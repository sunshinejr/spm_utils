require 'xcodeproj'

class ProjectMod
    def self.apply_build_setting(name:, value:, target_names: [])
        xcodeprojs = Dir.new(Dir.pwd).select { |a| a.include? '.xcodeproj' }
        xcodeprojs_count = xcodeprojs.count
        
        abort "No *.xcodeproj files in current directory" if xcodeprojs_count == 0
        abort "Found #{xcodeprojs_count} .xcodeproj files in the directory (1 required)." if xcodeprojs_count > 1
        
        project = Xcodeproj::Project.open(xcodeprojs[0])
        targets = project.targets.clone
        if !target_names.empty?
            not_found_targets = target_names.select { |t| !targets.map { |tt| tt.name }.include? t }
            abort not_found_targets.join(", ") + " targets were not found in the Xcodeproj." if !not_found_targets.empty?

            targets.select! { |t| target_names.include? t.name }
        end
        
        abort "No targets selected" if targets.empty?
        
        targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings[name] = value
            end
        end
        
        project.save
    end
end
