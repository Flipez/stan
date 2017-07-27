require 'typhoeus'
module Stan
  class Deployer
    def self.deploy(source, name, keep: false)
      url = ENV.fetch('STAN_SERVER') 
      Typhoeus.post(
        "#{url}/upload",
        body: {
          name: name,
          file: File.open(source,"r")
        },
        followlocation: true
      )
      FileUtils.rm(source) unless keep
    end
  end
end
