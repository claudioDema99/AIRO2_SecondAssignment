(define (problem prob1)
     (:domain localization)
     (:objects
          r0 r1 r2 r3 r4 - region
          Rob - robot
     )

     (:init
          (robot_in Rob r0)

          (= (act-cost) 0)
          (= (dummy) 0)

          (= (get r1) 1) (= (get r2) 1) (= (get r3) 1) (= (get r4) 1)
     )

     (:goal 
          (and (collected r0) (collected r3) (robot_in Rob r4))
     )

     (:metric 
          minimize (act-cost)
     )
)


