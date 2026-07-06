# Rui Konuma

Customer-Facing GenAI Engineer / Technical Product Lead

Tokyo, Japan | [konumaru1022@gmail.com](mailto:konumaru1022@gmail.com) | [GitHub](https://github.com/konumaru) | [LinkedIn](https://www.linkedin.com/in/) | [Blog](https://konumaru.com/) | [Kaggle](https://www.kaggle.com/konumaru)

<!-- TODO: replace LinkedIn URL with actual profile slug before submitting -->

## Summary

Customer-facing GenAI engineer and technical product lead with 8 years across machine-learning engineering, data science, and AI product delivery. Experienced in building production-grade GenAI applications, RAG systems, AI agents, and workflow automation tools from discovery and prototyping through deployment and operations. Strong at integrating AI systems with real business workflows, cloud infrastructure, APIs, and SaaS tools.

## Skills

- **GenAI / LLM**: RAG, AI agents, prompt engineering, LLM evaluation & observability (Opik, promptfoo), model selection, OpenAI API / Agents SDK
- **Product**: discovery, requirements definition, A/B testing, stakeholder management
- **Data / ML**: recommender systems, causal inference, forecasting, experiment design; Kaggle Expert
- **Engineering**: Python, TypeScript/Next.js, GCP (Cloud Run), AWS, Supabase, Stripe, Elasticsearch, Playwright, Slack apps

## Experience

### Explaza Inc. — Lead AI Producer (PdM) | Sep 2024 – Present

Generative-AI startup providing AI products and enterprise AI enablement (capital and business alliance with Matsuo Institute; NVIDIA Inception partner).

- Lead client-facing generative-AI projects end-to-end — business discovery, requirements structuring, prototype design, delivery management, and production rollout — for clients in real estate, enterprise, sales, and marketing.
- Launched **project "Camelot"**, an agentic AI for real-estate planning, co-developed with Tokyo Asset Solution Inc. ([publicly announced, Dec 2025](https://explaza.jp/news/20251204)); instrumented the agent with Opik for trace-based debugging and LLM output evaluation.
- Delivered a structured-data-extraction tool for specialized documents, enterprise chatbots, and AI-powered market/competitive research tools, moving each from PoC to implementation.
- Founded **"Biz Agent Ops"** — embedding AI agents into internal business operations (sales, recruiting, marketing, support): a Slack-resident sales agent automating business-card-to-HubSpot workflows, a Chrome extension generating recruiting scout messages, Playwright-based form-outreach automation, and auto-generated help pages — shifting operations previously shared by multiple people, including contract and side-job staff, to being run by a single person. Published the approach externally ([note article](https://note.com/konumr/n/n9e5ce3b72543)).
- Built the team's LLM evaluation and cost-aware model-selection framework; systematized reproducible prompt-design practices and quality-monitoring processes for LLM outputs.

### note Inc. — Technical Product Manager | Sep 2021 – Aug 2024

Media platform where anyone can publish and sell content; one of Japan's largest creator platforms.

- Revamped the home-feed recommendation system to surface content beyond followed creators; designed and ran A/B tests, confirmed improvement in key engagement metrics, and shipped to production ([public case study](https://note.com/info/n/na6401a53bdb2)).
- Led the search-platform migration from AWS CloudSearch to Elasticsearch (team of 1 PM + 2 engineers): clarified business requirements the legacy stack could not meet, improving search relevance, customizability, and operating cost.
- Designed and drove a **content-delivery API hub** (1 PM + 3–4 engineers): a YAML-defined endpoint layer over multiple data sources that replaced one-off integrations and reduced development lead time for content-delivery features.
- Prototyped article categorization and content moderation with the OpenAI API to validate GenAI use in the existing product.

### Repro Inc. — ML Engineer → Associate Product Manager | Jul 2018 – Aug 2021

Mobile marketing SaaS (customer engagement platform).

- Built and validated ML features to automate campaign-operation work — purchase prediction, push-notification send-time optimization, and causal-inference analyses — then moved into product (Associate PM) to bring these prototypes to market through market research, user interviews, and PRD/MRD authoring.
- Client data-science engagements: analytics platform and dashboards on AWS Redshift + Tableau, CTR-prediction models for ad placements, and lead-scoring models.

## Selected Projects

- **[yomitoka](https://yomitoka.com/)** — Japanese-equity AI research service, built and operated solo as a paid production service: aggregates TDnet disclosures, IR, and news per company; weekly themes, company following, and AI chat for reading market changes. Next.js, Supabase, Stripe subscriptions (Free/Pro), Cloudflare. Covers the full loop from product design and implementation to billing and operations; prompt regression testing with promptfoo.
- **[luanti-agent](https://github.com/konumaru/luanti-agent)** — reproducible Docker-based playground for AI-agent experiments on the Luanti voxel game: observation/control API as a Lua mod, FastAPI bot server, Python client implementing an observe→act control loop.
- **Kaggle Expert** — competition medals in [M5 Forecasting – Accuracy](https://www.kaggle.com/c/m5-forecasting-accuracy) (time-series demand forecasting), [CommonLit Readability Prize](https://www.kaggle.com/c/commonlitreadabilityprize) (NLP), and [Predict Student Performance from Game Play](https://www.kaggle.com/competitions/predict-student-performance-from-game-play).
## Writing & Talks

- [Biz Agent Ops](https://note.com/konumr/n/n9e5ce3b72543) (note, Jul 2025) — framing and practice of automating business operations with AI agents
- [Managing multiple Google Cloud projects from the CLI](https://zenn.dev/explaza/articles/7e53353c6b817c) (Zenn, Dec 2025)
- [Building a multilingual real-time voice dialogue system with the ElevenLabs API](https://zenn.dev/explaza/articles/fb0f2a50612397) (Zenn, Nov 2025)
- [Reporting inconsistent docstrings in the OpenAI Agents SDK](https://zenn.dev/explaza/articles/0148bda2326c4e) (Zenn, May 2025)

## Education

**Meiji University** (Tokyo) — B.S. in Frontier Media Science, School of Interdisciplinary Mathematical Sciences | Mar 2019
