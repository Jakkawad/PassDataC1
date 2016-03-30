//
//  ViewController.swift
//  PassDataC1
//
//  Created by admin on 3/28/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    var mainArray = NSArray()
    var productDetail:AnyObject!
    
    func loadData() {
        let params = ["api":"productall", "productall":"10"]
        Alamofire.request(.POST, "https://www.all2sale.com/sendmail/testfunction/json/apitest.php", parameters: params, encoding: .URL, headers: nil).responseJSON { (request,response, result) -> Void in
            self.mainArray = result.value as! NSArray
            //print(self.mainArray.debugDescription)
            self.mainCollectionView.reloadData()
            //self.mainTableView.reloadData()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //self.performSegueWithIdentifier("ProductDetailSegue", sender: self)
        //print("didSelectItemAtIndexPath\(self.mainArray[indexPath.row])")
        productDetail = self.mainArray[indexPath.row]
        //self.performSegueWithIdentifier("ProductDetailSegue", sender: self)
        //print(productDetail)
        //self.performSegueWithIdentifier("ProductDetailSegue", sender: productDetail)
        //let destinationVC = ProductDetailViewController()
        //destinationVC.productDetail = productDetail
        //destinationVC.performSegueWithIdentifier("ProductDetailSegue", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ProductDetailSegue" {
            //print("segue")
            let indexPath = self.mainCollectionView.indexPathsForSelectedItems()?.last
            //print(indexPath)
            let AA = self.mainArray[(indexPath?.row)!]
            //print(AA)
            let destinationVC = segue.destinationViewController as? ProductDetailViewController
            
            destinationVC?.productDetail = AA
            //destinationVC?.title = "AAA"
            //print(productDetail)
        } else {
            print("no segue")
        }
    }
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ProductDeatailSegue" {
            print(productDetail)
            /*
            if let productDetailVC = segue.destinationViewController as? ProductDetailViewController {
                let indexPath = mainCollectionView.indexPathsForSelectedItems()?.first!
                //print(indexPath)
                let productDetail = mainArray[indexPath!.row] as! NSDictionary
                productDetailVC.productDetail = productDetail
            }
            */
        }
    }
    */
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 10
        return self.mainArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col1 = collectionView.dequeueReusableCellWithReuseIdentifier("collectCell1", forIndexPath: indexPath) as? CustomCollectionViewCell
        let item = self.mainArray[indexPath.row] as! NSDictionary
        col1?.lblName.text = item.objectForKey("ProductName") as? String
        let imageURL = item.objectForKey("ProductShowImage") as? String
        var wwwURL = "https://www.all2sale.com/store/"
        wwwURL += imageURL!
        let imageURL2 = NSURL(string: wwwURL)
        col1?.imageViewProduct.setImageWithURL(imageURL2!)
        return col1!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

