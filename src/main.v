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

mut f_size:= 0
mut filename_size := 0

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
				filename_size = file.len
                println('"${filename_size}"')
				arc.write_bytes(&filename_size, 4) // size of file name
				arc.write(file) // file name
                f_size = os.file_size(file)
                println('"${f_size}"')
				arc.write_bytes(&f_size, 4) // size of file
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
