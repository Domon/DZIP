#!/usr/bin/ruby -Ku
#
# DZIP: List and extract compressed files in a ZIP archive
# Copyright (C) 2010  Chun-wei Kuo <http://www.cdpa.nsysu.edu.tw/~domon/>
#
# DZIP is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# DZIP is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with DZIP.  If not, see <http://www.gnu.org/licenses/>.
#
require 'fileutils'
require 'kconv'
require 'optparse'
require 'ostruct'
require 'zip/zip'

def list options
  Zip::ZipFile.open options.file do |zipfile|
    zipfile.each do |entry|
      print "(#{entry.name.encoding}) " if options.verbose
      puts entry.name.toutf8
    end
  end
end

def extract options
  Zip::ZipFile.open options.file do |zipfile|
    zipfile.each do |entry|
      path = "#{options.directory}/#{entry.name.toutf8}"
      puts path if options.verbose
      FileUtils.mkdir_p File.dirname(path)
      zipfile.extract(entry, path) { true if options.overwrite }
    end
  end
end

# set default values
options = OpenStruct.new
options.directory = "."
options.verbose = false

# parse options
OptionParser.new do |opts|
  opts.banner = "Usage: dz.rb [options]"
  opts.separator ""
  opts.separator "Main operation mode:"
  opts.on("-t", "--list", "list the contents of an archive") { |list| options.list = list }
  opts.on("-x", "--extract", "extract files from an archive") { |extract| options.extract = extract }
  opts.separator ""
  opts.separator "Common options:"
  opts.on("-C", "--directory DIR", "change to directory DIR") { |directory| options.directory = directory }
  opts.on("-f", "--file FILE", "use archive file") { |file| options.file = file }
  opts.on("--overwrite", "overwrite existing files and directory metadata when extracting") { |overwrite| options.overwrite = overwrite }
  opts.on("-v", "--verbose", "run verbosely") { |verbose| options.verbose = verbose }
end.parse!

if options.file.nil?
  puts "No file is specified." if options.verbose
else
  if options.list
    if options.extract
      puts "You may not use -x with -t."
    else
      list options
    end
  elsif options.extract
    extract options
  end
end
