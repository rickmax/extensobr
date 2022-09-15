# frozen_string_literal: true

require 'yaml'

class Settings
  class << self
    attr_reader :extensobr_settings
  end

  @extensobr_settings = {
    raise_for_nil: ENV['EXTENSO_RAISE_FOR_NIL'] || 'false',
    use_core_exts: ENV['EXTENSO_USE_CORE_EXTS'] || 'true'
  }

  @extensobr_settings_loaded = false

  def self.load_extensobr_settings
    return if @extensobr_settings_loaded

    if Kernel.const_defined? 'Rails'
      file_path = "#{__dir__}/config/extensobr.yml"
      if ::File.exist?(file_path)
        settings_file = ::YAML.load_file(file_path)
        @extensobr_settings[:raise_for_nil] = settings_file['extensobr_settings']['raise_for_nil'] || 'false'
        @extensobr_settings[:use_core_exts] = settings_file['extensobr_settings']['use_core_exts'] || 'true'
        @extensobr_settings_loaded = true
      else
        @extensobr_settings_loaded = false
      end
    end
  end
end
