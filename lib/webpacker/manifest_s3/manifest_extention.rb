module Webpacker
  module ManifestS3
    module ManifestExtention
      private

      def load
        if Webpacker::Configuration.manifest_s3_bucket && Webpacker::Configuration.manifest_s3_key
          resp = Webpacker::ManifestS3::S3Client.get_manifest
          JSON.parse(resp.body.read)
        else
          return super unless File.exist?(@path)
          JSON.parse(File.read(@path))
        end
      rescue Aws::S3::Errors::ServiceError
        super
      end
    end
  end
end
