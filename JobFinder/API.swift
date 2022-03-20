// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class JobListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query JobList {
      jobs {
        __typename
        id
        title
        description
        company {
          __typename
          logoUrl
          name
        }
        locationNames
      }
    }
    """

  public let operationName: String = "JobList"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("jobs", type: .nonNull(.list(.nonNull(.object(Job.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(jobs: [Job]) {
      self.init(unsafeResultMap: ["__typename": "Query", "jobs": jobs.map { (value: Job) -> ResultMap in value.resultMap }])
    }

    public var jobs: [Job] {
      get {
        return (resultMap["jobs"] as! [ResultMap]).map { (value: ResultMap) -> Job in Job(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Job) -> ResultMap in value.resultMap }, forKey: "jobs")
      }
    }

    public struct Job: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Job"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("company", type: .object(Company.selections)),
          GraphQLField("locationNames", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, description: String? = nil, company: Company? = nil, locationNames: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Job", "id": id, "title": title, "description": description, "company": company.flatMap { (value: Company) -> ResultMap in value.resultMap }, "locationNames": locationNames])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var company: Company? {
        get {
          return (resultMap["company"] as? ResultMap).flatMap { Company(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "company")
        }
      }

      public var locationNames: String? {
        get {
          return resultMap["locationNames"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "locationNames")
        }
      }

      public struct Company: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Company"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("logoUrl", type: .scalar(String.self)),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(logoUrl: String? = nil, name: String) {
          self.init(unsafeResultMap: ["__typename": "Company", "logoUrl": logoUrl, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var logoUrl: String? {
          get {
            return resultMap["logoUrl"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "logoUrl")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}
