// ATS-first single-column resume.
// Build: typst compile cv.typ
// ATS affordances are deliberate - keep them when editing:
//   * standard section headings (SUMMARY / WORK EXPERIENCE / RESEARCH EXPERIENCE / TECHNICAL SKILLS / EDUCATION)
//   * labeled contact fields, plain-text URLs, smart quotes disabled (ASCII apostrophes/hyphens)
//   * full month names in dates, reverse-chronological roles
//   * no letter-spacing (tracking) on name/headings, no ligatures, no hyphenation
//   * only non-ASCII glyph in the text layer is the "•" bullet
// Content mirrors career-ops-data/cv.md.

#set document(
  title: "Pablo Jakubowicz - Resume",
  author: "Pablo Jakubowicz",
  keywords: (
    "AWS",
    "AWS CDK",
    "CloudFormation",
    "Linux",
    "Go",
    "TypeScript",
    "Python",
    "Jenkins",
    "Docker",
    "Infrastructure as Code",
    "DevOps",
    "Site Reliability",
    "Observability",
  ),
)

#set page(
  paper: "us-letter",
  margin: (top: 0.40in, bottom: 0.40in, left: 0.45in, right: 0.45in),
)
#set text(
  font: ("Palatino", "Libertinus Serif"),
  size: 11pt,
  fill: rgb("#1a1a1a"),
  ligatures: false,
  hyphenate: false,
)
#set par(leading: 0.45em, spacing: 0pt)
// Keep the text layer ASCII: no smart quotes / typographic replacements.
#set smartquote(enabled: false)

#let accent = rgb("#3a5a63")
#let muted = rgb("#5a5a55")
#let section(title, top_gap: 10pt) = block(above: top_gap, below: 6pt, sticky: true)[
  #grid(
    columns: (1fr, auto, 1fr),
    column-gutter: 9pt,
    align: horizon,
    line(length: 100%, stroke: 0.5pt + accent),
    text(weight: "bold", size: 10.8pt, fill: accent)[#title],
    line(length: 100%, stroke: 0.5pt + accent),
  )
]

#let role(company, title, date, location, bullets) = block(above: 0pt, below: 8pt)[
  #block(above: 0pt, below: 5pt, sticky: true)[
    #text(weight: "bold", size: 10.5pt)[#company] #text(size: 10.5pt)[| #title]
    #linebreak()
    #text(size: 9.5pt, fill: muted)[#date | #location]
  ]
  #for (index, item) in bullets.enumerate() {
    block(above: 0pt, below: if index < bullets.len() - 1 { 4pt } else { 0pt })[
      #par(hanging-indent: 11pt)[#box(width: 11pt)[•]#item]
    ]
  }
]

#let inline-item(label, body) = block(above: 0pt, below: 3pt)[
  #text(weight: "bold", size: 10pt)[#label: ]
  #text(size: 10pt)[#body]
]

#let wrapped-inline-item(label, first-line, second-line) = block(above: 0pt, below: 5pt)[
  #text(weight: "bold", size: 10pt)[#label: ]
  #text(size: 10pt)[#first-line]
  #v(3pt)
  #h(12pt)#text(size: 10pt)[#second-line]
]

#block(above: 0pt, below: 0pt, breakable: false)[
  #set align(center)
  #text(weight: "medium", size: 25pt)[Pablo Jakubowicz]
  #v(5pt)
  #text(size: 9.4pt, fill: muted)[LinkedIn: #link("https://www.linkedin.com/in/pablojakubowicz/")[linkedin.com/in/pablojakubowicz] | Website: #link("https://pablojaku.com")[pablojaku.com]]
  #v(7pt)
  #line(length: 100%, stroke: 1.4pt + accent)
  #v(2.2pt)
  #line(length: 100%, stroke: 0.5pt + accent)
]

#section("SUMMARY")
#par[
  Infrastructure engineer with 9+ years of experience in Linux administration and cloud infrastructure for software development teams. I turn infrastructure operations into code through reusable AWS CDK constructs in TypeScript and automation services in Go. At Amazon, I've led multi-region service expansions and safety-gated deployments supporting S3 Glacier.
]

#section("WORK EXPERIENCE")
#role(
  [Amazon], [System Development Engineer II], [September 2022 - Present], [Crystal City, VA],
  (
    [Implemented a firmware-update orchestration service across 8 AWS Regions with staged, safety-gated updates for ~5,000 drives on 1,250 custom hardware units; resulted in zero Sev2 incidents.],
    [Led expansion of 8 services into 5 new AWS Regions; fixed opt-in-region gaps in cross-account S3 policies and IAM/STS endpoints.],
    [Built 6 Go clients for internally vended workflow orchestration, host lifecycle management, and cross-account request-and-response workflows.],
    [Delivered CDK constructs: standardized CloudWatch logging, an AppConfig emergency stop, least-privilege IAM roles, S3 audited access logging, and Step Functions workflows handling custom retry and error logic.],
    [Built shared libraries consumed by up to 9 services supporting S3 Glacier's object storage platform at exabyte scale.],
    [Managed a junior engineer through structured work plans, architectural guidance, and quality checks.],
    [Led end-to-end implementations: design and durability reviews, go/no-go rollout, deployment planning, readiness reviews, and post-launch verification.],
  ),
)
#role(
  [Transcat], [Systems Administrator], [August 2020 - August 2022], [Rochester, NY, USA],
  (
    [Built a Jenkins CI/CD pipeline for a microservices application on AWS ECS.],
    [Migrated infrastructure to CloudFormation, and implemented a SOX-compliant Linux backup and patching solution using AWS Backup and Systems Manager.],
    [Integrated Datadog monitoring and performance dashboards for enterprise applications.],
  ),
)
#role(
  [DealerOn], [Linux Administrator], [September 2016 - July 2018], [Derwood, MD, USA],
  (
    [Maintained 99.99% uptime for a SaaS environment of more than 150 VMware virtual machines while meeting SLA response-time requirements for more than 15 million daily requests through Fastly, NGINX, and Windows IIS.],
    [Deployed and administered multi-node Redis, Elasticsearch, and Riak systems.],
    [Designed real-time performance dashboards using Zabbix, Graylog, PRTG, Grafana, and Opserver.],
  ),
)
#role(
  [DigBang], [Junior Systems Administrator], [February 2013 - January 2016], [Buenos Aires, Argentina],
  (
    [Deployed Atlassian JIRA and related products for the Agile development lifecycle. Integrated Laravel and the Deployer deployment tool.],
    [Administered Linux development and QA servers.],
  ),
)

#section("RESEARCH EXPERIENCE", top_gap: 6pt)
#role(
  [Gallaudet University, Disability and Rehabilitation Research Project], [Research Assistant], [September 2018 - October 2019], [Washington, DC, USA],
  (
    [Surveyed and classified published research papers for Captions DRRP 2019.],
    [Usability research on the impact of different caption punctuation frameworks on user experience.],
  ),
)

#section("TECHNICAL SKILLS", top_gap: 6pt)
#inline-item([Programming Languages], [Go, TypeScript, Python])
#wrapped-inline-item(
  [Cloud & Infrastructure as Code],
  [AWS, AWS CDK, CloudFormation, AWS ECS, AWS Fargate, S3, IAM, CloudWatch,],
  [AppConfig, Step Functions, AWS Backup, Systems Manager],
)
#inline-item([CI/CD & Automation], [Jenkins, Docker])
#inline-item([Systems Engineering], [Linux, VMware, NGINX, Windows IIS, Fastly])
#inline-item([Observability & Data Platforms], [Datadog, Grafana, Graylog, Zabbix, PRTG, Opserver, Redis, Elasticsearch, Riak])

#section("EDUCATION", top_gap: 6pt)
#text(weight: "bold", size: 9.7pt)[Gallaudet University, Washington, DC]
#linebreak()
#text(weight: "medium", size: 9.7pt)[Bachelor of Science in Information Technology (B.S.) #h(1fr)May 2020]
