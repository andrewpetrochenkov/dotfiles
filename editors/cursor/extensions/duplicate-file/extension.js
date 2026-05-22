const vscode = require("vscode");
const path = require("path");
const fs = require("fs");

async function duplicateFile() {
  const editor = vscode.window.activeTextEditor;
  if (!editor) {
    return;
  }

  const src = editor.document.uri.fsPath;
  if (!src || editor.document.isUntitled) {
    vscode.window.showWarningMessage("Сохраните файл перед дублированием");
    return;
  }

  const ext = path.extname(src);
  const base = path.basename(src, ext);
  const dst = path.join(path.dirname(src), `${base} copy${ext}`);

  try {
    await fs.promises.copyFile(src, dst);
    const doc = await vscode.workspace.openTextDocument(dst);
    await vscode.window.showTextDocument(doc);
  } catch (err) {
    vscode.window.showErrorMessage(`${err.name}: ${err.message}`);
  }
}

/** @param {vscode.ExtensionContext} context */
function activate(context) {
  context.subscriptions.push(
    vscode.commands.registerCommand("duplicate-file.duplicate", duplicateFile)
  );
}

function deactivate() {}

module.exports = { activate, deactivate };
