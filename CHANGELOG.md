# Changelog

All notable changes to this project will be documented here.

## 2025-09-06

### Changed
- Switched GitHub Pages to **Deploy from a branch → `main` `/docs`** (no Actions).
- Configured Astro build output to **`/docs`** and published a fresh build.

### Fixed
- Home page updated to remove old post
- General cleanup around old contributor display: verified commit authors are unified under **Mark McDermott**; prepared support note in case GitHub’s contributor cache needs a manual refresh.

## 2025-08-20

### Changed
- **Removed GitHub Actions build/deploy** in favor of local builds (simpler, no waiting on remote CI).
- Beginning refactor to shift “CMS” workflow from **VS Code/GitHub** to **Obsidian**, which is open all the time anyway.
