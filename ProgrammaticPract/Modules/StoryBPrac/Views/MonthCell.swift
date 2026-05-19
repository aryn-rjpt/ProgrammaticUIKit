//
//  MonthCell.swift
//  ProgrammaticPract
//
//  Created by Unthinkable-Mac on 13/05/26.
//

import UIKit

class MonthCell: UICollectionViewCell {

    @IBOutlet weak var monthLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func set(month: String, isSelected: Bool) {
        monthLabel.text = month

        monthLabel.font = isSelected ? .systemFont( ofSize: 20, weight: .semibold ) : .systemFont( ofSize: 15, weight: .regular )
    }

}
