n = [15,15,15,20,20,20];
k = [10,10,10,10,10,10];
p = [0.015,0.1,0.45,0.015,0.1,0.45];

Prob_Error_n_k_p = zeros(1,6);

for f = 1:6
 Prob_Error_n_k_p_C =  zeros(1,5);
for w = 1:5
%% code generation
code = rem(randperm(n(f)),2);  % randperm(n) gives a random permutation of n integers, %2 converts it into 1s and 0s
while length(unique(code,'rows')) ~= 2^(k(f)) % run the loop unless 2^k unique codewords are generated
    c = rem(randperm(n(f)),2);
    code = [code ; c];  % code is the coleection of codewords
end
code = unique(code,'rows');

N = 500;

E = Transmission(code,p(f),k(f),n(f),N);

Prob_Error_n_k_p_C(w) =  E/N;
end
Prob_Error_n_k_p(f) = min(Prob_Error_n_k_p_C);
end

figure;
f = 1:6;
stem(f,Prob_Error_n_k_p);
grid on;
ylabel('P_E(n,k,p)');
xlabel('f');
title('Minimum Probability of Error for (n,k,p)');

function E = Transmission(code,p,k,n,N)
E = 0;
for l = 1:N
%% picking a codeword from the code at random
X = rem(randi(2^k),2^k)+1;
codeword = code(X,1:n);

%% flipping each bit with probability p
flip = rand(1,n); % flip is an length vector with random values in (0,1)
for t = 1:n
    if(flip(t)<=p)  % rand() is uniform in (0,1) so probability of any value in flip being less than p is p
        codeword(t) = ~codeword(t);
    end
end

%% Decoding
[m,word] = Min_Dist_Decoder(code,codeword,k);

error = word - codeword;
e  = sum(error); 
if e ~= 0
    I = 1;
else 
    I = 0;
end

E = E + I;

end
end

%% Implementation of Minimum Distance Decoder
function [m,word] = Min_Dist_Decoder(code,codeword,k)
matrix(1,:) =  code(1,:) - codeword;
for t = 2:2^k
   D =  code(t,:) - codeword;
   matrix = [matrix;D];
end
matrix = abs(matrix);
weight = sum(matrix,2);  % weight is a vector of size n containg the hamming distances of all codewords from the transmitted signal
m = min(weight);   % m is the min hamming distance
for t = 1:2^k
    if weight(t) == m  % finding the codeword with the min hamming distance from the transmitted signal
        word = code(t,:);
        break;
    end
end
end


