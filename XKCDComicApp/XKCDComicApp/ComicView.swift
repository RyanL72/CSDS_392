//
//  ComicView.swift
//  XKCDComicApp
//
//  Created by Ryan Lin on 3/14/25.
//

import SwiftUI

struct XKCDComic: Codable {
    var num: Int
    var month: String
    var day: String
    var year: String
    var title: String
    var img: String
    var alt: String
}

class ComicModel: ObservableObject {
    @Published var comic: XKCDComic?
    @Published var imageURL: URL?
    var refreshDate: Date
    
    init() {
        self.comic = nil
        self.imageURL = nil
        self.refreshDate = Date()
    }
    
    func refresh() async {
        DispatchQueue.main.async {
            self.comic = nil
            self.imageURL = nil
        }
        
        if let newComic = await getComic() {
            DispatchQueue.main.async {
                self.comic = newComic
                self.imageURL = URL(string: newComic.img)
                self.refreshDate = Date()
            }
        }
    }
    
    private func getComic() async -> XKCDComic? {
        let session = URLSession(configuration: .default)
        guard let url = URL(string: "https://xkcd.com/info.0.json") else { return nil }
        
        let request = URLRequest(url: url)
        do {
            let (data, _) = try await session.data(for: request)
            let decoder = JSONDecoder()
            let comic = try decoder.decode(XKCDComic.self, from: data)
            return comic
        } catch {
            print("Error fetching XKCD comic: \(error)")
            return nil
        }
    }
}

struct ComicView: View {
    @StateObject private var comicModel = ComicModel()
    @State private var fetchingComic = false
    
    func loadComic() {
        fetchingComic = true
        Task {
            await comicModel.refresh()
            fetchingComic = false
        }
    }
    
    var body: some View {
        VStack {
            Text("Today's XKCD Comic")
                .font(.title)
                .padding(.bottom, 10)
            
            Text(comicModel.comic?.title ?? "Loading...")
                .font(.headline)
                .multilineTextAlignment(.center)
            
            if let url = comicModel.imageURL {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 300)
            } else if fetchingComic {
                ProgressView()
            }
            
            Spacer()
            
            Button("Get Comic") {
                loadComic()
            }
            .disabled(fetchingComic)
            .padding(.top, 10)
        }
        .padding()
        .onAppear {
            loadComic()
        }
    }
}

#Preview {
    ComicView()
}
