import { globby, fs, $ } from "zx";

const paths = (await globby("./src/scenes/*.ts")).map((v) =>
  v.replace("./src/scenes/", "").replace(".ts", "")
);

const result = `
${paths.map((v) => `import { ${v} } from "../scenes/${v}";`).join("\n")}

export const allScenes = {
  ${paths
    .map(
      (v) => `
    ${v.replace("Scene_", "")}: () => new ${v}(),
  `
    )
    .join("\n")}
}
`;

console.log(paths);
console.log(result);

const fileName = "./src/constants/allScenes.ts";

await fs.writeFile(fileName, result);
$`pnpm prettier --write '${fileName}'`;
