//
//  ViewController.swift
//
//
//  Created by Unthinkable-Mac on 13/05/26.
//

import UIKit

class StoryPracVC: UIViewController {

    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var monthCollection: UICollectionView!
    @IBOutlet private weak var salaryProgressTile: ProgressTile!
    @IBOutlet private weak var bonusProgressTile: ProgressTile!
    @IBOutlet private weak var foodProgressTile: ProgressTile!

    private var gradientLayer: CAGradientLayer? = nil

    fileprivate let vm = StoryPracVM()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureProfileImage()
        configureMonthCollection()

        salaryProgressTile.setContent( tileData: vm.salaryData, tileTintColor: .systemOrange )
        bonusProgressTile.setContent( tileData: vm.bonusData, tileTintColor: .systemTeal )
        foodProgressTile.setContent( tileData: vm.foodData, tileTintColor: .systemGreen )
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureGradientBG()
    }

    private func configureProfileImage() {
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.clipsToBounds = true
    }

    private func configureGradientBG() {
        guard gradientLayer == nil else { return }
        gradientLayer = CAGradientLayer.gradientLayer(
            colors: [UIColor.systemBlue.cgColor, UIColor.cyan.cgColor],
            frame: headerView.bounds,
            isHorizontal: true
        )
        headerView.layer.insertSublayer(gradientLayer!, at: 0)
    }

    private func configureMonthCollection() {
        monthCollection.delegate = self
        monthCollection.dataSource = self
        monthCollection.register( UINib(nibName: "MonthCell", bundle: nil), forCellWithReuseIdentifier: "MonthCell" )
    }

}

extension StoryPracVC: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.months.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthCell", for: indexPath) as! MonthCell

        cell.set( month: vm.months[indexPath.item], isSelected: vm.selectedMonthIdx == indexPath.item )

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if indexPath.item == 0 || indexPath.item == vm.months.count - 1 {
            return
        }

        let prevIdxPath = IndexPath(item: vm.selectedMonthIdx, section: 0)
        
        vm.selectedMonthIdx = indexPath.item

        collectionView.reloadItems(at: [prevIdxPath, indexPath])

        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}
