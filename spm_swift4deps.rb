#!/usr/bin/env ruby

require 'xcodeproj'

xcodeprojs = Dir.new(Dir.pwd).select { |a| a.include? '.xcodeproj' }
xcodeprojs_count = xcodeprojs.count

abort "No *.xcodeproj files in current directory" if xcodeprojs_count == 0
abort "Found #{xcodeprojs_count} .xcodeproj files in the directory (1 required)." if xcodeprojs_count > 1

project = Xcodeproj::Project.open(xcodeprojs[0])
project.targets.each do |target|
    target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.0'
    end
end

project.save()

puts "All targets were updated to use Swift 4.0!"