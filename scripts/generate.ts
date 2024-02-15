import * as CodeGen from "elm-codegen"
import * as fs from "fs"
import * as path from "path"

const directoryPath = __dirname



/*function readFilesRecursively(dir: string) {
    const files = fs.readdirSync(dir)
    for (const file of files) {
        const filePath = path.join(dir, file)
        const stat = fs.statSync(filePath)
        if (stat.isFile()) {
            const content = fs.readFileSync(filePath, "utf-8")
            found.push({ path: filePath, contents: content })
        } else if (stat.isDirectory()) {
            readFilesRecursively(filePath)
        }
    }
}*/
//readFilesRecursively(directoryPath)

function readFile(file: string): string {
    const filePath = path.join(directoryPath, file)
    const content = fs.readFileSync(filePath, "utf-8")
    return content;
}

const flags = {
    properties: JSON.parse(readFile("../data/css/properties.json"))
}


CodeGen.run("Generate.elm", {
    debug: true,
    output: "generated",
    flags: flags,
    cwd: "./codegen",
})