import SwiftUI

struct ListeDesSousComptes: View {
    @State private var result: String = "Loading..."

    var body: some View {
        VStack {
            Text("Liste Des Sous Comptes")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: loadSubAccounts)
    }

    func loadSubAccounts() {
        let apiKey = "YOUR_API_KEY"
        let urlString = "https://api.smspartner.fr/v1/subaccount/list?apiKey=\(apiKey)"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                let resultString = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    self.result = resultString ?? "Error"
                }
            }
        }

        task.resume()
    }
}

struct ListeDesSousComptes_Previews: PreviewProvider {
    static var previews: some View {
        ListeDesSousComptes()
    }
}
