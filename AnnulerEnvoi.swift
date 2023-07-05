import SwiftUI

struct AnnulerEnvoi: View {
    @State private var result: String = "Loading..."

    var body: some View {
        VStack {
            Text("Annuler Envoi")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: cancelMessage)
    }

    func cancelMessage() {
        let apiKey = "YOUR_API_KEY"
        let messageId = "300"
        let urlString = "https://api.smspartner.fr/v1/message-cancel?apiKey=\(apiKey)&messageId=\(messageId)"

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

struct AnnulerEnvoi_Previews: PreviewProvider {
    static var previews: some View {
        AnnulerEnvoi()
    }
}
