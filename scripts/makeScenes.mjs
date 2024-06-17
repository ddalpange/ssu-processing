import { globby, fs, $ } from "zx";

const paths = (await globby("./src/scenes/*.ts")).map((v) =>
    v.replace("./src/scenes/", "").replace(".ts", "")
).filter((v) => /\d/.test(v));

const result = `
import { BaseScene } from "../interfaces/BaseScene";
${paths.map((v) => `import { ${v} } from "../scenes/${v}";`).join("\n")}

import { Scene_Intro_New } from "../scenes/Scene_Intro_New";

export const allScenes: Record<number, () => BaseScene>  = {
    ${paths
        .map(
            (v) => `
        ${v.replace("Scene_", "")}: () => new ${v}(),
    `
        )
        .join("\n")}
}

export const allSceneNumbers: number[] = [
    ${paths.map((v) => v.replace("Scene_", "")).join(",\n  ")}
];

export function createIntroScene(): BaseScene {
    return new Scene_Intro_New();
}
`;

console.log(paths);
console.log(result);

const fileName = "./src/constants/allScenes.ts";

await fs.writeFile(fileName, result);
$`pnpm prettier --write '${fileName}'`;
