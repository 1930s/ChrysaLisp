%include 'inc/func.inc'
%include 'inc/task.inc'

	fn_function sys/mail_select, no_debug_enter
		;inputs
		;r0 = mailbox address array
		;r1 = mailbox count
		;outputs
		;r0 = mailbox address
		;trashes
		;r1-r3, r5

		vp_cpy r0, r3
		vp_lea [r0 + r1 * 8], r1
		loop_start
			;check if any have mail
			vp_cpy r3, r0
			loop_start
				vp_cpy [r0], r2
				lh_is_empty r2, r2
				if r2, !=, 0
					;return first mailbox not empty
					vp_cpy [r0], r0
					vp_ret
				endif
				vp_add 8, r0
			loop_until r0, ==, r1

			;fill in all tcb's and suspend
			static_bind task, statics, r5
			vp_cpy [r5 + tk_statics_current_tcb], r5
			vp_cpy r3, r0
			loop_start
				vp_cpy [r0], r2
				vp_cpy r5, [r2 + ml_mailbox_tcb]
				vp_add 8, r0
			loop_until r0, ==, r1
			static_call task, suspend

			;clear all tcb's
			vp_xor r5, r5
			vp_cpy r3, r0
			loop_start
				vp_cpy [r0], r2
				vp_cpy r5, [r2 + ml_mailbox_tcb]
				vp_add 8, r0
			loop_until r0, ==, r1
		loop_end

	fn_function_end
