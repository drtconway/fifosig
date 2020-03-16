# fifosig

A small tool for computing a digest on a file while copying it to a pipe.

## About

Many bioinformatics applications require the processing of pretty big files.
It is sometimes considered too expensive to perform a separate processing
task to compute a checksum (e.g. MD5 or SHA1) because it involves re-reading
the file from disk.

The purpose of this tool is to allow a workflow to interpose a process that
reads the file and computes the checksum, while also writing the file to a
Unix FIFO (named pipe), which can be read by a target process.

## Example

```bash
$ fifosig -o /tmp/ERR3624969_1.fastq.gz.sha1 /data/ERR3624969_1.fastq.gz /tmp/ERR3624969_1.fastq.gz &
[1]
$ fifosig -o /tmp/ERR3624969_2.fastq.gz.sha1 /data/ERR3624969_2.fastq.gz /tmp/ERR3624969_2.fastq.gz &
[2]
$ bwa mem /reference/TIGR4.fa /tmp/ERR3624969_1.fastq.gz /tmp/ERR3624969_2.fastq.gz > /tmp/ERR3624969.sam
...
```
