Matrix = {}
Matrix.mt = {
	__add = function(self, mat)
		result = Matrix:new(self.matrix) --This sets the matrix size, data will be overwritten
		for i = 1, self.rows do
			for j = 1, self.columns do
				result.matrix[i][j] = self.matrix[i][j] + mat.matrix[i][j]
			end
		end
		return result
	end
}

function Matrix:new(matrix)
	local self = {}

	setmetatable(self, Matrix.mt)

	self.matrix = matrix
	self.rows = #matrix
	self.columns = #matrix[1]

	return self
end
