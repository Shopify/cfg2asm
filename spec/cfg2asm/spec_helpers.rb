module Cfg2asm
  module SpecHelpers
    def self.dependencies_installed?
      ENV['NO_DEPENDENCIES_INSTALLED'].nil?
    end
  end
end
