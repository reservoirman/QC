//Ten-Seng Guh tg2458 
//COMS 4281 Intro to Quantum Computing
//Homework 2 Programming Part


args = sciargs()
numargs = size(args, 2)
epsilon = 10e-4

badinput = 0
if (numargs == 7) then
    components = tokens(args(7),[" ";" ";",";"(";")"]) 
    if (size(components, 1) == 8) then
        epsilon = (strtod(args(6)))
        u11a = (components(1))
        u11b = (components(2))
        u12a = (components(3))
        u12b = (components(4))
        u21a = (components(5))
        u21b = (components(6))
        u22a = (components(7))
        u22b = (components(8))
        //disp(components)
        u11 = complex(strtod(u11a), strtod(u11b))
        u12 = complex(strtod(u12a), strtod(u12b))
        u21 = complex(strtod(u21a), strtod(u21b))
        u22 = complex(strtod(u22a), strtod(u22b))                
        //disp(u11)
        //disp(u12)
        //disp(u21)
        //disp(u22)
        U = [u11 u12; u21 u22];
    //shorthand secret way of inputting the 6 unitary matrices:
    //just simply input the 
    else if (size(components, 1) == 1)
            select components(1)
            case 'X'
                U = [ 0 1; 1 0];
            case 'Y'
                U = [0 -%i; %i 0];
            case 'Z'
                U = [1 0; 0 -1];
            case 'H'
                U = (1/sqrt(2)) * [1 1; 1 -1];
            case 'S'
                U = [1 0; 0 %i];
            case 'T'
                U = [1 0; 0 sqrt(%i)];
            end
        else
            badinput = 1
            printf("Matrix submitted incorrectly!  Must be in the form:\n\n")
        end
    end

else
    //default values for j,k, and m
    disp("Incorrect number of args!  Must be in the form:")
    badinput = 1
end

if (badinput == 0) then
    disp("U = ")
    disp(U)
    get0 = [1;0]
    get1 = [0;1]
    U3 = U * U * U
    Udiff = U - U3
    disp("U^3 = ")
    disp(U3)
    disp("U - U3 = ")
    disp(Udiff)
    upperBound =  abs(2 * sqrt( ((U - U3)*get0).^2 + ((U - U3)*get1).^2 ) )
    disp("Upper Bound = ")
    disp(upperBound)
    if (upperBound <= epsilon)
        disp("YES")
    else disp("NO")
    end
else
    printf("scilab -nw -f hw1.sci -args epsilon\""(a1, b1), (a2, b2), (a3, b3), (a4, b4)\""\n\n")
    printf("Epsilon represents the cutoff value to check if the circuits are equivalent.  It should be represented as a small floating point number, eg. \""10e-4\""\n\n")
    printf("Each tuple (a, b) represents a complex number.")
end
exit

