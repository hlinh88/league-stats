//
//  ViewController.swift
//  LeagueStats
//
//  Created by Hoang Linh Nguyen on 23/11/2023.
//

import UIKit
import LeagueAPI

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
    }

    func test() {
        // puuid: t_wIdp8rAHch0TnbRbw2Yx21I1cVxWTSaOQP3zPeAXHs1lMxWk2fwe6Q5Ik52cKXj3bv1gS8a0O2qw
        let league = LeagueAPI(APIToken: "RGAPI-89ed4642-182e-46c4-88b0-9db0b3ec7cc5")

        league.lolAPI.getChampionDetails(byName: "Ahri") { (champion, errorMsg) in
            if let champion = champion {
                print(champion.images?.loading.url)
                print("Success!")
            }
            else {
                print("Request failed cause: \(errorMsg ?? "No error description")")
            }
        }
    }
}

