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

This tap is currently maintained by hand. To publish a new AutoVault
release:

1. Find the new version on
   [npmjs.com](https://www.npmjs.com/package/@autoworks-ai/autovault).
2. Compute the SHA256 of the published tarball:

   ```
   curl -sL https://registry.npmjs.org/@autoworks-ai/autovault/-/autovault-<NEW>.tgz \
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
