# TodoMVC Ruby on Rails 7.1 app for the MAS-RAD 2023

[![Rails Test Action Status](https://github.com/mas-rad/todomvc-rails-2023/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/mas-rad/todomvc-rails-2023/actions/workflows/test.yml)


This [TodoMVC](http://todomvc.com) application written with [Ruby on Rails](https://rubyonrails.org) 7.1 is used as a learning tool in the context of the [Master of Advanced Studies in Rapid Application Development (MAS-RAD)](https://www.he-arc.ch/ingenierie/formation-continue/mas-in-rapid-application-development) in the [CAS-DAS](https://www.he-arc.ch/ingenierie/formation-continue/cas-en-developpement-dapplications-riches/) [Frameworks module](https://rs.he-arc.ch/docs/RS530.40.22.204.pdf).


## Getting started

1. Install [Docker](https://www.docker.com/products/docker-desktop/) (and [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) on Windows). Then copy'n'paste into your terminal.

```bash
docker volume create ruby-bundle-cache
```

2. Add the following alias to your shell configuration file (e.g. `~/.bashrc` or `~/.zshrc`), then reload your terminal.

```bash
alias docked='docker run --rm -it -v ${PWD}:/rails -v ruby-bundle-cache:/bundle -p 3000:3000 ghcr.io/mas-rad/rails-cli-firefox-esr:latest'
```

3. [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) the [mas-rad/todomvc-rails-2023](https://github.com/mas-rad/todomvc-rails-2023) repository to your own GitHub account and [clone it locally](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository).
4. From within the cloned repo folder, use your terminal to ensure that `git remote -v` includes both an `origin` remote pointing to your fork and an `upstream` remote pointing to `mas-rad/todomvc-rails-2023`. If the `upstream` remote is missing, add it with `git remote add upstream https://github.com/mas-rad/todomvc-rails-2023.git`.
5. Install the Ruby gem dependencies with `docked bundle`.
6. Finally, run the DB migration with `docked rails db:migrate`.
7. You are ready! 🎉 You can now run `docked COMMAND` to execute commands in the Rails container. For example, `docked rails server` will start the Rails server (http://0.0.0.0:3000) and `docked rails test:all` will run the whole test suite.


## Working on an exercise

1. Update your `upstream` remote with: `git fetch upstream`
2. Optional, list available remote branch with: `git branch --remote`
3. Create a new `exercise-XX` branch from the remote branch with `git checkout -b exercise-XX upstream/exercise-XX`
4. Do the exercise and ensure that all tests are green with `docked rails test:all`.
5. Commit your changes.
6. Push your `exercise-XX` branch to your `origin` with: `git push origin`.
7. Visit [mas-rad/todomvc-rails-2023](https://github.com/mas-rad/todomvc-rails-2023) and [open a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).


## Author

[Thibaud Guillaume-Gentil](https://thibaud.gg) ([@thibaudgg](https://github.com/thibaudgg))
