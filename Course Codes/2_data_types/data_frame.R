vector1 = c("A", "B", "C", "D")
vector2 =  c(1, 2, 3, 4)
data_frame_variable = data.frame(alphabets = vector1,
                                 numbers = vector2,
                                 words = c("AAA", "BBB", "CCC", "DDD"),
                                 row.names = c("r1", "r2", "r3", "r4")
)


#===================== Access =====================
# Access by column
data_frame_variable[, 1]
data_frame_variable$alphabets

# Access by row
data_frame_variable[1 ,]

# Get col names
col_names = colnames(data_frame_variable)

# Get row names
row_names = rownames(data_frame_variable)


#===================== Exclude =====================

# exclude the first column
data_frame_variable[, -1]

# exclude the first and third columns
data_frame_variable[, -c(1, 3)]
