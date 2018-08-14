
import Foundation

@objc public protocol XPCInterfaceProtocol {

    func receive(data packet: Data, from senderIdentifier: String)
}
