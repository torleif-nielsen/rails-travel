# Rails Travel

The companion GitBook can be found here: [Rails 5 Basics](https://www.gitbook.com/book/torleif-nielsen/rails-5-basics/details)

This is the repository containing the most up to date source code following a book I am writing as an introduction to developing web applications using **Ruby on Rails**. The demo app itself is a travel web application and the goals of the book are to introduce concepts like server side rendering with Ruby, some client side rendering with JavaScript, HTML, CSS frameworks (Bootstrap in this case), and responsive, accessible design.

## Installing the Demo Application

There are a few prerequisites for starting an instance of the application, for portability's sake, Vagrant is an interface for managing virtual machines is used to run and develop the application through a virtual machine provider, here are the steps to see the Application in action:

1. **Windows Only**: Install a bash client like [Git Bash](https://git-scm.com/downloads)
2. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
3. Install [Vagrant](https://www.vagrantup.com/downloads.html)
4. Open a *Bash Terminal Emulator* \(Terminal/iTerm2 for Mac, Terminal for your Linux distribution, Git Bash for Windows\)
5. Navigate to the directory where you would like to clone this repository to `cd ~/your-projects-directory-here`
6. Clone the repository \(`git clone https://github.com/torleif-nielsen/rails-travel.git`\)
7. Change into the `rails-travel` directory \(`cd rails-travel`\)
8. Download and fire up the VM using Vagrant \(`vagrant up`\) **NOTE**: Vagrant will parse the `Vagrantfile`, fetch the appropriate VM from Hashicorp's catalog, and boot up the VM. Depending on your internet connection, this may take a moment, at the end you will see a line saying that Vagrant has mounted the `rails-travel` directory inside of the VM at `/vagrant`
9. SSH into the booted VM using Vagrant's ssh tool \(`vagrant ssh`\)
10. Once inside of the VM, change to the `/vagrant` directory \(`cd /vagrant`\)
11. Confirm for yourself that the directory was mounted properly and the files are there \(`ls` or `ls /vagrant`\)
12. There is a PostgreSQL store running inside of the VM, and the application expects a PostgreSQL user named `vagrant` with password `vagrant`. Add this user inside of your VM \(sudo -u postgres psql -c "create role vagrant with superuser createdb login password 'vagrant';"\). You will see a line `CREATE ROLE` in response.
13. Run Bundler to install the dependencies listed in the `Gemfile` \(`bundle install`\), this may take a moment.
14. Provision the database with the Rails CLI tool \(`rails db:create`\)
15. Migrate the table schema declarations with the Rails CLI tool \(`rails db:migrate`\)
16. Finally, fire up your rails server \(`rails server -b 0.0.0.0`\) to forward requests to the host and navigate to `localhost:3000` in a browser on your host machine \(your computer, not the VM\).
17. The app will run in your browser, start by adding some offices and destinations, then agents, and then sales, enjoy!
