//: [Previous](@previous)
//: # Introduction
/*:
 Swift generics were designed with four primary goals in mind:
 1. Generic definitions should be independently type checked, without knowledge of all possible concrete type substitutions that they are invoked with.
 2. Shared libraries that export generic definitions should be able to evolve resiliently without requiring recompilation of clients.
 3. Layouts of generic types should be determined by their concrete substitutions, with fields of generic parameter type stored inline.
 4. Abstraction over concrete types with generic parameters should only impose a cost across module boundaries, or in other situations where type information is not available at compile time.
 
 The Swift compiler achieves these goals as follows:
 1. The interface between a generic definition and its uses is mediated by generic requirements. The generic requirements describe the behavior of the generic parameter types inside the function body, and the generic arguments at the call site are checked against the declaration’s generic requirements at compile time.
 2. Generic functions receive runtime type metadata for each generic argument from the caller. Type metadata defines operations to abstractly manipulate values of their type without knowledge of their concrete layout.
 3. Runtime type metadata is constructed for each type in the language. The runtime type layout of a generic type is computed recursively from the type metadata of the generic arguments. Generic types always store their contents without boxing or indirection.
 4. The optimizer can generate a specialization of a generic function in the case where the definition is visible at the call site. This eliminates the overhead of runtime type metadata and abstract value manipulation.
 */
//: [Next](@next)
