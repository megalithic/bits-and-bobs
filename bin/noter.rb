#!/usr/bin/env ruby

#
# NOTER!
# ===========================================================================
# This is a super basic markdown-based note taking app for command-line users.
# It makes some assumptions already, but is flexible in other areas as well.
#
# Firstly, it assumes you're using Dropbox and that your Dropbox folder - with
# a subfolder called `notes` - exists at `~/Dropbox/notes`.
#
# Secondly, to make it easier to use, I suggest aliasing the script to
# something like this in your shell rc of choice:
# `alias n="ruby ~/.dotfiles/bin/noter.rb"`
#
# That's it for 'setup'.
#
#
# USAGE:
# `n "some notes text"`
#
# Wait, what? That's it?
# Yeah, that's it. What it does is create a dated notes file for the current
# day (if it doesn't already exist) and then append that given string to the
# newly created file. If a notes file with the current date already exists, it
# simply appends it to that file.
#
# MOAR USAGE:
# If you simply execute `n`, all naked-like, it'll open the current day's note
# file in your system-defined $EDITOR, and if you use vim (which.. you should),
# it will open it in insert mode on a new line at the end of the file for you
# -- no muss, no fuss.
#
#
# TODO n STUFF:
# * Get those command line options/switches workin', dog!
# * Handle archiving
# * Handle a more appropriate setup of files and folder locations.
# * Prepare the web counter-part for Dropbox/GitHub-hosted note viewing.
# * Migrate the script to GitHub.
# * Sigh, code smells in process_script method
# * Time-stamp new "chunks" of entries?
# * Tests!
#


require 'rubygems'
require 'pry'
require 'fileutils'
require 'pathname'
require 'date'

def note_text
  ARGV[0]
end

def default_file_path
  "#{Dir.home}/Dropbox/notes"
end

def current_date
  Time.now.strftime("%m/%d/%Y")
end

def current_date_stamp
  Time.now.strftime("%Y_%m_%d")
end

def all_available_notes
  Dir["#{Dir.home}/Dropbox/notes/**/*.md"]
end

def open_file_in_editor(f)
  # determine which default editor; if vim, we want to do fun things for smart
  # people that use vim, otherwise just open the file
  case `which $EDITOR`
  when /vim/
    system "$EDITOR +norm\!Go +startinsert #{f.path}"
  else
    system "$EDITOR #{f.path}"
  end
end

def add_note(f, note)
  # if we don't have any note text, just open the file instead
  if note.chomp("- ").empty?
    # open our file for editing in default editor
    open_file_in_editor(f)
    exit
  else
    # otherwise go ahead and append our given note text
    f.puts note
  end
end

def add_date(f, date)
  add_note(f, date)
  add_note(f, "##########")
end

# TODO: clean up redundancy
def process_script
  if all_available_notes.grep(/#{current_date_stamp}/)[0]
    # we found a current-dated file, so write to it
    current_file = all_available_notes.grep(/#{current_date_stamp}/)[0]
    begin
      File.open(current_file, "a+") do |f|
        # append our note text to the file
        add_note(f, "- #{note_text}")
      end
      STDOUT.puts ".. finished appending to #{current_file}"
    rescue => e
      # something went horribly wrong with writing to our file..
      STDOUT.puts "Unable to open current dated file for appending -- #{e}"
    end
  else
    # we don't have a file for the current date, so create it and add our date-
    # stamp for the current date
    new_file = "#{default_file_path}/#{current_date_stamp}-notes.md"
    begin
      File.open(new_file, "w+") do |f|
        add_date(f, current_date)
        add_note(f, "- #{note_text}")
      end
      STDOUT.puts ".. finished writing to #{new_file}"
    rescue => e
      # something went horribly wrong with writing to our file..
      STDOUT.puts "Unable to open newly created file for writing -- #{e}"
    end
  end
end

# invoke primary code execution
process_script
