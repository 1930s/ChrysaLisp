(import 'sys/mail/class.inc)

;;;;;;;;;;;;;;;;;;;;;;;
; kernel mail functions
;;;;;;;;;;;;;;;;;;;;;;;

(def-enum 'kn_call)
	(enum 'callback 'open 'child 'route 'declare)
(def-enum-end)

;;;;;;;;;;;;;;;;;;
; kernel mail data
;;;;;;;;;;;;;;;;;;

(def-struct 'kn_msg)
	(ulong 'user)
	(struct 'reply_id 'id)
	(ulong 'function)
(def-struct-end)

(def-struct 'kn_msg_callback 'kn_msg)
	(ptr 'addr)
(def-struct-end)

(def-struct 'kn_msg_open 'kn_msg)
	(offset 'pathname)
(def-struct-end)

(def-struct 'kn_msg_flood 'kn_msg)
	(uint 'via)
(def-struct-end)

(def-struct 'kn_msg_route 'kn_msg_flood)
	(uint 'origin)
	(uint 'hops)
(def-struct-end)

(def-struct 'kn_msg_declare 'kn_msg_flood)
	(offset 'name)
(def-struct-end)

(def-class 'sys_kernel)
(dec-method 'id 'sys/kernel/id 'static nil '(r0))
(dec-method 'total 'sys/kernel/total 'static nil '(r0))
(dec-method 'opts 'sys/kernel/opts 'static '(r0))
(dec-method 'declare 'sys/kernel/declare 'static '(r0 r1))
(dec-method 'kernel 'sys/kernel/kernel 'static '(r0 r1))

(dec-method 'lisp_total 'sys/kernel/lisp_total 'static '(r0 r1) '(r0 r1))