Pod::Spec.new do |s|
  s.name             = "AppYard"
  s.version          = "0.0.3"
  s.summary          = "Super sweet syntactic sugar for Swift initializers."
  s.homepage         = "https://github.com/skeyboy/AppYard"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "sk" => "lylapp@163.com" }
  s.source           = { :git => "https://github.com/skeyboy/AppYard.git",
                         :tag => s.version.to_s }
  s.source_files     = "Sources/AppYard/*.swift"
  s.requires_arc     = true

  s.swift_version = "5.0"
  s.ios.deployment_target = "11.0"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"
end
