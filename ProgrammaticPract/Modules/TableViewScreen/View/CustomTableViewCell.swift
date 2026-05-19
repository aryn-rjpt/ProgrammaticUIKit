//
//  CustomTableViewCell.swift
//  ProgrammaticPract
//
//  Created by Unthinkable-Mac on 23/04/26.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var myImage = UIImageView()
    var myTitle = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(myImage)
        addSubview(myTitle)
        
        configImage()
        configTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configImage(){
        myImage.layer.cornerRadius  = 10
        myImage.clipsToBounds       = true
        
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        myImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        myImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        myImage.widthAnchor.constraint(equalTo: myImage.heightAnchor, multiplier: 16/9.0).isActive = true
        
    }
    
    func configTitle (){
        myTitle.numberOfLines = 0
        myTitle.adjustsFontSizeToFitWidth = true
        
        myTitle.translatesAutoresizingMaskIntoConstraints = false
        
        myTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        myTitle.leadingAnchor.constraint(equalTo: myImage.trailingAnchor, constant: 20).isActive = true
        myTitle.heightAnchor.constraint(equalToConstant: 80).isActive = true
        myTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true 
    }
    
    func set(video: Video){
        myImage.image = video.image
        myTitle.text = video.title
    }
    
}
