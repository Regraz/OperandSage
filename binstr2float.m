    function [val] = binstr2float(binstream)
    %https://in.mathworks.com/matlabcentral/answers/384157-binary-to-floating-point-representation-using-ieee-754
    V = binstream-'0'; % convert to numeric
    frc = 1+sum(V(10:32).*2.^(-1:-1:-23));
    pow = sum(V(2:9).*2.^(7:-1:0))-127;
    sgn = (-1)^V(1);
    val = sgn * frc * 2^pow;