/************************************************************************
Author: Mirafra Technologies Pvt Limited
        By Meenal Sitaram Pannase
Filename:	func_assign3.sv  
Date:   	7th June 2024
Version:	1.0
Description: Concept of Constraint Randomization in System Verilog 
***************************************************************************/
`define REP 10

class constraint_assign3;
  
//ADD_CODE: Declare the 32bit variable a.
  randc bit [31:0] a;
//ADD_CODE: Write constraint the random variable [31:0]a such that the randomized values are always multiples of 10.
  constraint c_{a%10 == 0 && a inside {[0:100]};} 
endclass:constraint_assign3 
module con_assign3; 
//ADD_CODE: Declare the handle for "class constraint_assign3" as c0.
  constraint_assign3 c0;
initial
  begin
    //ADD_CODE: Create the Object for  handle
    c0=new;
    //ADD_CODE: Randomize the object for genrating randomize values for data which is divisible by 5
    $display("####Generating %0d random variables divisible by 10 ...............",`REP);
    $write("-->");
    repeat(`REP) begin
    c0.randomize;
    //ADD_CODE: Display the values of data using object handel.
      $write("%d,",c0.a);
        
    end 
    $display("\n");
  end
endmodule:con_assign3

