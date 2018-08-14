
import TypePreservingCodingAdapter
import Communicator

public final class XPCJSONCodec: Codec {

	private let encoder = JSONEncoder()
	private let decoder = JSONDecoder()
	public let adapter = TypePreservingCodingAdapter()

	public init() {
		encoder.userInfo[.typePreservingAdapter] = adapter
		decoder.userInfo[.typePreservingAdapter] = adapter
	}

	public  func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
		return try decoder.decode(type, from: data)
	}

	public func encode<T: Encodable>(_ value: T) throws -> Data {
		return try encoder.encode(value)
	}
}
