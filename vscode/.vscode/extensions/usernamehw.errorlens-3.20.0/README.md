[![Version](https://img.shields.io/visual-studio-marketplace/v/usernamehw.errorlens)](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)
[![Installs](https://img.shields.io/visual-studio-marketplace/i/usernamehw.errorlens)](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)
[![Rating](https://img.shields.io/visual-studio-marketplace/r/usernamehw.errorlens)](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)
[![OpenVSX Downloads](https://shields.io/open-vsx/dt/usernamehw/errorlens?label=OpenVSX%20Downloads)](https://open-vsx.org/extension/usernamehw/errorlens)

ErrorLens turbo-charges language diagnostic features by making diagnostics stand out more prominently, highlighting
the entire line wherever a diagnostic is generated by the language and also prints the message inline.

![Demo image](https://raw.githubusercontent.com/usernamehw/vscode-error-lens/master/img/demo.png)

## Features

- Highlight lines containing diagnostics
- Append diagnostic as text to the end of the line
- Show icons in gutter
- Show message in status bar

<!-- COMMANDS_START -->
## Commands (13)

|Command|Description|
|-|-|
|errorLens.toggle|Error Lens: Toggle (Enable/Disable) Everything (toggle global setting `"errorLens.enabled"`)|
|errorLens.toggleError|Error Lens: Enable/Disable Errors in `"errorLens.enabledDiagnosticLevels"` setting.|
|errorLens.toggleWarning|Error Lens: Enable/Disable Warnings in `"errorLens.enabledDiagnosticLevels"` setting.|
|errorLens.toggleInfo|Error Lens: Enable/Disable Info in `"errorLens.enabledDiagnosticLevels"` setting.|
|errorLens.toggleHint|Error Lens: Enable/Disable Hint in `"errorLens.enabledDiagnosticLevels"` setting.|
|errorLens.toggleInlineMessage|Error Lens: Toggle global setting `"errorLens.messageEnabled"`.|
|errorLens.searchForProblem|Error Lens: Open problem in default browser (controlled by `errorLens.searchForProblemQuery` setting).|
|errorLens.selectProblem|Error Lens: Set editor selection to the problem range (controlled by `errorLens.selectProblemType` setting).|
|errorlens.toggleWorkspace|Error Lens: Exclude/Include current workspace by fs path.|
|errorLens.disableLine|Error Lens: Add a comment to disable line for linter rule. Comment format is controlled by `"errorLens.disableLineComments"` setting.|
|errorLens.findLinterRuleDefinition|Error Lens: Search in local linter files (like `.eslintrc.json`) for the rule definition.|
|errorLens.copyProblemMessage|Error Lens: Copy problem message to the clipboard (at the active cursor).|
|errorLens.copyProblemCode|Error Lens: Copy problem code to the clipboard (at the active cursor).|
<!-- COMMANDS_END -->
<!-- SETTINGS_START -->
## Settings (71)

> **Error Lens** extension settings start with `errorLens.`

|Setting|Default|Description|
|-|-|-|
|enabled|**true**|Controls all decorations and features (except commands).|
|respectUpstreamEnabled|\{"enabled":true, "inlineMessage":true, "gutter":true, "statusBar":false\}|When enabled - extension will take into account global VSCode setting `#problems.visibility#`. ([1.85.0 changelog](https://code.visualstudio.com/updates/v1_85#_hide-problem-decorations)).|
|enabledInMergeConflict|**true**|Controls if decorations are shown if the editor has git merge conflict indicators `<<<<<<<` or `=======` or `>>>>>>>`.|
|fontFamily|""|Font family of inline message.|
|fontWeight|"normal"|Font weight of inline message. `"normal"` is alias for 400, `"bold"` is alias for 700).|
|fontStyleItalic|**false**|When enabled - shows inline message in italic font style.|
|fontSize|""|Font size of inline message ([CSS units](https://developer.mozilla.org/en-US/docs/Web/CSS/length)).|
|margin|"4ch"|Distance between the last word on the line and the start of inline message ([CSS units](https://developer.mozilla.org/en-US/docs/Web/CSS/length)).|
|alignMessage|\{"start":0, "end":0, "minimumMargin":0\}|Align inline error message (either by starting position or ending position).|
|padding|""|Padding of the inline message. Visible when `#errorLens.messageBackgroundMode#` is set to "message".|
|borderRadius|"0.2em"|Border radius of the inline message. Visible when `#errorLens.messageBackgroundMode#` is set to "message".|
|enabledDiagnosticLevels|\["error", "warning", "info"\]|Customize which diagnostic levels(severity) to highlight.|
|messageTemplate|"$message"|Template used for all inline messages. Whitespace between items is important.<br>List of variables:<br>- `$message` - diagnostic message text<br>- `$count` - Number of diagnostics on the line<br>- `$severity` - Severity prefix taken from `#errorLens.severityText#`<br>- `$source` - Source of diagnostic e.g. "eslint"<br>- `$code` - Code of the diagnostic|
|messageMaxChars|**500**|Cut off inline message if it's longer than this value. (Improves performance when the diagnostic message is long).|
|severityText|\["⛔", "⚠", "ℹ", "🍏"\]|Replaces `$severity` variable in `#errorLens.messageTemplate#`.|
|messageEnabled|**true**|Controls whether inline message is shown or not (Including background highlight).|
|messageBackgroundMode|"line"|Controls how inline message is highlighted in the editor (entire line / only message / none).|
|problemRangeDecorationEnabled|**false**|When checked - highlight the entire problem range.|
|editorHoverPartsEnabled|\{"messageEnabled":false, "sourceCodeEnabled":false, "buttonsEnabled":false\}|Controls which parts of the editor hover tooltip to show.|
|statusBarIconsEnabled|**false**|When enabled - shows highlighted error/warning icons in status bar.|
|statusBarIconsPriority|**-9000**|Move status bar icons left or right by adjusting the number priority.|
|statusBarIconsAlignment|"left"|Choose on which side the icons status bar is on: left or right.|
|statusBarIconsTargetProblems|"all"|Which problems to use for counting problems at icons status bar.|
|statusBarIconsUseBackground|**true**|When enabled - highlights status bar icons with background, when disabled - with foreground.|
|statusBarIconsAtZero|"removeBackground"|What to do when there are 0 errors/warnings - hide the item or strip its background color.|
|statusBarMessageEnabled|**false**|When enabled - shows message in status bar.|
|statusBarMessagePriority|**-10000**|Move status bar message left or right by adjusting the number priority.|
|statusBarMessageAlignment|"left"|Choose on which side the message status bar is on: left or right.|
|statusBarColorsEnabled|**false**|When enabled - use message decoration foreground as color of Status Bar text.|
|statusBarMessageType|"activeLine"|Pick what to show in Status Bar: closest message or only message for the active line.|
|statusBarCommand|"goToProblem"|Pick command that activates on click for Status Bar.|
|statusBarMessageTemplate|""|Template for status bar message. Whitespace between items is important.<br>List of variables:<br>- `$message` - diagnostic message text<br>- `$count` - Number of diagnostics on the line<br>- `$severity` - Severity prefix taken from `#errorLens.severityText#`<br>- `$source` - Source of diagnostic e.g. "eslint"<br>- `$code` - Code of the diagnostic|
|replace|\[\]|Specify message to transform. E.g. if this is configured to [{ matcher: 'foo (.*)', message: 'just $1' }], the message 'foo bar' would be displayed as 'just bar'.|
|exclude|\[\]|Specify messages that should not be highlighted (RegExp). Strings passed to the RegExp constructor: `new RegExp(EXCLUDE_ITEM, 'i');`|
|excludeBySource|\[\]|Specify `source` or `source(code)` pair to exclude. Examples:<br>- `eslint` disable all ESLint problems<br>- `eslint(padded-blocks)` disable `padded-blocks` rule of ESLint<br>- `Pylance` disable all Pylance linter problems<br>- `Pylance(reportUndefinedVariable)` disable `reportUndefinedVariable` rule of Pylance|
|excludePatterns|\[\]|Exclude files by using [glob](https://code.visualstudio.com/docs/editor/glob-patterns) pattern. Example `["**/*.{ts,js}"]`|
|excludeWorkspaces|\[\]|Exclude workspaces by path.|
|disableLineComments|\{...\}|Used for `errorLens.disableLine` command that adds a comment disabling linter rule for a line.<br>To force comment on the same line - add `SAME_LINE` to the message: `"eslint": "// eslint-disable-line $code SAME_LINE"`|
|lintFilePaths|\{...\}|Specify where to search for linter rule definitions by diagnostic source ([glob](https://code.visualstudio.com/docs/editor/glob-patterns) for local linter files). `node_modules` folder is excluded.|
|searchForProblemQuery|"https://duckduckgo.com/?q=$message"|Pick query to open in default browser when searching for problem with `errorLens.searchForProblem` command.|
|selectProblemType|"closestProblem"|Which problem to select (closest / active line) when executing `errorLens.selectProblem` command.|
|light||Specify color of decorations for when the light color theme is active.|
|delay|**0**|Delay (ms) before showing problem decorations (**0** to disable). Minimum delay of **500** is enforced by the extension. `#errorLens.delayMode#` controls how to handle the delay.|
|delayMode|"new"|Pick which version of the delay to use.|
|onSave|**false**|When enabled - updates decorations only on document save (manual).|
|onSaveTimeout|**1000**|Time period (ms) that used for showing decorations after the document save.|
|onSaveUpdateOnActiveEditorChange|**true**|When `#errorLens.onSave#` enabled - extension still draws decorations when active/visible editors change.|
|enableOnDiffView|**false**|Enable decorations when viewing a diff view in the editor (e.g. Git diff).|
|followCursor|"allLines"|Highlight only portion of the problems.|
|followCursorMore|**0**|Augments `#errorLens.followCursor#`.<br>Adds number of lines to top and bottom when `#errorLens.followCursor#` is set to `activeLine`.<br> Adds number of closest problems when `#errorLens.followCursor#` is `closestProblem`|
|gutterIconsEnabled|**false**|When enabled - shows gutter icons (In place of the debug breakpoint icon).|
|gutterIconsFollowCursorOverride|**true**|When enabled and `#errorLens.followCursor#` setting is not `allLines`, then gutter icons would be rendered for all problems. But line decorations (background, message) only for active line.|
|gutterIconSize|"100%"|Change gutter icon size. Examples: `auto`, `contain`, `cover`, `50%`, `150%` ([CSS units](https://developer.mozilla.org/en-US/docs/Web/CSS/background-size)).|
|gutterIconSet|"default"|Change gutter icon style.|
|gutterEmoji|\{"error":"💀", "warning":"😞", "info":"🆗", "hint":"🍏"\}|Pick emoji symbol for gutter icon when `#errorLens.gutterIconSet#` is `emoji`.|
|errorGutterIconPath|""|Absolute path to error gutter icon.|
|warningGutterIconPath|""|Absolute path to warning gutter icon.|
|infoGutterIconPath|""|Absolute path to info gutter icon.|
|hintGutterIconPath|""|Absolute path to hint gutter icon.|
|errorGutterIconColor|"\#e45454"|Error color of simple gutter icons (shapes and letters).|
|warningGutterIconColor|"\#ff942f"|Warning color of simple gutter icons (shapes and letters).|
|infoGutterIconColor|"\#00b7e4"|Info color of simple gutter icons (shapes and letters).|
|hintGutterIconColor|"\#2faf64"|Hint color of simple gutter icons (shapes and letters).|
|removeLinebreaks|**true**|When enabled - replaces line breaks in inline diagnostic message with whitespaces.|
|replaceLinebreaksSymbol|"⏎"|Symbol to replace linebreaks. Requires enabling `#errorLens.removeLinebreaks#`.|
|scrollbarHackEnabled|**false**|When enabled - prevents showing horizontal scrollbar in editor (caused by inline decorations). Also prevents mouse hover at inline message.|
|ignoreUntitled|**false**|Controls whether to run on untitled (unsaved) files.|
|codeLensEnabled|**false**|Controls whether to show the Error Lens as a Code Lens above the code. |
|codeLensLength|\{"min":0, "max":200\}|Enforce minimum length of the first code lens item and max length of subsequent items.|
|codeLensTemplate|"$severity&nbsp;$message"|Template used for all messages appearing in the `#errorLens.codeLensEnabled#`. Whitespace between items is important.<br>List of variables:<br>- `$message` - diagnostic message text<br>- `$count` - Number of diagnostics on the line<br>- `$severity` - Severity prefix taken from `#errorLens.severityText#`<br>- `$source` - Source of diagnostic e.g. "eslint"<br>- `$code` - Code of the diagnostic|
|codeLensOnClick|"showQuickFix"|Controls what do on clicking the `#errorLens.codeLensEnabled#`.|
<!-- SETTINGS_END -->
<!-- COLORS_START -->
## Colors (30)

Can be specified in `settings.json` (**`workbench.colorCustomizations`** section)

|Color|Dark|Light|HC|Description|
|-|-|-|-|-|
|errorLens.errorBackground|`#e454541b`|`#e4545420`|`#e454541b`|Background color of the entire line containing error.|
|errorLens.errorMessageBackground|`#e4545419`|`#e4545419`|`#e4545419`|Background color of the error message.|
|errorLens.errorRangeBackground|`#e4545419`|`#e4545419`|`#e4545419`|Background color of the error range (when errorLens.problemRangeDecorationEnabled setting enabled).|
|errorLens.errorBackgroundLight|`#e4545420`|`#e4545420`|`#e4545420`|Background color of the entire line containing error (Only in light themes).|
|errorLens.errorForeground|`#ff6464`|`#e45454`|`#ff6464`|Text color used to highlight lines containing errors.|
|errorLens.errorForegroundLight|`#e45454`|`#e45454`|`#e45454`|Text color used to highlight lines containing errors (Only in light themes).|
|errorLens.warningBackground|`#ff942f1b`|`#ff942f20`|`#ff942f1b`|Background color used to highlight lines containing warnings.|
|errorLens.warningMessageBackground|`#ff942f19`|`#ff942f19`|`#ff942f19`|Background color of the warning message.|
|errorLens.warningRangeBackground|`#ff942f19`|`#ff942f19`|`#ff942f19`|Background color of the warning range (when errorLens.problemRangeDecorationEnabled setting enabled).|
|errorLens.warningBackgroundLight|`#ff942f20`|`#ff942f20`|`#ff942f20`|Background color used to highlight lines containing warnings (Only in light themes).|
|errorLens.warningForeground|`#fa973a`|`#ff942f`|`#fa973a`|Text color used to highlight lines containing warnings.|
|errorLens.warningForegroundLight|`#ff942f`|`#ff942f`|`#ff942f`|Text color used to highlight lines containing warnings (Only in light themes).|
|errorLens.infoBackground|`#00b7e420`|`#00b7e420`|`#00b7e420`|Background color used to highlight lines containing info.|
|errorLens.infoMessageBackground|`#00b7e419`|`#00b7e419`|`#00b7e419`|Background color of the info message.|
|errorLens.infoRangeBackground|`#00b7e419`|`#00b7e419`|`#00b7e419`|Background color of the info range (when errorLens.problemRangeDecorationEnabled setting enabled).|
|errorLens.infoBackgroundLight|`#00b7e420`|`#00b7e420`|`#00b7e420`|Background color used to highlight lines containing info (Only in light themes).|
|errorLens.infoForeground|`#00b7e4`|`#00b7e4`|`#00b7e4`|Text color used to highlight lines containing info.|
|errorLens.infoForegroundLight|`#00b7e4`|`#00b7e4`|`#00b7e4`|Text color used to highlight lines containing info (Only in light themes).|
|errorLens.hintBackground|`#17a2a220`|`#17a2a220`|`#17a2a220`|Background color used to highlight lines containing hints.|
|errorLens.hintMessageBackground|`#17a2a219`|`#17a2a219`|`#17a2a219`|Background color of the hint message.|
|errorLens.hintRangeBackground|`#17a2a219`|`#17a2a219`|`#17a2a219`|Background color of the hint range (when errorLens.problemRangeDecorationEnabled setting enabled).|
|errorLens.hintBackgroundLight|`#17a2a220`|`#17a2a220`|`#17a2a220`|Background color used to highlight lines containing hints (Only in light themes).|
|errorLens.hintForeground|`#2faf64`|`#2faf64`|`#2faf64`|Text color used to highlight lines containing hints.|
|errorLens.hintForegroundLight|`#2faf64`|`#2faf64`|`#2faf64`|Text color used to highlight lines containing hints (Only in light themes).|
|errorLens.statusBarIconErrorForeground|`#ff6464`|`#e45454`|`#ff6464`|Status bar icon item error color. Foreground is used when the `errorLens.statusBarIconsUseBackground` setting is disabled.|
|errorLens.statusBarIconWarningForeground|`#fa973a`|`#ff942f`|`#fa973a`|Status bar icon item error color. Foreground is used when the `errorLens.statusBarIconsUseBackground` setting is disabled.|
|errorLens.statusBarErrorForeground|`#ff6464`|`#e45454`|`#ff6464`|Status bar item error color.|
|errorLens.statusBarWarningForeground|`#fa973a`|`#ff942f`|`#fa973a`|Status bar item warning color.|
|errorLens.statusBarInfoForeground|`#00b7e4`|`#00b7e4`|`#00b7e4`|Status bar item info color.|
|errorLens.statusBarHintForeground|`#2faf64`|`#2faf64`|`#2faf64`|Status bar item hint color.|
<!-- COLORS_END -->

> Line highlighting depends on the **`"errorLens.messageBackgroundMode"`** setting.

> `#fff0` - Completely transparent color.

## Upstream issues

Please upvote the following VS Code issues:

- [Api for editor insets (💀 Locked)](https://github.com/microsoft/vscode/issues/85682)
- [Access theme's colors programmatically](https://github.com/microsoft/vscode/issues/32813)
- [Inline text adornments break word wrapping](https://github.com/microsoft/vscode/issues/32856)
- [Support hover decorations over the line numbers i.e. gutter](https://github.com/microsoft/vscode/issues/28080)

<!-- ## More Documentation

https://github.com/usernamehw/vscode-error-lens/tree/master/docs/docs.md -->