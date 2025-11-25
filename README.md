# Git Training Materials

```bash
curl -o synthetic_project_files.sh https://iv3-sharing.cog.sanger.ac.uk/synthetic_project_files.sh
bash synthetic_project_files.sh && rm synthetic_project_files.sh && cd SYNTHETIC_PROJECT
```

## Steps for Trainer to Check before workshop

1. Does participant have a GitLab account?
2. Has participant been added to the GitLab project? `https://gitlab.internal.sanger.ac.uk/team113_projects/`
3. If using a Sanger Mac is Git installed?


## Git Commands Covered

### Setting Up Git
These steps need to be done only once per machine.

```bash
git config --global user.name "Firstname Lastname"
git config --global user.email "<sanger-username>@sanger.ac.uk"
git config --global core.editor "nano" # explain nano vs vim vs other editors
```

### The Git Loop
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