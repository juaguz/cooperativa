#!/usr/bin/env python
import win32api
#os.chdir('c:\xampp\htdocs\cooperativa\app\storage\impresora')


test = "c:\\xampp\\htdocs\\cooperativa\\app\\storage\\impresora\\test.txt"


win32api.ShellExecute (0, "print", test, None, ".", 0)

