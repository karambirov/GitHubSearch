# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'GitHubSearch' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  # Pods for GitHubSearch

  # Networking
  pod 'Moya'                        # https://github.com/Moya/Moya
  pod 'ReachabilitySwift', '~> 4.0' # https://github.com/ashleymills/Reachability.swift

  # Image
  pod 'Kingfisher', '~> 4.0'  # https://github.com/onevcat/Kingfisher

  # UI
  pod 'NVActivityIndicatorView', '~> 4.0'    # https://github.com/ninjaprox/NVActivityIndicatorView
  pod 'PMAlertController', '~> 3.5.0'        # https://github.com/pmusolino/PMAlertController
  pod 'ImageSlideshow/Kingfisher', '~> 1.0'  # https://github.com/zvonicek/ImageSlideshow
  pod 'DZNEmptyDataSet', '~> 1.0'            # https://github.com/dzenbot/DZNEmptyDataSet
  pod 'Localize-Swift', '~> 2.0'             # https://github.com/marmelroy/Localize-Swift
  pod 'KafkaRefresh', '~> 1.0'               # https://github.com/OpenFeyn/KafkaRefresh

  # Date
  pod 'DateToolsSwift', '~> 4.0'  # https://github.com/MatthewYork/DateTools
  pod 'SwiftDate', '~> 5.0'       # https://github.com/malcommac/SwiftDate

  # Tools
  pod 'R.swift', '~> 5.0.0'  # https://github.com/mac-cain13/R.swift
  pod 'SwiftLint', '0.29.2'  # https://github.com/realm/SwiftLint

  # Keychain
  pod 'KeychainAccess', '~> 3.0'  # https://github.com/kishikawakatsumi/KeychainAccess

  # Color
  pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'  # https://github.com/ViccAlexander/Chameleon

  # Auto Layout
  pod 'SnapKit'  # https://github.com/SnapKit/SnapKit

  # Code Quality
  pod 'SwifterSwift'  # https://github.com/SwifterSwift/SwifterSwift
  pod 'AttributedLib', :git => 'https://github.com/Nirma/Attributed.git'  # https://github.com/Nirma/Attributed

end

# Cocoapods optimization, always clean project after pod updating
post_install do |installer|
  Dir.glob(installer.sandbox.target_support_files_root + "Pods-*/*.sh").each do |script|
      flag_name = File.basename(script, ".sh") + "-Installation-Flag"
      folder = "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
      file = File.join(folder, flag_name)
      content = File.read(script)
      content.gsub!(/set -e/, "set -e\nKG_FILE=\"#{file}\"\nif [ -f \"$KG_FILE\" ]; then exit 0; fi\nmkdir -p \"#{folder}\"\ntouch \"$KG_FILE\"")
      File.write(script, content)
  end
end
