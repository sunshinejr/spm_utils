require 'project_mod'

module SPMFixers
    class Swift4All
        def self.run
            ProjectMod.apply_build_setting(name: 'SWIFT_VERSION', value: '4.0')
            puts "All targets were updated to use Swift 4.0!"
        end
    end
end
