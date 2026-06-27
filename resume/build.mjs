// Build a self-contained resume HTML from README.md for serving at /resume/.
// Output: static/resume/index.html (CSS inlined, noindex + copy button included).
// Run: node resume/build.mjs   (see `make resume-html`)
import { readFileSync, writeFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { dirname, join } from "node:path";
import MarkdownIt from "markdown-it";

const here = dirname(fileURLToPath(import.meta.url));
const repoRoot = join(here, "..");

const markdown = readFileSync(join(here, "README.md"), "utf8");
const css = readFileSync(join(here, "styles", "markdown-theme.css"), "utf8");
const headCustom = readFileSync(join(here, "head-custom.html"), "utf8");

const md = new MarkdownIt({ html: true, linkify: true });
const body = md.render(markdown);

const html = `<!doctype html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>職務経歴書 - 小沼塁</title>
<style>${css}</style>
<style>
  @media screen {
    #main_content { max-width: 820px; margin: 24px auto; padding: 0 16px; }
  }
  .pdf-link { text-align: right; font-size: 13px; }
  @media print { .pdf-link { display: none !important; } }
</style>
${headCustom}
</head>
<body>
<main id="main_content">
<p class="pdf-link"><a href="resume.pdf">PDF版をダウンロード</a></p>
${body}
</main>
</body>
</html>
`;

const out = join(repoRoot, "static", "resume", "index.html");
writeFileSync(out, html);
console.log(`wrote ${out}`);
