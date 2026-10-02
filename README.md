# Cookiecutter template to create a GitHub reusable workflow

## Introduction

This is a [Cookiecutter] template to create a [GitHub reusable
workflow](https://docs.github.com/en/actions/using-workflows/reusing-workflows).
It will generate all the project's structure.

## User Guide

### Install Cookiecutter

To start a new project, you should first [install
Cookiecutter](https://cookiecutter.readthedocs.io/en/stable/installation.html).
It is normally available in any Linux distribution, but some have a very old
version (for example, Ubuntu/Debian). You can [check which version your distro
has on Repology](https://repology.org/project/cookiecutter/versions). You need
**at least version 2.6.0**. To ensure you get an up-to-date version, you can
always use `pip` and install it in a `venv`:

```console
$ python -m venv cookiecutter
$ cd cookiecutter
$ . bin/activate
[cookiecutter] $ pip install cookiecutter
Collecting cookiecutter
...
```

Then simply run [Cookiecutter] where you want to create the new project.

### Generate the project files

To generate a new project, you can use the following command:

```sh
cookiecutter gh:frequenz-floss/cookiecutter-gh-workflow
```

> [!TIP]
> You can also use the `--checkout` option to use a template from a specific
> release.

This command will prompt you for the project type, name, and other
configuration options, and it will generate the entire project for you in a new
subdirectory.

After completing the project and fixing the `TODO`s, you can either amend the
previous commit using `git commit --amend` or create a new commit for the
changes using `git commit`.

> [!TIP]
> You can find more information about the questions that are asked in the
> [questions help file](questions-help.md). This help will be also shown when
> you run `cookiecutter`.

### Create the GitHub repository

To simplify the creation and configuration of the GitHub repository, you can
[start a new project from the `frequenz-floss/template-gh-workflow` template
repository](https://github.com/new?template_name=template-gh-workflow&template_owner=frequenz-floss).

The contents of this repository should be completely replaced by the generated
files. To do this you can use this command:

```sh
rsync -vr --exclude=.git/ $COOKIECUTTER_GENERATED_DIRECTORY/ $GITHUB_REPOSITORY_DIRECTORY
```

> [!IMPORTANT]
> The `/` at the end of the source directory
> (`$COOKIECUTTER_GENERATED_DIRECTORY`) is important to copy the contents of the
> directory and not the directory itself. It is also important that the target
> directory (`$GITHUB_REPOSITORY_DIRECTORY`) does not have a trailing `/`.

After doing this you can change to the target directory and commit the changes:

```sh
cd $GITHUB_REPOSITORY_DIRECTORY
git add .
git commit -m "Add initial project files"
```

### Update an existing project

When new versions of this template are released, you might want to update an
existing project to the new version.

There are two main approaches: use a migration script or re-run the
[Cookiecutter] command.

#### Use a migration script

This is the recommended approach, as it should be much less work. Only when
extremely deep changes are made to the template, or when the project is very
old, should you consider re-running the [Cookiecutter] command. Usually release
notes will warn you about the former.

The script can't always perform all the changes necessary to migrate to a new
version. In this case, you will have to manually apply the changes. The script
will guide you through the process, so please read the script output carefully.

The script can also only migrate from one version to the next. If you are
skipping versions, you will have to run the script multiple times.

The easiest way to run the migration script is to fetch it from GitHub and run
it directly.

```sh
curl -sSL https://raw.githubusercontent.com/frequenz-floss/cookiecutter-gh-workflow/$VERSION/migrate.sh \
	| sh
```

> [!IMPORTANT]
> Make sure to set `$VERSION` to the version you are migrating to, for example
> `v2.0.0`.

#### Re-run the Cookiecutter command

If you are upgrading a very old project (jumping multiple versions at the time)
it is probably easier to just regenerate the whole project.

To do so, you can use the [Cookiecutter *replay
file*](https://cookiecutter.readthedocs.io/en/stable/advanced/replay.html) that
was saved during the project generation. The file is saved as
`.cookiecutter-replay.json`. Using this file, you can re-run [Cookiecutter]
without having to enter all the inputs again.

> [!WARNING]
> * Don't forget to commit all changes in your repository before doing this!
>   Files will be overwritten!
> * Don't forget to check all the [release
>   notes](https://github.com/frequenz-floss/frequenz-repo-config-python/releases)
>   for all the versions you are going to update, in particular the
>   **Upgrading** section, as there might be steps necessary before even
>   running the `cookiecutter` command for the update.

```sh
git commit -a  # commit all changes
cd ..
cookiecutter gh:frequenz-floss/frequenz-repo-config-python \
    --directory=cookiecutter \{{ """
    --checkout """ + version.ref_name + " \\" if version}}
    --overwrite-if-exists \
    --replay \
    --replay-file project-directory/.cookiecutter-replay.json
```

This will create a new commit with all the changes to the overwritten files.
Bear in mind that all the `TODO`s will come back, so there will be quite a bit
of cleanup to do. You can easily check what was changed using `git show`, and
you can use `git commit --amend` to amend the previous commit with the template
updates, or create a new commit with the fixes. You can also use `git citool`
or `git gui` to easily add, remove, or even discard (revert) changes in the
templates update commit.

> [!NOTE]
> The `project-directory` is the directory of your previously generated
> project. If you renamed it, then the files will be generated in a new
> directory with the original name. You can update the target directory in the
> replay file.

> [!NOTE]
> Please remember to keep your replay file up to date if you change any
> metadata in the project.

## Changelog

Please see the
[releases](https://github.com/frequenz-floss/cookiecutter-gh-workflow/releases/)
page.

[cookiecutter]: https://cookiecutter.readthedocs.io/
