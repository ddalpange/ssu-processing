const sharp = require("sharp");

import { globby } from "zx";
import fs from "node:fs/promises";
const compressImage = async (filePath) => {
  const outputPath = `${filePath}.output.png`;
  return new Promise((resolve, reject) => {
    sharp(filePath)
      .png({
        compressionLevel: 9, // 최대 압축
        quality: 80, // 품질 설정 (0-100)
        adaptiveFiltering: true, // 적응형 필터링
        palette: true, // 팔레트 기반 PNG
      })
      .withMetadata()
      .toFile(outputPath, function (err) {
        if (err) {
          reject(err);
        } else {
          resolve(outputPath);
        }
      });
  });
};

const main = async () => {
  const files = await globby("./**/*.png");
  for (const file of files) {
    try {
      const inputPath = `./${file}`;
      const outputPath = await compressImage(inputPath);
      await fs.rm(inputPath);
      await fs.rename(outputPath, inputPath);
    } catch (e) {
      console.error(e);
    }
  }
};

main();
