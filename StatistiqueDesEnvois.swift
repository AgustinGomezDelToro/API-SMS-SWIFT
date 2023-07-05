import SwiftUI

struct StatistiqueDesEnvois: View {
    @State private var result: String = "Loading..."

    var body: some View {
        VStack {
            Text("Statistique Des Envois")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: getStatistics)
    }

    func getStatistics() {
        let apiKey = "YOUR_API_KEY"
        let interval = "last_twelve_months"
        let urlString = "https://api.smspartner.fr/v1/statistics/cost-resume?apiKey=\(apiKey)&interval=\(interval)"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            result = "Invalid URL"
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                DispatchQueue.main.async {
                    self.result = "Error: \(error)"
                }
            } else if let data = data {
                let str = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    self.result = str ?? "Error"
                }
            }
        }

        task.resume()
    }
}
