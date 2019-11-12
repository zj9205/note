# reinstall pod 
- rm -rf ~/Library/Caches/CocoaPods; 
- rm -rf Pods; 
- rm -rf ~/Library/Developer/Xcode/DerivedData/*; 
- pod deintegrate; 
- pod setup; 
- pod install;

# install an old version 
- sudo gem uninstall cocoapods
- sudo gem install cocoapods -v 1.7.5
