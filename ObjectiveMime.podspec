#
# Be sure to run `pod lib lint ObjectiveMime.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ObjectiveMime"
  s.version          = "0.0.1"
  s.summary          = "inspired from node-mime."
  s.description      = <<-DESC
                        inspired from node-mime.
                        file from apache
                       DESC
  s.homepage         = "https://github.com/weekwood/ObjectiveMime"
  s.license          = 'MIT'
  s.author           = { "di wu" => "di.wu@me.com" }
  s.source           = { :git => "https://github.com/weekwood/ObjectiveMime.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*.swift'
  s.resource_bundles = {
    'ObjectiveMime' => ['Pod/Assets/*.types']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
