# Contributing to YumiOS

If you are reading this document right now, you are probably considering contributing to YumiOS and making it better
than it is today. Thank you for taking that initiative! Before submitting your contribution, please take a moment and
make sure to read through our contribution guidelines:

-   [Code of Conduct](https://github.com/Yumi-Lab/YumiOS/blob/develop/.github/CODE_OF_CONDUCT.md)
-   [Question or Problem?](#question)
-   [Issues and Bugs](#issue)
-   [Feature Requests](#feature)
-   [Submission Guidelines](#submit)
    -   [Submit an Issue](#submit-issue)
    -   [Submit a Pull Request](#submit-pr)

## <a name="question"></a> Got a Question or Problem?

Please do not open issues for general support questions. We want to keep GitHub issues for bug reports and feature
requests.

## <a name="issue"></a> Found a Bug?

If you find a bug in the source code or think that Mainsail is behaving odd in specific situations, you can help us fix
that issue by [submitting an issue](https://github.com/Yumi-Lab/YumiOS/issues/new?assignees=&labels=%E2%9A%A1+Type%3A+Bug&template=bug_report.yml).
If you have already fixed that issue, you can [submit a Pull Request](#submit-pr) with that fix.

## <a name="feature"></a> Missing a Feature?

You can request a new feature by [submitting a feature request](https://github.com/Yumi-Lab/YumiOS/issues/new?assignees=&labels=%F0%9F%92%A1+Type%3A+FR&template=feature_request.yml).
If you would like to implement a new feature, please consider the scope of the change. For changes requiring a lot of
work, it's best to outline a proposal first so it can be discussed. This allows us to prevent wasted time and effort and
discuss how to bring your proposed feature into the project.

## <a name="submit"></a> Submission Guidelines

### <a name="submit-issue"></a> Submitting an Issue

Before you submit an issue, please search the issue tracker if your problem may already exist. If a ticket already
covers your case, please refrain from opening a new ticket and instead contribute to the existing ticket. If you submit
an issue, please provide the required information and reproduction steps. We need those to be able to try and reproduce
the bug ourselves. Without proper instructions on how to reproduce the issue you are encountering, we might be unable to
fix a possible bug.

### <a name="submit-pr"></a> Submitting a Pull Request (PR)

Before you work on a PR and submit it, please pay attention to the following guidelines:

1. Search the [pull requests](https://github.com/Yumi-Lab/YumiOS/pulls) for an open or closed PR related to your submission.
    - You don't want to duplicate existing efforts or work on something unlikely to be merged into the project.
2. Do not submit PRs against the `master` branch. PRs need to be submitted against the `develop` branch.
3. Follow our Code Layout definded via [editorconfig](https://github.com/Yumi-Lab/YumiOS/blob/develop/.editorconfig).
4. If there is an issue describing the problem you're fixing or a discussion of a feature you are implementing, make sure to link it in the PRs body.

    - You can also add `fix #<id>` or `fixes #<id>` in the PR body where `<id>` is the issue id.
    - Example PR title, body and sign-off:

    ```
    fix: incorrect handling of click event

    This PR will fix #123.
    Fixes correct handling of click event when button [X] is clicked.

    Signed-off-by: James Smith <james.smith@myvalidemail.com>
    ```

5. If there is no issue describing the problem, create an issue first or provide a sufficient description of the bug/feature.
    - Screenshots of your changes are welcome if you worked on UI-related code.
6. The title of the PR should follow the [commit message convention](https://www.conventionalcommits.org/en/v1.0.0/).
    - If the PR consists of multiple commits, it's good practice to follow the convention, although that is not necessarily required.
    - Upon merging, we will squash all commits of the PR into a single commit for a clean history and release changelogs.
7. Please sign off each commit and your PR. It must contain your real name and a current email address (see example in item 4).
    - The sign-off should follow this pattern: `Signed-off-by: My Name <myemail@example.org>`
    - The sign-off certifies that you agree with the [developer certificate of origin](https://github.com/Yumi-Lab/YumiOS/blob/develop/.github/DEVELOPER_CERTIFICATE_OF_ORIGIN.md).
    - If you provide a translation, a sign-off is not necessarily required.
8. When opening a pull request, keep `Allow edits and access to secrets by maintainers` **enabled**.
9. Your pull request has to pass our automated Test Chain
10. pull requests have to pass internal tests on bare metal hardware, therefor they could take time to be merged.
