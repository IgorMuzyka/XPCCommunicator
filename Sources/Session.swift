
import Foundation
import Communicator

public final class XPCSession: Session<XPCPeer, XPCConnection> {

    public override func prepare(connection: XPCConnection) -> XPCConnection {
        connection.receiver.connection?.exportedObject = proxy
        connection.receiver.connection?.resume()

        return connection
    }
}
