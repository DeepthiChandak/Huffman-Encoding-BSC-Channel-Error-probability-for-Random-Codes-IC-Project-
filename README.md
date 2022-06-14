# Huffman Encoding:
1. _Generate Source Files_:  
Create three text source files of the approximately same size (5-10 KB or 1-2 pages of text) having the following properties:  
(a) File 1: Contains only your name (or any one word) multiple times.  
(b) File 2: Repeat a paragraph of around 30 words multiple times.  
(c) File 3: Normal 1-2 pages of paragraphs (english text) with no repetitions.  
We repeat that the files need to be of same size roughly. This will help you to compare the compression in the three scenarios.  
2. _Count Frequencies_:  
Examine the source file’s contents and count the number of occurrences of each character.  
Note that all characters must be included in the frequency table, including spaces, and any punctuation.  
This will give you a probability distribution.  
3. _Construct Huffman code_:  
Construct a Huffman code for each of the probability distributions obtained from the frequency tables.  
Output the symbols along with corresponding codewords of the Huffman code. (For each symbol, the codeword should be displayed).  
4. _Encode data_:  
Using Huffman Algorithm encode the source file’s contents into another file.  
Display the size of the encoded file.  
5. _Decode Data_:  
From the encoded file, decode the original source file by extracting the symbols from the codewords.  
Check the decoded output with the original file (via a code snippet) and ensure there is no error in decoding.
#  Error probability of Random codes over a BSC Channel:
Perform the steps below for the following parameters:  
(a) n = 15, k = 10, p = 0.015  
(b) n = 15, k = 10, p = 0.1  
(c) n = 15, k = 10, p = 0.45  
(d) n = 20, k = 10, p = 0.015  
(e) n = 20, k = 10, p = 0.1  
(f) n = 20, k = 10, p = 0.45  
1. _Create Random Code_:  
Pick 2^k random vectors from the binary vector space {0, 1}^n where n is the code length and the rate is k^n. This is your code C.  
2. _Decoding_:  
Define a counter E which calculates number of decoding errors. Initially E = 0. Repeat following steps (in bullets) for N iterations (N should be at least 500, best to use something of the order of 1000-2000. It depends upon the execution time on your machine. Higher N gives better approximation).  
• Pick a random codeword c from the code C. This is your transmitted codeword.  
• Simulating BSC channel: Obtain the received vector y by flipping each position of c with probability p.  
• Run the Minimum Distance Decoding algorithm on y to obtain the estimate cˆ, (This will be the most time consuming step).  
• Maintain a indicator value I(ˆc 6= c) for each iteration. This is 1 if decoder made an error, and 0 otherwise.  
• Compute E = E + I(ˆc 6= c)  
• Probability of error: Record approximate average probability of error as P_E(n, k, p, C) = E/N.  
3. Repeat the steps 1, 2 for five times for each value of k, n, p as defined in the problem. You will get one P_E(n, k, p, C) value for each code C.  
4. _Show outputs_: For each (k, n, p) values, output the P_E(n, k, p, C) values you get.  
5. For each (n, k, p) value-tuple, define P_E(n, k, p) as min C P_E(n, k, p, C). This corresponds to the best code among the ones you obtained for specific (n, k, p). Plot the values of P_E(n, k, p) for different (n, k, p) as given in the problem.  
