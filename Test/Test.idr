module Test.Test

import IdrTest.Test
import IdrTest.Expectation

import Main

export
suite : Test
suite =
  describe "Idris2Rust tests"
    [ test "1 == 1" (\_ => assertEq 1 1 )
    ]
