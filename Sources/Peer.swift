
import Foundation
import Communicator

public class XPCPeer: XPCInterface {

    public let identifier: Identifier
    public internal(set) var connection: NSXPCConnection!

    public init(identifier: Identifier, connection: NSXPCConnection?) {
        self.identifier = identifier
        self.connection = connection
    }
}
