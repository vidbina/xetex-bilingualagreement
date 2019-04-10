# Changelog

The format is based on [Keep a Changelog][keepachangelog-v1.0.0], and this
project adheres to [Semantic Versioning][semver-v2.0.0].

## [0.2.1] - 2019-04-10
### Changed

 - Refactor `\label` to simplify implementation
 - Remove debug output from previous commit #23f5a92
 - Fix missing TOC bug on left,single layout

## [0.2.0] - 2019-03-27
### Added
- `\adduntitledclause` command

### Changed
- refactored signature block
- enabled `enumerate` inside `\addtext`
- wrap `addtext` in `sloppypar` to fix line overruns
- parameterized title delimiters
- rename some vars for generalization (supplier->self, customer->other)

## [0.1.0] - 2018-12-06
### Added
- Initial release of bilinguallegal package
- README to inform users on how to use this package
- GDPR example and screenshots to demonstrate the package's use

[0.1.0]: https://github.com/asabina-de/bilinguallegal/releases/tag/v0.1.0
[0.2.0]: https://github.com/asabina-de/bilinguallegal/releases/tag/v0.2.0
[0.2.1]: https://github.com/asabina-de/bilinguallegal/releases/tag/v0.2.1

[keepachangelog-v1.0.0]: https://keepachangelog.com/en/1.0.0/
[semver-v2.0.0]: https://semver.org/spec/v2.0.0.html
