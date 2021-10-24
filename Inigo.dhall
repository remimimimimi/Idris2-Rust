{ ns = "Idris2.Rust"
, package = "Idris2Rust"
, version = "0.0.1"
, sourcedir = "src/"
, description = Some "Idris2 Rust backend"
, executable = Some "idris2rust"
, modules = ["Idris2Rust.Main"] : List Text
, readme = Some "README.md"
, license = Some "MIT"
, link = Some "https://github.com/remimimimi/Idris2-Rust"
, main = Some "Idris2Rust.Main"
, depends = ["idris2", "base", "network"] : List Text
, deps = [] : List Text
, devDeps = [] : List Text
, localDeps = [] : List Text
, gitDeps = [] : List { url : Text, commit : Text, subDirs : List Text }
}
