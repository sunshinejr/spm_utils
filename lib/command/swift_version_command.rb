class SwiftVersionCommand < Clamp::Command
    parameter "VERSION", "version", :attribute_name => :swift_version
    option ['--target'], 'TARGET', 'Target name', :multivalued => true
    # option ['--swift-version'], 'SWIFT_VERSION', 'What Swift version to change into', :required => true

    def execute
        supported_swift_versions = ['3.0', '4.0', '4.2']
        if !supported_swift_versions.include? swift_version
            signal_usage_error "'#{swift_version}' swift version is not supported. Supported values: " + supported_swift_versions.map { |v| "'#{v}'" }.join(", ")
        end
             
        ProjectMod.apply_build_setting(name: 'SWIFT_VERSION', value: "#{swift_version}.0", target_names: target_list)
        
        targets_string = target_list.empty? ? 'All targets' : (target_list.join(", ") + " targets")
        puts "#{targets_string} were updated to use Swift #{swift_version}!"        
    end
end