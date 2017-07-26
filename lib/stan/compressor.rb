module Stan
  class Compressor
    attr_reader :path, :output, :size

    def initialize(dir)
      @tempdir = ENV.fetch('STAN_TEMP_DIR')
      @path = File.path(dir)
    end

    def compress
      FileUtils.mkdir_p(@tempdir)
      date = DateTime.now.strftime('%Y%m%d%H%M%S')
      @output = "#{@tempdir}/#{date}.tar.gz"

      Dir.chdir(path) do
        `tar -czf #{output} .`
      end

      @size = File.size(output) / 2**20
    end

  end
end
