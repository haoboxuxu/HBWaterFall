//
//  ViewController.swift
//  HBWaterFall
//
//  Created by haoboxuxu on 11/16/2021.
//  Copyright (c) 2021 haoboxuxu. All rights reserved.
//

import UIKit
import HBWaterFall

struct Item {
    let imageName: String
}

class ViewController: UIViewController {
    
    var items: [Item] = Array(0...15).map{ "image\($0)" }.compactMap({ name in
        Item(imageName: name)
    })
    
    private var wfView = HBWaterFallView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        wfView.register(DemoCell.self, forCellWithReuseIdentifier: DemoCell.identifier)
        wfView.delegate = self
        wfView.dataSource = self
        
        let layout = HBWaterFallLayout()
        layout.delegate = self
        layout.interItemSpacing = 5
        layout.numOfItemPerRow = 2
        wfView.waterFallLayout = layout
        
        view.addSubview(wfView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        wfView.frame = view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, HBWaterFallLayoutDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DemoCell.identifier, for: indexPath) as! DemoCell
        cell.config(image: UIImage(named: items[indexPath.row].imageName)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = DemoDetailVC()
        vc.title = "DetailView"
        vc.config(image: UIImage(named: items[indexPath.row].imageName)!)
        self.present(vc, animated:true, completion:nil)
    }
    
    func waterfallView(_ collectionView: UICollectionView, sizeOfCellAtIndexPath indexPath: IndexPath) -> CGSize {
        return UIImage(named: items[indexPath.item].imageName)!.size
    }
}

