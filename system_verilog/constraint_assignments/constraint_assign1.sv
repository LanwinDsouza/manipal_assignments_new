/************************************************************************
Author: Mirafra Technologies Pvt Limited
        By Meenal Sitaram Pannase
Filename:	constraint_assign1.sv  hbhbhb
Date:   	7th June 2024
Version:	1.0
Description: Concept of Constraint Randomization in System Verilog 
***************************************************************************/
`define REP 10

class constraint_assign1;
  
//ADD_CODE: Declare the 8bit variable as data. 
  rand bit [7:0] data;
//ADD_CODE: Write constraint for an 8bit variable data to generate values divisible by 5.
  constraint c_{data%5==0 && data inside {[0:100]};} 
endclass:constraint_assign1 
module con_assign1; 
  //ADD_CODE: Declare the handle for "class constraint_assign1" as c0.
  constraint_assign1 c;
initial
  begin
    //ADD_CODE: Create the Object for  handle
    c=new;
    //ADD_CODE: Randomize the object for genrating randomize values for data which is divisible by 5
    $display("####Generating %0d random variables divisible by 5 ...............",`REP);
    $write("-->");
    repeat(`REP) begin
    c.randomize;
    //ADD_CODE: Display the values of data using object handel.
      $write("%d,",c.data);
        
    end 
    $display("\n");
  end
endmodule:con_assign1

