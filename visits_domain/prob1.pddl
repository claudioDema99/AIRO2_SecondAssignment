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

    (= (get r1) 1) (= (get r2) 1) (= (get r3) 1) (= (get r4) 1)
)

     (:goal 
          (and (collected r0) (collected r3) (robot_in R2D2 r5))
          ; here you can change the collected regions to find a different solution 
          ; with a different act-cost 
     )

     (:metric 
          minimize (act-cost)
     )
)


