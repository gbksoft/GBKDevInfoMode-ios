Pod::Spec.new do |s|

  s.name = "GBKDevInfoMode"
  s.version = "0.6"
  s.summary = "Info for developer/QA"
  s.license = 'MIT'
  s.homepage = 'https://gbksoft.com/'
  s.authors = 'Andrii Zakhliupanyi'
  s.source = { :git => 'git@github.com:gbksoft/GBKDevInfoMode-ios.git', :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.swift_version = '4.2'
  s.source_files = 'GBKDevInfoMode/GBKDevInfoMode/Source/**/*.swift'
  s.resources = 'GBKDevInfoMode/GBKDevInfoMode/Resource/*'

end
