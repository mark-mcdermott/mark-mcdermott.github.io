This is the github repo for my blog site: [https://markmcdermott.io](https://markmcdermott.io)


The "stack" is [Astro](https://astro.build), [Tailwind](https://tailwindcss.com/) and [Github Pages](https://pages.github.com/). The little avatar image links to [my Github User Site](https://github.com/mark-mcdermott/mark-mcdermott) which is a sort of a de facto "About Me" page for the blog. I write/edit posts right in this github repo in markdown.

#### Why Astro?
Fast load time: My old Nuxt blog was having some slow load time issues on mobile. Astro’s static site generation makes this blog load very quickly. Google Lighthouse says it loads in 0.2s on desktop and 1.1s on mobile and a 100% score for performance. It’s possible I can get this even lower, but for now that is great.

#### Why the weird stack?
Simplicity: Astro/GitHub Pages/GitHub User Site keeps things simple. No more big frontend framework, no more backend framework, no database, no docker, no CI/CD.

#### Why Github Pages?
It's free and easy to use.

#### Why no portfolio site?
Low maintenace: I sort of combined the about/projects/contact page into one page and moved it to GitHub’s user site where everything is just a single readme file. The blog page is now the only page I really have to maintain or think about at all.

#### Why no real CMS?
Speed: Using GitHub as the CMS is awesome. I’m in GitHub all the time anyway, so I don’t really need to log into a separate CMS.

#### Why markdown?
Quick post creation: Astro supports markdown files, so I can write my posts in markdown and frontmatter like I was used to with Nuxt Content.

#### Why Tailwind?
Quick CSS changes: CSS changes are so fast with Tailwind, I barely have to think about CSS, unlike Bootstrap, etc.  I still think Tailwind makes the html look ugly. but it's worth it.
