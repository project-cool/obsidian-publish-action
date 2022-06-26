# Obsidian Publish Github Action

### GitHub Action that publishes Obsidian vault in MkDocs format, when pushed to the GitHub repository to Netlify.

- This action parses the the Obsidian vault markdown (.md file) to the markdown format supported by MkDocs, compresses all the images and publishes the website to Netlify.
- This action is triggered by a push to the `publish` branch.

### Usage

```yaml
name: Publish Vault
on: [push]
jobs:
  Publish-Obsidian-Vault:
    runs-on: ubuntu-latest
    steps:
      - name: Publish Vault
        uses: project-cool/obsidian-publish-action@main
        with:
          websiteId: "<your-netlify-website-id>" # required
          log_level: "info"                      
          token: ${{ secrets.NETLIFY_TOKEN }}    # required
          branch: "publish"  
          image_resolution: 1920
          compression_factor: 20
          suppress_mkdocs_logs: true   
```
The unrequired fields have the default values written above.
### Instructions

1. Create a new repository to which the Obsidian vault will be pushed.
2. The root folder should contain `.github/workflows/publish-obsidian-vault.yml` and `mkdocs.yml`
3. Create a github secret which will store your Netlify access token. 
4. You can have the following directory structure

```
obsidian-vault
└─── .github
│   └─── workflows
│       │   publish-obsidian-vault.yml
│
└─── mkdocs.yml
│
│─── .git
│
│─── notes
│   │   blog.md
│   └─── engineering
│       │   scientist.md
│       │   ceo.md
│       │   mba.md
```

<details>
<summary style="font-weight:bold;">Sample <code>mkdocs.yml</code> </summary>
<p>

```yaml
site_name: Your Notes
theme:
  name: material

  features:
    - navigation.tabs
    - navigation.top
  palette:
    - media: "(prefers-color-scheme: light)"
      scheme: default
      primary: indigo
      accent: indigo
      toggle:
        icon: material/lightbulb
        name: Switch to dark mode
    - media: "(prefers-color-scheme: dark)"
      scheme: slate
      primary: teal
      accent: teal
      toggle:
        icon: material/lightbulb-outline
        name: Switch to light mode

markdown_extensions:
  - meta
  - toc:
      permalink: true
  - pymdownx.highlight:
      anchor_linenums: true
  - pymdownx.inlinehilite
  - pymdownx.snippets
  - pymdownx.superfences
  - admonition
  - pymdownx.details
  - pymdownx.superfences

extra:
  homepage: https://your-website.org

  social:
    - icon: fontawesome/brands/linkedin
      link: https://www.twitter.com
    - icon: fontawesome/brands/youtube
      link: https://www.twitter.com
    - icon: fontawesome/brands/instagram
      link: https://www.twitter.com

copyright: Copyright &copy; 2022 Your name
```
</p>
</details>

### References

#### GitHub Actions

- [Custom GitHub Actions in Node.js - GitHub Actions JavaScript Tutorial - YouTube](https://www.youtube.com/watch?v=Ef0gPGUh9oo)
- [How to Build Your First JavaScript GitHub Action](https://www.freecodecamp.org/news/build-your-first-javascript-github-action/)
- [4 Steps to Creating a Custom GitHub Action](https://betterprogramming.pub/4-steps-to-creating-a-custom-github-action-d67c4cf0445a)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

#### MkDocs
- [MkDocs - Material Theme by SquidFunk](https://squidfunk.github.io/mkdocs-material/)
- [MkDocs - Configurations](https://www.mkdocs.org/user-guide/configuration/)