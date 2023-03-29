//
//  CompanyTableViewCell.swift
//  HomeTask03-7
//
//  Created by Sonun on 29/3/23.
//

import UIKit
import SnapKit

class CompanyTableViewCell: UITableViewCell {
    

    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.cornerRadius =  8
        return view
    }()
    
    private let titleLabel: UILabel = {
        let titleLbl = UILabel()
        titleLbl.textColor = .blue
        return titleLbl
    }()

    private let nameLabel: UILabel = {
        let nameLbl = UILabel()
        nameLbl.font = .boldSystemFont(ofSize: 18)
        nameLbl.textColor = .blue
        return nameLbl
    }()
    
   

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: "cell")
        addSubview(backView)
        backView.addSubview(titleLabel)
        backView.addSubview(nameLabel)
        
        backView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(180)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(16)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(8)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    override class func awakeFromNib() {
        self.awakeFromNib()
    }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
     func initCell(title: String, name: String) {
         titleLabel.text = title
         nameLabel.text = name
     }
}
