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
			(submission_desk ?r - region )
			(given_reports)
	)

	(:functions
			(act-cost)
			(triggered ?from ?to - region)
			(dummy)
			(reports_in ?r - region)
			(collected)
			(total_reports)
	)

	(:durative-action move
			:parameters (?v - robot ?from ?to - region)
			:duration (= ?duration 100)
			:condition (and (at start (robot_in ?v ?from)))
			:effect (and (at start (not (robot_in ?v ?from))) (at start (increase (triggered ?from ?to) 1))
							(at end (robot_in ?v ?to)) (at end (assign (triggered ?from ?to) 0))	
							(at end (increase (act-cost) (dummy))))
	)

	(:action collect
			:parameters (?v - robot ?r - region)
			:precondition (and (robot_in ?v ?r) (> (reports_in ?r) 0))
			:effect (and (decrease (reports_in ?r) 1) (increase (collected) 1))
	)

	(:action deliver
			:parameters (?v - robot ?r - region)
			:precondition (and (robot_in ?v ?r) (submission_desk ?r) (>= (collected) (total_reports)))
			:effect (and (assign (collected) 0) (given_reports))
	)

)

