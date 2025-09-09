import { defineCollection, z } from 'astro:content'

const posts = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.string(),                 // "YYYY-MM-DD"
    spoiler: z.string().default(""),
    tags: z.array(z.string()).default([]),
    draft: z.boolean().default(false),
    // no need for frontmatter "slug" anymore
  }),
  // remove a leading date from the last path segment
  slug: ({ defaultSlug }) =>
    defaultSlug
      .split('/')                        // keep subfolders if you use them
      .map(seg => seg.replace(/^\d{4}-\d{2}-\d{2}-/, ''))
      .join('/'),
})

export const collections = { posts }