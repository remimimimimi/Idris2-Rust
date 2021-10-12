module Idris2Rust.Main

import Core.Context
import Compiler.Common
import Idris.Driver

compile : Ref Ctxt Defs -> (tmpDir : String) -> (outputDir : String) ->
        ClosedTerm -> (outfile : String) -> Core (Maybe String)
compile defs tmpDir outputDir term file = do coreLift $ putStrLn "I'd rather not."
                                             pure $ Nothing

execute : Ref Ctxt Defs -> (tmpDir : String) -> ClosedTerm -> Core ()
execute defs tmpDir term = do coreLift $ putStrLn "Maybe in an hour."

lazyCodegen : Codegen
lazyCodegen = MkCG compile execute Nothing Nothing

main : IO ()
main = mainWithCodegens [("lazy", lazyCodegen)]
