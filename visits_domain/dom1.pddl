(define (domain localization)

	(:requirements 
		:typing 
		:durative-actions 
		:numeric-fluents 
		:negative-preconditions 
		:action-costs 
		:conditional-effects 
		:equality 
		:fluents 
	)

	(:types 	
		robot 
		region 
	)

(:predicates
	(robot_in ?v - robot ?r - region) 
	(visited ?r - region )
	(collected ?r - region)   
)

	(:functions
		(act-cost)
		(triggered ?from ?to - region)
		(dummy)
		(get ?r - region)
)

(:durative-action localize
		:parameters (?v - robot ?from ?to - region)
		:duration (= ?duration 100)
		:condition (and (at start (robot_in ?v ?from)))
	    :effect (and (at start (not (robot_in ?v ?from))) (at start (increase (triggered ?from ?to) 1))
						(at end (robot_in ?v ?to)) (at end (assign (triggered ?from ?to) 0))	
            			(at end (increase (act-cost) (dummy))))
)

(:action visit_region
		:parameters (?v - robot ?r - region)
		:precondition (robot_in ?v ?r)
		:effect (visited ?r)
)

(:durative-action collect
	:parameters (?v - robot ?r - region)
	:duration (= ?duration 5)
	:condition (and (at start (robot_in ?v ?r)) (at start (visited ?r)) (at start (> (get ?r) 0)))
	:effect (and (at end (collected ?r)))
)

; (:durative-action deliver)  
; Maybe could be useful a duractive action for delivering the reports at the submission desk
)

