module Idris2Rust.CompileCfg

import Control.Monad.Maybe
import Control.Monad.Trans
import Control.Monad.Error.Either

import Data.String
import Data.Either
import Data.Maybe
import Data.List

import Libraries.Data.Version
import Libraries.Utils.Path

import System
import System.File

||| Find path to rust compiler
public export
findRust : IO (Maybe String)
findRust = do
  provided <- getEnv "RUSTC"
  finded <- pathLookup ["rustc"]
  pure $ provided <|> finded

-- TODO: Refactor in more beauty way (with monad Transformers AFAIK)
||| Returns the rust compiler version for given executable
public export
rustVersion : IO (Maybe Version)
rustVersion = do
  Just cmd <- findRust
    | Nothing => pure Nothing
  Just process_descriptor <- map getRight $ popen (cmd ++ " --version") Read
    | Nothing => pure Nothing
  Just output <- map getRight $ fGetLine process_descriptor
    | Nothing => pure Nothing
  pure . choiceMap parseVersion $ words output

||| Compilation profile
public export
data Profile = Debug | Release

-- TODO: Add CompileCommand record
export
showCompileCommand : Profile -> (path : String)-> String
showCompileCommand Debug path = ?getCompileCommand_rhs1
showCompileCommand Release path = ?getCompileCommand_rhs2
