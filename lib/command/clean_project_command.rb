class CleanProjectCommand < Clamp::Command
    def execute
        system("swift package clean && rm -rf .build && rm Package.resolved")
    end
end