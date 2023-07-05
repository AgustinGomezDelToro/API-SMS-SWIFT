import SwiftUI

struct StatutSmsParTag: View {
    @State private var result: String = "Loading..."
    
    var body: some View {
        VStack {
            Text("Statut Sms Par Tag")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: getStatusByTag)
    }

    func getStatusByTag() {
        let apiKey = "YOUR_API_KEY"
        let tag = "montag"
        let urlString = "https://api.smspartner.fr/v1/bulk-status-by-tag?apiKey=\(apiKey)&tag=\(tag)"

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

