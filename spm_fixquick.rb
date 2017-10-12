#!/usr/bin/env ruby

require 'xcodeproj'

xcodeprojs = Dir.new(Dir.pwd).select { |a| a.include? '.xcodeproj' }
xcodeprojs_count = xcodeprojs.count

abort "No *.xcodeproj files in current directory" if xcodeprojs_count == 0
abort "Found #{xcodeprojs_count} .xcodeproj files in the directory (1 required)." if xcodeprojs_count > 1

project = Xcodeproj::Project.open(xcodeprojs[0])
targets = project.targets.select { |a| a.name.eql? "QuickSpecBase" }
targets_count = targets.count

abort "No QuickSpecBase target" if targets_count < 1
abort "Too many QuickSpecBase targets :o" if targets_count > 1

target = targets[0]
target.build_configurations.each do |config|
    puts "current: #{config.build_settings['CLANG_ENABLE_MODULES']}"
    config.build_settings['CLANG_ENABLE_MODULES'] = 'YES'
    puts "now: #{config.build_settings['CLANG_ENABLE_MODULES']}"
end

project.save()

puts "Quick fixed!"