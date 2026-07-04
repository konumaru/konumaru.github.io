# Rui Konuma

Lead AI Producer / Technical Product Manager — Tokyo, Japan

[GitHub](https://github.com/konumaru) / [Zenn](https://zenn.dev/konumaru) / [X](https://x.com/konumaruuu_v2) / [Blog](https://konumaru.com/) / [note](https://note.com/konumr) / [SpeakerDeck](https://speakerdeck.com/konumaru) / [Kaggle](https://www.kaggle.com/konumaru)

<!-- TODO: add email / phone before submitting -->

## Summary

AI product lead with 8 years spanning machine-learning engineering, data science, and technical product management. Currently drives generative-AI projects end-to-end at Explaza Inc. — from business discovery with enterprise clients through prototyping, production delivery, and operations. Previously led recommendation, search, and API-platform products as a technical PM at note Inc. (one of Japan's largest content platforms), and built prediction and causal-inference models as an ML engineer at Repro Inc. Solo-builds and operates a paid consumer AI product in production. Strong at translating ambiguous business problems into shipped AI systems.

## Skills

- **GenAI / LLM**: RAG, AI agents, prompt engineering, LLM evaluation and model selection, OpenAI API / Agents SDK
- **Product**: discovery, requirements definition, PRD/MRD, UX design, A/B testing, stakeholder management
- **Data / ML**: recommender systems, causal inference, forecasting, experiment design; Kaggle Expert
- **Engineering**: Python, TypeScript/Next.js, GCP (Cloud Run), AWS, Supabase, Stripe, Elasticsearch, Playwright, Slack apps

## Experience

### Explaza Inc. — Lead AI Producer (PdM) | Sep 2024 – Present

Generative-AI startup providing AI products and enterprise AI enablement (capital and business alliance with Matsuo Institute; NVIDIA Inception partner).

- Lead client-facing generative-AI projects end-to-end — business discovery, requirements structuring, prototype design, delivery management, and production rollout — for clients in real estate, enterprise, sales, and marketing.
- Launched **project "Camelot"**, an agentic AI for real-estate planning, co-developed with Tokyo Asset Solution Inc. ([publicly announced, Dec 2025](https://explaza.jp/news/20251204)).
- Delivered a structured-data-extraction tool for specialized documents, enterprise chatbots, and AI-powered market/competitive research tools, moving each from PoC to implementation.
- Founded **"Biz Agent Ops"** — embedding AI agents into internal business operations (sales, recruiting, marketing, support): a Slack-resident sales agent automating business-card-to-HubSpot workflows, a Chrome extension generating recruiting scout messages, Playwright-based form-outreach automation, and auto-generated help pages — shifting operations previously shared by multiple people, including contract and side-job staff, to being run by a single person. Published the approach externally ([note article](https://note.com/konumr/n/n9e5ce3b72543)).
- Built the team's LLM evaluation and cost-aware model-selection framework; systematized reproducible prompt-design practices and quality-monitoring processes for LLM outputs.

### note Inc. — Technical Product Manager | Sep 2021 – Aug 2024

Media platform where anyone can publish and sell content; one of Japan's largest creator platforms.

- Revamped the home-feed recommendation system to surface content beyond followed creators; designed and ran A/B tests, confirmed improvement in key engagement metrics, and shipped to production ([public case study](https://note.com/info/n/na6401a53bdb2)).
- Led the search-platform migration from AWS CloudSearch to Elasticsearch (team of 1 PM + 2 engineers): clarified business requirements the legacy stack could not meet, improving search relevance, customizability, and operating cost.
- Designed and drove a **content-delivery API hub** (1 PM + 3–4 engineers): a YAML-defined endpoint layer over multiple data sources that replaced one-off integrations and reduced development lead time for content-delivery features.
- Improved new-user sign-up and onboarding funnels, combining qualitative UX fixes with A/B-tested changes; contributed to higher sign-up conversion and internal engagement.
- Prototyped article categorization and content moderation with the OpenAI API to validate GenAI use in the existing product.

### Repro Inc. — ML Engineer → Associate Product Manager | Jul 2018 – Aug 2021

Mobile marketing SaaS (customer engagement platform).

- As Associate PM (Nov 2020 – Aug 2021): moved from ML engineering into product to bring ML prototypes to market — market research, user interviews, and PRD/MRD authoring with the development team.
- Validated ML features to automate campaign-operation work: purchase-prediction models, push-notification send-time optimization, and causal-inference-based analyses of in-app behavior for client reporting.
- Client data-science engagements: built an analytics platform and dashboards on AWS Redshift + Tableau (FOLIO, fintech), CTR-prediction models for ad placements (F@N Communications), and lead-scoring models plus an engineer-recruiting web service (dip).

## Selected Projects

- **[yomitoka](https://yomitoka.com/)** — Japanese-equity AI research service, built and operated solo as a paid production service: aggregates TDnet disclosures, IR, and news per company; weekly themes, company following, and AI chat for reading market changes. Next.js, Supabase, Stripe subscriptions (Free/Pro), Cloudflare. Covers the full loop from product design and implementation to billing and operations.
- **[luanti-agent](https://github.com/konumaru/luanti-agent)** — reproducible Docker-based playground for AI-agent experiments on the Luanti voxel game: observation/control API as a Lua mod, FastAPI bot server, Python client implementing an observe→act control loop.
- **Kaggle Expert** — competition medals in [M5 Forecasting – Accuracy](https://www.kaggle.com/c/m5-forecasting-accuracy) (time-series demand forecasting), [CommonLit Readability Prize](https://www.kaggle.com/c/commonlitreadabilityprize) (NLP), and [Predict Student Performance from Game Play](https://www.kaggle.com/competitions/predict-student-performance-from-game-play).
- **[pycalf](https://github.com/konumaru/pycalf)** — open-source causal-inference library published on PyPI.

## Writing & Talks

- [Biz Agent Ops](https://note.com/konumr/n/n9e5ce3b72543) (note, Jul 2025) — framing and practice of automating business operations with AI agents
- [Managing multiple Google Cloud projects from the CLI](https://zenn.dev/explaza/articles/7e53353c6b817c) (Zenn, Dec 2025)
- [Building a multilingual real-time voice dialogue system with the ElevenLabs API](https://zenn.dev/explaza/articles/fb0f2a50612397) (Zenn, Nov 2025)
- [Reporting inconsistent docstrings in the OpenAI Agents SDK](https://zenn.dev/explaza/articles/0148bda2326c4e) (Zenn, May 2025)
- Speaker, ["AI × Requirements Definition" LT Night](https://explaza.connpass.com/event/397760/) (Jul 2026, hosted by Explaza)
- [Cursor × Marp workshop](https://speakerdeck.com/konumaru/cursor-x-marp-mian-qiang-hui) (May 2025) — internal enablement for AI-assisted slide authoring

<!-- TODO: Education section (school, degree, year) -->
