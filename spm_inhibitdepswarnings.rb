#!/usr/bin/env ruby

require 'json'
require 'xcodeproj'

xcodeprojs = Dir.new(Dir.pwd).select { |a| a.include? '.xcodeproj' }
xcodeprojs_count = xcodeprojs.count

abort "No *.xcodeproj files in current directory" if xcodeprojs_count == 0
abort "Found #{xcodeprojs_count} .xcodeproj files in the directory (1 required)." if xcodeprojs_count > 1

json_file = File.read "Package.resolved"
json = JSON.parse(json_file)
dependencies = json["object"]["pins"].map { |a| a["package"] }

project = Xcodeproj::Project.open(xcodeprojs[0])
targets = project.targets.select { |a| dependencies.include? a.name }

targets.each do |target|
    target.build_configurations.each do |config|
        config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
    end
end

project.save()

puts "Dependencies will now inhibit all warnings!"