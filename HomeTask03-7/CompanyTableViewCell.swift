//
//  CompanyTableViewCell.swift
//  HomeTask03-7
//
//  Created by Sonun on 29/3/23.
//

import UIKit
import SnapKit

class CompanyTableViewCell: UITableViewCell {
    
    private let headerView: UIView = {
     let header = UIView()
        header.backgroundColor = UIColor(named: "blueColor")
        header.layer.cornerRadius = 8
        header.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        header.clipsToBounds = false
        return header
    }()
    
    private let numberView: UIView = {
        let numView = UIView()
        numView.backgroundColor = .white
        numView.layer.cornerRadius = 16
        return numView
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius =  8
        return view
    }()
    
    private let headLabel: UILabel = {
        let headLbl = UILabel()
        headLbl.textColor = UIColor(named: "blueColor")
        headLbl.font = .systemFont(ofSize: 12)
        return headLbl
    }()

    private let nameLabel: UILabel = {
        let nameLbl = UILabel()
        nameLbl.textColor = UIColor(named: "blueColor")
        nameLbl.font = .systemFont(ofSize: 12)
        return nameLbl
    }()
    
    private let addressLabel: UILabel = {
        let addressLbl = UILabel()
        addressLbl.font = .systemFont(ofSize: 12)
        return addressLbl
    }()
    
    private let emailLabel: UILabel = {
        let emailLbl = UILabel()
        emailLbl.font = .systemFont(ofSize: 12)
        return emailLbl
    }()
    
    private let numberLabel: UILabel = {
        let numberLbl = UILabel()
        numberLbl.font = .systemFont(ofSize: 12)
        return numberLbl
    }()
    
    private let headerImage: UIImageView = {
        let headerImage = UIImageView()
        headerImage.image = UIImage(named: "frame")
        return headerImage
    }()
    
    private let imageLetter: UIImageView = {
        let imageLetter = UIImageView()
        imageLetter.image = UIImage(named: "letter")
        return imageLetter
    }()
    
    private let imageLetter2: UIImageView = {
        let imageLetter2 = UIImageView()
        imageLetter2.image = UIImage(named: "letter")
        return imageLetter2
    }()
    
    private let imageLetter3: UIImageView = {
        let imageLetter3 = UIImageView()
        imageLetter3.image = UIImage(named: "letter")
        return imageLetter3
    }()
   

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: "cell")
        addSubview(backView)
        backView.addSubview(addressLabel)
        backView.addSubview(nameLabel)
        backView.addSubview(emailLabel)
        backView.addSubview(numberLabel)
        backView.addSubview(imageLetter)
        backView.addSubview(imageLetter2)
        backView.addSubview(imageLetter3)
        
        addSubview(headerView)
        headerView.addSubview(numberView)
        headerView.addSubview(headerImage)
        numberView.addSubview(headLabel)
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        numberView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
            make.height.equalTo(28)
            make.width.equalTo(64)
        }
        
        backView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(headerView.snp.bottom)
        }
        
        headLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        headerImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        imageLetter.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalTo(addressLabel)
        }
        
        imageLetter2.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalTo(emailLabel)
        }
        
        imageLetter3.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalTo(numberLabel)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(12)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
            make.leading.equalTo(imageLetter).offset(20)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(addressLabel.snp.bottom).offset(12)
            make.leading.equalTo(imageLetter2).offset(20)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(12)
            make.leading.equalTo(imageLetter3).offset(20)
        }
    }
    
    override class func awakeFromNib() {
        self.awakeFromNib()
    }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func initCell(model: CompanyData) {
        headLabel.text = model.title
        nameLabel.text = model.name
        addressLabel.text = model.address
        emailLabel.text = model.emailAdress
        numberLabel.text = model.phoneNumber
        
     }
}
