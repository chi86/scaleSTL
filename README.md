# scaleSTL
Fortran code to scale STL files

Execute:
~$ gfortran scaleStl.f
~$ ./a.out


Scale a STL File (ascii-format):
--------------------------------

File (*.stl)                : INPUT.stl
Output - File (solid ***)   : OUTPUT.stl
Scale-factor (mm->m = 1000) : 1000
DONE .........

Transforms all values from INPUT.stl by a factor of 1000 (x  = x/1000) and stores it in OUTPUT.stl.
From mm to m: Scale-factor=1000
