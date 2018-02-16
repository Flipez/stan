require 'typhoeus'
module Stan
  class Deployer
    def self.deploy(source, name, keep: false)
      url = ENV.fetch('STAN_SERVER') 
      puts "Going to deploy `#{name}` to #{url}"
      res = Typhoeus.post(
              "#{url}/upload",
              body: {
                name: name,
                file: File.open(source, 'r')
              },
              followlocation: true
            )
      if res.success?
        puts "Successfully deployed `#{name}`"
	puts "Your site should be reachable at `#{url}/#{name}`"
      else
        puts "Something went wrong. (#{res.response_code})"
	puts res.inspect if Stan::CI
      end
      FileUtils.rm(source) unless keep
    end
  end
end
