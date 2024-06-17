/************************************************************************
Author: Mirafra Technologies Pvt Limited
        By Meenal Sitaram Pannase
Filename:	constraint_assign10.sv  
Date:   	7th June 2024
Version:	1.0
Description: Concept of Constraint Randomization in System Verilog 
***************************************************************************/
//What is wrong with the below code? What is the correct process to write the constraint?
class const;
    rand bit [7:0] low, mid, high;
    constraint Const_1 {mid>low;mid<high;}
endclass

		

