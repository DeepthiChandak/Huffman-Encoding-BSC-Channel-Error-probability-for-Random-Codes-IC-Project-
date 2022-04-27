function CODE = sorted_Code(Code,N)

% Generating the array of frequencies from the nodes of Codes:
for k = 1:N
    Frequency(k,1) = Code(k).frequency;
end

% Sorting the frequencies in ascending order:
% sort() is the inbuilt MATLAB function used for this.
sorted_Frequency = sort(Frequency);

% Sorting the Codes in the same order as the frequencies:
frequency_occured_at = zeros(N,1);
for k = 1:N
    if sorted_Frequency(1) == Frequency(k)
        sorted_Codes = Code(k);
        frequency_occured_at(1,1) = k;
        break;
    end
end
for k = 2:N
    for kk = 1:N
        check = 0;
        if sorted_Frequency(k) == Frequency(kk)
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
                sorted_Codes = [sorted_Codes;Code(kk)];
                frequency_occured_at(k,1) = kk;
                break;
            end
        end
    end
end

% The sorted_Codes array is returned.
CODE = sorted_Codes;
end