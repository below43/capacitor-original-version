import Foundation
import Capacitor
import StoreKit

@objc(OriginalVersionPlugin)
public class OriginalVersionPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "OriginalVersionPlugin"
    public let jsName = "OriginalVersion"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "getOriginalAppVersion", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getOriginalPurchaseDate", returnType: CAPPluginReturnPromise)
    ]
    
    @objc func getOriginalAppVersion(_ call: CAPPluginCall) {
        if #available(iOS 16.0, *) {
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
            call.reject("iOS 16+ required")
        }
    }
    
    @objc func getOriginalPurchaseDate(_ call: CAPPluginCall) {
        if #available(iOS 16.0, *) {
            Task {
                do {
                    let result = try await AppTransaction.shared
                    switch result {
                    case .verified(let transaction):
						let purchaseDate = transaction.originalPurchaseDate
						
						// Check if date is epoch (1970-01-01), which indicates no valid date
						if purchaseDate == Date(timeIntervalSince1970: 0) {
							call.reject("No original purchase date available")
							return
						}
						
						let dateFormatter = ISO8601DateFormatter()
						let dateString = dateFormatter.string(from: purchaseDate)
						call.resolve(["date": dateString])
                    case .unverified(_, let error):
                        call.reject("Unverified: \(error.localizedDescription)")
                    }
                } catch {
                    call.reject("Failed to get app transaction: \(error.localizedDescription)")
                }
            }
        } else {
            call.reject("iOS 16+ required")
        }
    }
}
