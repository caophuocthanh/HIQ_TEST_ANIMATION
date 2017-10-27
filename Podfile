# Uncomment this line to define a global platform for your project
platform :ios, '9.0'
# Uncomment this line if you're using Swift
use_frameworks!

project 'HIQ-Test-CaoPhuocThanh.xcodeproj'

def shared_pods

# PINRemoteImage
pod 'PINRemoteImage'

end

target 'HIQ-Test-CaoPhuocThanh' do
    shared_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
        end
    end
end
