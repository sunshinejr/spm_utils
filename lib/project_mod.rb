require 'xcodeproj'

module SPMFixers
    class ProjectMod
        def self.apply_build_setting(name:, value:, target_name: nil, depedencies_required: [])
            xcodeprojs = Dir.new(Dir.pwd).select { |a| a.include? '.xcodeproj' }
            xcodeprojs_count = xcodeprojs.count
            
            abort "No *.xcodeproj files in current directory" if xcodeprojs_count == 0
            abort "Found #{xcodeprojs_count} .xcodeproj files in the directory (1 required)." if xcodeprojs_count > 1
            
            project = Xcodeproj::Project.open(xcodeprojs[0])
            targets = project.targets.clone
            if target_name != nil
                targets.select! { |t| t.name == target_name }
            end
            if !depedencies_required.empty?
                targets.select! { |a| depedencies_required.include? a.name }
            end
            
            abort "No targets" if targets.empty?
            
            target = targets[0]
            target.build_configurations.each do |config|
                config.build_settings[name] = value
            end
            
            project.save()
        end
    end
end
