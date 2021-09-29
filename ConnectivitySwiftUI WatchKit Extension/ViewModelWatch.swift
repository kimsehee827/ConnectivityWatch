import Foundation
import WatchConnectivity

class ViewModelWatch : NSObject,  WCSessionDelegate, ObservableObject{
    
    var session: WCSession
    @Published var messageText = ""
    //@Published var hello: String = "hi"
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.messageText = message["message"] as? String ?? "Unknown"
        }
    }
    
    /*func sendmessage(){
        self.session.sendMessage(["message" : hello/*self.messageText*/], replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
    }*/
    
}
