//
//  ViewController.swift
//  HomeTask03-7
//
//  Created by Sonun on 28/3/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let idCell = "cell"
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private var companyInfoList: [CompanyData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.placeholder = "Search"
        initData()
        initUi()
        
        func initData(){
        companyInfoList = [CompanyData(title: "C0015", name: "Kut Company", address: "Ankara street 77", emailAdress: "kut@gmail.com", phoneNumber: "+996500600", image: "letter"),
                           CompanyData(title: "C0016", name: "Elit House Company", address: "Bitik Baatyra street 22", emailAdress: "elithouse@gmail.com", phoneNumber: "+996500300", image: "letter"),
                           CompanyData(title: "C0017", name: "Aalam Stroy Company", address: "Jibek Jolu street 88", emailAdress: "aalamstroy@gmail.com", phoneNumber: "+996508600", image: "letter"),
                           CompanyData(title: "C0018", name: "Ihlas Company", address: "Kurmanjan Datka street 45", emailAdress: "ihlas@gmail.com", phoneNumber: "+996560600", image: "letter")]
            
        }
    }
    
    private func initUi() {
        navigationItem.titleView = searchBar
        view.addSubview(searchBar)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: idCell)
        
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        companyInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: idCell)
        cell.textLabel?.text = companyInfoList[indexPath.row].name
        cell.detailTextLabel?.text = companyInfoList[indexPath.row].address
        return cell
    }
    
        
    }
