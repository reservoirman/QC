//Ten-Seng Guh tg2458 
//COMS 4281 Intro to Quantum Computing
//Homework 1 Programming Part
 
    args = sciargs()
    numargs = size(args, 2)
    
    if (numargs == 8) then
        j = strtod(args(6))
        k = strtod(args(7))
        m = strtod(args(8))

    else
    //default values for j,k, and m
    disp("Incorrect number of args!  Should be in the form:")
    disp("scilab -nw -f hw1.sci -args j k m")
    exit
    j = 2;
    k = 2;
    m = 1;
    end    
    // define the matrices
    X = [ 0 1; 1 0];
    Y = [0 -%i; %i 0];
    Z = [1 0; 0 -1];
    H = (1/sqrt(2)) * [1 1; 1 -1];
    S = [1 0; 0 %i];
    T = [1 0; 0 sqrt(%i)]; //same as [1 0; 0 exp(%i*%pi/4)]
    
    jb = char(dec2bin(j, k));
    // initializing probability and matrix for tensor products to 
    // default values:
    prob = 1
    M = [ 1 0; 0 1];
    origj = j;
    origm = m;
    
    for i = k : -1 : 1
        cjb = modulo(j, 2)
        cmb = modulo(m, 2)
        mod = modulo(i, 6)
        select mod
        case 1
            M = X
        case 2
            M = Y
        case 3
            M = Z
        case 4
            M = H
        case 5
            M = S
        case 6
            M = T
        end

        if (cjb == 1) then
            left = [0 1]
        else left = [1 0]
        end
        if (cmb == 1) then
            right = [0 1]'
        else right = [1 0]'
        end
        //calculate the tensor product of the left basis vector, 
        //the matrix, and right basis vector:
        tp = (left * M) * right
        //disp(M)
        //disp(tp)
        prob = prob * tp 
        //disp(prob)
        j = j / 2
        m = m / 2
    end
    
    prob = abs(prob)^2
   
    printf("The probability is to measure j = %d in a k = %d qubit system on input m = %d is:\n %f.", origj, k, origm, prob);
    
