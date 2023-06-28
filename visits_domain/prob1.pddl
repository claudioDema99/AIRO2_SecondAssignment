(define (problem prob1)
(:domain localization)
(:objects
     r0 r1 r2 r3 r4 r5 - region
     R2D2 - robot
)

     (:init
          (robot_in R2D2 r0)
          (submission_desk r5)

          (= (act-cost) 0)
          (= (dummy) 0)

          (= (total_reports) 2)
          (= (report r1) 1) (= (report r2) 1) (= (report r3) 1) (= (report r4) 1)
          (= (collected) 0)
)

     (:goal 
          (and (given_reports))
     )

     (:metric 
          minimize (act-cost)
     )
)


