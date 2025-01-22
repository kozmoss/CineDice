//
//  SearchViewController.swift
//  Netflix
//
//  Created by samet on 26.11.2024.
//

import UIKit
import SnapKit

class DiceViewController: UIViewController {
    private var colletionView = UICollectionView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        colletionView.delegate = self
        colletionView.dataSource = self
        view.addSubview(colletionView)
    }

}

extension DiceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
