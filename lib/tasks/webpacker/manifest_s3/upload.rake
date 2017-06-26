desc 'upload manifest file to AWS S3'
namespace 'webpacker:manifest_s3' do
  task :upload do
    Webpacker::Env.load
    Webpacker::Configuration.load
    Webpacker::ManifestS3::S3Client.put_manifest
  end
end
