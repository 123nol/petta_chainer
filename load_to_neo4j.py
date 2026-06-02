import os
import json
from neo4j import GraphDatabase
from neo4j.exceptions import ServiceUnavailable


NEO4J_URI = os.getenv("NEO4J_URI", "bolt://localhost:7687")
NEO4J_USER = os.getenv("NEO4J_USER", "neo4j")
NEO4J_PASSWORD = os.getenv("NEO4J_PASSWORD", "password")

def load_data(filepath):
    with open(filepath, 'r') as f:
        return json.load(f)

def import_to_neo4j(data):
    print(f"Connecting to Neo4j at {NEO4J_URI}...")
    try:
        driver = GraphDatabase.driver(NEO4J_URI, auth=(NEO4J_USER, NEO4J_PASSWORD))
        
        driver.verify_connectivity()
    except ServiceUnavailable as e:
        print("\n[!] Error: Neo4j database is not reachable.")
        print(f"Details: {e}")
        print("\nTo run a local Neo4j instance using Docker, run this command:")
        print("  docker run --name neo4j -p 7474:7474 -p 7687:7687 -d -e NEO4J_AUTH=neo4j/password neo4j:latest")
        print("\nOnce Neo4j is running, rerun this script to upload the data.")
        return False

    with driver.session() as session:
        print("Clearing existing mathematical graph data...")
        session.run("MATCH (n:Concept) DETACH DELETE n")

        print("Importing Concept Nodes...")
        for concept in data["concepts"]:
            session.run("""
                MERGE (c:Concept {name: $name})
                SET c.full_name = $full_name, c.kind = $kind, c.docstring = $docstring
            """, name=concept["name"], full_name=concept["full_name"], kind=concept["kind"], docstring=concept["docstring"])
            print(f" - Created Concept: {concept['name']}")

        print("Importing Implication Edges...")
        for impl in data["implications"]:
     
            session.run("""
                MERGE (a:Concept {name: $antecedent})
                MERGE (c:Concept {name: $consequent})
                MERGE (a)-[r:IMPLIES {source_theorem: $source_thm}]->(c)
            """, antecedent=impl["antecedent"], consequent=impl["consequent"], source_thm=impl["source_theorem"])
            print(f" - Created Implication: {impl['antecedent']} -> {impl['consequent']} (via {impl['source_theorem']})")

    driver.close()
    print("\n[+] Import complete! Mathematical Knowledge Graph loaded successfully in Neo4j.")
    print("You can view and query your graph in the Neo4j Browser at: http://localhost:7474")
    return True

def main():
    json_file = "mathlib_implications.json"
    if not os.path.exists(json_file):
        print(f"Error: {json_file} does not exist. Run 'extract_mathlib.py' first.")
        return
        
    data = load_data(json_file)
    import_to_neo4j(data)

if __name__ == "__main__":
    main()
