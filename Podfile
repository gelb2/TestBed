# Uncomment the next line to define a global platform for your project
  platform :ios, '15.0'
  use_frameworks!

def rxswift
  pod 'RxSwift'
end

def rxcocoa
  pod 'RxCocoa'
end

workspace 'BasicWorkSpace'
project 'TestBed.xcodeproj'
project 'Landmarks/Landmarks.xcodeproj'
project 'testWeather/test_weatherApp.xcodeproj'

target 'TestBed' do
  # Comment the next line if you don't want to use dynamic frameworks
  project 'TestBed.xcodeproj'
  # Pods for TestBed
  rxswift
  rxcocoa


end

target 'Landmarks' do
  # Comment the next line if you don't want to use dynamic frameworks
  project 'Landmarks/Landmarks.xcodeproj'
  # Pods for Landmarks
   rxswift
   rxcocoa

end

target 'test_weatherApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  project 'testWeather/test_weatherApp.xcodeproj'
  
  rxswift
  rxcocoa
  
end
