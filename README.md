# LazySwift

![CocoaPods](https://img.shields.io/badge/platform-ios-lightgray.svg)
[![CocoaPods](https://img.shields.io/badge/pod-0.1.6-blue.svg)](https://github.com/Khmelevsky/QuickForms)
![CocoaPods](https://img.shields.io/badge/status-alpha-orange.svg)
[![CocoaPods](https://img.shields.io/badge/swift-3.0-brightgreen.svg)](https://swift.org)
[![CocoaPods](https://img.shields.io/badge/license-MIT-lightgray.svg)](https://github.com/Khmelevsky/QuickForms/blob/master/LICENSE)

## Why use this?

### Lazy frames editing

#### CGrect

*Vanilla*
```swift
var rect = CGRect.zero
rect.size.width = 100
```
*LazySwift*
```swift
var rect = CGRect.zero
rect.width = 100
```

#### UIView

*Vanilla*
```swift
let view = UIView()
var frame = view.frame
frame.size.width = 100
view.frame = frame
```
*LazySwift*
```swift
let view = UIView()
view.width = 100
```




### Views positioning

To create a view 100x100 with color RGB(100, 100, 100) and center it you'll have to type:
```swift
let bomjView = UIView(frame:CGRect(x:0, y:0, width:100, height:100))
bomjView.backgroundColor = UIColor(red: 100 / 255, green: 100 / 255, blue: 100 / 255, alpha: 1)
view.addSubview(bomjView)

var bomjFrame = bomjView.frame
bomjFrame.origin.x = (bomjView.superview?.frame.size.width)! / 2 - bomjView.frame.size.width / 2
bomjFrame.origin.y = (bomjView.superview?.frame.size.height)! / 2 - bomjView.frame.size.height / 2
bomjView.frame = bomjFrame
```
![alt tag](http://i.imgur.com/6gNA4Gc.png)


With LazySwift it becomes:
```swift
let eliteView = UIView(width:100, height:100)
eliteView.backgroundColor = UIColor(100, 100, 100)
view.addSubview(eliteView)
eliteView.centerInSuperview()
```
![alt tag](http://i.imgur.com/IHOs86h.png)


### Let's see what happens if we want to create a random color

*Vanilla*
```swift
let randomColor = UIColor(red: CGFloat(Double(arc4random_uniform(255)) / 255.0),
                        green: CGFloat(Double(arc4random_uniform(255)) / 255.0),
                         blue: CGFloat(Double(arc4random_uniform(255)) / 255.0),
                        alpha: 1.0)
```
![alt tag](http://i.imgur.com/6GQtJtY.png)

*LazySwift*
```swift
let randomColor = UIColor.random
```
![alt tag](http://i.imgur.com/WSQZY1R.png)



