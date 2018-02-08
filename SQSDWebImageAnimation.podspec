#
# Be sure to run `pod lib lint SQSDWebImageAnimation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SQSDWebImageAnimation'
  s.version          = '0.1.0'
  s.summary          = '配合UIImageView为SDWebImage图片加载量身打造的动画小组件'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
配合UIImageView为SDWebImage图片加载量身打造的动画小组件，可以自定义加载动画和时长
                       DESC

  s.homepage         = 'https://github.com/liao3841054/SQSDWebImageAnimation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '251180323@qq.com' => '251180323@qq.com' }
  s.source           = { :git => 'https://github.com/liao3841054/SQSDWebImageAnimation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SQSDWebImageAnimation/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'SDWebImage', '~>3.8.2'
end
