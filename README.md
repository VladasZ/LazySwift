## Pod is deprecated. Use SwiftyTools or/and iOSTools instead.

[SwiftyTools](https://github.com/VladasZ/SwiftyTools)

[iOSTools](https://github.com/VladasZ/iOSTools)

# LazySwift

![CocoaPods](https://img.shields.io/badge/platform-ios-lightgray.svg)
[![CocoaPods](https://img.shields.io/badge/pod-0.3.24-blue.svg)](https://github.com/Khmelevsky/QuickForms)
![CocoaPods](https://img.shields.io/badge/status-alpha-orange.svg)
[![CocoaPods](https://img.shields.io/badge/swift-3.0-brightgreen.svg)](https://swift.org)
[![CocoaPods](https://img.shields.io/badge/license-MIT-lightgray.svg)](https://github.com/Khmelevsky/QuickForms/blob/master/LICENSE)

## Why use this?

### Views positioning

To create a view 100x100 with color RGB(100, 100, 100) and center it:

```swift
let view = UIView(width:100, height:100)
view.backgroundColor = UIColor(100, 100, 100)
view.addSubview(view)
view.centerInSuperview()
```
Also you can center views horizontally or vertically:


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

### Loading custom view:
*Vanilla*
```swift
 let customView = 
 UINib(nibName: "CustomView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomView

```
*LazySwift*
```swift
let customView = viewNamed("CustomView") as! CustomView
```
### More convinient types casting

*Vanilla*
```swift
let double = Double(5)
let float  = CGFloat(5)
```
*LazySwift*
```swift
let double = 5.Double
let float  = 5.CGFloat
```
### Lazy random returning Int

*Vanilla*
```swift
  let rand    = arc4random()
  let uniform = arc4random_uniform(100)
```
*LazySwift*
```swift
let rand    = random()
let uniform = random(100)
```

### Random color

*Vanilla*
```swift
let randomColor = UIColor(red: CGFloat(Double(arc4random_uniform(255)) / 255.0),
                        green: CGFloat(Double(arc4random_uniform(255)) / 255.0),
                         blue: CGFloat(Double(arc4random_uniform(255)) / 255.0),
                        alpha: 1.0)
```
*LazySwift*
```swift
let randomColor = UIColor.random
```
