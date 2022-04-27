function Tree = HuffmanTree(Nodes,N)

% Generating the array of frequencies from the Nodes:
for k = 1:N
    frequency(k,1) = Nodes(k).value;
end

% Sorting the frequencies in ascending order:
% sort() is the inbuilt MATLAB function used for this.
sorted_frequency = sort(frequency);

% Sorting the Nodes in the same order as the frequencies:
frequency_occured_at = zeros(N,1); 
for k = 1:N
    if sorted_frequency(1) == frequency(k)
        sorted_nodes = Nodes(k);
        frequency_occured_at(1,1) = k;
        break;
    end
end
for k = 2:N
    for kk = 1:N
        check = 0;
        if sorted_frequency(k) == frequency(kk)
            for ii = 1:k-1
                if frequency_occured_at(ii) == kk - check
                    if check == 1
                        check = 0;
                        break;
                    elseif check == 0
                        check = 1;
                    end
                end
            end
            if check == 0
                sorted_nodes = [sorted_nodes;Nodes(kk)];
                frequency_occured_at(k,1) = kk;
                break;
            end
        end
    end
end
for k = 1:N
    Nodes(k) = struct('node',sorted_nodes(k).node,'value',sorted_frequency(k),'leftChild',sorted_nodes(k).leftChild,'rightChild',sorted_nodes(k).rightChild);
end

% Generating the Parent Node for the two minimum frequency Nodes:
% The two minimum frequency are used as Children to the parent Node.
Node = struct('node',Nodes(1).value+Nodes(2).value,'value',Nodes(1).value+Nodes(2).value,'leftChild',Nodes(1),'rightChild',Nodes(2));
% Generating new Nodes array by excluding the two minimum Nodes and replacing that with a single Parent Node:
for k = 2:N-1
    Node(k) = Nodes(k+1);
end

Tree = Node; % Returns the root Node of the Huffman Tree when N = 2.

% Recursive call of the function to generate the Min Heap:
if N > 2
    Tree = HuffmanTree(Node,N-1);
end
end