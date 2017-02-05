# LazySwift
## Why use this?
### Views positioning

Currently you type:
```swift
let bomjView = UIView(frame:CGRect(x:0, y:0, width:100, height:100))
bomjView.backgroundColor = UIColor(red: 100 / 255, green: 100 / 255, blue: 100 / 255, alpha: 1)
view.addSubview(bomjView)

var bomjFrame = bomjView.frame
bomjFrame.origin.x = (bomjView.superview?.frame.size.width)! / 2 - bomjView.frame.size.width / 2
bomjFrame.origin.y = (bomjView.superview?.frame.size.height)! / 2 - bomjView.frame.size.height / 2
bomjView.frame = bomjFrame
```

With LazySwift it becomes:
```swift
let eliteView = UIView(CGRect(width:100, height:100))
eliteView.backgroundColor = UIColor(100, 100, 100)
view.addSubview(eliteView)
eliteView.centerInSuperview()
```

### Let's see what happens if we want to create a random color

*Vanilla*
```swift
let randomColor = UIColor(red: CGFloat(Double(arc4random_uniform(255)) / 255.0),
                        green: CGFloat(Double(arc4random_uniform(255)) / 255.0),
                         blue:  CGFloat(Double(arc4random_uniform(255)) / 255.0),
                        alpha: 1.0)
```
![alt tag](http://i.imgur.com/6GQtJtY.png)

*LazySwift*
```swift
let randomColor = UIColor.random
```
![alt tag](http://i.imgur.com/WSQZY1R.png)



