Pod::Spec.new do |s|
  s.name         = 'FMTagsView'
  s.summary      = '一个基于UICollectionView的标签展示控件 .'
  s.version      = '0.1.5'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Subo' => '455295813@qq.com' }
  s.social_media_url = 'http://bobdev.cn/'
  s.homepage     = 'https://github.com/huipengo/FMTagsView'
  s.platform     = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.source       = { :git => 'https://github.com/huipengo/FMTagsView.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.source_files = 'FMTagsView/TagsView/**/*.{h,m}'
  s.public_header_files = 'FMTagsView/TagsView/**/*.{h}'

  s.framework = 'UIKit'

end
