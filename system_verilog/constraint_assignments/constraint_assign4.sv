/************************************************************************
Author: Mirafra Technologies Pvt Limited
        By Meenal Sitaram Pannase
filename:	constraint_assign4.sv  
Date:   	7th June 2024
Version:	1.0
Description: Concept of Constraint Randomization in System Verilog 
***************************************************************************/
class constraint_assign4;
  
//ADD_CODE: Declare the 8bit variable as data.
  rand bit [7:0] data [];
//ADD_CODE: Write constraint for dynamic array of randomize size between 10 to 20 
  constraint c_{data.size inside {[10:20]};}
//ADD_CODE: Write a constraint for odd numbers in even location and even numbers in odd locations
//Example a[0] = 1, a[2] = 19, a[3] = 18 ....  
  constraint c__{foreach(data[i]) data[i] inside {[0:100]};}
  constraint c___{foreach(data[i]) if(i%2) data[i][0]==1'b0;
                 else data[i][0] == 1'b1;}

  
endclass:constraint_assign4
module con_assign4; 
  //ADD_CODE: Declare the handle for "class constraint_assign4" as c0.
   constraint_assign4 c0;
initial
  begin
    //ADD_CODE: Create the Object for  handle
    c0=new;
    //ADD_CODE: Randomize the object for genrating randomize values for array of size between 10 to 20 with odd numbers.
    c0.randomize;
    //ADD_CODE: Display the values and size of array using object handel.
    $display("####Generating %0d random values ...............",c0.data.size);
    $write("-->");
    //ADD_CODE: Display the values of of array address using object handel.
    foreach(c0.data[i]) 
      $display("\t [%0d]   : %0d",i,c0.data[i]); 
  end 
endmodule:con_assign4
