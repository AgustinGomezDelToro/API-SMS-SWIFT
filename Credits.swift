import SwiftUI

struct Credits: View {
    @State private var credit: String = "Loading..."

    var body: some View {
        VStack {
            Text("Mon crédit")
                .font(.title)
                .padding()

            Text(credit)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: getCredit)
    }

    func getCredit() {
        let apiKey = "9d508bc26ea3e9a4673b4faf66940e4b7e8fcdef"
        let urlString = "https://api.smspartner.fr/v1/me?apiKey=\(apiKey)"

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
                    credit = result ?? "Error"
                }
            }
        }

        task.resume()
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        Credits()
    }
}
