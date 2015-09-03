Matrix = {}
Matrix.mt = {
	__add = function(self, mat)
		if self.rows ~= mat.rows or self.columns ~= mat.columns then return nil end
		result = Matrix:new(self.matrix) --This sets the matrix size, data will be overwritten
		for i = 1, self.rows do
			for j = 1, self.columns do
				result.matrix[i][j] = self.matrix[i][j] + mat.matrix[i][j]
			end
		end
		return result
	end,
	__sub = function(self, mat)
		if self.rows ~= mat.rows or self.columns ~= mat.columns then return nil end
		result = Matrix:new(self.matrix)
		for i = 1, self.rows do
			for j = 1, self.columns do
				result.matrix[i][j] = self.matrix[i][j] - mat.matrix[i][j]
			end
		end
		return result
	end,
	__mul = function(self, mat)
		if self.columns ~= mat.rows then return nil end

		m = {}
		for i = 1, self.rows do
			m[i] = {}
			for j = 1, mat.columns do
				m[i][j] = 0
			end
		end

		result = Matrix:new(m)
		for i = 1, result.rows do
			for j = 1, result.columns do
				for k = 1, self.columns do
					result.matrix[i][j] = result.matrix[i][j] + self.matrix[i][k] * mat.matrix[k][j]
				end
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
