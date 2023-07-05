import SwiftUI

struct AjoutCreditSousCompte: View {
    @State private var result: String = "Loading..."

    var body: some View {
        VStack {
            Text("Ajout Credit Sous Compte")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: ajoutCreditSousCompte)
    }

    func ajoutCreditSousCompte() {
        let apiKey = "YOUR_API_KEY"
        let credit = "100"
        let tokenSubaccount = "identifiant du sous-compte"

        let urlString = "https://api.smspartner.fr/v1/subaccount/credit/add"
        let url = URL(string: urlString)!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "apiKey": apiKey,
            "credit": credit,
            "tokenSubaccount": tokenSubaccount
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
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

struct AjoutCreditSousCompte_Previews: PreviewProvider {
    static var previews: some View {
        AjoutCreditSousCompte()
    }
}
