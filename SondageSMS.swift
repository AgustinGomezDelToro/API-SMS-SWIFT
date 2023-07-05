import SwiftUI

struct SondageSMS: View {
    @State private var result: String = "Loading..."

    var body: some View {
        VStack {
            Text("Sondage SMS")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: sendSondage)
    }

    func sendSondage() {
        let apiKey = "YOUR_API_KEY"
        let phoneNumber = "+336xxxxxxxx"
        let sondageIdent = "SONDAGE_IDENT"
        let scheduledDeliveryDate = "05/07/2023"
        let time = 9
        let minute = 0

        let urlString = "https://api.smspartner.fr/v1/sondage/to/send"
        let url = URL(string: urlString)!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "apiKey": apiKey,
            "phoneNumbers": phoneNumber,
            "sondageIdent": sondageIdent,
            "scheduledDeliveryDate": scheduledDeliveryDate,
            "time": time,
            "minute": minute
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

struct SondageSMS_Previews: PreviewProvider {
    static var previews: some View {
        SondageSMS()
    }
}
