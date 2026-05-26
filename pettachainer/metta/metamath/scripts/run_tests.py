import subprocess
import glob
import os
import sys

def run_metta_tests():
    # 1. Dynamically find the paths
    script_dir = os.path.dirname(os.path.abspath(__file__))
    tests_dir = os.path.abspath(os.path.join(script_dir, "..", "tests"))
    
    # 2. Look for files starting with 'test' and ending in '.metta'
    search_pattern = os.path.join(tests_dir, "test*.metta")
    test_files = glob.glob(search_pattern)
    
    if not test_files:
        print(f"[INFO] No test files matching 'test*.metta' found in: {tests_dir}")
        sys.exit(1)
    passed_tests = len(test_files)
    failed_tests = 0

    all_tests_passed = True
    print(f"[INFO] Found {len(test_files)} test file(s) in {tests_dir}.")
    print("[INFO] Starting test run...\n")
    print("-" * 40)

    for file in test_files:
        filename = os.path.basename(file)
        print(f"Executing: {filename}...")
        
        # 3. Execute the MeTTa file
        try:
            result = subprocess.run(
                ['petta', file], 
                capture_output=True, 
                text=True,
                encoding='utf-8' # Ensures Python correctly reads the emoji characters
            )
            
            # 4. Check for the specific '❌' fail marker in the output
            # We also keep the return code check in case the script crashes completely
            failed = (
                result.returncode != 0 or 
                "❌" in result.stdout or 
                "❌" in result.stderr
            )
            
            # Ensure it actually ran and passed a test
            passed = not failed and ("✅" in result.stdout or "✅" in result.stderr)

            if failed or not passed:
                failed_tests += 1
                passed_tests -= 1
                print(f"❌ FAIL {filename}\n")
                all_tests_passed = False
            else:
                print(f"✅ PASS {filename}\n")
                
        except FileNotFoundError:
            print("[ERROR] The 'metta' command was not found.")
            print("[INFO] Make sure the MeTTa interpreter is installed and added to your system's PATH.")
            sys.exit(1)

    # 5. Final summary
    print("-" * 40)
    if all_tests_passed:
        print("[SUCCESS] All logical proofs passed.")
        sys.exit(0)
    else:
        print(f"[FAILURE] {failed_tests} proofs failed out of {len(test_files)}.")
        sys.exit(1)

if __name__ == "__main__":
    run_metta_tests()