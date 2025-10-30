# ToS-WebTop
ThinkorSwim Desktop in a web browser (WebTop)

Use lightweight GitHub's CodeSpace to host an Ubuntu desktop in the browser with Thinkorswim (TOS) trading desktop pre-installed so you can access it from anywhere and trade in any device securely. 

This README is focused on practical steps: quick start, backup & restore, common commands, troubleshooting, and security guidance for running the environment in Codespaces.

## Quick start

1. Open this repository in a GitHub Codespace (or start the devcontainer).
2. In the Codespace terminal run:

```bash
make start
```

3. Wait for the Codespace to boot. When the web desktop URL appears in the Codespace `Ports` Tab, click it to open the browser desktop.
4. On first run the Thinkorswim installer runs automatically in the background. Give it a few minutes — an application icon will appear on the desktop when installation completes.

### What `make start` does
- Brings up the Ubuntu Desktop that can be accessed securely over any device's web browser.
- Kicks off the Thinkorswim installer if not already installed.

## Backup

Create a backup of ToS Desktop system and configuration (recommended regularly):

```bash
make backup
```

This zips the installed files, and configuration into a file placed in the `backup/` directory. Download that zip to safe storage (local disk, cloud drive, etc.).

Why backup? GitHub Codespaces may delete inactive workspaces after ~30 days, so keep an external copy if you want to quickly restore your environment later.

## Restore

To restore from a previously-created backup in a fresh Codespace:

1. Upload your backup zip into the repository's `backup/` directory using the new CodeSpace IDE.
2. Run:

```bash
make restore
```

This will unpack the backup and restore the Thinkorswim install and user settings to the environment.

## Common commands

- `make start` — start the container and desktop environment
- `make stop` — stop the running container/desktop (if present)
- `make reset` - stop Ubuntu Desktop and reset back to default. (Almost equivalent to a fresh codespace, except if there is a backup file, that WILL NOT be deleted)
- `make backup` — create a zip backup of the installer and config
- `make restore` — restore from a zip placed in `backup/`

See the `Makefile` for implementation details and any additional targets.

## Security & licensing notes

- Thinkorswim is a proprietary application. This repository only automates running the Thinkorswim installer in a containerized desktop environment; you are responsible for complying with Thinkorswim's license and terms.
- This project is provided as-is for personal/self-hosted use.

## Security Considerations for Running ToS Desktop in Codespaces

Running ToS Desktop in GitHub Codespaces is secure, as access to the Codespace URI is restricted to the GitHub user starts the codespace as well as any services that it starts (Ubuntu Desktop webUI). However, to ensure your data remains secure, follow these best practices:

- **Recommend not to check ToS's `Remember Login ID`**: So that you need a Multi-Factor Authentication in order for you login on top of username/password. This added an additional later of security
- **Keep Your Repository Private**: If you decide to fork this project and commit private data. Ensure your GitHub repository is set to private to prevent unauthorized access to your backup file (`./backup/tos-webtop-config.tar.gz`) if you commit it to the repository, which is not recommended because it is more than 500MB.
- **Limit Codespace Access**: Do not share Codespace access. By default, it is private to you and only you.
- **Monitor Codespace Usage**: Regularly check your GitHub Codespaces for active instances, as inactive instances are deleted after 30 days, potentially requiring data restoration. There is an option in CodeSpace to prevent this from happening.

By following these steps, you can minimize any security risks and safely use Tos Desktop in Codespaces.

## Contributing

Small improvements, documentation fixes, or makefile tweaks are welcome. Open a PR with a focused change and a brief description.

## Backup retention and Codespaces lifecycle

GitHub may delete inactive Codespaces after a period of inactivity (typically 30 days). Periodically run `make backup` and store the resulting zip outside GitHub to avoid losing your environment.

## License

This repository's files are covered by the project license in `LICENSE`.

