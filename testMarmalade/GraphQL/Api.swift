// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class TestQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query test {
      randomQuote {
        __typename
        quote
        author
      }
    }
    """

  public let operationName: String = "test"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("randomQuote", type: .nonNull(.object(RandomQuote.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(randomQuote: RandomQuote) {
      self.init(unsafeResultMap: ["__typename": "Query", "randomQuote": randomQuote.resultMap])
    }

    public var randomQuote: RandomQuote {
      get {
        return RandomQuote(unsafeResultMap: resultMap["randomQuote"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "randomQuote")
      }
    }

    public struct RandomQuote: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Quote"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("quote", type: .nonNull(.scalar(String.self))),
          GraphQLField("author", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(quote: String, author: String) {
        self.init(unsafeResultMap: ["__typename": "Quote", "quote": quote, "author": author])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var quote: String {
        get {
          return resultMap["quote"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "quote")
        }
      }

      public var author: String {
        get {
          return resultMap["author"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "author")
        }
      }
    }
  }
}