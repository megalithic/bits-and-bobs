#!/usr/bin/env ruby
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
    # system "$EDITOR -c 'ggo' -c 'startinsert' #{f.path}"
    system "$EDITOR +norm\!Go +startinsert #{f.path}"
  else
    system "$EDITOR #{f.path}"
  end
end

def add_note(f, note_text)
  # if we don't have any note text, just open the file instead
  if note_text.nil?
    # open our file for editing in default editor
    open_file_in_editor(f)
    exit
  else
    # otherwise go ahead and append our given note_text
    f.puts note_text
  end
end

def add_date(f, date)
  add_note(f, date)
  add_note(f, "##########")
end

def process_script
  if all_available_notes.grep(/#{current_date_stamp}/)[0]
    # we found a current-dated file, so write to it
    current_file = all_available_notes.grep(/#{current_date_stamp}/)[0]
    begin
      File.open(current_file, "a+") do |f|
        # append our note text to the file
        add_note(f, note_text)
      end
      STDOUT.puts ".. finished appending '#{note_text.chomp}' to #{current_file}"
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
        add_note(f, note_text)
      end
      STDOUT.puts ".. finished writing '#{note_text.chomp}' to #{new_file}"
    rescue => e
      # something went horribly wrong with writing to our file..
      STDOUT.puts "Unable to open newly created file for writing -- #{e}"
    end
  end
end

# invoke primary code execution
process_script
