require "Matrix"

matrix1 = Matrix:new({{0}}) --1x1 matrix
print("Rows: " .. matrix1.rows)
print("Columns" .. matrix1.columns)
print(matrix1.matrix[1][1])
