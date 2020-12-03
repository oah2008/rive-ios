# MOSTLY WORKING
# Pod::Spec.new do |s|
#   s.name = 'Rive'
#   s.version = '0.6.3'
#   s.license = 'MIT'
#   s.summary = 'Beautiful animations in iOS'
#   s.homepage = 'https://github.com/rive-app/rive-ios'
#   s.authors = { 'Rive' => 'info@rive.app' }
#   s.source = { :git => 'https://github.com/rive-app/rive-ios', :tag => s.version, :submodules => true }
#   s.documentation_url = 'https://github.com/rive-app/rive-ios'
  
#   # s.preserve_paths = 'submodules/rive-cpp/include/**'
#   s.pod_target_xcconfig = {
#     'HEADER_SEARCH_PATHS' => '"' + __dir__ + '/submodules/rive-cpp/include" ' + '"' + __dir__ + '/Source"'
#   }
#   s.xcconfig = { 
#     'USER_HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/submodules/rive-cpp/include" ' + '"${PODS_ROOT}/Source"'
#   }

#   s.source_files = 'Source/*.{h,m,mm}',
#                    'submodules/rive-cpp/include/**/*.hpp',
#                    'submodules/rive-cpp/src/**/*.cpp'
  
#   s.requires_arc = true

# end
# END OF MOSTLY WORKING

# WITH SUBSPECS
# Pod::Spec.new do |s|
#   s.name = 'Rive'
#   s.version = '0.6.3'
#   s.license = 'MIT'
#   s.summary = 'Beautiful animations on Apple devices'
#   s.homepage = 'https://github.com/rive-app/rive-ios'
#   s.authors = { 'Rive' => 'info@rive.app' }
#   s.source = { :git => 'https://github.com/rive-app/rive-ios', :tag => s.version, :submodules => true }
#   s.documentation_url = 'https://github.com/rive-app/rive-ios'
  
#   s.source_files = 'Source/*.{h,hpp,mm}'
#   s.requires_arc = true

#   s.public_header_files = 'Source/*.{h,hpp}'

#   s.subspec 'rive_cpp' do |rive_cpp|

#     # rive_cpp.preserve_paths = 'submodules/rive-cpp/include/**'
#     rive_cpp.pod_target_xcconfig = {
#       'HEADER_SEARCH_PATHS' => '"' + __dir__ + '/submodules/rive-cpp/include"'
#     }
#     rive_cpp.xcconfig = { 
#       'USER_HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/submodules/rive-cpp/include"'
#     }
#     rive_cpp.source_files = 'submodules/rive-cpp/include/**/*.hpp',
#                             'submodules/rive-cpp/src/**/*.cpp'
#   end
# end
# END OF THE SUBSPECS

Pod::Spec.new do |s|
  s.name = 'Rive'
  s.version = '0.6.3'
  s.license = 'MIT'
  s.summary = 'Beautiful animations on Apple devices'
  s.homepage = 'https://github.com/rive-app/rive-ios'
  s.authors = { 'Rive' => 'info@rive.app' }
  s.source = { :git => 'https://github.com/rive-app/rive-ios', :tag => s.version, :submodules => true }
  s.documentation_url = 'https://github.com/rive-app/rive-ios'
  
  s.frameworks = 'QuartzCore', 'CoreGraphics'
  s.platform = :ios
  s.ios.deployment_target = '10.0'
  # s.default_subspecs = "rive"

  s.subspec 'rive' do |rive|
    rive.source_files = 'Source/*.{h,hpp,mm}' , 'submodules/rive-cpp/include/**/*'
    # rive.requires_arc = true
    rive.public_header_files = 'Source/*.{h,hpp}'

    # rive.header_mappings_dir = 'submodules/rive-cpp/include'
    # rive.header_dir = 'rive_headers'
    # rive.preserve_paths = 'submodules/rive-cpp/include/**'
    rive.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '"' + __dir__ + '/submodules/rive-cpp/include"'
    }
    # rive.xcconfig = {
    #   'USER_HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/submodules/rive-cpp/include"'
    # }

    # rive.dependency 'Rive/cpp'
  end

  s.subspec 'cpp' do |cpp|
    # cpp.library = 'c++'
    # cpp.compiler_flags = '-fno-rtti', '-fno-exceptions'
    # cpp.preserve_paths = 'submodules/rive-cpp/include/**'
    
    cpp.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '"' + __dir__ + '/submodules/rive-cpp/include"'
    }
    cpp.xcconfig = {
      'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
      'CLANG_CXX_LIBRARY' => 'libc++',
      'USER_HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/submodules/rive-cpp/include"'
    }
    cpp.source_files = 'submodules/rive-cpp/include/**/*.hpp',
                       'submodules/rive-cpp/src/**/*.cpp'
                            

    cpp.dependency 'Rive/rive'
  end
end