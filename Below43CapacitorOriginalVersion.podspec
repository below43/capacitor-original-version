require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name     = 'Below43CapacitorOriginalVersion'
  s.version  = package['version']
  s.summary  = package['description']
  s.license  = package['license']
  s.homepage = 'https://github.com/below43/capacitor-original-version'
  s.author   = package['author']

  s.source = { :path => '.' }

  s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'

  s.ios.deployment_target = '15.0'
  s.dependency 'Capacitor'
  s.swift_version = '5.1'
end