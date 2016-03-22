# CustomScrollViewIndicators

This project demonstrates how to customize UIScrollView indicator insets.

How It Works:
---
UIScrollView uses UIImages for displaying scroll indicators. So, we can use the tintColor property along with `UIImageModeAlwaysTemplate` to change the color of the bars.

Implementation:
---

The sample implementation, in Swift 2.2, below.

```
// MARK: - Color the Scroll View
    
    func setScrollIndicatorColor(color: UIColor) {
        
        for view in self.tableView.subviews {
            if view.isKindOfClass(UIImageView.self),
                let imageView = view as? UIImageView,
                let image = imageView.image  {
                
                imageView.tintColor = color
                imageView.image = image.imageWithRenderingMode(.AlwaysTemplate)
            }
        }
        
        self.tableView.flashScrollIndicators()
    }

```

Some thoughts:
---
- The method for finding the scroll indicator images might break if the internal implementation changes.
- The project has a pretty neat sorting technique for ensuring that the color names appear in the correct order. 
- I've successfully submitted an app to the App Store with this code included, butyour mileage may vary.

License:
---
MIT
