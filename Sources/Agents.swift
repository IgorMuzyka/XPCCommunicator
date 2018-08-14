
import Foundation
import Communicator

public typealias XPCDispatcher = Dispatcher<XPCPeer, XPCDriver, XPCSession, XPCConnection>
public typealias XPCClient = Client<XPCPeer, XPCProxy, XPCDispatcher>
public typealias XPCServer = Server<XPCPeer, XPCProxy, XPCDispatcher>
