//
//  SubjectsViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/17/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SubjectsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    let items = ["0", "1", "2"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CoursesCollectionViewCell
        cell._cellButton.setTitle(items[indexPath.item], for: .normal)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
