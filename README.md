# QuadLA
This repository contains MATLAB code which determines whether an order in a number field is locally associated.

The file AssociatedOrders.zip unzips into an Excel file containing a table identifying orders in real quadratic number fields which are half-factorial, associated, ideal-preserving, locally associated, or none of the above.
Every order of index n<=10000 in the number field Q[sqrt(d)] for d<1000 is identified.
In this table, the cell in row n, column d refers to the order of index n in the quadratic number field Q[sqrt(d)].
In each cell, 'H' (light green) indicates that an order is half-factorial (and thus associated, ideal-preserving, and locally associated).
'A' (dark green) indicates that an order is associated (and thus ideal-preserving and locally associated) but NOT half-factorial.
'I' (blue) indicates that an order is ideal-preserving but NOT locally associated (and thus NOT half-factorial or associated).
'L' (yellow) indicates that an order is locally associted by NOT ideal-preserving (and thus NOT half-factorial or associated).
'-' (white) indicates that an ordeer is neither ideal-preserving nor locally associated (and thus NOT half-factorial or associated).
'X' (black) indicates that d is not squarefree.

Notably, this table identifies 29,163 half-factorial orders which are not integrally closed.

This table was produced using the MATLAB program quadLA.m, which indicates whether the order of index n>1 in Q[sqrt(d)] is ideal-preserving and/or locally associated given n, d, and the fundamental unit fu.
A script was run to apply this program to every order found in the table; fundamental units were generated using SageMath and read into MATLAB using a .csv file.
Some quadratic number fields had units too large for MATLAB to properly work with; for these orders, SageMath was used to check the properties of the order (this was slower than MATLAB but was necessary for some number fields).
To determine which orders were half-factorial, the rings of algebraic integers with class number <=2 were entered manually. Excel was then used to identify all the associated orders in these number rings whose index is either prime or twice an odd prime (using a result of Franz Halter-Koch).

The remaining MATLAB programs in this repository are those called by quadLA.m to efficiently perform operations in number fields and factor integers into powers of primes.
