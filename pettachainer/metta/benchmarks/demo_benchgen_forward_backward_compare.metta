!(import! &self ../benchgen_forward_backward_compare)

!(BenchTimedForwardBackwardCompare benchForwardMode
   benchForwardBackwardMode
   benchBackwardMode
   1
   2
   2
   3
   1
   50
   3
   2
   400
   400)
