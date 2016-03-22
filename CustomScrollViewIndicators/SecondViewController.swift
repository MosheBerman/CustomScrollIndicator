//
//  SecondViewController.swift
//  CustomScrollViewIndicators
//
//  Created by Moshe Berman on 3/22/16.
//  Copyright © 2016 Moshe Berman. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {
    
    let colors = [
        "Red" : UIColor.redColor(),
        "Orange" : UIColor.orangeColor(),
        "Yellow" : UIColor.yellowColor(),
        "Green" : UIColor.greenColor(),
        "Cyan" : UIColor.cyanColor(),
        "Blue" : UIColor.blueColor(),
        "Purple" : UIColor.purpleColor(),
        "Pink" : UIColor.magentaColor()
        ].sort { (first : (name : String, color : UIColor), second: ( name : String, color : UIColor)) -> Bool in
        
            var result = false
            let desiredOrder = ["Red", "Orange", "Yellow", "Green", "Cyan", "Blue", "Purple", "Pink"]
            
            let firstName = first.name
            let secondName = second.name
            
            if desiredOrder.indexOf(firstName) < desiredOrder.indexOf(secondName) {
                result = true
            }
            
            return result
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let color = self.colors[self.colors.startIndex]
        
        self.setScrollIndicatorColor(color.1)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let index = indexPath.row % self.colors.count
        let color = self.colors[self.colors.startIndex.advancedBy(index)]
        
        cell.textLabel?.text = color.0
        cell.textLabel?.textColor = color.1
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.colors.count * 3
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let index = indexPath.row % self.colors.count
        let color = self.colors[self.colors.startIndex.advancedBy(index)]
        
        self.setScrollIndicatorColor(color.1)
        
    }
    
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
}

