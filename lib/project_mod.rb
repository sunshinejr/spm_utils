require 'xcodeproj'

class ProjectMod
    def self.xcodeproject(path:)
        xcodeprojs = Dir.new(path).select { |a| a.include? '.xcodeproj' }
        xcodeprojs_count = xcodeprojs.count
        
        abort "No *.xcodeproj files in current directory" if xcodeprojs_count == 0
        abort "Found #{xcodeprojs_count} .xcodeproj files in the directory (1 required)." if xcodeprojs_count > 1
        
        Xcodeproj::Project.open(xcodeprojs[0])        
    end

    def self.get_targets(project:,target_names:) 
        targets = project.targets.clone
        if !target_names.empty?
            not_found_targets = target_names.select { |t| !targets.map { |tt| tt.name }.include? t }
            abort not_found_targets.join(", ") + " targets were not found in the Xcodeproj." if !not_found_targets.empty?

            targets.select! { |t| target_names.include? t.name }
        end
        
        abort "No targets selected" if targets.empty?

        return targets
    end

    def self.apply_build_setting(name:, value:, target_names: [])        
        project = xcodeproject(path: Dir.pwd)
        targets = get_targets(project: project, target_names: target_names)
        
        targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings[name] = value
            end
        end
        
        project.save
    end

    def self.append_or_apply_build_setting(name:, append_value:, target_names: []) 
        project = xcodeproject(path: Dir.pwd)
        targets = get_targets(project: project, target_names: target_names)
        
        targets.each do |target|
            target.build_configurations.each do |config|
                if config.build_settings[name].nil?
                    config.build_settings[name] = value
                else
                    config.build_settings[name] += " #{value}"
                end
            end
        end
        
        project.save
    end
end
