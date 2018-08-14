//
//  AttachVC.swift
//  Taskatyy
//
//  Created by zoza on 24/07/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit
import Kingfisher

class AttachVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    var imageResult = [ImageResult]()

    @IBOutlet weak var collectionView: UICollectionView!
    
    let itemsPerRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "مرفقات"
        collectionView.delegate = self
        collectionView.dataSource = self
        loadData()
    }
    
    func loadData(){
        print("\(ShowResultVC.text_Band_No)")
        startLoading()
        API.attch(workitemid: "\(ShowResultVC.text_Band_No)") { (error, success, data) in
            DispatchQueue.main.async
                {
                    if success {
                        let r = img(fromDictionary: data as! [String : Any])
                        self.imageResult = r.imageResult
                        self.stopLoading()
                        self.collectionView.reloadData()
                        print("image")
                    }
                    else {
                        print("ERROR")
                        return
                        
                    }
            }
        }

    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AttachCell
        let newString = imageResult[indexPath.row].workItemsAttachmentPath?.replacingOccurrences(of: "\\" , with: "/" )
        
        cell.image.kf.indicatorType = .activity
        cell.image.kf.setImage(with: URL(string: newString ?? ""))
        return cell
    }
   
}

extension AttachVC: UICollectionViewDelegateFlowLayout {
    
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: 150)
        
    }
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    
}
