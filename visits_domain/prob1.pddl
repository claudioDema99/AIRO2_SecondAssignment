(define (problem prob1)
(:domain localization)
(:objects
     r0 r1 r2 r3 r4 r5 - region
     R2D2 - robot
)

     (:init
          (robot_in Rob r0)

          (= (act-cost) 0)
          (= (dummy) 0)

          (= (report r1) 1) (= (report r2) 1) (= (report r3) 1) (= (report r4) 1)
          (= (to_collect) 2)
)

     (:goal 
          (and (= (to_collect) 0) (robot_in R2D2 r5))
     )

     (:metric 
          minimize (act-cost)
     )
)


