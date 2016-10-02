(def (print_env)
	((lambda (l e)
		(progn
			(print '<= l '=>)
			(map print e)
			t))))

(def (prin_num)
	((lambda (n p c)
		(progn
			(def (l) ((length (str n))))
			(until (eq l p)
				(prin c)
				(setl (l) ((add l 1))))
			(prin n)))))

(def (squared cubed divmod)
	((lambda (x)
		(mul x x))
	(lambda (x)
		(mul x x x))
	(lambda (x y)
		(list (div x y) (mod x y)))))

(def (zip1 zip2 zip3 zip4)
	((lambda (a)
		(map list a))
	(lambda (a b)
		(map list a b))
	(lambda (a b c)
		(map list a b c))
	(lambda (a b c d)
		(map list a b c d))))

(def (fq)
	((lambda (x y)
		(mod (mul (cubed x) (squared y)) 10))))

(def (fxy)
	((lambda (f w h)
		(progn
			(def (x y w h) (1 1 (add w 1) (add h 1)))
			(until (eq y h)
				(setl (x) (1))
				(until (eq x w)
					(prin_num (f x y) 4 '.)
					(setl (x) ((add x 1))))
				(setl (y) ((add y 1)))
				(print))))))

(def (repeat_fxy)
	((lambda (l)
		(progn
			(def (c) (0))
			(until (eq c l)
				(fxy fq 10 20)
				(setl (c) ((add c 1))))))))
