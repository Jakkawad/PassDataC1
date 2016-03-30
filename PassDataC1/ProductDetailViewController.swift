//
//  ProductDetailViewController.swift
//  PassDataC1
//
//  Created by admin on 3/28/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import MapleBacon

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imageViewProduct: UIImageView!
    var productDetail:AnyObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(productDetail)
        //print("ProductDetailController")
        let item = self.productDetail as! NSDictionary
        lblTitle.text = item.objectForKey("ProductName") as? String
        lblDesc.text = item.objectForKey("ProductDescription") as? String
        lblPrice.text = item.objectForKey("ProductPrice") as? String
        let imageURL = item.objectForKey("ProductShowImage") as? String
        var wwwURL = "https://www.all2sale.com/store/"
        wwwURL += imageURL!
        let imageURL2 = NSURL(string: wwwURL)
        imageViewProduct.setImageWithURL(imageURL2!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
