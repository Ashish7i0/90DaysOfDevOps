this is solution for week-3-bash-scripting . will share solution here today EOD .
Here’s how you can accomplish each step of the task:

1. Create a User devops_user

Run the following command to create a new user:

sudo useradd -m -s /bin/bash devops_user

	•	-m creates a home directory.
	•	-s /bin/bash sets the default shell.

2. Create a Group devops_team and Add User

sudo groupadd devops_team
sudo usermod -aG devops_team devops_user

	•	groupadd devops_team creates the group.
	•	usermod -aG devops_team devops_user adds the user to the group.

3. Set a Password for devops_user

sudo passwd devops_user


Enter and confirm the new password.

4. Grant sudo Access to devops_user

Add devops_user to the sudo group:

sudo usermod -aG sudo devops_user

Alternatively, create a custom sudo rule:

echo "devops_user ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/devops_user

This allows passwordless sudo for devops_user.

5. Restrict SSH Login for Certain Users

Edit SSH configuration:

sudo nano /etc/ssh/sshd_config

To deny SSH access for specific users, add:

DenyUsers user1 user2

To allow only specific users, add:

AllowUsers devops_user

Then restart SSH service:

sudo systemctl restart sshd

