module Webpacker
  module ManifestS3
    module ConfigurationExtention
      def manifest_bucket
        fetch(:manifest_bucket)
      end

      def manifest_key
        fetch(:manifest_key)
      end

      def aws_access_key_id
        fetch(:aws_access_key_id)
      end

      def aws_secret_access_key
        fetch(:aws_secret_access_key)
      end

      def aws_region
        fetch(:aws_region)
      end
    end
  end
end
