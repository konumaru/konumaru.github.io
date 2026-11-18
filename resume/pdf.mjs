// Print the resume HTML pages built by build.mjs to PDF with headless Chrome,
// so the web page and the PDF come from the same markdown-it output and CSS.
// Input:  static/resume/index.html, static/resume/en/index.html
// Output: static/resume/resume.pdf, static/resume/en/resume.pdf
// Run: node resume/pdf.mjs   (see `make resume-pdf`; run build.mjs first)
import { existsSync } from "node:fs";
import { fileURLToPath, pathToFileURL } from "node:url";
import { dirname, join } from "node:path";
import puppeteer from "puppeteer";

const here = dirname(fileURLToPath(import.meta.url));
const outDir = join(here, "..", "static", "resume");

const targets = [
  { html: join(outDir, "index.html"), pdf: join(outDir, "resume.pdf") },
  { html: join(outDir, "en", "index.html"), pdf: join(outDir, "en", "resume.pdf") },
];

// Fail loudly instead of hanging if Chrome never comes up or stalls.
const TIMEOUT_MS = 120_000;
setTimeout(() => {
  console.error(`resume PDF generation timed out after ${TIMEOUT_MS / 1000}s`);
  process.exit(1);
}, TIMEOUT_MS).unref();

for (const t of targets) {
  if (!existsSync(t.html)) {
    console.error(`missing ${t.html}; run \`make resume-html\` first`);
    process.exit(1);
  }
}

const browser = await puppeteer.launch({
  args: ["--no-sandbox", "--font-render-hinting=none"],
});

try {
  for (const t of targets) {
    const page = await browser.newPage();
    await page.goto(pathToFileURL(t.html).href, { waitUntil: "load" });
    await page.evaluate(() => document.fonts.ready);
    // page.pdf() renders with print media, so the screen-only overrides in
    // build.mjs, the PDF link, and the copy button stay out of the PDF.
    await page.pdf({
      path: t.pdf,
      format: "A4",
      margin: { top: "15mm", bottom: "15mm", left: "15mm", right: "15mm" },
      printBackground: true,
    });
    await page.close();
    console.log(`wrote ${t.pdf}`);
  }
} finally {
  await browser.close();
}
