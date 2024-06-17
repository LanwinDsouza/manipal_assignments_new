/************************************************************************
Author: Mirafra Technologies Pvt Limited
        By Meenal Sitaram Pannase
Filename:	constraint_assign7.sv  
Date:   	7th June 2024
Version:	1.0
Description: Concept of Constraint Randomization in System Verilog 
***************************************************************************/
class constraint_assign7;
  
//ADD_CODE: Declare the 32bit variable. 
  rand bit [31:0] a;
//ADD_CODE: Write for constraint to Generate a random 32-bit value With alternate pattern {0,1,0,1,...}  
        //a = 0101010101 (32 bits)
  constraint c_{foreach(a[i]) if(i%2) a[i]==1'b0;
                else a[i] == 1'b1;} 
endclass:constraint_assign7
module con_assign7; 
//ADD_CODE: Declare the handle for "class constraint_assign7" as c0.
   constraint_assign7 c0;
initial
  begin
    //ADD_CODE: Create the Object for  handle
    c0=new;
    //ADD_CODE: Randomize the object for genrating randomize values of variable with pattern {0,1,0,1..}.
    c0.randomize;
    //ADD_CODE: Display the values of variable using object handel.
    $display("%b",c0.a);
        
  end 
endmodule:con_assign7
