function Y = isLeaf(Tree)

% In MATLAB, true = logical 1 and false = logical 0.
% 'isempty()' is the inbuilt MATLAB function which returns true if the argument of the function is empty else it returns false.

% A node of the tree is a leaf if both its children are empty.

if isempty(Tree.leftChild) == true && isempty(Tree.rightChild) == true
    Y = true;
else 
    Y = false;
end
end