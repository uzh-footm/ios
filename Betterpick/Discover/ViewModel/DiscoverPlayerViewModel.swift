//
//  DiscoverPlayerViewModel.swift
//  Betterpick
//
//  Created by David Bielik on 30/04/2020.
//  Copyright © 2020 dvdblk. All rights reserved.
//

import Foundation

class DiscoverPlayerViewModel: FetchingViewModel<GetPlayersResponseBody, [PlayerPreview]> {

    // MARK: - Properties
    var playerFilterData: PlayerFilterData {
        didSet {
            // Fetch every time we change the filter data
            start()
        }
    }

    let nationalities: [Nationality]

    // MARK: - Initialization
    init(nationalities: [Nationality]) {
        self.playerFilterData = PlayerFilterData.default()
        self.nationalities = nationalities
    }

    // MARK: - Inherited
    override func startFetching(completion: @escaping BetterpickAPIManager.Callback<GetPlayersResponseBody>) {
        apiManager.players(filterData: playerFilterData, completion: completion)
    }

    override func responseBodyToModel(_ responseBody: GetPlayersResponseBody) -> [PlayerPreview]? {
        return responseBody.players
    }

    // MARK: - Public
    public func numberOfPlayers() -> Int {
        guard case .displaying(let players) = state else { return 0 }
        return players.count
    }

    public func player(at row: Int) -> PlayerPreview? {
        guard case .displaying(let players) = state else { return nil }
        return players[row]
    }
}
