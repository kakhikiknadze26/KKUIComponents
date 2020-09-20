# KKUIComponents

[![CI Status](https://img.shields.io/travis/geowarsong/KKUIComponents.svg?style=flat)](https://travis-ci.org/geowarsong/KKUIComponents)
[![Version](https://img.shields.io/cocoapods/v/KKUIComponents.svg?style=flat)](https://cocoapods.org/pods/KKUIComponents)
[![License](https://img.shields.io/cocoapods/l/KKUIComponents.svg?style=flat)](https://cocoapods.org/pods/KKUIComponents)
[![Platform](https://img.shields.io/cocoapods/p/KKUIComponents.svg?style=flat)](https://cocoapods.org/pods/KKUIComponents)

Collection of custom UI Components.

*Create a shadowed view with corner radius on both the content and shadow*
* **RoundedShadowedView**
* **RoundedShadowedButton**
* **RoundedShadowedControl**

![](https://github.com/kakhikiknadze26/KKUIComponents/blob/main/Images/ShadowedButtonSmall.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation
* Download KKUIComponents
* Drag `KKUIComponents.xcodeproj` into your project directory
* Add `KKUIComponents.framework` in `Frameworks, Libraries and Embedded Content`

KKUIComponents is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KKUIComponents'
```

## Usage

First of all import `KKUIComponents`
```
import KKUIComponents
```

* **RoundedShadowedView**
```Swift
let shadowedView = RoundedShadowedView(frame: CGRect(x: 40, y: 40, width: 200, height: 100))
shadowedView.backgroundLayerColor = .red
shadowedView.backgroundLayerLineWidth = 4
shadowedView.backgroundLayerStrokeColor = .yellow
shadowedView.shadowColor = .black
shadowedView.shadowAlpha = 0.7
shadowedView.shadowRadius = 24
shadowedView.cornerRadius = 20
shadowedView.shadowOffset = CGSize(width: 3, height: 8)
view.addSubview(shadowedView)
```
> Or set the values in storyboard\
> You can multiply those values on `screenFactor` to fit them on all devices. If so, you need to set the `screenFactor` first. E.g. when app finishes launching. Default value of screenFactor is 1.0.
* **RoundedShadowedButton & RoundedShadowedControl**\
Use same steps as for `RoundedShadowedView`.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Author
Kakhi Kiknadze, kakhi.kiknadze@wandio.com

## License
KKUIComponents is available under the [MIT](https://choosealicense.com/licenses/mit/) license. See the LICENSE file for more info.
