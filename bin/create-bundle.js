const path = require("path");
const fs = require("fs");

const workspaceFolder = path.resolve(__dirname, "..");
const sourceDir = workspaceFolder;
const targetDir = path.join(workspaceFolder, "target");
const targetDirOutput = path.join(targetDir, "HungryPetNotification");

const blacklistFolder = ["target", ".vscode", "bin"];
const blacklistPatterns = [/.*\.code-workspace$/];

function clean() {
    if (fs.existsSync(targetDir)) {
        fs.rmSync(targetDir, { recursive: true, force: true });
    }
}

function ignore(name) {
    if (blacklistFolder.includes(name)) {
        return true;
    }
    return blacklistPatterns.some(pattern => pattern.test(name));
}

function copyRecursive(src, dest) {
    if (!fs.existsSync(dest)) {
        fs.mkdirSync(dest, { recursive: true });
    }

    const entries = fs.readdirSync(src, { withFileTypes: true });

    for (const entry of entries) {
        const srcPath = path.join(src, entry.name);
        const destPath = path.join(dest, entry.name);

        // Ignorieren, wenn in der Ignore-Liste
        if (ignore(entry.name)) {
            continue;
        }

        if (entry.isDirectory()) {
            // Unterordner rekursiv kopieren
            copyRecursive(srcPath, destPath);
        } else if (entry.isFile()) {
            fs.copyFileSync(srcPath, destPath);
        }
    }
}


clean();
copyRecursive(sourceDir, targetDirOutput);
console.log("Addon bundle created in:", targetDir);