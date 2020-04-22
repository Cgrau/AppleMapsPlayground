# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def testing_pods
 use_frameworks!
end

def app_pods
  use_frameworks!
  pod 'Sourcery'
  pod 'SnapKit', '~> 5.0.0'
  pod 'Polyline', '~> 4.0'
end

target 'AppleMapsPlayground' do
  app_pods
end

target 'AppleMapsPlaygroundTests' do
  testing_pods
end

target 'AppleMapsPlaygroundUITests' do
  # Pods for testing
end
