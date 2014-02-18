# TAPKeyboardPop

For an in depth overview, see the [blog post on the Cotap blog](http://engineering.cotap.com/post/77006076500/animating-the-keyboard-with-the-ios7-interactive-pop)

In short, animated keyboard dismissal, just like iMessage:

![Example Screenshot](https://raw.github.com/cotap/TAPKeyboardPop/master/Screenshots/example.png)

## Installation

TAPKeyboardPop is available through [CocoaPods](http://cocoapods.org),
to install it simply add the following line to your Podfile:

``` ruby
pod 'TAPKeyboardPop', '~> 0.1.0'
```

## Usage

To enable the keyboard to dismiss during an interactive back gesture,
import the category so that it's accessible to view controllers that can
be interactively popped:

``` objective-c
#import <TAPKeyboardPop/UIViewController+TAPKeyboardPop.h>
```

## Author

[Dave Lyon] (http://davelyon.net/) - [@daveisonthego](https://twitter.com/daveisonthego)

## Contributors

- Built to support [Cotap](http://cotap.com)
- [Stephen Celis] (https://github.com/stephencelis)
- [Delisa Mason] (http://delisa.me)

## License

TAPKeyboardPop is available under the MIT license. See the LICENSE file
for more info.
