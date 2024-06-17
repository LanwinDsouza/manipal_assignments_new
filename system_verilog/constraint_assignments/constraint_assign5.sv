/************************************************************************
Author: Mirafra Technologies Pvt Limited
        By Meenal Sitaram pannase
Filename:	constraint_assign5.sv  
Date:   	7th June 2024
Version:	1.0
Description: Concept of Constraint Randomization in System Verilog 
***************************************************************************/
class constraint_assign5;
  
//ADD_CODE: Declare the 8bit variable as data. 
  rand bit [7:0] b[10];
//ADD_CODE: Write constraint  for 8 bit variable b which will generate a values between range of 100to 200.
  constraint c_{foreach(b[i]) b[i] inside {[100:200]};} 
//ADD_CODE: Declare the 8bit variable as data1. 
  rand bit [7:0] b_unique[10];
//ADD_CODE: Write constraint  for 8 bit variable b_unique which will generate a values between range of
//100 to 200 without using unique keyword . 
  constraint c__{
    foreach (b_unique[i]) {
      foreach (b_unique[j]) {
        if(i != j) b_unique[i] != b_unique[j] ; 
      }
    }
  }

endclass:constraint_assign5

module con_assign5; 
  //ADD_CODE: Declare the handle for "class constraint_assign5" as c0.
  constraint_assign5 c0;
initial
  begin
    //ADD_CODE: Create the Object for  handle
    c0=new;
    //ADD_CODE: Randomize the object for generating randomize values for variable b and b_unique between range of 100to 200..
    c0.randomize;
    //ADD_CODE: Display the values of variable b using object handel.
    $display("### Displaying 10 random values of b ...............");
    $write("-->\t");
    //ADD_CODE: Display the values of of array address using object handel.
    foreach(c0.b[i]) 
      $write("{[%0d]:%0d},",i,c0.b[i]); 
    $display("\n### Displaying 10 random values of b_unique ...............");
    $write("-->\t");
    //ADD_CODE: Display the values of of array address using object handel.
    foreach(c0.b_unique[i]) 
      $write("{[%0d]:%0d},",i,c0.b_unique[i]); 
    $display("\n");
        
  end 
endmodule:con_assign5

