DZIP
====

DZIP is a simple script that lists or extracts files from a ZIP archive.

The initial attempt of this program was to extract files with Shift_JIS
filenames. DZIP converts any non-UTF-8 filenames to UTF-8.


Installation
------------

#  Install the `rubyzip` gem, if you have not already done so.

        gem install rubyzip

#  Get a copy of DZIP [here](http://github.com/Domon/DZIP).

        git clone git://github.com/Domon/DZIP.git

   or 

        wget http://github.com/Domon/DZIP/raw/master/dz.rb

#  Make it executable.

        chmod u+x dz.rb


Usage
-----

    dz.rb [options]
    
    Main operation mode:
        -t, --list                       list the contents of an archive
        -x, --extract                    extract files from an archive
    
    Common options:
        -C, --directory DIR              change to directory DIR
        -f, --file FILE                  use archive file
            --overwrite                  overwrite existing files and directory metadata when extracting
        -v, --verbose                    run verbosely


Examples
--------

*  List the contents of "日本語ファイル名.zip"

        ./dz.rb -tf 日本語ファイル名.zip

*  Extract "日本語ファイル名.zip" verbosely

        ./dz.rb -xvf 日本語ファイル名.zip

*  Extract "日本語ファイル名.zip" to a directory named "フォルダ"

        ./dz.rb -xf 日本語ファイル名.zip -C フォルダ/


License
-------

DZIP: List and extract compressed files in a ZIP archive
Copyright (C) 2010  Chun-wei Kuo <http://www.cdpa.nsysu.edu.tw/~domon/>

DZIP is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

DZIP is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with DZIP.  If not, see <http://www.gnu.org/licenses/>.

