{ mkDerivation, aeson, alex, array, async, base, bifunctors, binary
, blaze-html, boxes, bytestring, Cabal, case-insensitive
, containers, data-hash, deepseq, directory, edit-distance, emacs
, equivalence, exceptions, filemanip, filepath, ghc-compact, gitrev
, happy, hashable, hashtables, haskeline, ieee754, monad-control
, mtl, murmur-hash, pretty, process, process-extras, QuickCheck
, regex-tdfa, split, stdenv, stm, strict, tasty, tasty-hunit
, tasty-quickcheck, tasty-silver, template-haskell, temporary, text
, time, transformers, unix-compat, unordered-containers, uri-encode
, zlib, agda
}:
mkDerivation {
  pname = "Agda";
  version = "2.6.2";
  src = agda;
  doCheck = false;
  isLibrary = true;
  isExecutable = true;
  enableSeparateDataOutput = true;
  setupHaskellDepends = [ base Cabal directory filepath process ];
  libraryHaskellDepends = [
    aeson array async base bifunctors binary blaze-html boxes
    bytestring case-insensitive containers data-hash deepseq directory
    edit-distance equivalence exceptions filepath ghc-compact gitrev
    hashable hashtables haskeline monad-control mtl murmur-hash pretty
    process regex-tdfa split stm strict template-haskell text time
    transformers unordered-containers uri-encode zlib
  ];
  libraryToolDepends = [ alex happy ];
  executableHaskellDepends = [ base directory filepath process ];
  executableToolDepends = [ emacs ];
  testHaskellDepends = [
    array base bytestring containers directory filemanip filepath
    ieee754 monad-control mtl process process-extras QuickCheck
    regex-tdfa tasty tasty-hunit tasty-quickcheck tasty-silver
    temporary text unix-compat uri-encode
  ];
  homepage = "http://wiki.portal.chalmers.se/agda/";
  description = "A dependently typed functional programming language and proof assistant";
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
