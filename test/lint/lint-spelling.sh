#!/usr/bin/env bash
#
# Copyright (c) 2018-2019 The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.
#
# Warn in case of spelling errors.
# Note: Will exit successfully regardless of spelling errors.

export LC_ALL=C

if ! command -v codespell > /dev/null; then
    echo "Skipping spell check linting since codespell is not installed."
    exit 0
fi

IGNORE_WORDS_FILE="test/lint/spelling.ignore-words.txt"
if ! codespell --check-filenames --disable-colors --quiet-level=7 --ignore-words=${IGNORE_WORDS_FILE} $(git ls-files -- ":(exclude)build-aux/m4/" ":(exclude)contrib/seeds/*.txt" ":(exclude)depends/" ":(exclude)doc/release-notes/" ":(exclude)src/bip39_english.h" ":(exclude)src/dashbls/" ":(exclude)src/crc32c/" ":(exclude)src/crypto/" ":(exclude)src/ctpl_stl.h" ":(exclude)src/cxxtimer.hpp" ":(exclude)src/util/expected.h" ":(exclude)src/immer/" ":(exclude)src/leveldb/" ":(exclude)src/qt/locale/" ":(exclude)src/qt/*.qrc" ":(exclude)src/secp256k1/" ":(exclude)src/minisketch/" ":(exclude)src/univalue/" ":(exclude)contrib/builder-keys/" ":(exclude)contrib/guix/patches"); then
    echo "^ Warning: codespell identified likely spelling errors. Any false positives? Add them to the list of ignored words in ${IGNORE_WORDS_FILE}"
fi
