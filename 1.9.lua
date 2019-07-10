

test = [[
char s[] = "a /* here";  /* a tricky string */

]]
print(string.gsub(test, "/%*.-%*/", "<COMMENT>"))
