require 'aws-sdk'

module Webpacker
  module ManifestS3
    module ManifestExtention
      private

      def load
        if Webpacker::Configuration.manifest_s3_bucket && Webpacker::Configuration.manifest_s3_key
          resp = s3_client.get_object(bucket: Webpacker::Configuration.manifest_s3_bucket, key: Webpacker::Configuration.manifest_s3_key)
          JSON.parse(resp.body.read)
        else
          return super unless File.exist?(@path)
          JSON.parse(File.read(@path))
        end
      end

      def s3_client
        Aws::S3::Client.new(client_options)
      end

      def client_options
        hash = {}
        hash[:credentials] = credentials
        hash[:region] = region if region
        hash
      end

      def credentials
        if access_key_id && secret_access_key
          Aws::Credentials.new(access_key_id, secret_access_key)
        else
          Aws::InstanceProfileCredentials.new
        end
      end

      def access_key_id
        Webpacker::Configuration.aws_access_key_id || ENV['AWS_ACCESS_KEY_ID']
      end

      def secret_access_key
        Webpacker::Configuration.aws_secret_access_key || ENV['AWS_SECRET_ACCESS_KEY']
      end

      def region
        Webpacker::Configuration.aws_region || ENV['AWS_REGION']
      end
    end
  end
end
