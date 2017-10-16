class CleanProjectCommand < Clamp::Command
    def execute
        system "swift package clean && rm -rf .build && rm Package.resolved &> /dev/null"
        puts "All things cleaned! Now to the good stuff..."
    end
end