# autoworks-ai/homebrew-tap

Homebrew tap for [AutoVault](https://autovault.dev) — the local-first vault
for agent skills with MCP, validation, and signing.

## Install

```
brew install autoworks-ai/tap/autovault
```

This pulls the published `@autoworks-ai/autovault` npm tarball and links
the `autovault` CLI into your Homebrew prefix.

The first time you run AutoVault, the installer wizard would normally
launch automatically. With the Homebrew install path, run it yourself:

```
autovault setup
```

`setup` scans `~/.claude/skills`, `~/.codex/skills`, and `~/.cursor/skills`
and offers to import any existing skills into the vault.

## Updating the formula

This tap is currently maintained by hand. The formula builds from the
AutoVault GitHub source tarball — once the `npm-publish` step in
[`autoworks-ai/autovault`'s release pipeline](https://github.com/autoworks-ai/autovault/blob/main/.github/workflows/release-please.yml)
is fixed and `@autoworks-ai/autovault` ships to npmjs.com on every
release, this tap can switch to wrapping the npm tarball (smaller, no
build step). Until then:

1. Find the new release tag at
   [autoworks-ai/autovault/releases](https://github.com/autoworks-ai/autovault/releases).
2. Compute the SHA256 of the source tarball:

   ```
   curl -sL https://github.com/autoworks-ai/autovault/archive/refs/tags/v<NEW>.tar.gz \
     | shasum -a 256
   ```

3. Update `url` and `sha256` in `Formula/autovault.rb`.
4. Verify locally:

   ```
   brew untap autoworks-ai/tap
   brew tap autoworks-ai/tap
   brew audit --strict --online --new autoworks-ai/tap/autovault
   brew install autoworks-ai/tap/autovault
   brew test autoworks-ai/tap/autovault
   ```

5. Commit and push to `main`.

Automation tracked at:
[autoworks-ai/autovault#52](https://github.com/autoworks-ai/autovault/issues/52)
— once that lands, formula bumps will open here automatically on every
AutoVault release via `dawidd6/action-homebrew-bump-formula`.

## License

MIT.
