require 'project_mod'

module SPMFixers
    class FixQuick
        def self.run
            ProjectMod.apply_build_setting(name: 'CLANG_ENABLE_MODULES', value: 'YES', target_name: 'QuickSpecBase')
            puts "Quick fixed!"
        end
    end
end
