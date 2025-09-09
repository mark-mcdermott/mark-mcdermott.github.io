This is the github repo for my blog site: [https://markmcdermott.io](https://markmcdermott.io)

## Engineering Rationale

### GitHub Pages · Astro · Tailwind
This site uses a GAT stack, if you will: [Github Pages](https://pages.github.com/), [Astro](https://astro.build) and [Tailwind](https://tailwindcss.com/). The little avatar image links to [my Github User Site](https://github.com/mark-mcdermott/mark-mcdermott) which is, more or less, an "About Me" page. I write/edit posts right in this github repo in markdown.

### Why Astro?
Fast load time: My old Nuxt blog was having some slow load time issues on mobile. Astro’s static site generation makes this blog load very quickly. Google Lighthouse, last I checked, said this site loads in 0.2 seconds on desktop and 1.1 seconds on mobile and a 100% score for performance. I do plan to get that even lower eventually with Cloudflare edge network and going over first-to-load CSS/JS with a fine-toothed comb, but for now this is great.

### Why GAT?
Simplicity: A GitHub Pages, Astro and Tailwind setup keeps things nice and simple. No frontend or backend framework (in the traditional sense), no database, no Docker, no CI/CD. Let's me keep a blog current and gives me enough time to work on my side projects.

### Why Github Pages?
It's free and easy. I usually use Fly.io for hosting type stuff, but Github Pages for a static site is much simpler and cheaper.

### Why no portfolio site?
Low maintenace (both in time and mental load): I sort of combined the about/projects/contact page into one page and moved it to GitHub’s user site where everything is just a single readme file. The blog page is now the only page I really have to maintain or think about at all.

### Why no real CMS?
Speed: Using GitHub as the CMS is awesome. I’m in GitHub all the time anyway, so I don’t really need to log into a separate CMS.

### Why markdown?
Speed: Astro supports markdown files, so I can write my posts in markdown and frontmatter like I was used to with Nuxt Content.

### Why Tailwind?
Speed: CSS changes are so fast with Tailwind utility classes. I barely have to think about the CSS (unlike Bootstrap, etc). I will always think Tailwind makes HTML look ugly, but in terms of speed it's way better than old school CSS.

## Deploy Instructions
Ie., Notes To Self

### Publishing (The Short Way)
```
yarn publish
```
### Publishing (The Long Way)
```
yarn install           # only if deps changed
yarn build             # builds into ./docs
git add -A             # or: git add docs
git commit -m "Publish: $(date +%F)"
git push origin main
open "https://markmcdermott.io/?bust=$(date +%s)"   # cache-bust to verify
```

### Troubleshooting
If things aren't working right, start here:
- verify Pages source in Github: repo Settings → Pages shows **main /docs**.
- double check the contents of the file GitHub actually serves:
```
https://raw.githubusercontent.com/mark-mcdermott/mark-mcdermott.github.io/main/docs/index.html
```
- Make sure `docs/` isn’t ignored:
```
git check-ignore -v docs || echo "✅ docs is not ignored"
```

### Github Configuration
- This uses branch-based deploys (not Github Actions). That setting is in Github: repo Settings → Pages → Deploy → **main /docs**.
- In `astro.config.mjs`, the `outDir` is set to `/docs`:
```
import { defineConfig } from 'astro/config';
export default defineConfig({ outDir: './docs' });
```
- For Github Pages, these are in `/public`:
  - `CNAME` (custom domain)
```
markmcdermott.io
```
  - `.nojekyll` (blank file that tells Github Pages to skip Jekyll for branch-based deploys)

### Site Configuration
- There some base styles in `src/styles/globals.css`
- Markdown styles are in `src/styles/globals.css`
- Some helper functions (`getPostWords`, `readTimeStr`) in `src/utils`

### Posts
- posts live in `src/content/posts`
- file names are like `YYYY-MM-DD-post-title.mdx`
- posts must have frontmatter like this:
```
---
title: Post Title
spoiler: This is the subtitle that shows under the title on the index page
date: 'M/D/YY'
href: use-a-slug-version-of-the-title-here
---
```