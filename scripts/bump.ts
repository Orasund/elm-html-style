import fs from 'fs';
import childProcess from 'child_process';
import * as path from "path"

const directoryPath = __dirname

function readFile(file: string): string {
    const filePath = path.join(directoryPath, file)
    const content = fs.readFileSync(filePath, "utf-8")
    return content;
}

function writeFile(file: string, content: string) {
    const filePath = path.join(directoryPath, file)
    fs.writeFileSync(filePath, content)
}

const elmJson = JSON.parse(readFile("../elm.json"))
const version: string = elmJson.version
const [major, minor, batch] = version.split(".")
const newVersion = major + "." + (parseInt(minor) + 1) + "." + batch
elmJson.version = newVersion
writeFile("../elm.json", JSON.stringify(elmJson, null, 4))
childProcess.execSync("echo \"version=" + newVersion + "\" >> \"$GITHUB_OUTPUT\"");
//childProcess.execSync("git tag -a " + newVersion + " -m \"new release\"")
//childProcess.execSync("git push origin " + newVersion)