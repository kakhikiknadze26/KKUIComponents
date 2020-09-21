Pod::Spec.new do |s|
  s.name             = 'KKUIComponents'
  s.version          = '1.0.0'
  s.summary          = 'Collection of custom UI Components.'

  s.homepage         = 'https://github.com/kakhikiknadze26/KKUIComponents'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kakhi Kiknadze' => 'kakhi.kiknadze@wandio.com' }
  s.source           = { :git => 'https://github.com/kakhikiknadze26/KKUIComponents.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.source_files = 'KKUIComponents/Classes/**/*'
  s.frameworks = 'UIKit'
  s.swift_version = '5.0'
end
