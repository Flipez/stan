require 'sinatra'
module Stan
  class Server < Sinatra::Base
    upload_dir = ENV.fetch('STAN_UPLOAD_DIR')
    public_dir = ENV.fetch('STAN_PUBLIC_DIR')
    post '/upload' do
      name = params['name']
      filename = params['file']['filename']
      tempfile = params['file']['tempfile']
      FileUtils.mkdir_p(upload_dir)
      filepath = "#{upload_dir}/#{filename}"
      while blk = tempfile.read(65536)
        File.open(filepath, 'wb') do |f|
          f.write(blk)
        end
      end
      FileUtils.mkdir_p("#{public_dir}/#{name}")
      Dir.chdir("#{public_dir}/#{name}") do
        `tar -xzf #{filepath} .`
      end
      FileUtils.rm(filepath)
      "Upload complete"
    end

  end
end
