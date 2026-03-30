// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "mecab",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "mecab",
            targets: ["mecab"]
        ),
    ],
    targets: [
        .target(
            name: "mecab",
            dependencies: [],
            exclude: [
                "dictionary_compiler.cpp",
                "dictionary_generator.cpp",
                "eval.cpp",
                "learner.cpp",
                "learner_tagger.cpp",
                "mecab.cpp",
                "mecab-cost-train.cpp",
                "mecab-dict-gen.cpp",
                "mecab-dict-index.cpp",
                "mecab-system-eval.cpp",
                "mecab-test-gen.cpp",
                "make.bat",
                "Makefile.am",
                "Makefile.in",
                "Makefile.msvc.in"
            ],
            cxxSettings: [
                .define("HAVE_CONFIG_H"),
                .define("MECAB_USE_UTF8_ONLY"),
                .define("DIC_VERSION", to: "102"),
                .define("MECAB_DEFAULT_RC", to: "\"\""),
                .unsafeFlags(["-Wno-register", "-Wno-deprecated-declarations"])
            ],
            linkerSettings: [.linkedLibrary("iconv")]
        ),
    ],
    cxxLanguageStandard: .cxx14
)
