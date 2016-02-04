#
# Be sure to run `pod lib lint ObjectiveMime.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SwiftMime"
  s.version          = "0.3.0"
  s.summary          = "inspired from node-mime."
  s.homepage         = "https://github.com/weekwood/SwiftMime"
  s.license          = 'MIT'
  s.author           = { "di wu" => "di.wu@me.com" }
  s.source           = { :git => "https://github.com/weekwood/SwiftMime.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*.swift'
  s.resources = 'Pod/Assets/*.types'
end
