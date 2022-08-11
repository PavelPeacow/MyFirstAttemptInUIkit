//
//  ViewController.swift
//  SomeUIKitTests
//
//  Created by Павел Кай on 08.08.2022.
//

import UIKit


class ViewController: UIViewController {
    
    var heroesArray = [HeroStats]()
    
    lazy private var catLabel: UILabel = {
        let catLabel = UILabel()
        catLabel.text = "Какой-то жесткий тест UITableView на юйките без сториборда c дОтерским апи"
        catLabel.translatesAutoresizingMaskIntoConstraints = false
        catLabel.textAlignment = .center
        catLabel.numberOfLines = 0
        catLabel.backgroundColor = .orange
        return catLabel
    }()
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .orange
        
        tableView.separatorColor = .black
        tableView.rowHeight = 60
        return tableView
    }()
    
    lazy private var buttonAdd: UIButton = {
        let buttonAdd = UIButton()
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.backgroundColor = .brown
        buttonAdd.setTitle("Добавить пожилого кота", for: .normal)
        buttonAdd.titleLabel?.adjustsFontSizeToFitWidth = true
        buttonAdd.layer.cornerRadius = 12
        return buttonAdd
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        navigationItem.title = "Fucking Dota"
        
        view.addSubview(catLabel)
        view.addSubview(tableView)
        view.addSubview(buttonAdd)
        
        let anonymFunc = { (fetchedHeroList: [HeroStats]) in
            self.heroesArray = fetchedHeroList
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print(self.heroesArray)
            }
        }
        fetchJSON(onCompletion: anonymFunc)
        
        
        setConstraints()
    }

    
    func setConstraints() {
        NSLayoutConstraint.activate([
            catLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            catLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            
            tableView.topAnchor.constraint(equalTo: catLabel.bottomAnchor, constant: 30),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: buttonAdd.topAnchor, constant: -5),

            buttonAdd.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAdd.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            buttonAdd.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        ])
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
        let hero = heroesArray[indexPath.row]
        cell.label.text = hero.localized_name
        
        let defaultURL = "https://api.opendota.com" + heroesArray[indexPath.row].img
        
        if let url = URL(string: defaultURL) {
            cell.image.loadImage(for: url)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        let defaultURL = "https://api.opendota.com" + heroesArray[indexPath.row].img
        
        if let url = URL(string: defaultURL) {
            vc.catImage.loadImage(for: url)
        }
 
        navigationController?.pushViewController(vc, animated: true)
    }
}
