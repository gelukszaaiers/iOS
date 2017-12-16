# Make sure that the pods don't get an extra scheme.
install! 'cocoapods', deterministic_uuids: false, share_schemes_for_development_pods: false

platform :ios, '10.0'

# We need to use frameworks because of Swift.
use_frameworks!

##########################
### Application target ###
##########################

target 'Gelukszaaiers' do
  # Utility
  pod 'Stella', '~> 1.1'

  # Services
  pod 'Alamofire', '~> 4.6'
  pod 'AlamofireActivityLogger', '~> 2.4'

  # Fabric
  pod 'Fabric', '~> 1.7'
  pod 'Crashlytics', '~> 3.9'
end


####################
### Post install ###
####################

post_install do |installer|
  # Setup the signing correctly for Swift 3.
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.2'

      if config.name == 'Debug' || config.name == 'Testing'
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      end
    end
  end
end
