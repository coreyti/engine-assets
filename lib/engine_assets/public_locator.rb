class EngineAssets::PublicLocator
  class << self
    attr_reader :paths

    # TODO: expose this as EngineAssets.register(...)
    def register(full_path)
      raise ArgumentError unless File.exist?(full_path)

      @paths ||= []
      public_path = File.join(full_path, 'public')

      if File.exist?(public_path)
        paths << public_path
      end
    end

    def locate(file_path)
      full_paths = (paths || []).map { |base_path| File.join(base_path, file_path) }

      full_paths.each do |full_path|
        return full_path if File.exist?(full_path)
      end

      nil
    end

    private

      def clear
        @paths = nil
      end
  end
end
