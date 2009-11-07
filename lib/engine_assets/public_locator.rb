class EngineAssets::PublicLocator
  class << self
    def paths
      @paths ||= []
    end

    def locate(file_path)
      full_paths = paths.map { |base_path| File.join(base_path, file_path) }
      full_paths.each do |full_path|
        return full_path if File.exist?(full_path)
      end
      nil
    end
  end
end
