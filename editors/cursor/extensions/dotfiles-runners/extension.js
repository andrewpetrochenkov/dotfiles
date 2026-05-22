const vscode = require("vscode");
const path = require("path");

/** @type {Record<string, import('./extension.js').Runner>} */
const RUNNERS = {
  python: {
    shell: (file) => `python3 -u ${quote(file)}`,
    env: { PYTHONIOENCODING: "UTF-8", LANG: "ru_RU.UTF-8" },
    cwd: "fileDir",
  },
  shellscript: {
    shell: (file) => `bash -l ${quote(file)}`,
    cwd: "workspace",
  },
  makefile: {
    shell: (file) => `make -f ${quote(file)} all`,
    cwd: "fileDir",
  },
  javascript: {
    shell: (file) => `node ${quote(file)}`,
    env: { NODE_PATH: "/usr/local/lib/node_modules" },
    cwd: "fileDir",
  },
  php: {
    shell: (file) => `php ${quote(file)}`,
    env: { SUBLIME_TEXT: "true" },
    cwd: "fileDir",
  },
  sql: {
    shell: (file) => `sql ${quote(file)}`,
    cwd: "workspace",
  },
  html: {
    shell: (file) => `html ${quote(file)}`,
    cwd: "fileDir",
  },
  awk: {
    shell: (file, ctx) =>
      `awk -f ${quote(file)} ${quote(path.join(ctx.workspaceFolder, "awk.in"))}`,
    cwd: "workspace",
  },
  applescript: {
    shell: (file) => `osascript ${quote(file)}`,
    cwd: "fileDir",
  },
  swift: {
    shell: (file) => `swift ${quote(file)}`,
    cwd: "fileDir",
  },
};

/** languageId / extension → runner key */
const BY_LANG = {
  python: "python",
  shellscript: "shellscript",
  makefile: "makefile",
  javascript: "javascript",
  php: "php",
  sql: "sql",
  html: "html",
  awk: "awk",
  applescript: "applescript",
  swift: "swift",
};

const BY_EXT = {
  ".py": "python",
  ".sh": "shellscript",
  ".bash": "shellscript",
  ".mk": "makefile",
  ".mak": "makefile",
  ".make": "makefile",
  ".js": "javascript",
  ".mjs": "javascript",
  ".cjs": "javascript",
  ".php": "php",
  ".sql": "sql",
  ".html": "html",
  ".htm": "html",
  ".awk": "awk",
  ".scpt": "applescript",
  ".applescript": "applescript",
  ".swift": "swift",
};

function quote(p) {
  return `'${String(p).replace(/'/g, "'\\''")}'`;
}

function workspaceFolderUri() {
  const folders = vscode.workspace.workspaceFolders;
  if (!folders || folders.length === 0) {
    return undefined;
  }
  return folders[0].uri.fsPath;
}

function resolveCwd(kind, filePath) {
  if (kind === "workspace") {
    return workspaceFolderUri() || path.dirname(filePath);
  }
  return path.dirname(filePath);
}

/**
 * @param {string} runnerKey
 */
async function runRunner(runnerKey) {
  const editor = vscode.window.activeTextEditor;
  if (!editor) {
    vscode.window.showWarningMessage("Нет активного редактора");
    return;
  }

  const filePath = editor.document.uri.fsPath;
  if (!filePath || editor.document.isUntitled) {
    vscode.window.showWarningMessage("Сохраните файл перед запуском");
    return;
  }

  const runner = RUNNERS[runnerKey];
  if (!runner) {
    vscode.window.showWarningMessage(`Runner не найден: ${runnerKey}`);
    return;
  }

  const ctx = { workspaceFolder: workspaceFolderUri() || path.dirname(filePath) };
  const cwd = resolveCwd(runner.cwd, filePath);
  let command = runner.shell(filePath, ctx);

  if (runner.env) {
    const exports = Object.entries(runner.env)
      .map(([k, v]) => `export ${k}=${quote(v)}`)
      .join("; ");
    command = `${exports}; ${command}`;
  }

  const terminal = vscode.window.createTerminal({
    name: `Run: ${path.basename(filePath)}`,
    cwd,
  });
  terminal.show();
  terminal.sendText(command);
}

function detectRunnerKey() {
  const editor = vscode.window.activeTextEditor;
  if (!editor) {
    return undefined;
  }
  const lang = editor.document.languageId;
  if (BY_LANG[lang]) {
    return BY_LANG[lang];
  }
  const ext = path.extname(editor.document.fileName).toLowerCase();
  return BY_EXT[ext];
}

/** @param {vscode.ExtensionContext} context */
function activate(context) {
  const runAuto = vscode.commands.registerCommand("dotfiles-runners.run", async () => {
    const key = detectRunnerKey();
    if (!key) {
      vscode.window.showWarningMessage(
        "Неизвестный тип файла для запуска (нет runner)"
      );
      return;
    }
    await runRunner(key);
  });

  const commandIds = {
    python: "dotfiles-runners.runPython",
    shellscript: "dotfiles-runners.runBash",
    makefile: "dotfiles-runners.runMake",
    javascript: "dotfiles-runners.runNode",
    php: "dotfiles-runners.runPhp",
    sql: "dotfiles-runners.runSql",
    html: "dotfiles-runners.runHtml",
    awk: "dotfiles-runners.runAwk",
    applescript: "dotfiles-runners.runApplescript",
    swift: "dotfiles-runners.runSwift",
  };
  const named = Object.keys(RUNNERS).map((key) =>
    vscode.commands.registerCommand(commandIds[key], () => runRunner(key))
  );

  context.subscriptions.push(runAuto, ...named);
}

function deactivate() {}

module.exports = { activate, deactivate };
