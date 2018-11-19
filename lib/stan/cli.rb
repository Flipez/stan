class Thorough < Thor
  ENV["THOR_DEBUG"] = "1"
  check_unknown_options!
private
  def subcommand(*_) super subcommand(*_)
  rescue Thor::Error => e
    $stderr.puts e.message
    exit 1
  end
end

module Stan
  class Cli < Thorough
    desc 'version', 'display the stan version'
    def version
	    puts('Stan version ' + Stan::VERSION.to_s)
    end

    desc 'compress DIRECTORY', 'compress given directory'
    def compress(dir)
      c = Stan::Compressor.new(dir)
      c.compress
    end

    desc 'server', 'start the server to receive and serve pages'
    def server
      Stan::Server.run!
    end

    desc 'deploy DIRECTORY NAME', 'deploys given directory to stan server'
    def deploy(dir, name)
      c = Stan::Compressor.new(dir)
      c.compress
      file = c.output
      Stan::Deployer.deploy(file, name)
    end
  end
end
