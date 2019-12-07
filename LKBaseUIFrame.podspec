#
# Be sure to run `pod lib lint LKBaseUIFrame.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LKBaseUIFrame'
  s.version          = '1.1.0'
  s.summary          = 'A base UIFrame of LKBaseUIFrame.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                      Some UI Frame on common use that the project is on App Store
                       DESC

  s.homepage         = 'https://github.com/lingkun/LKBaseUIFrame'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lingkun' => '2858850100@qq.com' }
  s.source           = { :git => 'https://github.com/lingkun/LKBaseUIFrame.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LKBaseUIFrame/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LKBaseUIFrame' => ['LKBaseUIFrame/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
   s.dependency 'AFNetworking'
   s.dependency 'SocketRocket'  
s.dependency 'AFNetworking', '~> 3.2.1'
s.dependency 'IQKeyboardManager', '~> 6.4.0'
s.dependency 'Masonry'
s.dependency 'MBProgressHUD', '~> 1.1.0'
s.dependency 'SVProgressHUD', '~> 2.2.5'
s.dependency 'MJExtension', '~> 3.1.0'
s.dependency 'MJRefresh', '~> 3.2.0'
s.dependency 'SDWebImage', '4.4.7'
s.dependency 'SSKeychain'
s.dependency 'DZNEmptyDataSet'
s.dependency 'PNChart'
#pod 'FMDB'
#pod 'GPUImage', '~> 0.1.7'
s.dependency 'CocoaSecurity', '~> 1.2.4'
s.dependency 'GVUserDefaults'
s.dependency 'LBXScan','~> 1.1.1'
s.dependency 'SDCycleScrollView'
s.dependency 'TOWebViewController'
s.dependency 'LKDBHelper'
#pod 'Bugly' #腾讯统计bug
s.dependency 'ReactiveObjC'
#pod 'AliyunOSSiOS', '~> 2.10.7'
s.dependency 'MOFSPickerManager'
# 照片
s.dependency 'TZImagePickerController'
s.dependency 'YYKit'
s.dependency 'libextobjc', '~> 0.6'

end
