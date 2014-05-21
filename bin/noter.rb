#!/usr/bin/env ruby
require 'rubygems'
require 'pry'
require 'fileutils'
require 'pathname'
require 'date'


# ----------------------------------------------------------
# define our vars
note_text = ARGV[0]
default_file_path = "#{Dir.home}/Dropbox/notes"
current_date = Time.now.strftime("%m/%d/%Y")
current_date_stamp = Time.now.strftime("%Y_%m_%d")
all_notes = Dir["#{Dir.home}/Dropbox/notes/**/*.md"]


def add_note(f, note_text)
  # if we don't have any note text, just open the file instead
  if note_text.nil?
    # open our file for editing in default editor
    system "$EDITOR #{f.path}"
  else
    f.puts note_text
  end
end

def add_date(f, date)
  add_note(f, date)
  add_note(f, "##########")
end


# ----------------------------------------------------------
# primary code execution
if all_notes.grep(/#{current_date_stamp}/)
  # we found a currently dated file, so write to it
  current_file = all_notes.grep(/#{current_date_stamp}/)[0]
  begin
    File.open(current_file, "a+") do |f|
      add_note(f, note_text)
    end
  rescue => e
    STDOUT.puts "Unable to open current dated file for writing -- #{e}"
  end
else
  # we don't have a file for the current date, so created it and add our date-
  # stamp
  File.open("#{default_file_path}/#{current_date_stamp}-notes.md", "w+") do |f|
    add_date(f, current_date)
    add_note(f, note_text)
  end
end

