;; define external variables
(define-native unit :bind-to "unit")
(define-native screen :bind-to "screen")

(define script {})

(.<! script :onStart
	(lambda []
		;; Display some text
		((.> screen :setCenteredText) "script started")

		;; Create some timers to show that the script is working
		((.> unit :setTimer) "a" 2) ;; timer id "a", ticks every 2 seconds
		((.> unit :setTimer) "b" 3) ;; timer id "b", ticks every 3 seconds
	)
)

(.<! script :onStop
	(lambda []
		((.> screen :setCenteredText) "script stopped")
	)
)

(.<! script :onActionStart
	(lambda [actionName]
		((.> screen :setCenteredText) (.. actionName " key pressed"))
	)
)

(.<! script :onActionStop
	(lambda [actionName]
		((.> screen :setCenteredText) (.. actionName " key released"))
	)
)

(.<! script :onTick
	(lambda [timerId]
		((.> screen :setCenteredText) (.. "timer " timerId " ticked"))
	)
)

;; Other events that are available by default:
;; * onActionLoop(actionName): action key is held
;; * onUpdate(): executed once per frame
;; * onFlush(): executed 60 times per second, for physics calculations only; setEngineCommand must be called from here

;; Slot events are available if slot type is set with the ;;slot command line option.
(.<! script :onMouseDown
	(lambda [x y]
		((.> screen :setCenteredText) (.. "mouse down: x=" x " , y=" y))
	)
)

script