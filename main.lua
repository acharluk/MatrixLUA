require "Matrix"

function main()
	local matrix1 = Matrix:new({{0}}) --1x1 matrix
	local matrix2 = Matrix:new({{0, 1}, {1, 0}}) --2x2 matrix
	local matrix3 = Matrix:new({{1, 2}, {3, 4}}) --Another 2x2 matrix
	print(matrix3:add(matrix2))
end

local ok, err = pcall(main)
if not ok then
	print("Something went wrong :(")
	print(err)
end
