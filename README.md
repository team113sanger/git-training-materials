# Git Training Materials



## Steps for Trainer to Check before workshop

1. Does participant have a GitLab account?
2. Has participant been added to the GitLab project? `https://gitlab.internal.sanger.ac.uk/team113_projects/`
3. If using a Sanger Mac is Git installed?


## Git Introduction

### 0. SSH Key Setup (if needed)

Users can copy-paste this code into their terminal to create an SSH keypair if they do not already have one set up.

As a trainer you will need to still explain what SSH keys, show their contents and then demonstrate adding the public key to GitLab.

```bash
# Ensure home directory is not group/other writable (SSH requires this)
chmod go-w "$HOME"
# Create ~/.ssh with safe permissions
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
# Ensure standard SSH files exist
touch "$HOME/.ssh/config" "$HOME/.ssh/authorized_keys" "$HOME/.ssh/known_hosts"
chmod 600 "$HOME/.ssh/config" "$HOME/.ssh/authorized_keys" "$HOME/.ssh/known_hosts"
# Create RSA keypair if one doesn't already exist
if [ ! -f "$HOME/.ssh/id_rsa" ] && [ ! -f "$HOME/.ssh/id_rsa.pub" ]; then ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa" -N "" -q; else echo "Existing SSH keypair found at ~/.ssh/id_rsa[.pub]; not creating a new one."; fi
# Fix key permissions
[ -f "$HOME/.ssh/id_rsa" ] && chmod 600 "$HOME/.ssh/id_rsa"
[ -f "$HOME/.ssh/id_rsa.pub" ] && chmod 644 "$HOME/.ssh/id_rsa.pub"
```

### 1. Prepare a Synthetic directory for Git Training

We want a directory of realistic analysis/bioinformatics files rather than starting with an empty directory.

```bash
curl -fsSL https://github.com/team113sanger/git-training-materials/releases/latest/download/synthetic_project_files.sh | bash && cd "$(whoami)-git-training"
```

### 2. Get traineers to create an uninitialised Git repository in GitLab

Guide them through creating a new project in GitLab. Importantly, do NOT initialise with a README.md file.

Then scroll down to the **section "…or push an existing folder"** and copy the commands for pushing an existing repository from the command line.

### 3. Setting Up Git for the first time
These steps need to be done only once per machine.

```bash
git config --global user.name "Firstname Lastname"
git config --global user.email "<sanger-username>@sanger.ac.uk"
git config --global core.editor "nano" # explain nano vs vim vs other editors
```

### 4. The Git Loop
We familiarise ourselves with the basic Git workflow: `git add`, `git commit` and `git push` punctuated by `git status` to check our progress.

```bash
# Like adding a single item to your shopping cart
git add <file>
# or git add <file> <file> <file>
# or git add <directory>
# or git add .

# Like reviewing your cart and changes before you pay
git status

# Like confirming your order in checkout with a short note about what you're buying
git commit -m "Your message here"

# Like sending your confirmed order to the store to be processed
git push
```

## Importantant talking points

1. When to use Git in one's work
2. The difference between local and remote repositories
3. What is a commit and why commit messages matter
4. Discuss perfection - no such thing as perfect code; do not wait to commit before submitting to a journal. Use analogy of Manuscript DOCX with regards to versioning and how long before saving.