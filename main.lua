require "Matrix"

function main()
	local matrix1 = Matrix:new({{0}}) --1x1 matrix
	local matrix2 = Matrix:new({{1, 0}, {0, 1}}) --2x2 matrix
	local matrix3 = Matrix:new({{1, 2}, {3, 4}}) --Another 2x2 matrix
	local matrix4 = Matrix:new({{1,2,3},{4,5,6}})
	print(tostring(matrix3 * matrix4))
end

local ok, err = pcall(main)
if not ok then
	print("Something went wrong :(")
	print(err)
end
