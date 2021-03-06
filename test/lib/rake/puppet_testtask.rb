#!/usr/bin/env ruby

module Rake
    class PuppetTestTask < Rake::TestTask
        def rake_loader
            if Integer(RUBY_VERSION.split(/\./)[2]) < 4
                file = super
            else
                file = find_file('rake/puppet_test_loader') or
                    fail "unable to find rake test loader"
            end
            return file
        end
    end
end

