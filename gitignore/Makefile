all:
	# not works with CR (Carriage Return) end of line
	# use .editorconfig 'end_of_line = lf'
	find . -type f -name "*.gitignore" -exec cat {} \; -exec echo \; > ../.gitignore
