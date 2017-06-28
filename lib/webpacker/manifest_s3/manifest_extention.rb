module Webpacker
  module ManifestS3
    module ManifestExtention
      private

      def load
        if Webpacker::Configuration.manifest_s3_bucket && Webpacker::Configuration.manifest_s3_key
          resp = Webpacker::ManifestS3::S3Client.get_manifest
          JSON.parse(resp.body.read)
        else
          super
        end
      rescue Aws::S3::Errors::ServiceError
        {}
      end
    end
  end
end
