//
//  ListScreenViewModel.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 09/09/26.
//

import SwiftUI
import Combine

enum StateView {
    case loading
    case content([ShowModel])
    case error(Error)
}

class ListScreenViewModel: ObservableObject {
    @Published var stateView: StateView = .loading
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    init () {
        self.refresh()
    }
}

extension ListScreenViewModel {
    func refresh() {
        updateStateView(with: .loading)
        
        Task {
            await self.fetchShows()
        }
    }
}

private extension ListScreenViewModel {
    func updateStateView(with state: StateView) {
        DispatchQueue.main.async {
            self.stateView = state
        }
    }
    
    func fetchShows() async {
        guard let url = URL(string: Environment.apiUrl + "shows?page=0") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let shows = try JSONDecoder().decode([ShowModel].self, from: data)
                
                updateStateView(with: .content(shows))
            } else {
                updateStateView(with: .error("Failed with status code outside 200" as! Error))
            }
        } catch {
            print(error.localizedDescription)
            updateStateView(with: .error(error))
        }
    }
}

enum Environment {
    static let apiUrl: String = {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "API_URL") as? String else {
            fatalError("API_URL tidak ditemukan di Info.plist")
        }
        return url
    }()
}
