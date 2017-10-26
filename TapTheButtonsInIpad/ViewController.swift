//
//  ViewController.swift
//  TapTheButtonsInIpad
//
//  Created by Admin on 26/10/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell{
    @IBOutlet weak var button: UIButton!
    var textWidth: CGFloat = 0
    var height: CGFloat = 0
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size.width = textWidth
        self.frame.size.height = height
        self.frame.origin.y = 0
        print(self.frame)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
        cell.height = col.frame.height
        cell.textWidth = 200
        cell.button.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
        cell.button.setTitle("tap me", for: .normal)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        col.delegate = self
        col.dataSource = self
    }

    @IBAction func tap(_ sender: UIButton){
        print(sender)
        let hitPoint = sender.convert(CGPoint.zero, to: col)
        if let indexPath = col.indexPathForItem(at: hitPoint) {
            print(indexPath)
        }
    }

    @IBOutlet weak var col: UICollectionView!
    
}

