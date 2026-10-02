* Name: The human-readable name of the GitHub Action. This will be used to
  build defaults for other inputs, such as `github_repo_name`, etc.

  For example: `Setup Python`

  Spaces and special characters will be replaced by either `_` or `-` depending
  on the generated input.

* Description: A short description of the action. It will be used as the
  description in the `README.md`, `action.yaml`, etc.

* Author name: The name and email address of the author of the project. They
  will be used in the copyright notice in file headers and as the author in
  `action.yaml`.

* License: Currently, only two options are provided: `MIT`, which should be
  used for open-source projects, and `Proprietary`, which should be used for
  closed-source projects. This will be added to file headers, and as the
  `LICENSE` file.

* GitHub repository name: The handle of the GitHub repository where the project
  will reside. This will be used to generate links to the project on GitHub and
  as the top-level directory name.

* GitHub organization: The GitHub handle of the organization where
  the project will reside. This will be used to generate links to the project
  on GitHub and for assigning a default code owners team.

* Default code owners: A space-separated list of GitHub teams (`@org/team`) or
  users (`@user`) that will be used as the fallback code owners in the
  `CODEOWNERS` file. Please refer to the [code owners documentation] for more
  details on the valid syntax.

[code owners documentation]: https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners
