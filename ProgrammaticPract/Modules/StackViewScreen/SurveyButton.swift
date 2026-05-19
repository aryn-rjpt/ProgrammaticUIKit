//
//  SurveyButton.swift
//  ProgrammaticPract
//
//  Created by Unthinkable-Mac on 23/04/26.
//

import UIKit

class SurveyButton: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
        setupButton()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    func setupButton(){
        setTitleColor(.white, for: .normal)
        backgroundColor = .red
        layer.cornerRadius = 10
        titleLabel?.font = .boldSystemFont(ofSize: 30)
    }
    
}
