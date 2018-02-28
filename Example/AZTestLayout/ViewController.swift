//
//  ViewController.swift
//  AZTestLayout
//
//  Created by Afroz Zaheer on 22/02/2018.
//  Copyright © 2018 Afroz Zaheer. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let exploreLayout = AZExploreCollectionViewLayout()
    let browsingLayout = AZSafariCollectionViewLayout()
    let sitesData = ["https://www.google.com","https://www.apple.com","https://www.yahoo.com","https://www.bing.com","https://www.msn.com","https://www.cocoacontrols.com","https://www.github.com/AfrozZaheer","https://www.google.com" ]
    var isSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "TabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TabCollectionViewCell")
        collectionView.setCollectionViewLayout(browsingLayout, animated: true)
        browsingLayout.height = (collectionView?.frame.size.height)!
        browsingLayout.itemGap = 150
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // collectionView.scrollToItem(at: IndexPath(item: sitesData.count - 1, section: 0), at: .bottom, animated: true)
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sitesData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionViewCell", for: indexPath) as! TabCollectionViewCell

        DispatchQueue.once(token: "\(indexPath.item)") {
            DispatchQueue.main.async {
                let site = self.sitesData[indexPath.item]
                let request = URLRequest(url: URL(string: site)!)
                cell.webView.loadRequest(request)
            }
        }
        
        cell.bgView.layer.shadowColor = UIColor.black.cgColor
        
        cell.bgView.layer.shadowOffset = CGSize(width: 0.0, height: -20.0)
      
        cell.bgView.layer.shadowOpacity = 0.6
        cell.bgView.layer.shadowRadius = 20.0
        cell.bgView.layer.shadowPath = UIBezierPath(rect: cell.contentView.bounds).cgPath
        //cell.bgView.layer.shouldRasterize = true
        cell.bgView.layer.cornerRadius = 15
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            if self.isSelected == false {
                collectionView.setCollectionViewLayout(self.exploreLayout, animated: true)
                self.isSelected = true
            }
            else {
                collectionView.setCollectionViewLayout(self.browsingLayout, animated: true)
                self.isSelected = false
            }
        }
    }
}


public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    public class func once(token: String, block:()->Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}

