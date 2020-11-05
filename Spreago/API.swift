//  This file was automatically generated and should not be edited.

import Apollo

public struct SocialiteInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(token: Swift.Optional<String?> = nil, provider: Swift.Optional<String?> = nil) {
    graphQLMap = ["token": token, "provider": provider]
  }

  public var token: Swift.Optional<String?> {
    get {
      return graphQLMap["token"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "token")
    }
  }

  public var provider: Swift.Optional<String?> {
    get {
      return graphQLMap["provider"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "provider")
    }
  }
}

public struct attempt: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(email: String, password: String) {
    graphQLMap = ["email": email, "password": password]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct forgotPasswordinput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(password: String) {
    graphQLMap = ["password": password]
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct verifyPinCodeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(email: String, pinCode: Swift.Optional<String?> = nil) {
    graphQLMap = ["email": email, "pin_code": pinCode]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var pinCode: Swift.Optional<String?> {
    get {
      return graphQLMap["pin_code"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pin_code")
    }
  }
}

public struct newUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(name: String, password: String, countriesId: Int, citiesId: Int, userTypeId: Int) {
    graphQLMap = ["name": name, "password": password, "countries_id": countriesId, "cities_id": citiesId, "user_type_id": userTypeId]
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }

  public var countriesId: Int {
    get {
      return graphQLMap["countries_id"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "countries_id")
    }
  }

  public var citiesId: Int {
    get {
      return graphQLMap["cities_id"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cities_id")
    }
  }

  public var userTypeId: Int {
    get {
      return graphQLMap["user_type_id"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user_type_id")
    }
  }
}

public final class UsersQuery: GraphQLQuery {
  /// query users {
  ///   users {
  ///     __typename
  ///     id
  ///     name
  ///     email
  ///     get_notifications
  ///     is_active
  ///     is_verified
  ///     email_verified_at
  ///     created_at
  ///     updated_at
  ///     Locale
  ///     city
  ///     country
  ///     address
  ///     image
  ///     cities_id
  ///     countries_id
  ///     gender
  ///     phone
  ///     typeName
  ///   }
  /// }
  public let operationDefinition =
    "query users { users { __typename id name email get_notifications is_active is_verified email_verified_at created_at updated_at Locale city country address image cities_id countries_id gender phone typeName } }"

  public let operationName = "users"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("users", type: .nonNull(.list(.nonNull(.object(User.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(users: [User]) {
      self.init(unsafeResultMap: ["__typename": "Query", "users": users.map { (value: User) -> ResultMap in value.resultMap }])
    }

    public var users: [User] {
      get {
        return (resultMap["users"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "users")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("get_notifications", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("is_active", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("is_verified", type: .scalar(Bool.self)),
        GraphQLField("email_verified_at", type: .nonNull(.scalar(String.self))),
        GraphQLField("created_at", type: .nonNull(.scalar(String.self))),
        GraphQLField("updated_at", type: .nonNull(.scalar(String.self))),
        GraphQLField("Locale", type: .scalar(String.self)),
        GraphQLField("city", type: .scalar(String.self)),
        GraphQLField("country", type: .scalar(String.self)),
        GraphQLField("address", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("cities_id", type: .scalar(Int.self)),
        GraphQLField("countries_id", type: .scalar(Int.self)),
        GraphQLField("gender", type: .scalar(Bool.self)),
        GraphQLField("phone", type: .scalar(String.self)),
        GraphQLField("typeName", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, email: String, getNotifications: Bool, isActive: Bool, isVerified: Bool? = nil, emailVerifiedAt: String, createdAt: String, updatedAt: String, locale: String? = nil, city: String? = nil, country: String? = nil, address: String? = nil, image: String? = nil, citiesId: Int? = nil, countriesId: Int? = nil, gender: Bool? = nil, phone: String? = nil, typeName: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "get_notifications": getNotifications, "is_active": isActive, "is_verified": isVerified, "email_verified_at": emailVerifiedAt, "created_at": createdAt, "updated_at": updatedAt, "Locale": locale, "city": city, "country": country, "address": address, "image": image, "cities_id": citiesId, "countries_id": countriesId, "gender": gender, "phone": phone, "typeName": typeName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
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

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var getNotifications: Bool {
        get {
          return resultMap["get_notifications"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "get_notifications")
        }
      }

      public var isActive: Bool {
        get {
          return resultMap["is_active"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "is_active")
        }
      }

      public var isVerified: Bool? {
        get {
          return resultMap["is_verified"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "is_verified")
        }
      }

      public var emailVerifiedAt: String {
        get {
          return resultMap["email_verified_at"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email_verified_at")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["created_at"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "created_at")
        }
      }

      public var updatedAt: String {
        get {
          return resultMap["updated_at"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updated_at")
        }
      }

      public var locale: String? {
        get {
          return resultMap["Locale"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "Locale")
        }
      }

      public var city: String? {
        get {
          return resultMap["city"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "city")
        }
      }

      public var country: String? {
        get {
          return resultMap["country"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "country")
        }
      }

      public var address: String? {
        get {
          return resultMap["address"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "address")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var citiesId: Int? {
        get {
          return resultMap["cities_id"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "cities_id")
        }
      }

      public var countriesId: Int? {
        get {
          return resultMap["countries_id"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "countries_id")
        }
      }

      public var gender: Bool? {
        get {
          return resultMap["gender"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var phone: String? {
        get {
          return resultMap["phone"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "phone")
        }
      }

      public var typeName: String {
        get {
          return resultMap["typeName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "typeName")
        }
      }
    }
  }
}

public final class CountriesQuery: GraphQLQuery {
  /// query countries {
  ///   countries {
  ///     __typename
  ///     ...countryInfo
  ///   }
  /// }
  public let operationDefinition =
    "query countries { countries { __typename ...countryInfo } }"

  public let operationName = "countries"

  public var queryDocument: String { return operationDefinition.appending(CountryInfo.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("countries", type: .nonNull(.list(.nonNull(.object(Country.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(countries: [Country]) {
      self.init(unsafeResultMap: ["__typename": "Query", "countries": countries.map { (value: Country) -> ResultMap in value.resultMap }])
    }

    public var countries: [Country] {
      get {
        return (resultMap["countries"] as! [ResultMap]).map { (value: ResultMap) -> Country in Country(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Country) -> ResultMap in value.resultMap }, forKey: "countries")
      }
    }

    public struct Country: GraphQLSelectionSet {
      public static let possibleTypes = ["Countries"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(CountryInfo.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var countryInfo: CountryInfo {
          get {
            return CountryInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class LoginSocialiteMutation: GraphQLMutation {
  /// mutation loginSocialite($SocialiteInput: SocialiteInput!) {
  ///   loginSocialite(data: {SocialiteInput: $SocialiteInput}) {
  ///     __typename
  ///     BearerTokenResponse {
  ///       __typename
  ///       access_token
  ///     }
  ///     user {
  ///       __typename
  ///       id
  ///       name
  ///       email
  ///       is_verified
  ///       type {
  ///         __typename
  ///         id
  ///       }
  ///     }
  ///     Status {
  ///       __typename
  ///       check
  ///       message
  ///     }
  ///   }
  /// }
  public let operationDefinition =
    "mutation loginSocialite($SocialiteInput: SocialiteInput!) { loginSocialite(data: {SocialiteInput: $SocialiteInput}) { __typename BearerTokenResponse { __typename access_token } user { __typename id name email is_verified type { __typename id } } Status { __typename check message } } }"

  public let operationName = "loginSocialite"

  public var SocialiteInput: SocialiteInput

  public init(SocialiteInput: SocialiteInput) {
    self.SocialiteInput = SocialiteInput
  }

  public var variables: GraphQLMap? {
    return ["SocialiteInput": SocialiteInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("loginSocialite", arguments: ["data": ["SocialiteInput": GraphQLVariable("SocialiteInput")]], type: .nonNull(.object(LoginSocialite.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(loginSocialite: LoginSocialite) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "loginSocialite": loginSocialite.resultMap])
    }

    public var loginSocialite: LoginSocialite {
      get {
        return LoginSocialite(unsafeResultMap: resultMap["loginSocialite"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "loginSocialite")
      }
    }

    public struct LoginSocialite: GraphQLSelectionSet {
      public static let possibleTypes = ["AuthResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("BearerTokenResponse", type: .object(BearerTokenResponse.selections)),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("Status", type: .object(Status.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(bearerTokenResponse: BearerTokenResponse? = nil, user: User? = nil, status: Status? = nil) {
        self.init(unsafeResultMap: ["__typename": "AuthResponse", "BearerTokenResponse": bearerTokenResponse.flatMap { (value: BearerTokenResponse) -> ResultMap in value.resultMap }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "Status": status.flatMap { (value: Status) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var bearerTokenResponse: BearerTokenResponse? {
        get {
          return (resultMap["BearerTokenResponse"] as? ResultMap).flatMap { BearerTokenResponse(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "BearerTokenResponse")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public var status: Status? {
        get {
          return (resultMap["Status"] as? ResultMap).flatMap { Status(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Status")
        }
      }

      public struct BearerTokenResponse: GraphQLSelectionSet {
        public static let possibleTypes = ["BearerTokenResponse"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("access_token", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(accessToken: String) {
          self.init(unsafeResultMap: ["__typename": "BearerTokenResponse", "access_token": accessToken])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var accessToken: String {
          get {
            return resultMap["access_token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "access_token")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("is_verified", type: .scalar(Bool.self)),
          GraphQLField("type", type: .nonNull(.object(`Type`.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, name: String, email: String, isVerified: Bool? = nil, type: `Type`) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "is_verified": isVerified, "type": type.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var isVerified: Bool? {
          get {
            return resultMap["is_verified"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "is_verified")
          }
        }

        public var type: `Type` {
          get {
            return `Type`(unsafeResultMap: resultMap["type"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "type")
          }
        }

        public struct `Type`: GraphQLSelectionSet {
          public static let possibleTypes = ["userType"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int) {
            self.init(unsafeResultMap: ["__typename": "userType", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }

      public struct Status: GraphQLSelectionSet {
        public static let possibleTypes = ["Status"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("check", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("message", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(check: Bool, message: String) {
          self.init(unsafeResultMap: ["__typename": "Status", "check": check, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var check: Bool {
          get {
            return resultMap["check"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "check")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// mutation login($attempt: attempt!) {
  ///   login(data: {attempt: $attempt}) {
  ///     __typename
  ///     BearerTokenResponse {
  ///       __typename
  ///       access_token
  ///     }
  ///     user {
  ///       __typename
  ///       id
  ///       name
  ///       email
  ///       is_verified
  ///       type {
  ///         __typename
  ///         id
  ///       }
  ///     }
  ///     Status {
  ///       __typename
  ///       check
  ///       message
  ///     }
  ///   }
  /// }
  public let operationDefinition =
    "mutation login($attempt: attempt!) { login(data: {attempt: $attempt}) { __typename BearerTokenResponse { __typename access_token } user { __typename id name email is_verified type { __typename id } } Status { __typename check message } } }"

  public let operationName = "login"

  public var attempt: attempt

  public init(attempt: attempt) {
    self.attempt = attempt
  }

  public var variables: GraphQLMap? {
    return ["attempt": attempt]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["data": ["attempt": GraphQLVariable("attempt")]], type: .nonNull(.object(Login.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes = ["AuthResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("BearerTokenResponse", type: .object(BearerTokenResponse.selections)),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("Status", type: .object(Status.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(bearerTokenResponse: BearerTokenResponse? = nil, user: User? = nil, status: Status? = nil) {
        self.init(unsafeResultMap: ["__typename": "AuthResponse", "BearerTokenResponse": bearerTokenResponse.flatMap { (value: BearerTokenResponse) -> ResultMap in value.resultMap }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "Status": status.flatMap { (value: Status) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var bearerTokenResponse: BearerTokenResponse? {
        get {
          return (resultMap["BearerTokenResponse"] as? ResultMap).flatMap { BearerTokenResponse(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "BearerTokenResponse")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public var status: Status? {
        get {
          return (resultMap["Status"] as? ResultMap).flatMap { Status(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Status")
        }
      }

      public struct BearerTokenResponse: GraphQLSelectionSet {
        public static let possibleTypes = ["BearerTokenResponse"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("access_token", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(accessToken: String) {
          self.init(unsafeResultMap: ["__typename": "BearerTokenResponse", "access_token": accessToken])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var accessToken: String {
          get {
            return resultMap["access_token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "access_token")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("is_verified", type: .scalar(Bool.self)),
          GraphQLField("type", type: .nonNull(.object(`Type`.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, name: String, email: String, isVerified: Bool? = nil, type: `Type`) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "is_verified": isVerified, "type": type.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var isVerified: Bool? {
          get {
            return resultMap["is_verified"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "is_verified")
          }
        }

        public var type: `Type` {
          get {
            return `Type`(unsafeResultMap: resultMap["type"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "type")
          }
        }

        public struct `Type`: GraphQLSelectionSet {
          public static let possibleTypes = ["userType"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int) {
            self.init(unsafeResultMap: ["__typename": "userType", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }

      public struct Status: GraphQLSelectionSet {
        public static let possibleTypes = ["Status"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("check", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("message", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(check: Bool, message: String) {
          self.init(unsafeResultMap: ["__typename": "Status", "check": check, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var check: Bool {
          get {
            return resultMap["check"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "check")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class SendPinCodeForRegisterMutation: GraphQLMutation {
  /// mutation sendPinCodeForRegister($email: Email!) {
  ///   sendPinCodeForRegister(email: $email) {
  ///     __typename
  ///     Status {
  ///       __typename
  ///       check
  ///       message
  ///     }
  ///   }
  /// }
  public let operationDefinition =
    "mutation sendPinCodeForRegister($email: Email!) { sendPinCodeForRegister(email: $email) { __typename Status { __typename check message } } }"

  public let operationName = "sendPinCodeForRegister"

  public var email: String

  public init(email: String) {
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("sendPinCodeForRegister", arguments: ["email": GraphQLVariable("email")], type: .nonNull(.object(SendPinCodeForRegister.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sendPinCodeForRegister: SendPinCodeForRegister) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "sendPinCodeForRegister": sendPinCodeForRegister.resultMap])
    }

    public var sendPinCodeForRegister: SendPinCodeForRegister {
      get {
        return SendPinCodeForRegister(unsafeResultMap: resultMap["sendPinCodeForRegister"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "sendPinCodeForRegister")
      }
    }

    public struct SendPinCodeForRegister: GraphQLSelectionSet {
      public static let possibleTypes = ["payloadResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("Status", type: .object(Status.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: Status? = nil) {
        self.init(unsafeResultMap: ["__typename": "payloadResponse", "Status": status.flatMap { (value: Status) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: Status? {
        get {
          return (resultMap["Status"] as? ResultMap).flatMap { Status(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Status")
        }
      }

      public struct Status: GraphQLSelectionSet {
        public static let possibleTypes = ["Status"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("check", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("message", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(check: Bool, message: String) {
          self.init(unsafeResultMap: ["__typename": "Status", "check": check, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var check: Bool {
          get {
            return resultMap["check"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "check")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class VerifyPinCodeMutation: GraphQLMutation {
  /// mutation verifyPinCode($email: Email!, $pin_code: String!) {
  ///   verifyPinCode(data: {email: $email, pin_code: $pin_code}) {
  ///     __typename
  ///     Status {
  ///       __typename
  ///       check
  ///       message
  ///     }
  ///   }
  /// }
  public let operationDefinition =
    "mutation verifyPinCode($email: Email!, $pin_code: String!) { verifyPinCode(data: {email: $email, pin_code: $pin_code}) { __typename Status { __typename check message } } }"

  public let operationName = "verifyPinCode"

  public var email: String
  public var pin_code: String

  public init(email: String, pin_code: String) {
    self.email = email
    self.pin_code = pin_code
  }

  public var variables: GraphQLMap? {
    return ["email": email, "pin_code": pin_code]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("verifyPinCode", arguments: ["data": ["email": GraphQLVariable("email"), "pin_code": GraphQLVariable("pin_code")]], type: .nonNull(.object(VerifyPinCode.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(verifyPinCode: VerifyPinCode) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "verifyPinCode": verifyPinCode.resultMap])
    }

    public var verifyPinCode: VerifyPinCode {
      get {
        return VerifyPinCode(unsafeResultMap: resultMap["verifyPinCode"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "verifyPinCode")
      }
    }

    public struct VerifyPinCode: GraphQLSelectionSet {
      public static let possibleTypes = ["payloadResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("Status", type: .object(Status.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: Status? = nil) {
        self.init(unsafeResultMap: ["__typename": "payloadResponse", "Status": status.flatMap { (value: Status) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: Status? {
        get {
          return (resultMap["Status"] as? ResultMap).flatMap { Status(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Status")
        }
      }

      public struct Status: GraphQLSelectionSet {
        public static let possibleTypes = ["Status"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("check", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("message", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(check: Bool, message: String) {
          self.init(unsafeResultMap: ["__typename": "Status", "check": check, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var check: Bool {
          get {
            return resultMap["check"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "check")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class SendPinCodeForpasswordresetsMutation: GraphQLMutation {
  /// mutation sendPinCodeForpasswordresets($email: Email!) {
  ///   sendPinCodeForpasswordresets(email: $email) {
  ///     __typename
  ///     Status {
  ///       __typename
  ///       check
  ///       message
  ///     }
  ///   }
  /// }
  public let operationDefinition =
    "mutation sendPinCodeForpasswordresets($email: Email!) { sendPinCodeForpasswordresets(email: $email) { __typename Status { __typename check message } } }"

  public let operationName = "sendPinCodeForpasswordresets"

  public var email: String

  public init(email: String) {
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("sendPinCodeForpasswordresets", arguments: ["email": GraphQLVariable("email")], type: .nonNull(.object(SendPinCodeForpasswordreset.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sendPinCodeForpasswordresets: SendPinCodeForpasswordreset) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "sendPinCodeForpasswordresets": sendPinCodeForpasswordresets.resultMap])
    }

    public var sendPinCodeForpasswordresets: SendPinCodeForpasswordreset {
      get {
        return SendPinCodeForpasswordreset(unsafeResultMap: resultMap["sendPinCodeForpasswordresets"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "sendPinCodeForpasswordresets")
      }
    }

    public struct SendPinCodeForpasswordreset: GraphQLSelectionSet {
      public static let possibleTypes = ["payloadResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("Status", type: .object(Status.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: Status? = nil) {
        self.init(unsafeResultMap: ["__typename": "payloadResponse", "Status": status.flatMap { (value: Status) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: Status? {
        get {
          return (resultMap["Status"] as? ResultMap).flatMap { Status(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Status")
        }
      }

      public struct Status: GraphQLSelectionSet {
        public static let possibleTypes = ["Status"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("check", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("message", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(check: Bool, message: String) {
          self.init(unsafeResultMap: ["__typename": "Status", "check": check, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var check: Bool {
          get {
            return resultMap["check"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "check")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class PasswordresetsMutation: GraphQLMutation {
  /// mutation passwordresets($forgotPasswordInput: forgotPasswordinput!, $verifyPinCodeInput: verifyPinCodeInput!) {
  ///   passwordresets(data: {forgotPasswordInput: $forgotPasswordInput, verifyPinCodeInput: $verifyPinCodeInput}) {
  ///     __typename
  ///     BearerTokenResponse {
  ///       __typename
  ///       access_token
  ///     }
  ///     user {
  ///       __typename
  ///       id
  ///       name
  ///       email
  ///       is_verified
  ///       type {
  ///         __typename
  ///         id
  ///       }
  ///     }
  ///     Status {
  ///       __typename
  ///       check
  ///       message
  ///     }
  ///   }
  /// }
  public let operationDefinition =
    "mutation passwordresets($forgotPasswordInput: forgotPasswordinput!, $verifyPinCodeInput: verifyPinCodeInput!) { passwordresets(data: {forgotPasswordInput: $forgotPasswordInput, verifyPinCodeInput: $verifyPinCodeInput}) { __typename BearerTokenResponse { __typename access_token } user { __typename id name email is_verified type { __typename id } } Status { __typename check message } } }"

  public let operationName = "passwordresets"

  public var forgotPasswordInput: forgotPasswordinput
  public var verifyPinCodeInput: verifyPinCodeInput

  public init(forgotPasswordInput: forgotPasswordinput, verifyPinCodeInput: verifyPinCodeInput) {
    self.forgotPasswordInput = forgotPasswordInput
    self.verifyPinCodeInput = verifyPinCodeInput
  }

  public var variables: GraphQLMap? {
    return ["forgotPasswordInput": forgotPasswordInput, "verifyPinCodeInput": verifyPinCodeInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("passwordresets", arguments: ["data": ["forgotPasswordInput": GraphQLVariable("forgotPasswordInput"), "verifyPinCodeInput": GraphQLVariable("verifyPinCodeInput")]], type: .nonNull(.object(Passwordreset.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(passwordresets: Passwordreset) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "passwordresets": passwordresets.resultMap])
    }

    public var passwordresets: Passwordreset {
      get {
        return Passwordreset(unsafeResultMap: resultMap["passwordresets"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "passwordresets")
      }
    }

    public struct Passwordreset: GraphQLSelectionSet {
      public static let possibleTypes = ["AuthResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("BearerTokenResponse", type: .object(BearerTokenResponse.selections)),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("Status", type: .object(Status.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(bearerTokenResponse: BearerTokenResponse? = nil, user: User? = nil, status: Status? = nil) {
        self.init(unsafeResultMap: ["__typename": "AuthResponse", "BearerTokenResponse": bearerTokenResponse.flatMap { (value: BearerTokenResponse) -> ResultMap in value.resultMap }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "Status": status.flatMap { (value: Status) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var bearerTokenResponse: BearerTokenResponse? {
        get {
          return (resultMap["BearerTokenResponse"] as? ResultMap).flatMap { BearerTokenResponse(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "BearerTokenResponse")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public var status: Status? {
        get {
          return (resultMap["Status"] as? ResultMap).flatMap { Status(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Status")
        }
      }

      public struct BearerTokenResponse: GraphQLSelectionSet {
        public static let possibleTypes = ["BearerTokenResponse"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("access_token", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(accessToken: String) {
          self.init(unsafeResultMap: ["__typename": "BearerTokenResponse", "access_token": accessToken])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var accessToken: String {
          get {
            return resultMap["access_token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "access_token")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("is_verified", type: .scalar(Bool.self)),
          GraphQLField("type", type: .nonNull(.object(`Type`.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, name: String, email: String, isVerified: Bool? = nil, type: `Type`) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "is_verified": isVerified, "type": type.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var isVerified: Bool? {
          get {
            return resultMap["is_verified"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "is_verified")
          }
        }

        public var type: `Type` {
          get {
            return `Type`(unsafeResultMap: resultMap["type"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "type")
          }
        }

        public struct `Type`: GraphQLSelectionSet {
          public static let possibleTypes = ["userType"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int) {
            self.init(unsafeResultMap: ["__typename": "userType", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }

      public struct Status: GraphQLSelectionSet {
        public static let possibleTypes = ["Status"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("check", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("message", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(check: Bool, message: String) {
          self.init(unsafeResultMap: ["__typename": "Status", "check": check, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var check: Bool {
          get {
            return resultMap["check"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "check")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class RegisterMutation: GraphQLMutation {
  /// mutation register($newUserInput: newUserInput!, $verifyPinCodeInput: verifyPinCodeInput, $SocialiteInput: SocialiteInput!) {
  ///   register(data: {newUserInput: $newUserInput, verifyPinCodeInput: $verifyPinCodeInput, SocialiteInput: $SocialiteInput}) {
  ///     __typename
  ///     BearerTokenResponse {
  ///       __typename
  ///       access_token
  ///     }
  ///     user {
  ///       __typename
  ///       id
  ///       name
  ///       email
  ///       is_verified
  ///       type {
  ///         __typename
  ///         id
  ///       }
  ///     }
  ///     Status {
  ///       __typename
  ///       check
  ///       message
  ///     }
  ///   }
  /// }
  public let operationDefinition =
    "mutation register($newUserInput: newUserInput!, $verifyPinCodeInput: verifyPinCodeInput, $SocialiteInput: SocialiteInput!) { register(data: {newUserInput: $newUserInput, verifyPinCodeInput: $verifyPinCodeInput, SocialiteInput: $SocialiteInput}) { __typename BearerTokenResponse { __typename access_token } user { __typename id name email is_verified type { __typename id } } Status { __typename check message } } }"

  public let operationName = "register"

  public var newUserInput: newUserInput
  public var verifyPinCodeInput: verifyPinCodeInput?
  public var SocialiteInput: SocialiteInput

  public init(newUserInput: newUserInput, verifyPinCodeInput: verifyPinCodeInput? = nil, SocialiteInput: SocialiteInput) {
    self.newUserInput = newUserInput
    self.verifyPinCodeInput = verifyPinCodeInput
    self.SocialiteInput = SocialiteInput
  }

  public var variables: GraphQLMap? {
    return ["newUserInput": newUserInput, "verifyPinCodeInput": verifyPinCodeInput, "SocialiteInput": SocialiteInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("register", arguments: ["data": ["newUserInput": GraphQLVariable("newUserInput"), "verifyPinCodeInput": GraphQLVariable("verifyPinCodeInput"), "SocialiteInput": GraphQLVariable("SocialiteInput")]], type: .nonNull(.object(Register.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(register: Register) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "register": register.resultMap])
    }

    public var register: Register {
      get {
        return Register(unsafeResultMap: resultMap["register"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "register")
      }
    }

    public struct Register: GraphQLSelectionSet {
      public static let possibleTypes = ["AuthResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("BearerTokenResponse", type: .object(BearerTokenResponse.selections)),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("Status", type: .object(Status.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(bearerTokenResponse: BearerTokenResponse? = nil, user: User? = nil, status: Status? = nil) {
        self.init(unsafeResultMap: ["__typename": "AuthResponse", "BearerTokenResponse": bearerTokenResponse.flatMap { (value: BearerTokenResponse) -> ResultMap in value.resultMap }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "Status": status.flatMap { (value: Status) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var bearerTokenResponse: BearerTokenResponse? {
        get {
          return (resultMap["BearerTokenResponse"] as? ResultMap).flatMap { BearerTokenResponse(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "BearerTokenResponse")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public var status: Status? {
        get {
          return (resultMap["Status"] as? ResultMap).flatMap { Status(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Status")
        }
      }

      public struct BearerTokenResponse: GraphQLSelectionSet {
        public static let possibleTypes = ["BearerTokenResponse"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("access_token", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(accessToken: String) {
          self.init(unsafeResultMap: ["__typename": "BearerTokenResponse", "access_token": accessToken])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var accessToken: String {
          get {
            return resultMap["access_token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "access_token")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("is_verified", type: .scalar(Bool.self)),
          GraphQLField("type", type: .nonNull(.object(`Type`.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, name: String, email: String, isVerified: Bool? = nil, type: `Type`) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "is_verified": isVerified, "type": type.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var isVerified: Bool? {
          get {
            return resultMap["is_verified"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "is_verified")
          }
        }

        public var type: `Type` {
          get {
            return `Type`(unsafeResultMap: resultMap["type"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "type")
          }
        }

        public struct `Type`: GraphQLSelectionSet {
          public static let possibleTypes = ["userType"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int) {
            self.init(unsafeResultMap: ["__typename": "userType", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }

      public struct Status: GraphQLSelectionSet {
        public static let possibleTypes = ["Status"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("check", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("message", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(check: Bool, message: String) {
          self.init(unsafeResultMap: ["__typename": "Status", "check": check, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var check: Bool {
          get {
            return resultMap["check"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "check")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public struct CountryInfo: GraphQLFragment {
  /// fragment countryInfo on Countries {
  ///   __typename
  ///   id
  ///   name
  ///   created_at
  ///   updated_at
  ///   cities {
  ///     __typename
  ///     id
  ///     name
  ///   }
  /// }
  public static let fragmentDefinition =
    "fragment countryInfo on Countries { __typename id name created_at updated_at cities { __typename id name } }"

  public static let possibleTypes = ["Countries"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(Int.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("created_at", type: .nonNull(.scalar(String.self))),
    GraphQLField("updated_at", type: .nonNull(.scalar(String.self))),
    GraphQLField("cities", type: .nonNull(.list(.nonNull(.object(City.selections))))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, name: String, createdAt: String, updatedAt: String, cities: [City]) {
    self.init(unsafeResultMap: ["__typename": "Countries", "id": id, "name": name, "created_at": createdAt, "updated_at": updatedAt, "cities": cities.map { (value: City) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
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

  public var createdAt: String {
    get {
      return resultMap["created_at"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "created_at")
    }
  }

  public var updatedAt: String {
    get {
      return resultMap["updated_at"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "updated_at")
    }
  }

  public var cities: [City] {
    get {
      return (resultMap["cities"] as! [ResultMap]).map { (value: ResultMap) -> City in City(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: City) -> ResultMap in value.resultMap }, forKey: "cities")
    }
  }

  public struct City: GraphQLSelectionSet {
    public static let possibleTypes = ["Cities"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int, name: String) {
      self.init(unsafeResultMap: ["__typename": "Cities", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: Int {
      get {
        return resultMap["id"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
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
