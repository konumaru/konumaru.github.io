// Build self-contained resume HTML pages from markdown.
// Output: static/resume/index.html (ja) and static/resume/en/index.html (en),
// each with CSS inlined, noindex + copy button included.
// Run: node resume/build.mjs   (see `make resume-html`)
import { readFileSync, writeFileSync, mkdirSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { dirname, join } from "node:path";
import MarkdownIt from "markdown-it";

const here = dirname(fileURLToPath(import.meta.url));
const repoRoot = join(here, "..");

const css = readFileSync(join(here, "styles", "markdown-theme.css"), "utf8");
const headCustom = readFileSync(join(here, "head-custom.html"), "utf8");

const md = new MarkdownIt({ html: true, linkify: true });

const targets = [
  {
    src: "README.md",
    out: join(repoRoot, "static", "resume", "index.html"),
    lang: "ja",
    title: "職務経歴書 - 小沼塁",
    pdfLabel: "PDF版をダウンロード",
    altHref: "en/",
    altLabel: "English",
  },
  {
    src: "README.en.md",
    out: join(repoRoot, "static", "resume", "en", "index.html"),
    lang: "en",
    title: "Resume - Rui Konuma",
    pdfLabel: "Download PDF",
    altHref: "../",
    altLabel: "日本語版",
  },
];

for (const t of targets) {
  const markdown = readFileSync(join(here, t.src), "utf8");
  const body = md.render(markdown);

  const html = `<!doctype html>
<html lang="${t.lang}">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${t.title}</title>
<style>${css}</style>
<style>
  .pdf-link { text-align: right; font-size: 13px; }
  /* Screen-only overrides: the shared theme CSS is sized for A4 print/PDF,
     so scale type up for comfortable web reading. */
  @media screen {
    #main_content { max-width: 880px; margin: 24px auto; padding: 0 16px; }
    body { font-size: 16px; }
    h1 { font-size: 27px; }
    h2 { font-size: 20px; }
    h3 { font-size: 17px; }
    h4 { font-size: 15px; }
    table { font-size: 14px; }
    .pdf-link { font-size: 14px; }
  }
  @media print { .pdf-link { display: none !important; } }
</style>
${headCustom}
</head>
<body>
<main id="main_content">
<p class="pdf-link"><a href="${t.altHref}">${t.altLabel}</a> | <a href="resume.pdf">${t.pdfLabel}</a></p>
${body}
</main>
</body>
</html>
`;

  mkdirSync(dirname(t.out), { recursive: true });
  writeFileSync(t.out, html);
  console.log(`wrote ${t.out}`);
}
