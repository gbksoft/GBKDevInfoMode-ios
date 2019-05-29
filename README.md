# GBK DEV INFO MODE iOS

![DEV INFO MODE iOS](http://gbksoft.net/downloads/zakhliupanyi-av/gbkdevinfomode.jpg)

Screen with application info (naming, version, API environment etc).

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Use](#use)
- [To Do](#to-do)
- [Issue](#issue)

## Features

- [x] Manual/Automatic dev info screen opening
- [x] Display Application info
- [x] Display environment info (from info.plist, key - Key_type)
- [x] Display info from Key-\(environment).plist
- [x] Show contents of User Defaults
- [x] Display info about Facebook App
- [x] Display info from GoogleService-Info.plist file
- [x] Developer can limit sections to show
- [x] Developer can add own properties (type: String)
- [x] Dynamically watch added property (type: String)
- [x] Display info from any .plist file (Data types: String, Number, Bool, Date)
- [x] Show any particular key from any .plist file (Data types: String, Number, Bool, Date)
- [x] Display info by key from User Defaults
- [x] You can easily copy value by tapping on cell

## Requirements

- iOS 8.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate GBKDevInfoMode into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'GBKDevInfoMode'
end
```

Then, run the following command:

```bash
$ pod install
```

## Use

### Setup

>  Attention: you need to setup GBKDevInfoMode first, before interacting with it.

Import framework:

```swift
import GBKDevInfoMode
```

To start using simply:

```swift
GBKDevInfoMode.shared.setup(isEnabled: true)
```

>  Don't forget to set isEnabled to false.

To limit sections to show:

```swift
GBKDevInfoMode.shared.setup(isEnabled: true, sections: [.appInfo, .keyAPI, .userDefaults, .googleList, .custom])
```

Sections types:

```swift
public enum SectionType {
    case appInfo /// base app info: (app name, bundle, app version, app build, OS)
    case keyAPI /// key api (environment from info.plist, all values from Key_\(environment).plist)
    case userDefaults /// all user defaults
    case facebookList /// Facebook info from info.plist
    case googleList /// GoogleService-Info.plist
    case custom /// custom property list
}
```

To disable opening dev info screen by shaking:

```swift
GBKDevInfoMode.shared.automaticLaunchByShake = false
```

To manually show screen:

```swift
GBKDevInfoMode.shared.manualLaunch()
```

### Custom info

To show custom information you have 5 possibilities:

>  To add custom info you need specify .custom during setup

#### 1) Show custom properties

```swift
// Values
let valueUserName = GBKDIMDevValueModel(title: "User name", value: "username")
let valueToken = GBKDIMDevValueModel(title: "Token", value: "1234567890zxcvbnm")

// Section
let section = GBKDIMDevSectionModel(title: "Custom section", items: [valueUserName, valueToken])

// Add section to GBK Dev Info Mode
GBKDevInfoMode.shared.add(section: section)
```

#### 1.1) Dsiplaying custom properties with unique keys to update them in the future

```swift
// Values
let valueUserName = GBKDIMDevValueModel(title: "User name", value: "username", uniqueKey: "username")
let valueToken = GBKDIMDevValueModel(title: "Token", value: "1234567890zxcvbnm", uniqueKey: "token")

// Section
let section = GBKDIMDevSectionModel(title: "Custom section", items: [valueUserName, valueToken])

// Add section to GBK Dev Info Mode
GBKDevInfoMode.shared.add(section: section)

///
...
///

GBKDevInfoMode.shared.update(value: "newtoken", in: "token")
```

#### 2) Display values by key from .plist files

```swift
// Values
let valueFromKey1 = GBKDIMDevValuePlistModel(title: "Test value 1", name: "<key_name>", inFile: "<filename>")
let valueFromKey2 = GBKDIMDevValuePlistModel(title: "Test value 2", name: "<key_name>", inFile: "<filename>")

// Section
let section = GBKDIMDevSectionModel(title: "Custom section key from plist", items: [valueFromKey1, valueFromKey2])

// Add section to GBK Dev Info Mode
GBKDevInfoMode.shared.add(section: section)
```

#### 3) Display all keys from .plist file (Data types: String, Number, Bool, Date)

```swift
// Section
let section = GBKDIMDevSectionPlistModel(title: "Custom section from plist", fromFile: "<filename>")

// Add section to GBK Dev Info Mode
GBKDevInfoMode.shared.add(section: section)
```

#### 4) Display all User Defaults custom content

```swift
// Section
let section = GBKDIMDevSectionUserDefaultsModel(title: "Custom section from custom User Defaults", suiteName: "<filename>")

// Add section to GBK Dev Info Mode
GBKDevInfoMode.shared.add(section: section)
```

#### 5) Display value by key from User Defaults

```swift
// Values
let valueFromKey1 = GBKDIMDevValueUserDefaultsModel(title: "Test value 1", key: "<key_name_from_user_defaults>")
let valueFromKey2 = GBKDIMDevValueUserDefaultsModel(title: "Test value 2", key: "<key_name_from_user_defaults>", suiteName: "<name_user_defaults>")

// Section
let section = GBKDIMDevSectionModel(title: "Custom section key from user defaults", items: [valueFromKey1, valueFromKey2])

// Add section to GBK Dev Info Mode
GBKDevInfoMode.shared.add(section: section)
```

## To Do
- Add properties (on other screen) which could be changed in runtime (eg user auth token).

## Issue

If UIWindow has extension on and overrides method motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?), you need manually open dev info window (automaticLaunchByShake wont work)

```swift
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {

        // ...

        if motion == .motionShake {
            GBKDevInfoMode.shared.motionShake()
        }
    }
}
```

# Let us know
We'd be very happy if you sent links to your projects where you use our component. Just send us email to [github@gbksoft.com](mailto:github@gbksoft.com)
