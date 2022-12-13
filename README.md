# Template for starting a new project...

Every service inside RecipyHub scope must be synchronized with this template

To start using this template, please remove assets folder and modify the files to your own purpose (this is just an illustrated method of "how to setup").

## CONTAINS

- Setup to work with github actions (contains one workflow example)
- Template to create Issues & Pull Requests

## How to setup github for projects?

- First go to settings on your github repository
  - Go to branches
    - Click on the button **Add rule**
    - Give a name for which branch do you wanna setup
    - Check mark the option **Require pull request reviews before merging** if you wanna reviews on your PRs (generally used only on main branch)
    - Check mark the option **Require status checks to pass before merging** if you had a workflow settled with github actions
    - Check mark **Require signed commits** (optional) only if you want to ensure Signed commits

Docs: Comming Soon
