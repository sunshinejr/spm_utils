require 'project_mod'
require 'json'

module SPMFixers
    class InhibitDepsWarnings
        def self.run
            json = JSON.parse(File.read("Package.resolved"))
            dependencies = json["object"]["pins"].map { |a| a["package"] }
            ProjectMode.apply_build_setting(name: 'GCC_WARN_INHIBIT_ALL_WARNINGS', value: 'YES', depedencies_required: dependencies)
            puts "Dependencies will now inhibit all warnings!"
        end
    end
end
