# GitLab Workflow

The GitLab Workflow extension integrates GitLab into Visual Studio Code. After you [set up the extension](#setup), you can:

- [**View GitLab issues and merge requests**](#issue-and-merge-request-details-and-comments-in-vs-code).
  View issues, comments, merge requests, and changed files [in the VS Code sidebar](#sidebar-details),
  or build a [custom search](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/main/docs/user/custom-queries.md)
  to meet your needs.
- [**Create and review merge requests**](#merge-request-reviews).
- [**View security findings in your current branch**](#security-findings)
- [**Validate your GitLab CI/CD configuration**](#validate-gitlab-cicd-configuration) locally with a [command](#commands).
- [**Manage your pipelines**](#pipeline-actions). View your [pipeline status](#status-bar-details)
  and open the related merge request. With [advanced pipeline actions](#pipeline-actions),
  you can create, retry, or cancel a pipeline.
- [**View the job output**](#view-the-job-output). View the output of a running or finished job in an editor tab.
- **Manage snippets**. [Create](#create-snippet) and [insert](#insert-snippet)
  snippets, and apply [snippet patches](#create-and-apply-snippet-patch).
- [**Browse a GitLab repository directly**](#browse-a-repository-without-cloning)
  in Visual Studio Code without cloning it.
- [**Auto-complete GitLab CI/CD variables**](#cicd-variable-autocompletion) in your `.gitlab-ci.yml` pipeline file, and any file beginning with `.gitlab-ci` and ending with `.yml` or `.yaml`, like `.gitlab-ci.production.yml`.

If you face an issue, check out our [list of known issues](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/main/docs/user/known-issues.md) and if it's not listed, please [report it](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/main/CONTRIBUTING.md#reporting-issues).

## Minimum supported version

- GitLab versions 16.1 and later. While many extension features might work with earlier versions, they are unsupported.
- [GitLab Duo Code Suggestions](#code-suggestions) requires both:
  1. GitLab version 16.8 or later.
  1. VS Code 1.82.0 or later.
- [Security Findings](#security-findings) requires GitLab Workflow version 3.74.0 or later, and GitLab Ultimate.

To find your GitLab version, visit `/help` (like `https://gitlab.com/help`).

## Features

_These features require you to set up your access token. See the [Setup](#setup) section for instructions._

### Code Suggestions

Write code more efficiently by using generative AI to suggest code while you're developing. To learn more about this feature, see the
[Code Suggestions documentation](https://docs.gitlab.com/ee/user/project/repository/code_suggestions/index.html). With Code Suggestions, you get:

- Code Completion, which suggests completions for the current line you are typing. These suggestions usually have low latency.
- Code Generation, which generates code based on a natural-language code comment block. Responses for code generation are streamed in VS Code to quickly begin giving results.

Code Suggestions is a generative artificial intelligence (AI) model. GitLab selects the best-in-class large-language models for specific tasks. We use [Google Vertex AI Code Models](https://cloud.google.com/vertex-ai/generative-ai/docs/code/code-models-overview) and [Anthropic Claude](https://www.anthropic.com/claude) for Code Suggestions.

No new additional data is collected to enable this feature. Private non-public GitLab customer data is not used as training data.
Learn more about [Code Suggestion data usage](https://docs.gitlab.com/ee/user/project/repository/code_suggestions/#code-suggestions-data-usage).

#### Code Suggestions status icons

Use the status bar icon to see if code suggestions are enabled:

| Status   | Icon                                                                    |
| -------- | ----------------------------------------------------------------------- |
| Enabled  | ![enabled icon](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/HEAD/src/assets/icons/gitlab-code-suggestions-enabled.svg)   |
| Disabled | ![disabled icon](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/HEAD/src/assets/icons/gitlab-code-suggestions-disabled.svg) |
| Loading  | ![loading icon](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/HEAD/src/assets/icons/gitlab-code-suggestions-loading.svg)   |
| Error    | ![error icon](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/HEAD/src/assets/icons/gitlab-code-suggestions-error.svg)       |

#### Set up Code Suggestions

To set up Code Suggestions:

1. Ensure your GitLab instance and organization
   [meets all the requirements](https://docs.gitlab.com/ee/user/project/repository/code_suggestions/#use-code-suggestions)
   to use Code Suggestions.
1. [Set up this extension](#setup) and connect it to your instance.
1. To verify Code Suggestions are working properly, open a file that uses an
   [officially supported language](https://docs.gitlab.com/ee/user/project/repository/code_suggestions/supported_extensions.html#supported-languages).
   In the status bar, find the tanuki icon. The enabled icon (![enabled icon](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/HEAD/src/assets/icons/gitlab-code-suggestions-enabled.svg)) shows that Code Suggestions are enabled. For the full set of icons and their meanings, see [Code Suggestions status icons](#code-suggestions-status-icons).

To add more languages to Code Suggestions:

1. Find your desired language in the list of
   [language identifiers](https://code.visualstudio.com/docs/languages/identifiers#_known-language-identifiers)
   for VS Code. You need the **Identifier** for a later step.
1. In VS Code, open the extension settings for **GitLab Workflow**:
   1. On the top bar, go to **Code > Settings > Extensions**.
   1. Search for **GitLab Workflow** in the list, and select the gear icon.
   1. Select **Extension Settings**.
   1. In your **User** settings, find
      **GitLab › Ai Assisted Code Suggestions: Additional Languages** and select **Add Item**.
1. In **Item**, add the language identifier, and select **OK**.

#### Accepting code suggestions

To accept suggestions, use the following keyboard shortcuts:

- To accept the entire suggestion, press <kbd>Tab</kbd>.
- To accept the suggestion word-by-word, press <kbd>Command</kbd> + <kbd>→</kbd> (right arrow).

You can also accept a single line using the context menu:

- To accept the suggestion line-by-line, select **Accept Line**.
  - ![accept line](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/43d38aaeb939ebc475625d6cb3fc23c68073892a/docs/assets/cs-accept-line.png)

You can assign different keyboard shortcuts for **Accept Inline Suggestion**, **Accept Next Word Of Inline Suggestion**, or **Accept Next Line Of Inline Suggestion**:

1. Run the `Preferences: Open Keyboard Shortcuts` command.
1. Find the shortcut you want to edit, and select the **Change keybinding** (pencil) icon.
1. Enter your preferred keyboard shortcut, then press <kbd>Enter</kbd>.
   - ![accept code suggestions - keyboard setting](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/43d38aaeb939ebc475625d6cb3fc23c68073892a/docs/assets/cs-accept-keyboard-settings.png)

#### Use Code Generation

To use Code Generation:

1. Add a comment to a supported file type.
1. In the comment, use natural language to describe the code you want to build.
1. Press <kbd>Enter</kbd> to start generating code.

![Demo of Code Generation in use](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/058288b8fe5d7252248ad8e4783fe59af73aab7f/docs/assets/streaming.gif)

You can [disable the streaming function](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/HEAD/docs/user/troubleshooting.md#disable-streaming), if needed.

### Browse issues, review MRs

See your issues, MRs (including changed files) and other [custom search results](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/main/docs/user/custom-queries.md) on a dedicated panel in the VS Code sidebar. [Read more](#sidebar-details)

### Information about your branch - pipelines, MR, closing issue

See pipeline status, open MR and closing issue links in the status bar. [Read more](#status-bar-details).
This pipeline status automatically updates so you don't need to open GitLab to see your pipeline status.

Advanced pipeline actions allow you to view pipeline on GitLab, create a new pipeline, retry or cancel current pipeline. [Read more](#pipeline-actions).

![status_bar.gif](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/status-bar.gif)

### Commands

You can use [Command Palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) to run the commands.

- `GitLab: Search Project Issues (Supports Filters)`. [Read more](#search-with-filters)
- `GitLab: Search Project Merge Requests (Supports Filters)`. [Read more](#search-with-filters)
- `GitLab: Advanced Search (Issues, Merge Requests, Commits, Comments...)`. [Read more](#search-with-advanced-search)
- `GitLab: Create Snippet` - Create public, internal or private snippet from entire file or selection. [Read more](#create-snippet).
- `GitLab: Insert Snippet` - Insert a project snippet, supports multi-file snippets. [Read more](#insert-snippet).
- `GitLab: Compare Current Branch with Default Branch` - Compare your branch with the repository's default branch and view changes on GitLab. [Read more](#compare-with-default-branch).
- `GitLab: Open Active File on GitLab` - View active file on GitLab with highlighting active line number and selected text block. [Read more](#open-active-file).
- `GitLab: Validate GitLab CI/CD Config` - Validate GitLab CI/CD configuration file `.gitlab-ci.yml`. [Read more](#validate-gitlab-cicd-configuration).
- `GitLab: Show Merged GitLab CI/CD Config` - Show a preview of the GitLab CI/CD configuration file `.gitlab-ci.yml` with all includes resolved. [Read more](#show-merged-gitlab-cicd-configuration).
- `GitLab: Open Merge Request for Current Branch`
- `GitLab: Show Issues Assigned to Me` - Open issues assigned to you on GitLab.
- `GitLab: Show Merge Requests Assigned to Me` - Open MRs assigned to you on GitLab.
- `GitLab: Open Current Project on GitLab`
- `GitLab: Create New Issue on Current Project`
- `GitLab: Create New Merge Request on Current Project` - Open the merge request page to create a merge request.
- `GitLab: Open Remote Repository` - Browse a remote GitLab repository. [Read more](#browse-a-repository-without-cloning).
- `GitLab: Open Active File on GitLab`
- `GitLab: Copy Link to Active File on GitLab`
- `GitLab: Remove Account from VS Code`
- `GitLab: Toggle Code Suggestions`
- `GitLab: Toggle Code Suggestions for current language`

Commands this extension extends or integrates with:

- `Git: Clone` - Search for and clone projects for every GitLab instance you set up. [Read more](#clone-gitlab-projects), [Official Documentation](https://code.visualstudio.com/docs/sourcecontrol/overview#_cloning-a-repository)
- `Git: Add Remote...` - Add existing projects as remote from every GitLab instance you set up.

## Setup

This extension requires you to create a GitLab personal access token, and assign it to the extension:

1. [Install the extension](https://marketplace.visualstudio.com/items?itemName=GitLab.gitlab-workflow) from the Visual Studio Marketplace and enable it. If you use an unofficial version of VS Code, install the extension from the [Open VSX Registry](https://open-vsx.org/extension/GitLab/gitlab-workflow).
1. To sign in to your GitLab instance, run the command **GitLab: Authenticate**.
   1. Open Visual Studio Code, then open the command palette by pressing <kbd>Command</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>.
   1. In the command palette, search for **GitLab: Authenticate** and press <kbd>Enter<kbd>.
   1. Select your GitLab instance URL from the offered options, or enter one manually.
      - When manually adding an instance to **URL to GitLab instance**, paste the full URL to your
        GitLab instance, including the `http://` or `https://`. Press <kbd>Enter</kbd> to confirm.
   1. For GitLab.com, you can use the OAuth authentication method.
   1. If you don't use OAuth, use a Personal Access Token to log in.
      - If you have an existing personal access token with `api` scope, select **Enter an existing token** to enter it.
      - If you don't, select **Create a token first**, and the extension opens the PAT settings page for you.
        If this method fails, follow the instructions [in the GitLab documentation](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#create-a-personal-access-token).
   1. Copy the token. _For security reasons, this value is never displayed again, so you must copy this value now._
   1. Paste in your GitLab personal access token and press <kbd>Enter</kbd>. The token is not displayed, nor is it accessible to others.

The extension automatically matches your Git repository remote URL with the GitLab instance URL you specified for your token. If you have multiple accounts or projects, you can choose the one you want to use. See [Account management](#account-management) for more details.

The extension is ready to use. If your project has a pipeline for the last commit, and a merge request from your current branch, information about both is displayed in the Visual Studio Code status bar.

### Set token with environment variables

If you often delete your VS Code storage (such as in Gitpod containers) you can create environment variables before starting VS Code. If you set the token in an environment variable you don't have to set the personal access token every time you delete your VS Code storage.

- `GITLAB_WORKFLOW_INSTANCE_URL`: GitLab instance URL (e.g. `https://gitlab.com`).
- `GITLAB_WORKFLOW_TOKEN`: personal access token, which you created [during setup](#setup).

The token configured in an environment variable is overridden if you configure a token for the same GitLab instance in the extension.

### Self-signed certificate authority

If your GitLab uses a self-signed CA (certificate authority), please read
[the SSL setup guide](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/main/docs/user/ssl.md)
and the [settings for self-signed certificates](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/main/docs/user/troubleshooting.md#settings-for-self-signed-certificates)

## Extension settings

To learn how to change the VS Code Settings, read the official [Settings documentation](https://code.visualstudio.com/docs/getstarted/settings).

If you use self-signed certificates to connect to your GitLab instance, read the
community-contributed
[settings for self-signed certificates](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/main/docs/user/troubleshooting.md#settings-for-self-signed-certificates).

**`gitlab.pipelineGitRemoteName`** _(default: null)_

The name of the Git remote name corresponding to the GitLab repository with your pipelines. If set to `null` or missing, then the extension uses the same remote as for the non-pipeline features.

**`gitlab.debug`** _(default: false)_

Setting this option to `true` enables debug mode. Debug mode improves error stack trace because the extension will use source maps to understand minified code. Debug mode also shows debug log messages in the [extension logs](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/HEAD/docs/user/troubleshooting.md#view-log-files).

**`gitlab.customQueries`**

Defines the search queries that retrieves the items shown on the GitLab Panel. See [Custom Queries documentation](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/main/docs/user/custom-queries.md) for more details.

**`gitlab.duo.enabledWithoutGitlabProject`** _(default: true)_

Set to `true` to keep GitLab Duo features _enabled_ if the extension can't retrieve the project's `duoFeaturesEnabledForProject` setting. When `false`, all GitLab Duo features are disabled if the extension can't retrieve the project's `duoFeaturesEnabledForProject` setting.

The `duoFeaturesEnabledForProject` setting is unavailable if:

- The project is not set up in the extension.
- The project is on a different GitLab instance than your current account.
- The file or folder you are working with isn't part of any GitLab project you have access to.

**`gitlab.duoCodeSuggestions.enabled`** _(default: true)_

Toggle to enable or disable AI assisted code suggestions.

**`gitlab.duoCodeSuggestions.openTabsContext`** _(default: true)_

Toggle to enable or disable sending of context across open tabs to improve Code Suggestions.

**`gitlab.duoCodeSuggestions.enabledSupportedLanguages`**

The supported languages for which to enable Code Suggestions.
By default, all supported languages are enabled.

**`gitlab.duoCodeSuggestions.additionalLanguages`**

(Experimental.) To expand the list of [officially supported languages](https://docs.gitlab.com/ee/user/project/repository/code_suggestions/supported_extensions.html#supported-languages) for Code Suggestions, provide an array of the [language identifiers](https://code.visualstudio.com/docs/languages/identifiers#_known-language-identifiers). This feature is experimental, and the code suggestions quality for the added languages might not be optimal.

## Features in-depth

### Issue and Merge Request details and comments in VS Code

![Issues in Visual Studio Code](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/issues-in-vscode.png)

GitLab Workflow allows you to view issue details and comments right in the VS Code. Click an issue link from the VS Code sidebar to open a new tab with the issue details. You can also comment on the issue from VS Code.

You can use [GitLab Slash Commands](https://docs.gitlab.com/ee/user/project/integrations/gitlab_slack_application.html#slash-commands) to perform actions directly from VS Code. For example, to assign an issue to `@fatihacet`, simply add a comment `/assign @fatihacet` inside VS Code.

#### Merge Request Reviews

GitLab Workflow enables you to review merge requests directly inside the editor:

![Animated gif showing how to review a merge request](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/diff-comments.gif)

1. In VS Code, on the left-hand sidebar, go to **Issues and Merge Requests**.
1. Select the appropriate merge request filter to view a list of merge requests.
1. Expand a relevant merge request to view the description and files changed.
1. Select a file to open it, and view the diff.

From the diff, you can:

- Review and create discussions.
- Resolve and unresolve these discussions.
- Delete and edit individual comments.

### Sidebar: details

Extension will add a GitLab Workflow panel to sidebar of VS Code. The dedicated panel will allow you to see the list of your issues and MRs (you can decide the exact queries by using the [custom queries](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/main/docs/user/custom-queries.md)). Also you will be able to see pipeline, MR and issue links for your current branch.

You can see the issue and MR details by clicking on the issue item or by expanding the MR item and clicking on "Description". When you expand the MR, you can see all the changed files. When you click on a changed file, the extension opens the MR diff.

![_sidebar.gif](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/sidebar.gif)

### View the job output

To view the output of a job directly in VS Code, on the left sidebar, select the job. The output is updated automatically. To view the latest output, select **Scroll to Bottom**.

![view-job-output.png](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/9555acfd02253cb506d2b5e50dee7fde885fbddf/docs/assets/view-job-output.png)

### Security findings

If your project includes [Secure](https://about.gitlab.com/features/?stage=secure) features, then security findings are displayed for the currently checked out branch after you've opened a merge request for that branch and scans have completed. Secure features must be [configured](https://docs.gitlab.com/ee/user/application_security/secure_your_application.html).

![_security_findings.gif](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/8d4b5e106388511c05d098392a14a6b7e746ee29/docs/assets/security_findings.gif)

### Pipeline actions

One of the real power features of this extension is pipeline actions. This feature can be accessible from the status bar by clicking the pipeline status text or command palette and allows you to,

- View the latest pipeline on GitLab
- Create a new pipeline for your current branch
- Retry the last pipeline
- Cancel the last pipeline

![_pipeline_actions.gif](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/pipeline_actions.gif)

### Status bar: details

If your current project is a GitLab project, the extension will do the following things:

- Fetch pipeline of the last commit and show it on the status bar. Clicking this item will open the pipeline actions menu.
- Show open MR for current branch and show it on the status bar. Clicking this item will open MR on GitLab.
- Fetch closing issue of that MR and show it on the status bar. Clicking this item will open Issue on GitLab.

### Search

GitLab Workflow extension provides you two types of search. Search with filters and Advanced Search.

#### Search with filters

It allows users to search issues/MRs against their title and description fields. In the search input, you can type your search term and hit Enter, for example, `Inconsistent line endings for HEX files` or `Pipelines should ignore retried builds`.

It can become more powerful by allowing you to filter issues/MRs by author, assignee, milestone, title etc. Below is the full list of supported filter tokens

| Token     | Description                                                                                                                                                 | Example                                                            |
| --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| title     | Search issues/MRs against their title and description. You don't need to add quotes around multiple words. See [Important notes](#important-notes) section. | discussions refactor                                               |
| labels    | Comma separated label list for multiple labels.                                                                                                             | `labels: frontend, Discussion, performance`                        |
| label     | To search with a single label. You can also have multiple `label` tokens.                                                                                   | `label: frontend` or `label:frontend label: Discussion`            |
| milestone | Milestone title without `%`.                                                                                                                                | `milestone: 9.5`                                                   |
| scope     | Searches issues/MRs for the given scope. Values can be `created-by-me`, `assigned-to-me` or `all`. Defaults to `created-by-me`.                             | `scope: created-by-me` or `scope: assigned-to-me` or `scope: all`. |
| author    | Username of the author without `@`.                                                                                                                         | `author: fatihacet`                                                |
| assignee  | Username of the assignee without `@`.                                                                                                                       | `assignee: timzallmann`                                            |

##### Examples

- `title: new merge request widget author: fatihacet assignee: jschatz1 labels: frontend, performance milestone: 10.5`
- `title: multiple group page author: annabeldunstone assignee: timzallmann label: frontend`

##### Important notes

- `:` after the token name is necessary. `label :` is not a valid token name and may return parsing error. Hence `label:` should be used. However, space after the token name is optional. Both `label: frontend` and `label:frontend` is valid. This rule is valid for all tokens above.
- You don't need to add quotes around multiple words for `title` token. `title:"new merge request widget"` may return parsing error. `title: new merge request widget` should be used.
- You can have `labels` and `label` tokens at the same time. `labels: fronted discussion label: performance` is a valid query and all labels will be included in your search query. It's equal with `labels: fronted discussion performance`. You can also have multiple `label` tokens. `label: frontend label: discussion label: performance` is valid and equals to `labels: fronted discussion performance`.

![Advanced search](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/advanced-search.gif)

#### Search with Advanced Search

GitLab provides [Advanced Search feature which is backed by Elasticsearch](https://docs.gitlab.com/ee/integration/advanced_search/elasticsearch.html). Please see [Advanced Search syntax](https://docs.gitlab.com/ee/user/search/advanced_search.html#syntax) for more details.

### Create snippet

You can create a snippet from selection or entire file. You can also select visibility level of your snippet.

![_create-snippet.gif](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/create-snippet.gif)

### Insert snippet

You can insert public and private project snippets. The insert supports [multi-file snippets](https://docs.gitlab.com/ee/user/snippets.html#multiple-files-by-snippet).

![insert-multi-file-snippet](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/insert-multi-file-snippet.gif)

### Create and apply snippet patch

Creating a snippet patch is a great way to suggest a multi-file change during MR review.

1. Locally check out the branch where you want to suggest changes.
1. Edit the project's code.
1. Run command `GitLab: Create snippet patch`. This stores the result of the `git diff` command in a GitLab snippet in your project.
1. VS Code opens a GitLab web page with the snippet patch. The snippet's description contains instructions on how to apply the patch.
1. Other team members can apply the snippet using the `GitLab: Apply snippet patch` command.

![Create and apply snippet patch](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/snippet-patch.mp4)

### Compare with default branch

You can see changes on GitLab by comparing your branch with the repository's default branch.

![_compare-with-master.gif](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/compare-with-master.gif)

### Open active file

This command allows you to see active file on GitLab. Extension sends active line number and selected text block to GitLab UI so you can see them highlighted.

![_open_active_file.gif](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/open_active_file.gif)

### Validate GitLab CI/CD Configuration

Using this command, you can quickly validate GitLab CI/CD configuration.

![Validate CI/CD configuration](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/validate-ci-config.gif)

### Show merged GitLab CI/CD configuration

This command displays a preview of your merged CI/CD configuration file, with all includes and references resolved.

![Show merged CI/CD configuration](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/e6492d12bab89d6a726046841fcc0f655e0db113/docs/assets/show-merged-ci-config.gif)

### CI/CD variable autocompletion

Quickly find the CI/CD variable you are looking for with the CI/CD variable autocompletion.

![screenshot of the CI/CD variable autocompletion](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/ci_variable_autocomplete.png)

### Clone GitLab projects

This extension integrates with the built-in Git Extension and allows you to search for and clone projects from GitLab (command `Git: Clone`).

- You can search for projects on each GitLab instance for which you [added an access-token](#setup).
- Only projects where you are a **member of** are displayed.
- You can clone with SSH or HTTPS
- With HTTPS, your access token is used to clone the repository, fetch commits, and push commits. Access tokens are used this way for all GitLab projects that are cloned manually with HTTPS, then opened in VS Code.

![Demonstration of cloning a project from GitLab.com](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/d0589878829338b64657e592f3451f1dace41cdf/docs/assets/git-clone.gif)

> **NOTE:** Using the access-token for cloning with HTTPS does not work with VS Code version 1.53.x (See [discussion](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/merge_requests/172#note_513068345))

### Browse a repository without cloning

With this extension, you can browse a GitLab repository without cloning it. While similar to the [GitHub Repositories](https://marketplace.visualstudio.com/items?itemName=github.remotehub) extension, remote GitLab repository browsing is **read-only**.

Prerequisite:

- You have [registered an access token](#setup) for that GitLab instance.

![browse remote repository](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/c8d66e145569749bc05b6b63531eea3dfbb80edb/docs/assets/virtual-workspace.gif)

To open and browse a repository, either:

- Run the **GitLab: Open Remote Repository** command
- Select _Choose Project_ option.
- Select GitLab instance, project and branch/tag that you would like to browse

Alternatively, run the **GitLab: Open Remote Repository** command and select `Enter gitlab-remote URL` option or manually add a `gitlab-remote` URL to your [workspace file](https://code.visualstudio.com/docs/editor/multi-root-workspaces#_workspace-file). For information about how to create GitLab remote URL, please see [GitLab remote URL format documentation](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/main/docs/user/remote-fs-url-format.md)

## Account management

In the extension, you can switch between multiple GitLab accounts. For example, you can add a personal account and work account for `gitlab.com`, and another account for a self-managed instance like `gitlab.gnome.org`.

### How the account and project are selected

To determine which account to use, the extension uses your `git remote` URL. However, sometimes multiple accounts and projects exist. In this case, the extension asks you to select a project and account. For example:

- If you have a single remote URL `git@gitlab.com:gitlab-org/gitlab-vscode-extension.git`, but two accounts for `gitlab.com` (like `@Alice` and `@Bob`).
- If you have a single GitLab account (for example `@Alice`), but you have multiple remotes, like:
  - `origin`: `git@gitlab.com:gitlab-org/gitlab-vscode-extension.git`
  - `personal-fork`: `git@gitlab.com:viktomas/gitlab-vscode-extension.git`

In these cases, the extension needs your input to decide which GitLab project (represented by `git remote` URL) and account it should use.

#### Change the selected project and account

In the GitLab Workflow panel, a **(multiple projects)** label indicates you must choose an account.

![multiple accounts](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/e89c4cb42847263500e923b0aabf238c92062565/docs/assets/multiple-accounts.png)

1. Click the label to select a project-account combination

   ![select project-account combination](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/e89c4cb42847263500e923b0aabf238c92062565/docs/assets/select-project-account.png)

   The list **Issues and Merge requests** list is populated.

   ![issues and MRs](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/e89c4cb42847263500e923b0aabf238c92062565/docs/assets/issues-and-mrs.png)

1. To change your choice, right-click the project label and select **Clear selected project**.

   ![clear selected project](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/raw/e89c4cb42847263500e923b0aabf238c92062565/docs/assets/clear-selected-project.png)

## Roadmap

To learn more about this project's team, processes, and plans, see
the [Create:Editor Extensions Group](https://handbook.gitlab.com/handbook/engineering/development/dev/create/editor-extensions/)
page in the GitLab handbook.

For a list of all open issues in this project, see the
[issues page](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/issues/)
for this project.

---

## Contribution

This extension is open source and [hosted on GitLab](https://gitlab.com/gitlab-org/gitlab-vscode-extension). Contributions are more than welcome. Feel free to fork and add new features or submit bug reports. See [CONTRIBUTING](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/HEAD/CONTRIBUTING.md) for more information.

[A list of the great people](https://gitlab.com/gitlab-org/gitlab-vscode-extension/-/blob/main/CONTRIBUTORS.md) who contributed this project, and made it even more awesome, is available. Thank you all! 🎉
