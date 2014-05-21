#!/usr/bin/env ruby

require 'rubygems'
require 'pry'
# require 'kramdown'
require 'fileutils'
require 'pathname'
require 'date'

ARGV.each do |arg|
  # do something with the arguments soon, k?
end


# ----------------------------------------------------------
# define our vars
note_text = ARGV[0]
default_file_path = "#{Dir.home}/Dropbox/notes"
default_file_name = "notes.md"
default_file = "#{default_file_path}/#{default_file_name}"
current_date = Time.now.strftime("%m/%d/%Y")


# ----------------------------------------------------------
# write content to file
current_date_found = false
File.open(default_file, "a+") do |f|
  # check for date line entries and determine if it's a match for today's date
  # should this only check the first line?
  f.readlines.each_with_index do |line, i|
    if i == 0 # fine, we'll only check on the first line
      begin
        # loop lines and find the current date as our given string format
        line_as_date_text = Date.strptime(line, "%m/%d/%Y").strftime("%m/%d/%Y")

        # if current date found, note that with the line number it was found on
        if line_as_date_text == current_date
          @found_on_line = i
          current_date_found = line_as_date_text == current_date
        end
      rescue => e
        STDOUT.puts ".. no current date found, or unable to parse -- #{e}"
        current_date_found = false
      end
      break
    end
  end

  # ----------------------------------------------------------
  # verify we have some notes text to write
  if note_text.empty?
    if current_date_found
      # TODO: write the current date to the top of the file before opening
    end
    # open our file for editing in default editor
    `$EDITOR #{default_file}`
  end

  if current_date_found
    # write our content on the last line of notes for the current date
    STDOUT.puts ".. found a current date entry at line #{@found_on_line}"
    # TODO: find the last line of notes for this date and write our new note
  else
    # TODO: go to line 1 of the file and write the current date
    f.rewind
    f.puts "\n"
    f.puts current_date
    f.puts "##########"
    STDOUT.puts ".. unable to find a current date entry, so creating a date entry for #{current_date}"
  end

  # write note to file
  # TODO: write the content in the appropriate place, not just at the end of
  # the file
  begin
    f.puts note_text
    STDOUT.puts ".. wrote, `#{note_text}`, to #{default_file} at #{Time.now.strftime("%m/%d/%Y %H:%M")}"
  rescue => e
    f.close
    STDOUT.puts ".. unable to write to file -- #{e}"
  end
end


