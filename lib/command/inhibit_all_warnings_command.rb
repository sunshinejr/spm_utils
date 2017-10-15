class InhibitAllWarningsCommand < Clamp::Command
    option ['--target'], 'TARGET', 'Target name', :multivalued => true

    def execute
        ProjectMod.append_or_apply_build_setting(name: 'OTHER_SWIFT_FLAGS', value: "-suppress-warnings", target_names: target_list)
        
        targets_string = target_list.empty? ? 'All targets' : (target_list.join(", ") + " targets")
        puts "#{targets_string} have inhibited warnings now!"                
    end
end