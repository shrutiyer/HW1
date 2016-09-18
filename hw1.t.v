`include "hw1.v"

module demorgan_test ();

  // Instantiate device/module under test
  reg A, B;                		 // Primary test inputs
  wire nA, nB, AandB, AorB;    // Test outputs
	wire nAandnB, nAandB, nAorB, nAornB;

	// Module to be tested
  demorgan dut(A, B, nA, nB, AandB, AorB, nAandnB, nAandB, nAorB, nAornB);  

  // Run sequence of test stimuli
  initial begin
    $display("A B | ~A ~B | ~A~B ");            // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);

		$display("A B | A+B | ~(A+B) ");            
    A=0;B=0; #1                                 
    $display("%b %b |  %b  |    %b  ", A,B, AorB, nAorB);
    A=0;B=1; #1                            
    $display("%b %b |  %b  |    %b  ", A,B, AorB, nAorB);
    A=1;B=0; #1
    $display("%b %b |  %b  |    %b  ", A,B, AorB, nAorB);
    A=1;B=1; #1
    $display("%b %b |  %b  |    %b  ", A,B, AorB, nAorB);
    $display();

    $display("A B | A*B | ~(AB) ");            
    A=0;B=0; #1                                 
    $display("%b %b |  %b  |   %b  ", A,B, AandB, nAandB);
    A=0;B=1; #1                            
    $display("%b %b |  %b  |   %b  ", A,B, AandB, nAandB);
    A=1;B=0; #1
    $display("%b %b |  %b  |   %b  ", A,B, AandB, nAandB);
    A=1;B=1; #1
    $display("%b %b |  %b  |   %b  ", A,B, AandB, nAandB);
    $display();

		$display("A B | ~A ~B | (~A)+(~B) ");            
    A=0;B=0; #1                                 
    $display("%b %b |  %b  %b |     %b  ", A,B, nA, nB, nAornB);
    A=0;B=1; #1                            
    $display("%b %b |  %b  %b |     %b  ", A,B, nA, nB, nAornB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b |     %b  ", A,B, nA, nB, nAornB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b |     %b  ", A,B, nA, nB, nAornB);
    $display();

  end
endmodule    // End demorgan_test
