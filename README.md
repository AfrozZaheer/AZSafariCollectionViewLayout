# AZSafariCollectionViewLayout

<!--[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)-->
[![Swift version](https://img.shields.io/badge/swift%20-4.0-orange.svg)](https://img.shields.io/badge/swift%20-4.0-orange.svg)
[![Support Dependecy Manager](https://img.shields.io/badge/support-CocoaPods-red.svg?style=flat.svg)](https://img.shields.io/badge/support-CocoaPods-red.svg?style=flat.svg)
[![Version](https://img.shields.io/cocoapods/v/AZSafariCollectionViewLayout.svg?style=flat)](https://cocoapods.org/pods/AZSafariCollectionViewLayout)
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)](https://cocoapods.org/pods/AZSafariCollectionViewLayout)


<p align="center">
<a href="https://i.imgur.com/3e49iHG.gif">
<img src="https://i.imgur.com/3e49iHG.gif" height="480">
</a>
</p>


## Features

* iOS Safari history view layout
* IBDesignAble for properties
* Few minutes integration

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```


To integrate AZSafariCollectionViewLayout controller into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
pod 'AZSafariCollectionViewLayout'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

#### Step 1

* Set collectionView layout and give some design properties value.
```swift

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let exploreLayout = AZExploreCollectionViewLayout()
    let browsingLayout = AZSafariCollectionViewLayout()
    
    var isSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "TabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TabCollectionViewCell")
        collectionView.setCollectionViewLayout(browsingLayout, animated: true)
        browsingLayout.height = (collectionView?.frame.size.height)!
        browsingLayout.itemGap = 100
        
    }
}

```
#### OR

* You can set these properties in storyboard

![Alt text](https://i.imgur.com/JyYsQGT.png "AZSafariCollectionViewLayout")

#### Done
Thats it, you successfully integrate AZSafariCollectionViewLayout


## License

AZSafariCollectionViewLayout is available under the MIT license. See the LICENSE file for more info.

## Author

**Afroz Zaheer** - (https://github.com/AfrozZaheer)


