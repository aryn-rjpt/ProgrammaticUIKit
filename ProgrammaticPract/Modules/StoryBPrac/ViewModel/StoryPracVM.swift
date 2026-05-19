//
//  ProgrammaticPract
//  StoryPracVM.swift
//
//  Created by Unthinkable-Mac on 13/05/26.
//

import Foundation
import UIKit

struct TileData {
    let logo: String
    let title: String
    let totalAmount: Int
    let currentAmount: Int
    let transactionCount: Int
}

class StoryPracVM {

    let months = [
        "", "January", "February", "March", "April", "May", "June", "July",
        "August", "September", "October", "November", "December", "",
    ]
    
    let salaryData: TileData = TileData(
        logo: "dollarsign.circle.fill",
        title: "Salary",
        totalAmount: 10000,
        currentAmount: 9500,
        transactionCount: 6,
    )
    
    let bonusData: TileData = TileData(
        logo: "bag.circle.fill",
        title: "Bonuses",
        totalAmount: 250,
        currentAmount: 50,
        transactionCount: 1,
    )
    
    let foodData: TileData = TileData(
        logo: "fork.knife",
        title: "Food",
        totalAmount: 630,
        currentAmount: 500,
        transactionCount: 5,
    )

    var selectedMonthIdx: Int = 1

}
