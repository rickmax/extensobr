# frozen_string_literal: true

require 'yaml'

class Settings
  class << self
    attr_reader :settings
  end

  @settings = {
    raise_for_nil: ENV['EXTENSO_RAISE_FOR_NIL'] || 'false',
    use_core_exts: ENV['EXTENSO_USE_CORE_EXTS'] || 'true'
  }

  @settings_loaded = false

  def self.load_settings
    return if @settings_loaded

    if Kernel.const_defined? 'Rails'
      file_path = ::File.join(Rails.root, 'config', 'extensobr.yml')
      if ::File.exist?(file_path)
        settings_file = ::YAML.load_file(file_path)
        @settings[:raise_for_nil] = settings_file['raise_for_nil'] || 'false'
        @settings[:use_core_exts] = settings_file['use_core_exts'] || 'true'
      end
    end
    @settings_loaded = true
  end
end
