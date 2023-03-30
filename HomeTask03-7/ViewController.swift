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
    private var filteredCompanyList: [CompanyData] = []
    private var isFiltering = false

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.placeholder = "Search"
        initData()
        initUi()
        
        func initData(){
        companyInfoList = [CompanyData(title: "C0015", name: "ABC Company", address: "Ankara 77", emailAdress: "abc@gmail.com", phoneNumber: "+996500600", image: "letter"),
                           CompanyData(title: "C0016", name: "ZET House Company", address: "7 Aprel 22", emailAdress: "elithouse@gmail.com", phoneNumber: "+996500300", image: "letter"),
                           CompanyData(title: "C0017", name: "GG Company", address: "Jibek Jolu 88", emailAdress: "aalamstroy@gmail.com", phoneNumber: "+996508600", image: "letter"),
                           CompanyData(title: "C0018", name: " KKK Company", address: "Kurmanjan Datka street 45", emailAdress: "kkk@gmail.com", phoneNumber: "+996560600", image: "letter")]
            
        }
    }
    
    private func initUi() {
        view.backgroundColor = .white
        navigationItem.titleView = searchBar
        
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: idCell)
        
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltering ? filteredCompanyList.count : companyInfoList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! CompanyTableViewCell
        let model = isFiltering ? filteredCompanyList[indexPath.row] : companyInfoList[indexPath.row]
        cell.initCell(model: model)
        return cell
    }
    
        
    }

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isFiltering = false
        } else {
            isFiltering = true
            filteredCompanyList = companyInfoList.filter({ $0.name.contains(searchText)})
        }
        
        tableView.reloadData()
    }
}
