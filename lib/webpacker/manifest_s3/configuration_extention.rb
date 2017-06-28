module Webpacker
  module ManifestS3
    module ConfigurationExtention
      def manifest_s3_bucket
        fetch(:manifest_s3_bucket)
      end

      def manifest_s3_key
        fetch(:manifest_s3_key)
      end

      def aws_region
        fetch(:aws_region)
      end

      def aws_access_key_id
        fetch(:aws_access_key_id)
      end

      def aws_secret_access_key
        fetch(:aws_secret_access_key)
      end

      def upload_manifest_path
        fetch(:upload_manifest_path)
      end
    end
  end
end
