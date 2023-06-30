#### Prerequisites
- [RVM](https://rvm.io/) is installed and configured.

#### Running the application
In the project directory run the following commands:
```bash
$ rvm install ruby-3.2.2
$ gem install bundler
$ gem install foreman
$ bundle install
```
To start the server, run
```bash
$ foreman start -f Procfile.dev
```
In your browser visit http://0.0.0.0:3000/hash.
