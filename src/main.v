/*
elv
size of name
name of the file
size of content
content
.....
*/

module main

import os

const (
	Mag = 'elv'
)

/*struct AFile {
	name string
	content string
}*/

fn main() {
	if os.args.len < 3 || os.args[1].len != 1 {
		execname := os.args[0]
		println('usage: $execname <alx> <ARCHIVE_NAME.elv> [FILE...]')
	} else if os.args[1] == 'l' {
		println('listing')
		// TODO
	} else if os.args[1] == 'a' {
		println('archiving')
		if os.args.len > 3 {
			files := os.args.right(3)    // get files to archive
			arc := os.create(os.args[2]) // create new archive
			arc.write(Mag) // write magic number
			for file in files {
				arc.write_bytes(file.len, 4) // size of file name
				arc.write(file) // file name
				arc.write_bytes(os.file_size(file), 8) // size of file
				cont := os.read_file(file) or {  // read file content
					panic('file does not exists')
					return
				}
				arc.write(cont) // write content
			}
			arc.close()
		} else {
			println('no files to archive')
			exit(1)
		}

	} else if os.args[1] == 'x' {
		println('extarcting')
		// TODO
	}
}
