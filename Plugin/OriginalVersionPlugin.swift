import Foundation
import Capacitor
import StoreKit

@objc(OriginalVersionPlugin)
public class OriginalVersionPlugin: CAPPlugin {
    @objc func getOriginalVersion(_ call: CAPPluginCall) {
        if #available(iOS 15.0, *) {
            Task {
                do {
                    let result = try await AppTransaction.shared
                    switch result {
                    case .verified(let transaction):
                        call.resolve(["version": transaction.originalAppVersion ?? ""])
                    case .unverified(_, let error):
                        call.reject("Unverified: \(error.localizedDescription)")
                    }
                } catch {
                    call.resolve(["version": nil])
                }
            }
        } else {
            call.reject("iOS 15+ required")
        }
    }
}
