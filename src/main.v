/*
elv
-----
size of name
name of the file
size of content
content
-----
.....
*/

module main

import os

const (
	Mag = 'elv'
)

struct AFile {
	name string
	content string
}

fn main() {
	if os.args.len < 3 || os.args[1].len != 1 {
		execname := os.args[0]
		println('usage: $execname <alx> <ARCHIVE_NAME.elv> [FILE...]')
	} else if os.args[1] == 'l' {
		println('listing')
	} else if os.args[1] == 'a' {
		println('archiving')
		if os.args.len > 3 {
			files := os.args.right(3)
			arc := os.create(os.args[2])
			arc.appendln(Mag)
			for file in files {
				arc.write_byte(file.len, 4)
				arc.appendln(file)
				arc.write_byte(os.file_size(file), 8)
				arc.appendln(os.read_file(file))
			}
			arc.close()
		} else {
			println('no files to archive')
			exit(1)
		}

	} else if os.args[1] == 'x' {
		println('extarcting')
	}
}
