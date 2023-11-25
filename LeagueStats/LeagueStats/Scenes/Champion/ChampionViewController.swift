//
//  ChampionViewController.swift
//  LeagueStats
//
//  Created by Hoang Linh Nguyen on 25/11/2023.
//

import UIKit
import LeagueAPI
import Reusable

let league = LeagueAPI(APIToken: "API_KEY")

class ChampionViewController: UIViewController {
    @IBOutlet weak var championTableView: UITableView!


    private var championNames: [String] = []
    private var championDetails : [ChampionDetails] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        getAllChampion()
    }


    private func registerTableView() {
        championTableView.register(UINib(nibName: "ChampionTableViewCell", bundle: nil),
                                   forCellReuseIdentifier: "ChampionTableViewCell")
        championTableView.rowHeight = 100
        championTableView.delegate = self
        championTableView.dataSource = self
    }

    func getDetailChampions(champNames: [String]) {
        let queue = DispatchQueue(label: "getDetailChampion", qos: .utility)
        queue.sync {
            _ = champNames.map { champName in
                league.lolAPI.getChampionDetails(byName: champName) { (champion, errorMsg) in
                    if let champion = champion {
                        self.championDetails.append(champion)
                    }
                    else {
                        print("Request failed cause: \(errorMsg ?? "No error description")")
                    }
                }
            }
            DispatchQueue.main.async { [unowned self] in
                self.championTableView.reloadData()
            }
        }
    }

    func getAllChampion() {
        let queue = DispatchQueue(label: "getAllChampionName", qos: .utility)
        queue.async { [unowned self] in
            league.lolAPI.getAllChampionNames() { (championNames, errorMsg) in
                if let championNames = championNames {
                    self.getDetailChampions(champNames: championNames)
                }
                else {
                    print("Request failed cause: \(errorMsg ?? "No error description")")
                }
            }
        }

    }
}

extension ChampionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return championDetails.count
    }
}

extension ChampionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = championTableView.dequeueReusableCell(withIdentifier: "ChampionTableViewCell", for: indexPath)
            as? ChampionTableViewCell {
            cell.configCell(thisChampion: championDetails[indexPath.row],
                            index: indexPath.row)
            return cell
        }
        return UITableViewCell()
    }
}
