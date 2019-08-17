% mapn test
%  prerequisites:
net = sig.Net;
x = net.origin('x');
y = net.origin('y');

%% Test for mapn
% Test mapping multiple input signals to multiple output signals
[X, Y] = x.mapn(y, @meshgrid);

% Test with these inputs
xx = 1:5; yy = 5:10;
[expectedX, expectedY] = meshgrid(xx, yy);

x.post(xx); y.post(yy);
actualX = X.Node.CurrValue;
actualY = Y.Node.CurrValue;

% Verify Signals implementation yields equal output values
isEqualX = isequal(expectedX, actualX);
isEqualY = isequal(expectedY, actualY);
assert(isEqualX && isEqualY, 'Failed to assign expected outputs')