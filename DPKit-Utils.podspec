Pod::Spec.new do |s|
  s.name         = "DPKit-Utils"
  s.version      = "0.0.1"
  s.summary      = "DPKit-Utils"
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }
  s.source       = { :git => "https://github.com/dpostigo/DPKit-Utils.git", :tag => s.version.to_s }
  s.platform     = :osx, '10.8'

  s.requires_arc = true

  s.source_files = 'DPKit-Utils/*.{h,m}'

  s.ios.deployment_target = '4.3'
  s.osx.deployment_target = '10.8'

  s.dependency  'JMSimpleDate'



  
end
