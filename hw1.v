module demorgan
(
  input  A,          // Single bit inputs
  input  B,

  output nA,         // Output intermediate complemented inputs
  output nB,

  output AandB,	     
  output AorB,	 
    
  output nAandnB,     // Single bit output, (~A)*(~B)
  output nAandB,      // Single bit output, ~(A*B)
  output nAorB,	      // Single bit output, ~(A+B)    
  output nAornB	      // Single bit output, (~A)+(~B)    
);

  wire nA;
  wire nB;
  not Ainv(nA, A);      // Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);

  // (~A)*(~B)
  and andgate(nAandnB, nA, nB);     // AND gate produces nAandnB from nA and nB

  // ~(A*B)
  wire AandB;
  and andgate(AandB, A, B);
  not AandBinv(nAandB, AandB);
  
  // ~(A+B)
  wire AorB;
  or orgate(AorB, A, B);
  not AorBinv(nAorB, AorB);
  
  // (~A)+(~B)
  or orgate(nAornB, nA, nB);

endmodule
