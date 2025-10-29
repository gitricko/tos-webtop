# tos-desktop
Thinkorswim Desktop in a web browser (Webtop)

Lightweight Codespace / devcontainer template that runs an Ubuntu desktop in the browser and installs the Thinkorswim (TOS) trading desktop so you can access it from anywhere. Intended for personal/self-hosted use in a GitHub Codespace or similar containerized environment.

This README is focused on practical steps: quick start, backup & restore, common commands, troubleshooting, and security guidance for running the environment in Codespaces.

## Quick start

1. Open this repository in a GitHub Codespace (or start the devcontainer).
2. In the Codespace terminal run:

```bash
make start
```

3. Wait for the Codespace to boot. When the web desktop URL appears in the Codespace UI, click it to open the browser desktop.
4. On first run the Thinkorswim installer runs automatically in the background. Give it a few minutes — an application icon will appear on the desktop when installation completes.

### What `make start` does
- Brings up the container/dev environment defined in this repo.
- Starts the services needed to host an Ubuntu desktop accessible over the Codespaces web UI.
- Kicks off the Thinkorswim installer if not already installed.

## Backup

Create a backup of the installed system and configuration (recommended regularly):

```bash
make backup
```

This zips the installer, installed files, and configuration into a file placed in the `backup/` directory. Download that zip to safe storage (local disk, cloud drive, etc.).

Why backup? GitHub Codespaces may delete inactive workspaces after ~30 days, so keep an external copy if you want to quickly restore your environment later.

## Restore

To restore from a previously-created backup in a fresh Codespace:

1. Upload your backup zip into the repository's `backup/` directory or make it available inside the Codespace.
2. Run:

```bash
make restore
```

This will unpack the backup and restore the Thinkorswim install and user settings to the environment.

## Common commands

- `make start` — start the container and desktop environment
- `make stop` — stop the running container/desktop (if present)
- `make backup` — create a zip backup of the installer and config
- `make restore` — restore from a zip placed in `backup/`

See the `Makefile` for implementation details and any additional targets.

## Troubleshooting

- Installer not finishing: check the Codespace terminal for the installer log. Restart the Codespace and re-run `make start`.
- No desktop URL: ensure the Codespace has finished starting. Confirm ports and forwarding are available in the Codespace UI.
- Thinkorswim won't launch or shows graphical glitches: try restarting the session, and if persistent, recreate the Codespace and restore from backup.

If you hit a blocker, include the Codespace logs and a short description of what you tried when opening an issue.

## Security & licensing notes

- Thinkorswim is a proprietary application. This repository only automates running the Thinkorswim installer in a containerized desktop environment; you are responsible for complying with Thinkorswim's license and terms.
- This project is provided as-is for personal/self-hosted use. Do not upload account credentials or sensitive information into the repo.

### Codespaces & security (important)

Adapted guidance for safely running this environment in GitHub Codespaces and similar hosted containers:

- Do not commit secrets: never store API keys, passwords, certificate files, or other secrets in the repository. Treat the repo as public if you are unsure.
- Use private storage for backups: download and store `backup/*.zip` files outside GitHub (local disk or an encrypted cloud store). Consider encrypting backups before uploading to external storage.
- Avoid sharing the Codespace URL: the web desktop URL can provide access to the running environment. Only share with trusted parties and close the Codespace or revoke access when finished.
- Limit port exposure: do not open unnecessary ports. Only use the Codespaces port-forwarding features that you need.
- Use non-root users where possible: the container may run processes as root by default; avoid running interactive sessions or third-party installers as root unless required.
- Rotate credentials and tokens: if you ever accidentally expose a credential, rotate it immediately.
- Use GitHub Secrets / Secret Manager: keep any automation credentials in the GitHub Secrets store or another secrets manager rather than in repo files.
- Principle of least privilege: where possible, run with minimal permissions and avoid mounting credentials into the container unnecessarily.
- Keep images and packages updated: apply updates to base images and installed packages to reduce exposure to known vulnerabilities.
- Audit and remove sensitive files: before pushing changes, confirm you haven't included credentials, browser profiles, or other sensitive artifacts in commits.

If you need guidance implementing stronger protections (e.g., encrypted backups, automatic secret rotation, or an offline installer workflow), I can add a `make secure-backup` target and small helper scripts.

## Contributing

Small improvements, documentation fixes, or makefile tweaks are welcome. Open a PR with a focused change and a brief description.

## Backup retention and Codespaces lifecycle

GitHub may delete inactive Codespaces after a period of inactivity (typically 30 days). Periodically run `make backup` and store the resulting zip outside GitHub to avoid losing your environment.

## License

This repository's files are covered by the project license in `LICENSE`.

---

If you'd like, I can also:

- Add a small troubleshooting log collector script and a `make collect-logs` target.
- Add a `make secure-backup` target that creates an encrypted backup (uses `gpg`).
- Add a short screenshot showing the desktop and where the TOS icon appears.

Tell me which of those you'd like and I'll add it next.
# tos-desktop
Thinkorswim Desktop in a web browser (Webtop)

Lightweight Codespace template that runs an Ubuntu desktop in the browser and installs the Thinkorswim (TOS) trading desktop so you can access it from anywhere. Intended for personal/self-hosted use in a GitHub Codespace or similar containerized environment.
This README follows a compact, practical style — quick start, backup & restore, common issues, and notes about Codespaces lifecycle.
## Quick start

1. Open this repository in a GitHub Codespace (or start the devcontainer).
2. In the Codespace terminal run:

```bash
make start

3. Wait for the Codespace to boot. When the Webtop URL appears in the Codespace UI, click it to open the browser desktop.
4. On first run the Thinkorswim installer runs automatically in the background. Give it a few minutes — an application icon will appear on the desktop when installation completes.
### What `make start` does
- Brings up the container/dev environment defined in this repo.
- Starts the services needed to host an Ubuntu desktop accessible over the Codespaces web UI.
- Kicks off the Thinkorswim installer if not already installed.
## Backup

Create a backup of the installed system and configuration (recommended regularly):

```bash
make backup

This zips the installer, installed files, and configuration into a file placed in the `backup/` directory. Download that zip to safe storage (local disk, cloud drive, etc.).
Why backup? GitHub Codespaces may delete inactive workspaces after ~30 days, so keep an external copy if you want to quickly restore your environment later.
## Restore

To restore from a previously-created backup in a fresh Codespace:

1. Upload your backup zip into the repository's `backup/` directory or make it available inside the Codespace.
2. Run:

```bash
make restore

This will unpack the backup and restore the Thinkorswim install and user settings to the environment.
## Common commands

- `make start` — start the container and desktop environment
- `make stop` — stop the running container/desktop (if present)
- `make backup` — create a zip backup of the installer and config
- `make restore` — restore from a zip placed in `backup/`
## Troubleshooting

- Installer not finishing: check the Codespace terminal for the installer log. Restart the Codespace and re-run `make start`.
- No desktop URL: ensure the Codespace has finished starting. Confirm ports and forwarding are available in the Codespace UI.
- Thinkorswim won't launch or shows graphical glitches: try restarting the session, and if persistent, recreate the Codespace and restore from backup.
If you hit a blocker, include the Codespace logs and a short description of what you tried when opening an issue.
## Security & licensing notes

- Thinkorswim is a proprietary application. This repository only automates running the Thinkorswim installer in a containerized desktop environment; you are responsible for complying with Thinkorswim's license and terms.
- This project is provided as-is for personal/self-hosted use. Do not upload account credentials or sensitive information into the repo.
## Contributing

Small improvements, documentation fixes, or makefile tweaks are welcome. Open a PR with a focused change and a brief description.
## Backup retention and Codespaces lifecycle

GitHub may delete inactive Codespaces after a period of inactivity (typically 30 days). Periodically run `make backup` and store the resulting zip outside GitHub to avoid losing your environment.
## License

This repository's files are covered by the project license in `LICENSE`.
---

If you'd like, I can also:

- Add a small troubleshooting log collector script and a `make collect-logs` target.
- Add a short GIF/screenshot showing the desktop and where the TOS icon appears.
Tell me if you'd like those additions and I'll add them next.
# tos-desktop
ThinkSwim Desktop on Web Browser


## How to start
- start codespace in github
- in console: enter `make start`
- once a URL appears, click it.
- It will start an ubuntu OS on a browser
- If this is the first time u use it, ThinkOrSwim desktop will be installing at the background, in a few minutes, you will see an icon


## How to backup
- `make backup` this will zip up the whole installer including your system configuration into a zip file
- save it somewhere save.

## How to restore
- if you have a new codespace, upload the backup zip into backup directory
- `make restore`

# Note
- Your codespace if it is not use for 30 days (inactivity) will be deleted by github automatically with an email warning.
- This is the reasons you should periodically backup and download the zip file somewhere safe so that all are setting can be restore with a new codespace instance
