import SwiftUI

struct StopSmsDeleteList: View {
    @State private var result: String = "Loading..."
    
    var body: some View {
        VStack {
            Text("Stop Sms Delete")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: deleteStopSms)
    }

    func deleteStopSms() {
        let apiKey = "YOUR_API_KEY"
        let id = "666"
        let urlString = "https://api.smspartner.fr/v1/stop-sms/delete?apiKey=\(apiKey)&id=\(id)"

        guard let url = URL(string: urlString) else {
            print("URL inválida")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                let result = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    self.result = result ?? "Error"
                }
            }
        }

        task.resume()
    }
}

