function Decoded = Decode(Encoded,Code,N,count,encoding,decoded)

% 'strcmp()' and "strcat()' are inbuilt MATLAB functions to compare two strings and to combine two strings respectively.

check = 0; % For keeping into account if the string to be decoded, i.e., encoding is a codeword or not.

% Decoding encoding to a codeword if possible.
% Iteratively check if encoding is a codeword or not.
for k = 1:length(Code)
    if  strcmp(encoding,Code(k).code) == 1
        decoded = decoded + Code(k).charecter;
        check = 1;
        break;
    end
end

% If count of no. of charecters of decoded upto now, i.e., count != no. of charecters; then recursively call the function to decode the remaining bits.
if count < N
    % If encoding is already decoded, then decode the next bit in the string to be decoded.
    if check == 1 
        Decoded = Decode(Encoded,Code,N,count+1,Encoded(count+1),decoded);
    % If encoding isn't decoded, then the string to be decoded will be encoding + next bit in the string to be decoded.
    else
        encoding = strcat(encoding,Encoded(count+1));
        Decoded = Decode(Encoded,Code,N,count+1,encoding,decoded);
    end
% If count of no. of charecters of decoded upto now, i.e., count = no. of charecters; then the decoded string is found.
else
    Decoded = decoded;
end 
end