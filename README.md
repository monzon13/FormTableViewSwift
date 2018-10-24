# FormTableView

[![Status](https://travis-ci.org/jmhdevelop/FormTableViewSwift.svg?branch=master)](https://travis-ci.org/jmhdevelop/FormTableViewSwift)
[![Version](https://img.shields.io/cocoapods/v/FormTableView.svg?style=flat)](https://cocoapods.org/pods/FormTableViewSwift)
[![License](https://img.shields.io/cocoapods/l/FormTableView.svg?style=flat)](https://cocoapods.org/pods/FormTableViewSwift)
[![Platform](https://img.shields.io/cocoapods/p/FormTableView.svg?style=flat)](https://cocoapods.org/pods/FormTableViewSwift)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

FormTableView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FormTableView', :git => 'https://github.com/jmhdevelop/FormTableView.git'

```
also add this to end:
```ruby
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
            end
        end
    end

```

## Author

jmhdevep, jmherrero@jmhdeveloper.com

## License

FormTableView is available under the MIT license. See the LICENSE file for more info.
