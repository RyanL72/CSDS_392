//
//  ContentView.swift
//  NetworkingApp
//
//  Created by Ryan Lin on 3/14/25.
//

import SwiftUI

struct UUIDResponse : Codable{
    var host:String
    var uuid:String
    var timestamp:Int
}

func getUUID(completion: @escaping(UUIDResponse)->Void){
    let session = URLSession(configuration: .default)
    
    if let url = URL(string: "https://caslab.case.edu/392/test.php/uuid"){
        let request = URLRequest(url: url)
        
        session.dataTask(with: request){data, response, error in
            if let data = data{
                let decoder = JSONDecoder()
                do{
                    let uuidResponse = try decoder.decode(UUIDResponse.self, from: data)
                    completion(uuidResponse)
                    print("UUID: \(uuidResponse.uuid)")
                } catch{
                    print("Error decoding \(error)")
                }
            }
            
        }.resume()
    }
    
}

struct ContentView: View {
    @State var uuid = ""
    var body: some View {
        VStack {
            Text(uuid)
            Button("Get new UUID"){
                getUUID{ uuidResponse in
                    uuid = uuidResponse.uuid
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
