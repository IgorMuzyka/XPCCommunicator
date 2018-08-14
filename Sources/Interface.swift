
import Foundation
import Communicator

public protocol XPCInterface: Interface {

    var connection: NSXPCConnection! { get }
}
