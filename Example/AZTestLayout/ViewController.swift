//
//  ViewController.swift
//  AZTestLayout
//
//  Created by Afroz Zaheer on 22/02/2018.
//  Copyright © 2018 Afroz Zaheer. All rights reserved.
//

import UIKit

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionViewCell", for: indexPath) as! TabCollectionViewCell
        
        if (indexPath.item % 2 == 0) {
            cell.bgView.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.639, blue: 0.404, alpha: 1.0)
        }
        else {
            cell.bgView.backgroundColor = UIColor(displayP3Red: 0.871, green: 0.298, blue: 0.275, alpha: 1.0)
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
