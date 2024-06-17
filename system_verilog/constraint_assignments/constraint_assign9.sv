/************************************************************************
Author: Mirafra Technologies Pvt Limited
        By Priya Ananthakrishnan
Filename:	constraint_assign9.sv  
Date:   	7th June 2024
Version:	1.0
Description: Concept of Constraint Randomization in System Verilog 
***************************************************************************/

class constraint_assign9;
  
//ADD_CODE: Declare the dynamic array fibo.
  rand int fibo [];
//ADD_CODE: Write for constraint to generate Fibonacci series.
// Ex: ( 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55)

  constraint c_{fibo.size inside {[5:10]};}
  constraint c___{foreach(fibo[i]) if(i==0) fibo[0]==0;
                  else if(i==1) fibo[1]==1;
    			  else fibo[i]==fibo[i-2]+fibo[i-1];
                 }
   
  
endclass:constraint_assign9
module con_assign9; 
  //ADD_CODE: Declare the handle for "class constraint_assign9" as c0.
  constraint_assign9 c0;
initial
  begin
    //ADD_CODE: Create the Object for  handle
    c0=new;
    //ADD_CODE: Randomize the object for genrating randomize values of array .
    c0.randomize();
    
    //ADD_CODE: Display the values of array fibo  using object handel.
    $display("####Generating %0d fibonacci series ............",c0.fibo.size);
    $display("-->%p",c0.fibo);
  end 
endmodule:con_assign9
