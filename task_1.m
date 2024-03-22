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
% Вывод введенной матрицы
disp('Введенная матрица C:');
disp(matrix);
C = matrix

%Решение
n=length(A);
lambda = eig(A)
for i = 1:n
rank1C = rank([A-lambda(i)*eye(n); C]);
rank3B = rank([A-lambda(i)*eye(n) B]);
message = ['Ранк собств числа ', num2str(lambda(i)), ' И С'];
disp(message);
disp(rank1C);
message = ['Ранк собств числа ', num2str(lambda(i)), ' И B'];
disp(message);
disp(rank3B);
end
