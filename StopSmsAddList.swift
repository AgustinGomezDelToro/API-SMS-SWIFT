import SwiftUI

struct StopSmsAddList: View {
    @State private var result: String = "Loading..."
    
    var body: some View {
        VStack {
            Text("Stop SMS Add")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: addStopSms)
    }
    
    func addStopSms() {
        let apiKey = "YOUR API KEY"
        let phoneNumber = "+336xxxxxxxx"
        let urlString = "https://api.smspartner.fr/v1/stop-sms/add"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let fields = ["apiKey": apiKey, "phoneNumber": phoneNumber]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: fields, options: [])
        } catch {
            print("Failed to serialize data: \(error.localizedDescription)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
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
