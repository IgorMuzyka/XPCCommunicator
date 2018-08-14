
import Communicator

public struct XPCDriver: Driver {

    public enum XPCDriverError: Error {
        case recipientPeerDoesNotExportExpectedXPCInterface
    }

    public typealias Peer = XPCPeer
    public typealias DedicatedCodec = XPCJSONCodec

    public static func deliver(packet: Packet, to receiver: XPCPeer, from sender: XPCPeer) throws {
        var error: Error?

        guard let interface = receiver.connection?.remoteObjectProxyWithErrorHandler({ xpcError in
            error = xpcError
        }) as? XPCInterfaceProtocol else {
            throw XPCDriverError.recipientPeerDoesNotExportExpectedXPCInterface
        }

        if let error = error {
            throw error
        }

        let data = try codec.encode(packet)
        interface.receive(data: data, from: sender.identifier)
    }

    public static func packet(from data: Data) throws -> Packet {
        return try codec.decode(Packet.self, from: data)
    }

    public static let codec = XPCJSONCodec()
}
