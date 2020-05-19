
gui, add, edit, vedit1,BMW 			;search Google
gui, add, button, ,Google
gui, add, edit, vedit2,Mercedes		        ;search Bing
gui, add, button, ,Bing
gui, add, DDL,vdd_var gdd_label ,Google|Bing
gui, show, autosize
return

buttonGoogle:
gui, submit, nohide
run, https://www.google.com/search?q=%edit1%
return

buttonBing:
gui, submit, nohide
run, https://www.bing.com/search?q=%edit2%
return

dd_label:
gui, submit, nohide
if dd_var = google
	run, https://www.google.com/search?q=%edit1%
if dd_var = bing
	run, https://www.bing.com/search?q=%edit2%
return