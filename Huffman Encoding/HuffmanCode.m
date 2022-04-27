function Code = HuffmanCode(Tree,Nodes,string,Collected)

% For the left child of any node which isn't a leaf the codeword of that node will be " string+'0' ".
% For the right child of any node which isn't a leaf the codeword of that node will be " string+'1' ".
% 'isLeaf' function takes the input Tree node and finds whether the node is a leaf of the Tree or not.

% 4 different conditions for the Node of the Tree: 
%       1) Left child is a leaf but not right child.
%          Including the Code struct for the left child in the code, then recursively calling the function for the right child first.
if isLeaf(Tree.leftChild) == true && isLeaf(Tree.rightChild) == false
    Code1 = [Collected; struct('charecter',Tree.leftChild.node,'code',string+'0','frequency',Tree.leftChild.value)];
    Code = [Code1; HuffmanCode(Tree.rightChild,Nodes,string+'1',[])]; 
%       2) Right child is a leaf but not left child.
%          Including the Code struct for the right child in the code, then recursively calling the function for the left child first.
elseif isLeaf(Tree.leftChild) == false && isLeaf(Tree.rightChild) == true
    Code1 = [Collected; struct('charecter',Tree.rightChild.node,'code',string+'1','frequency',Tree.rightChild.value)];
    Code = [Code1; HuffmanCode(Tree.leftChild,Nodes,string+'0',[])];
%       3) Both the children are leaves.
%          Including the Code struct for left child and then for the right child in Code.
elseif isLeaf(Tree.leftChild) == true && isLeaf(Tree.rightChild) == true
    Code1 = [Collected; struct('charecter',Tree.leftChild.node,'code',string+'0','frequency',Tree.leftChild.value)];
    Code = [Code1; struct('charecter',Tree.rightChild.node,'code',string+'1','frequency',Tree.rightChild.value)];
%       4) Neither of the children are leaves.
%          Recursively calling the function for the left child first and then for the right child.
elseif isLeaf(Tree.leftChild) == false && isLeaf(Tree.rightChild) == false
    Code1 = [Collected; HuffmanCode(Tree.leftChild,Nodes,string+'0',[])];
    Code = [Code1; HuffmanCode(Tree.rightChild,Nodes,string+'1',[])];
end

% In the recursive call of the function the Collected argument is given as empty array, as the previously constructed Code Nodesare included (while calling recursively).
end