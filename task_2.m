
%Поиск регулятора, необходимы A B S Y
%S - спектр
n =length(A)
if n ==2
    G = [S(1) 0;
        0 S(2);]
    syms q1 q2 q3 q4 
    P = [q1 q2;
         q3 q4];
    A*P -P*G
    B*Y
    eq = A*P - P*G == B*Y;
    ss = solve(eq, P)
    P = [ss.q1 ss.q2; ss.q3 ss.q4]
    Pinv = pinv(P)
    K = -Y*Pinv

    disp('Наблюдатель')
    
    Y = [Y(1) Y(1)]'
    syms q1 q2 q3 q4 
    Q = [q1 q2;
         q3 q4];
    G*Q -Q*A
    Y*C
    eq = G*Q -Q*A == Y*C;
    ss = solve(eq, Q);
    Q = [ss.q1 ss.q2; ss.q3 ss.q4]
    Qinv = pinv(Q)
    L = Qinv*Y
end
if n == 3
    disp('Регулятор')
     G = [S(1) 0 0;
        0 S(2) 0;
        0 0 S(3)]
    syms q1 q2 q3 q4 q5 q6 q7 q8 q9
    P = [q1 q2 q3;
         q4 q5 q6;
         q7 q8 q9];
    A*P -P*G
    B*Y
    eq = A*P - P*G == B*Y;
    ss = solve(eq, P);
    P = [ss.q1 ss.q2 ss.q3; ss.q4 ss.q5 ss.q6; ss.q7 ss.q8 ss.q9]
    Pinv = pinv(P)
    K = -Y*Pinv

    disp('Наблюдатель')
    Y = [Y(1) Y(1) Y(1)]'
    syms q1 q2 q3 q4 q5 q6 q7 q8 q9
    Q = [q1 q2 q3;
         q4 q5 q6;
         q7 q8 q9];
    G*Q -Q*A
    Y*C
    eq = G*Q -Q*A == Y*C;
    ss = solve(eq, Q);
    Q = [ss.q1 ss.q2 ss.q3; ss.q4 ss.q5 ss.q6; ss.q7 ss.q8 ss.q9]
    Qinv = pinv(Q)
    L = Qinv*Y
end
