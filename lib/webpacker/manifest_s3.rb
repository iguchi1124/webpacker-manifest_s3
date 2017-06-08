require "webpacker/manifest_s3/version"
require 'webpacker/manifest_s3/configuration_extention'
require 'webpacker/manifest_s3/manifest_extention'
require 'webpacker/configuration'
require 'webpacker/manifest'

Webpacker::Configuration.send(:extend, Webpacker::ManifestS3::ConfigurationExtention)
Webpacker::Manifest.send(:prepend, Webpacker::ManifestS3::ManifestExtention)
