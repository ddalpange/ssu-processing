import { globby, fs, $ } from "zx";

const paths = (await globby("./Main/res/images/**/*.png")).map((v) =>
  v.replace("./Main/", "")
);

const result = `
export const imagePaths = {
  ${paths.map((v) => `["${v}"]: "${v}",`).join("\n")}
}
`;

const fileName = "./src/constants/imagePaths.ts";

await fs.writeFile(fileName, result);
$`pnpm prettier --write '${fileName}'`;
