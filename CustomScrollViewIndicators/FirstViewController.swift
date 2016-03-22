//
//  FirstViewController.swift
//  CustomScrollViewIndicators
//
//  Created by Moshe Berman on 3/22/16.
//  Copyright © 2016 Moshe Berman. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {

    let styles = [
        
        "Black" : UIScrollViewIndicatorStyle.Black,
        "White" : UIScrollViewIndicatorStyle.White,
        "Default" : UIScrollViewIndicatorStyle.Default
        
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.indicatorStyle = UIScrollViewIndicatorStyle.Black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        
        let index = indexPath.row % self.styles.count
        let style = self.styles[self.styles.startIndex.advancedBy(index)]
        
        cell.textLabel?.text = style.0
        
        if style.1 == .White {
            cell.backgroundColor = UIColor.blackColor()
            cell.textLabel?.textColor = UIColor.whiteColor()
        }
        else {
            cell.backgroundColor = UIColor.whiteColor()
            cell.textLabel?.textColor = UIColor.blackColor()
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let index = indexPath.row % self.styles.count
        let style = self.styles[self.styles.startIndex.advancedBy(index)]
        
        self.tableView.indicatorStyle = style.1
        
        self.tableView.flashScrollIndicators()
    }
}

