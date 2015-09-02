Matrix = {}

function Matrix:new(matrix)
	local self = {}

	self.matrix = matrix
	self.rows = #matrix
	self.columns = #matrix[1]

	return self
end
