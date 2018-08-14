
import Foundation
import Communicator

public final class XPCConnection: Connection<XPCPeer> {

    public override func prepare() -> Self {
        receiver.connection?.exportedInterface = NSXPCInterface(with: XPCInterfaceProtocol.self)
        receiver.connection?.remoteObjectInterface = NSXPCInterface(with: XPCInterfaceProtocol.self)
        return self
    }

    public override func destroy() -> Self {
        receiver.connection?.invalidate()
        return self
    }
}
