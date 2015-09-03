Matrix = {}

function Matrix:new(matrix)
	local self = {}

	self.matrix = matrix
	self.rows = #matrix
	self.columns = #matrix[1]

	self.add = function(self, mat)
		result = Matrix:new(self.matrix) --This sets the matrix size, data will be overwritten
		for i = 1, self.rows do
			for j = 1, self.columns do
				result.matrix[i][j] = self.matrix[i][j] + mat.matrix[i][j]
			end
		end
		return result
	end

	return self
end
