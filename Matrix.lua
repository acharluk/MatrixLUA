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
	end,
	__tostring = function(self)
		str = ""
		for i = 1, self.rows do
			for j = 1, self.columns do
				str = str .. self.matrix[i][j] .. ","
			end
			str = str .. "\n"
		end
		return str
	end,
	__call = function(self) -- When a matrix is called, return its determinant (only 1, 2 or 3 sizes)
		m = self.matrix
		assert(#m == #m[1], "Matrix is not square!")
		local size = #m

		if size == 1 then return m[1][1] end
		if size == 2 then return m[1][1] * m[2][2] - m[2][1] * m[1][2] end
		if size == 3 then return m[1][1]*m[2][2]*m[3][3] + m[1][2]*m[2][3]*m[3][1] + m[1][3]*m[2][1]*m[3][2]
							   - m[1][3]*m[2][2]*m[3][1] - m[1][1]*m[2][3]*m[3][2] - m[1][2]*m[2][1]*m[3][3] end

		return -0
	end
}

function Matrix:new(matrix)
	local self = {}

	setmetatable(self, Matrix.mt)

	self.matrix = matrix
	self.rows = #matrix
	self.columns = #matrix[1]

	self.reset = function()
		for i = 1, self.rows do
			for j = 1, self.columns do
				self.matrix[i][j] = 0
			end
		end
	end

	return self
end
