
import Foundation
import Communicator

public final class XPCProxy: XPCPeer, Proxy, XPCInterfaceProtocol {

    public var handler: Handler!

    public required init(identifier: Identifier) {
        super.init(identifier: identifier, connection: nil)
    }

    public func receive(data: Data, from senderIdentifier: Identifier) {
        handler!(data, senderIdentifier)
    }
}
