#=====================  rbind()  =====================
# df1 and df2 are combined by rows. The result has 4 rows.

# Create two data frames
df1 <- data.frame(Name = c("Alice", "Bob"), Age = c(25, 30))
df2 <- data.frame(Name = c("Charlie", "David"), Age = c(35, 40))

# Combine the data frames by rows
result <- rbind(df1, df2)
print(result)



#=====================  cbind()  =====================
# df1 and df2 are combined by columns. The result has 2 columns (Name and Age).

# Create two data frames
df1 <- data.frame(Name = c("Alice", "Bob"))
df2 <- data.frame(Age = c(25, 30))

# Combine the data frames by columns
result <- cbind(df1, df2)
print(result)


#=================================================================
# Merge
#=================================================================
df1 <- data.frame(ID = c(1, 2, 3), Name = c("Alice", "Bob", "Charlie"))
df2 <- data.frame(ID = c(2, 3, 4), Age = c(30, 35, 40))


#===================== Inner Join (default)  =====================
# Only the rows with ID 2 and 3 are included, 
# because these IDs are present in both df1 and df2.
result_inner <- inner_join(df1, df2, by = "ID")
print(result_inner)


#===================== Left Join  =====================
# All rows from df1 are included, 
# and the Age for ID 1 is NA because there is no corresponding match in df2.
result_left <- merge(df1, df2, by = "ID", all.x = TRUE)
print(result_left)


#===================== Right Join =====================
#  All rows from df2 are included, 
# and the Name for ID 4 is NA because there is no corresponding match in df1.
result_right <- merge(df1, df2, by = "ID", all.y = TRUE)
print(result_right)


#===================== Full Join  =====================
# All rows from both df1 and df2 are included. 
# ID 1 and 4 have NA values in the columns where there was no match.
result_full <- full_join(df1, df2, by = "ID")
print(result_full)



#=================================================================
# Joins
#=================================================================

#===================== Semi Join (a only) =====================
# Include shared nationalities from "a" and "b" but keep only columns from "a"
result_semi_a <- semi_join(df1, df2, by = "ID")
print(result_semi_a)

#===================== Semi Join (b only) =====================
# Include shared nationalities from "a" and "b" but keep only columns from "b"
result_semi_b <- semi_join(df1, df2, by = "ID")
print(result_semi_b)

#===================== Anti Join (unique to "a") =====================
# Get unique nationalities in "a" that are not in "b"
result_anti_a <- anti_join(df1, df2, by = "ID")
print(result_anti_a)

#===================== Anti Join (unique to "b") =====================
# Get unique nationalities in "b" that are not in "a"
result_anti_b <- anti_join(df1, df2, by = "ID")
print(result_anti_b)
