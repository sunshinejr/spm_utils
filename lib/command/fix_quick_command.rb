require 'clamp'
require 'project_mod'

class FixQuickCommand < Clamp::Command

    def execute
        ProjectMod.apply_build_setting(name: 'CLANG_ENABLE_MODULES', value: 'YES', target_name: 'QuickSpecBase')
        puts "Quick fixed!"        
    end
end