# Beginner Friendly Ansible Projects

Here are three projects to help you practice what you've learned.

## Project 1: The LAMP Stack (Linux, Apache, MySQL, PHP)
**Goal**: automated provision of a web server with PHP and Database support.

**Tasks**:
1.  Create an inventory file with one group `web`.
2.  Write a playbook `site.yml`.
3.  Install `apache2`, `mysql-server`, `php`, `libapache2-mod-php`, `php-mysql`.
4.  Ensure Apache service is running and enabled.
5.  Create a PHP info file (`info.php`) in `/var/www/html/` with content `<?php phpinfo(); ?>`.
6.  **Challenge**: Use a **Handler** to restart Apache only if the config file changes.

---

## Project 2: User Management System
**Goal**: Manage user accounts across multiple servers.

**Tasks**:
1.  Define a list of users in a variable (e.g., `remote_users: ['alice', 'bob', 'charlie']`).
2.  Write a playbook to:
    *   Create these users on all servers.
    *   Add them to the `sudo` group.
    *   Set up authorized SSH keys for them (use the `authorized_key` module).
3.  **Challenge**: Add a specific user to be "absent" (deleted) to test removing users.

---

## Project 3: Application Deployment with Git
**Goal**: Deploy a simple static website from GitHub.

**Tasks**:
1.  Pick a simple HTML template repo from GitHub.
2.  Write a playbook that:
    *   Installs `git` and `nginx`.
    *   Clones the repository to `/var/www/html/my-app`.
    *   Configures Nginx to serve that directory.
3.  **Challenge**: Use the `sychronize` module or `git` module to ensure that if you push changes to the repo, running the playbook updates the site.

---

## Next Steps
Once you finish these, look into **Ansible Roles** to organize your playbooks better!
