module Idris2Rust.Main

import Core.Context
import Compiler.Common
import Idris.Driver

import System
import System.Directory
import System.File
import System.Info

import Libraries.Data.NameMap
import Libraries.Data.Version

import Idris2Rust.CompileCfg

-- %default covering

compile : Profile
       -> Ref Ctxt Defs
       -> (tmpDir : String)
       -> (outputDir : String)
       -> ClosedTerm
       -> (outfile : String)
       -> Core (Maybe String)
compile profile defs tmpDir outputDir term file
  = do coreLift $ putStrLn "I'd rather not."
       pure $ Nothing

execute : Profile -> Ref Ctxt Defs -> (tmpDir : String) -> ClosedTerm -> Core ()
execute profile defs tmpDir term = do coreLift $ putStrLn "Maybe in an hour."

export
rustCodegen : Profile -> Codegen
rustCodegen profile = MkCG (compile profile) (execute profile) Nothing Nothing

main : IO ()
main = mainWithCodegens [
  ("rust-debug", rustCodegen Debug),
  ("rust-release", rustCodegen Release)
]
