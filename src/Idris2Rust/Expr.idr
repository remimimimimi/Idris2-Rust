||| Compiling of expressions
|||
||| Experssions track their type along with the generated Rust code.
||| Because Rust is a statically typeed language and some primitive types in
||| Idris map nicely to Rust it makes sense to keep this information around to
||| only inseert the casts that are necessary.
module Idris2Rust.Expr

import Compiler.Common
import Compiler.CompileExpr

import Core.Context

import Data.List
import Data.Maybe
import Data.Vect

rustKeywords : List String
rustKeywords = [
    "as", "break", "const", "continue",
    "crate", "else", "enum", "extern",
    "false", "fn", "for", "if",
    "impl", "in", "let", "loop",
    "match", "mod", "move", "mut",
    "pub", "ref", "return", "self",
    "Self", "static", "struct", "super",
    "trait", "true", "type", "unsafe",
    "use", "where", "while", "async",
    "await", "dyn", "abstract", "become",
    "box", "do", "final", "macro",
    "override", "priv", "typeof", "unsized",
    "virtual", "yield", "try", "union"
]
