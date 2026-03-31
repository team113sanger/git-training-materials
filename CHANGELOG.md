# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- GitHub Actions workflow to create a release with `synthetic_project_files.sh` as a downloadable asset on tag push
- Script now checks for `git` availability and prints the version or a warning
- Coloured terminal output using `tput` with graceful fallback when colours are unsupported
- Visually distinct banners at end of script showing the `cd` command to run next
- SSH setup now includes `chmod go-w "$HOME"` to satisfy SSH `StrictModes`
- `README`: Homebrew/git install instructions for Sanger Macs in a foldout
- `README`: `git config` additions for `init.defaultBranch main` and `push.default current` with explanation foldout
- `README`: two repo initialisation scenarios (empty vs initialised) using `<details>` elements
- `README`: screenshots for Self Service Homebrew install and uninitialised repo creation
- `README`: note that the workshop simulates adding existing work to git

### Changed
- Script downloaded via `curl | bash` from GitHub releases instead of `iv3-sharing.cog.sanger.ac.uk`
- `DEFAULT_DIR` changed from `SYNTHETIC_PROJECT` to `<username>-git-training` (slugified from `whoami`)
- `.gitignore` updated from `SYNTHETIC_PROJECT/` to `*-git-training/`
- SSH setup code block reformatted as single-line statements for Terminal.app copy-paste compatibility
- README restructured with numbered workshop steps (SSH setup, synthetic dir, git config, repo creation, git loop)

## [0.1.0] - 2025-11-25

### Added
- `synthetic_project_files.sh` generating hello-world scripts (Python, R, Bash), analysis scripts (CaVEMan, Pindel), flag images, summary report, and 110MB BAM files
- README with trainer checklist, SSH key setup block, git config instructions, git loop walkthrough, and talking points
- `.gitignore` for generated project directory

### Fixed
- Heredoc constants refactored to functions for macOS bash compatibility
