% Запрос размеров матрицы A
rows = input('Введите размер матрицы A: ');
cols = rows
% Инициализация пустой матрицы
matrix = zeros(rows,cols);
% Цикл для ввода каждого элемента матрицы
for i = 1:rows
    for j = 1:rows
        matrix(i,j) = input(['Введите элемент матрицы A(' num2str(i) ', ' num2str(j) '): ']);
    end
end
% Вывод введенной матрицы B
disp('Введенная матрица:');
disp(matrix);
A = matrix;

% Запрос размеров матрицы B
% Инициализация пустой матрицы
matrix = zeros(cols,1);
% Цикл для ввода каждого элемента матрицы
for i = 1:cols
    for j = 1:1
        matrix(i,j) = input(['Введите элемент матрицы B (' num2str(i) ', ' num2str(j) '): ']);
    end
end
% Вывод введенной матрицы B
disp('Введенная матрица B:');
disp(matrix);
B = matrix;


% Запрос размеров матрицы C
% Инициализация пустой матрицы
matrix = zeros(1,cols);
% Цикл для ввода каждого элемента матрицы
for i = 1:1
    for j = 1:cols
        matrix(i,j) = input(['Введите элемент матрицы C (' num2str(i) ', ' num2str(j) '): ']);
    end
end
% Вывод введенной матрицы желаемых спектров S
disp('Введенная матрица S:');
disp(matrix);
C = matrix

% Запрос размеров матрицы 
% Инициализация пустой матрицы
matrix = zeros(1,cols);
% Цикл для ввода каждого элемента матрицы
for i = 1:1
    for j = 1:cols
        matrix(i,j) = input(['Введите элемент матрицы желаемых спектров S ОТРИЦАТЕЛЬНЫЙ (' num2str(i) ', ' num2str(j) '): ']);
    end
end
% Вывод введенной матрицы желаемых спектров S
disp('Введенная матрица S:');
disp(matrix);
S = matrix

% Запрос размеров матрицы Y
% Инициализация пустой матрицы
matrix = zeros(1,cols);
% Цикл для ввода каждого элемента матрицы
for i = 1:1
    for j = 1:cols
        matrix(i,j) = input(['Введите элемент матрицы Y  ЛИБО НОЛЬ ЛИБО ОДИН (' num2str(i) ', ' num2str(j) '): ']);
    end
end
% Вывод введенной матрицы Y
disp('Введенная матрица Y:');
disp(matrix);
Y = matrix


%Поиск регулятора, необходимы A B C S Y
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
