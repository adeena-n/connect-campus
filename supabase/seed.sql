-- CampusConnect Production Supabase PostgreSQL Seed Data
-- Contains 14 Student Profiles, 25 Gigs, 26 Applications, 10 Reviews

BEGIN;

-- 1. Seed Users (14 Students)
INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (1, 'sara.ahmed@campus.edu', 'Sara Ahmed', 'Computer Science', 3, 'Passionate frontend developer specializing in responsive modern React interfaces and accessible design systems.', ARRAY['React', 'UI Design', 'TypeScript', 'Tailwind CSS']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (2, 'ali.khan@campus.edu', 'Ali Khan', 'Software Engineering', 4, 'Backend architecture enthusiast. Experienced in Node.js, Express, Python REST APIs, and database optimization.', ARRAY['Node.js', 'Python', 'PostgreSQL', 'Express', 'API Design']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (3, 'maya.chen@campus.edu', 'Maya Chen', 'Graphic Design', 5, 'Visual and brand designer. Love crafting modern vector illustrations, club identities, and UI mockups in Figma.', ARRAY['Figma', 'Illustrator', 'Branding', 'Logo Design']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (4, 'liam.oconnor@campus.edu', 'Liam O''Connor', 'English Literature', 6, 'Senior writing fellow and academic editor. Helping peers polish research papers, thesis proposals, and statements of purpose.', ARRAY['Academic Writing', 'Proofreading', 'Essays', 'MLA/APA Style']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (5, 'priya.patel@campus.edu', 'Priya Patel', 'Mathematics & CS', 2, 'Peer tutor passionate about breaking down complex math concepts: linear algebra, multivariable calculus, and proofs.', ARRAY['Calculus', 'Linear Algebra', 'Python', 'Discrete Math']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (6, 'david.kim@campus.edu', 'David Kim', 'Interaction Design', 4, 'UX researcher and interactive prototype builder. Focused on usability testing and intuitive user flows.', ARRAY['Figma', 'Wireframing', 'User Testing', 'CSS Animation']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (7, 'fatima.almansoor@campus.edu', 'Fatima Al-Mansoor', 'Data Science', 5, 'Data science student focused on predictive modeling, exploratory data analysis, and scientific Python.', ARRAY['Python', 'Pandas', 'Machine Learning', 'Statistics']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (8, 'marcus.vance@campus.edu', 'Marcus Vance', 'Business Administration', 3, 'Pitch deck designer and campus venture strategist. Skilled in market research and pitch deck storytelling.', ARRAY['PowerPoint', 'Market Research', 'Pitch Decks', 'Public Speaking']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (9, 'elena.rostova@campus.edu', 'Elena Rostova', 'Computer Engineering', 7, 'Hardware-software codesign and low-level systems programmer. Building robotics prototypes and Arduino controllers.', ARRAY['C++', 'Rust', 'Arduino', 'Computer Architecture']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (10, 'carlos.mendez@campus.edu', 'Carlos Mendez', 'Media Arts', 4, 'Videographer and motion designer. Creating student documentary reels, short trailers, and social video content.', ARRAY['Premiere Pro', 'After Effects', 'Sound Design', 'Storyboarding']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (11, 'aisha.bello@campus.edu', 'Aisha Bello', 'Biology & Pre-Med', 6, 'Biochemistry peer mentor and lab report guide. Helping premed students ace organic chemistry reaction mechanisms.', ARRAY['Organic Chemistry', 'Biology', 'Lab Reports', 'MCAT Prep']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (12, 'noah.tanaka@campus.edu', 'Noah Tanaka', 'Web Development', 3, 'Full-stack builder passionate about open source and student hackathons. Always excited to collaborate on new ideas.', ARRAY['React', 'Vue', 'Next.js', 'REST APIs']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (13, 'evaluator.owner@campus.edu', 'Alex Morgan', 'Computer Science', 4, 'Evaluator Testing Account: Specializes in posting gigs, reviewing proposals, and applicant management.', ARRAY['React', 'Node.js', 'System Architecture']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

INSERT INTO public.users (id, email, name, major, semester, bio, skills)
VALUES (14, 'evaluator.applicant@campus.edu', 'Jordan Taylor', 'Software Engineering', 3, 'Evaluator Testing Account: Specializes in browsing marketplace gigs, submitting proposals, and mutual peer reviews.', ARRAY['Python', 'Figma', 'Technical Writing']::TEXT[])
ON CONFLICT (id) DO UPDATE SET
  email = EXCLUDED.email, name = EXCLUDED.name, major = EXCLUDED.major,
  semester = EXCLUDED.semester, bio = EXCLUDED.bio, skills = EXCLUDED.skills;

-- 2. Seed Gigs (25 Gigs)
INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (101, 1, 'React & Tailwind Component Library Setup', 'Offering 4 hours of hands-on pairing to build clean, reusable React component systems with Tailwind styling for your project.', 'Offering', 'Programming', 'Paid', 1200, '2026-11-15T23:59:00.000Z', 'Open', '2026-10-18T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (102, 8, 'Build Python Web Scraper for Market Analysis', 'Need an experienced programmer to build a script extracting local competitor pricing from public business directories into CSV.', 'Requesting', 'Programming', 'Paid', 2500, '2026-11-10T23:59:00.000Z', 'Open', '2026-10-19T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (103, 3, 'Debug Express API Authentication Routes', 'Looking for a backend developer to troubleshoot JWT middleware and route guards. Will exchange 2 custom vector logos in return.', 'Requesting', 'Programming', 'SkillSwap', NULL, '2026-11-20T23:59:00.000Z', 'Open', '2026-10-19T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (104, 12, 'Code Review & Git Workflow Mentoring', 'Offering free 45-minute code reviews for beginner CS students. We can review pull requests, clean up commit trees, or debug logic.', 'Offering', 'Programming', 'Free', NULL, '2026-11-25T23:59:00.000Z', 'Open', '2026-10-20T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (105, 4, 'Full-Stack Student Literary Journal Website', 'Need a multi-page web platform for our campus literary magazine with article submission forms and reader archive.', 'Requesting', 'Programming', 'Paid', 3500, '2026-11-18T23:59:00.000Z', 'In Progress', '2026-10-16T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (106, 7, 'Interactive Data Dashboard in React and Chart.js', 'Build interactive line and bar charts with filter widgets for student survey results. Needs responsive mobile layouts.', 'Requesting', 'Programming', 'Paid', 2800, '2026-10-19T23:59:00.000Z', 'Completed', '2026-10-10T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (107, 5, 'Automated Homework Grader CLI Tool', 'Create a Python script to test student code submissions against test cases and produce markdown reports.', 'Requesting', 'Programming', 'Paid', 1500, '2026-10-15T23:59:00.000Z', 'Expired', '2026-10-05T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (108, 9, 'Raspberry Pi Home Automation Workshop', 'Offering hands-on setup of IoT temperature sensors and MQTT brokers in exchange for assistance with 3D CAD modeling.', 'Offering', 'Programming', 'SkillSwap', NULL, '2026-11-01T23:59:00.000Z', 'Cancelled', '2026-10-12T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (109, 3, 'Club & Student Startup Branding Package', 'Offering a complete branding identity including primary vector logo, color palette, typography guidelines, and social media banners.', 'Offering', 'Design', 'Paid', 2000, '2026-11-22T23:59:00.000Z', 'Open', '2026-10-19T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (110, 2, 'UI/UX Mockups for Campus Transit App', 'Seeking a talented designer to create 6 high-fidelity mobile screens in Figma for real-time bus tracking and route alerts.', 'Requesting', 'Design', 'Paid', 1800, '2026-11-12T23:59:00.000Z', 'Open', '2026-10-18T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (111, 11, 'Infographic Posters for Campus Health Week', 'Need 3 eye-catching visual summary infographics on sleep hygiene and mental wellness. Will trade 3 hours of bio/chem tutoring.', 'Requesting', 'Design', 'SkillSwap', NULL, '2026-11-17T23:59:00.000Z', 'Open', '2026-10-19T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (112, 6, 'Figma Usability Review & Design Critique', 'Providing comprehensive UX audit of your web app or portfolio prototype with annotated wireframes and recommendations.', 'Offering', 'Design', 'Paid', 900, '2026-11-14T23:59:00.000Z', 'In Progress', '2026-10-15T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (113, 1, 'Modern Portfolio Logo and Vector Monogram', 'Looking for a minimalist typographic logo for my engineering portfolio. Exchanging custom responsive CSS and Tailwind theme setup.', 'Requesting', 'Design', 'SkillSwap', NULL, '2026-10-18T23:59:00.000Z', 'Completed', '2026-10-08T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (114, 10, 'Free Photo Touch-ups for Student LinkedIn Avatars', 'Offering quick background cleaning and color balancing for student profile pictures before the fall career fair.', 'Offering', 'Design', 'Free', NULL, '2026-10-14T23:59:00.000Z', 'Expired', '2026-10-06T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (115, 4, 'Grad School Statement of Purpose Editing', 'Meticulous sentence-by-sentence editing, clarity enhancement, and structural feedback for graduate school admissions essays.', 'Offering', 'Writing', 'Paid', 1600, '2026-11-30T23:59:00.000Z', 'Open', '2026-10-17T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (116, 7, 'Proofreading for IEEE Conference Paper', 'Looking for a native English editor to polish grammar, academic flow, and passive voice in our 8-page machine learning paper.', 'Requesting', 'Writing', 'Paid', 2200, '2026-11-19T23:59:00.000Z', 'Open', '2026-10-20T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (117, 8, 'Executive Summary and Grant Proposal Writing', 'Offering help drafting executive summaries and student pitch competitions. Will trade for video editing or motion graphics.', 'Offering', 'Writing', 'SkillSwap', NULL, '2026-11-24T23:59:00.000Z', 'Open', '2026-10-18T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (118, 9, 'Technical Documentation for Embedded Sensor SDK', 'Need help formatting and polishing our open-source robotics C++ API documentation with clear Quickstart examples.', 'Requesting', 'Writing', 'Paid', 1400, '2026-11-16T23:59:00.000Z', 'In Progress', '2026-10-14T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (119, 4, 'Comprehensive Literature Review Structuring', 'Guided assistance structuring academic synthesis, citation bibliographies, and thematic literature matrices.', 'Offering', 'Writing', 'Paid', 1500, '2026-10-17T23:59:00.000Z', 'Completed', '2026-10-07T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (120, 1, 'Resume & Cover Letter Peer Review for Tech Internships', 'Voluntary critique of SWE/design resumes with actionable feedback on impact metrics, ATS formatting, and bullet verbs.', 'Offering', 'Writing', 'Free', NULL, '2026-11-28T23:59:00.000Z', 'Open', '2026-10-20T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (121, 5, 'Multivariable Calculus & Linear Algebra Tutoring', 'One-on-one exam preparation focusing on eigenvalue problems, double integrals, and vector fields with step-by-step problem sets.', 'Offering', 'Tutoring', 'Paid', 1000, '2026-11-26T23:59:00.000Z', 'Open', '2026-10-19T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (122, 10, 'Need 1-on-1 Help with Statistics and Probability', 'Struggling with normal distribution models and hypothesis testing. Looking for 3 sessions before midterm next week.', 'Requesting', 'Tutoring', 'Paid', 1500, '2026-11-08T23:59:00.000Z', 'Open', '2026-10-20T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (123, 11, 'Organic Chemistry Reactions & Synthesis Tutoring', 'Offering mechanism breakdown sessions (SN1/SN2/E1/E2 & carbonyl chemistry). Will swap for React website debugging assistance.', 'Offering', 'Tutoring', 'SkillSwap', NULL, '2026-11-21T23:59:00.000Z', 'Open', '2026-10-17T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (124, 2, 'Data Structures & Algorithms in Python Tutoring', 'Crash course on graph traversals, binary search trees, and dynamic programming for technical interview rounds.', 'Offering', 'Tutoring', 'Paid', 1800, '2026-11-15T23:59:00.000Z', 'In Progress', '2026-10-13T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

INSERT INTO public.gigs (id, user_id, title, description, type, category, payment_type, budget, deadline, status, created_at)
VALUES (125, 5, 'Discrete Math & Proof Writing Boot Camp', 'Targeted preparation for induction proofs, set theory, and recurrence relations with custom practice questions.', 'Offering', 'Tutoring', 'Paid', 1200, '2026-10-16T23:59:00.000Z', 'Completed', '2026-10-06T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title, description = EXCLUDED.description, type = EXCLUDED.type,
  category = EXCLUDED.category, payment_type = EXCLUDED.payment_type, budget = EXCLUDED.budget,
  deadline = EXCLUDED.deadline, status = EXCLUDED.status;

-- 3. Seed Applications (26 Applications)
INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (200, 101, 2, 'I have a project needing clean React components and would love to collaborate on standardizing our design tokens.', 'Pending', '2026-10-19T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (2010, 101, 6, 'Excited to pair with you! I can provide the design specs while you help set up the React component scaffolding.', 'Pending', '2026-10-19T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (2011, 102, 2, 'I specialize in Python Beautiful Soup and Playwright scraping with automated CSV export pipelines.', 'Pending', '2026-10-20T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (2012, 103, 12, 'I have built multiple JWT auth middleware services in Express. Let us swap skills; I would love a custom logo!', 'Pending', '2026-10-20T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (201, 105, 2, 'I have extensive experience building full-stack platforms with Express and Postgres. I can build the literary journal.', 'Accepted', '2026-10-17T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (2013, 105, 12, 'I can help build the frontend submission portal using Next.js and Markdown rendering.', 'Rejected', '2026-10-17T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (202, 106, 1, 'I build interactive dashboards with React and Chart.js regularly. Let me craft this survey visualization for you.', 'Accepted', '2026-10-11T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (203, 106, 6, 'I have done data visualization dashboards before and can ensure responsive chart layouts.', 'Rejected', '2026-10-11T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (204, 109, 8, 'Our student business club needs an updated branding suite and logo for upcoming venture competitions.', 'Pending', '2026-10-20T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (2014, 110, 3, 'Transit UI is one of my favorite design challenges! I can provide clean Figma vector frames and interactive flows.', 'Pending', '2026-10-19T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (2015, 110, 6, 'I have researched campus navigation UX and can deliver wireframes optimized for fast bus schedule lookups.', 'Pending', '2026-10-19T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (205, 112, 3, 'I need a thorough UX audit on my client design portfolio prototype before user testing sessions.', 'Accepted', '2026-10-16T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (206, 112, 1, 'Looking for expert design critique on my component library documentation hierarchy.', 'Rejected', '2026-10-16T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (207, 113, 3, 'I would love to design your portfolio monogram and vector mark in exchange for Tailwind setup assistance!', 'Accepted', '2026-10-09T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (208, 113, 6, 'I can create modern typographic logo variations in Figma for your portfolio header.', 'Rejected', '2026-10-09T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (209, 115, 11, 'Applying for clinical research master programs and need help tightening my personal narrative statement.', 'Pending', '2026-10-18T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (2016, 116, 4, 'I regularly edit technical and CS manuscripts to conform with IEEE formatting standards and style manuals.', 'Pending', '2026-10-20T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (210, 118, 4, 'I have experience editing technical markdown manuals and creating developer onboarding guides.', 'Accepted', '2026-10-15T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (211, 118, 1, 'I can help proofread API reference docs and write clear code snippets.', 'Rejected', '2026-10-15T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (212, 119, 9, 'Need help organizing literature on embedded sensor networks and hardware acceleration for my senior thesis.', 'Accepted', '2026-10-08T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (213, 121, 1, 'Need help clarifying linear transformation matrices and eigenvalues before our 3D graphics homework deadline!', 'Pending', '2026-10-20T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (214, 122, 7, 'I teach statistics and probability distributions weekly and can walk through homework problems step-by-step.', 'Pending', '2026-10-20T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (215, 123, 12, 'I need review on alkene addition reactions and will happily build or debug your React project!', 'Pending', '2026-10-18T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (216, 124, 10, 'I need to master binary search trees and recursion in Python for my media computing project.', 'Accepted', '2026-10-14T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (217, 124, 8, 'Looking for a programming fundamentals refresher on algorithm complexity.', 'Rejected', '2026-10-14T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

INSERT INTO public.applications (id, gig_id, applicant_id, message, status, created_at)
VALUES (218, 125, 6, 'Need tutoring on mathematical induction and recurrence relations for my discrete structures course.', 'Accepted', '2026-10-07T23:59:00.000Z')
ON CONFLICT (id) DO UPDATE SET
  message = EXCLUDED.message, status = EXCLUDED.status;

-- 4. Link Accepted Applications to Gigs
UPDATE public.gigs SET accepted_applicant_id = 201 WHERE id = 105;
UPDATE public.gigs SET accepted_applicant_id = 202 WHERE id = 106;
UPDATE public.gigs SET accepted_applicant_id = 205 WHERE id = 112;
UPDATE public.gigs SET accepted_applicant_id = 207 WHERE id = 113;
UPDATE public.gigs SET accepted_applicant_id = 210 WHERE id = 118;
UPDATE public.gigs SET accepted_applicant_id = 212 WHERE id = 119;
UPDATE public.gigs SET accepted_applicant_id = 216 WHERE id = 124;
UPDATE public.gigs SET accepted_applicant_id = 218 WHERE id = 125;

-- 5. Seed Reviews (10 Mutual Reviews)
INSERT INTO public.reviews (id, gig_id, reviewer_id, reviewee_id, rating, comment)
VALUES (301, 106, 7, 1, 5, 'Sara built a stellar interactive chart dashboard! Delivered ahead of schedule with clean, accessible components.')
ON CONFLICT (id) DO UPDATE SET
  rating = EXCLUDED.rating, comment = EXCLUDED.comment;

INSERT INTO public.reviews (id, gig_id, reviewer_id, reviewee_id, rating, comment)
VALUES (302, 106, 1, 7, 5, 'Fatima provided clear dataset specifications and was fantastic to collaborate with throughout the project!')
ON CONFLICT (id) DO UPDATE SET
  rating = EXCLUDED.rating, comment = EXCLUDED.comment;

INSERT INTO public.reviews (id, gig_id, reviewer_id, reviewee_id, rating, comment)
VALUES (303, 113, 1, 3, 5, 'Maya designed an exquisite monogram and vector logo for my portfolio. Unbelievable eye for detail and aesthetics.')
ON CONFLICT (id) DO UPDATE SET
  rating = EXCLUDED.rating, comment = EXCLUDED.comment;

INSERT INTO public.reviews (id, gig_id, reviewer_id, reviewee_id, rating, comment)
VALUES (304, 113, 3, 1, 5, 'Super smooth skill swap! Sara set up all my Tailwind configurations and answered all my questions patiently.')
ON CONFLICT (id) DO UPDATE SET
  rating = EXCLUDED.rating, comment = EXCLUDED.comment;

INSERT INTO public.reviews (id, gig_id, reviewer_id, reviewee_id, rating, comment)
VALUES (305, 119, 4, 9, 4, 'Elena had very detailed technical questions and a well-formulated thesis outline. Great academic collaboration.')
ON CONFLICT (id) DO UPDATE SET
  rating = EXCLUDED.rating, comment = EXCLUDED.comment;

INSERT INTO public.reviews (id, gig_id, reviewer_id, reviewee_id, rating, comment)
VALUES (306, 119, 9, 4, 5, 'Liam restructured my literature review brilliantly. My advisor was extremely impressed with the clarity of the draft.')
ON CONFLICT (id) DO UPDATE SET
  rating = EXCLUDED.rating, comment = EXCLUDED.comment;

INSERT INTO public.reviews (id, gig_id, reviewer_id, reviewee_id, rating, comment)
VALUES (307, 125, 5, 6, 5, 'David was eager to learn and grasped induction proof mechanics rapidly during our practice sessions.')
ON CONFLICT (id) DO UPDATE SET
  rating = EXCLUDED.rating, comment = EXCLUDED.comment;

INSERT INTO public.reviews (id, gig_id, reviewer_id, reviewee_id, rating, comment)
VALUES (308, 125, 6, 5, 5, 'Priya is the best math tutor on campus! She turned daunting discrete math proofs into intuitive, easy-to-follow steps.')
ON CONFLICT (id) DO UPDATE SET
  rating = EXCLUDED.rating, comment = EXCLUDED.comment;

INSERT INTO public.reviews (id, gig_id, reviewer_id, reviewee_id, rating, comment)
VALUES (309, 106, 7, 2, 4, 'Reliable work on our data pipeline backend.')
ON CONFLICT (id) DO UPDATE SET
  rating = EXCLUDED.rating, comment = EXCLUDED.comment;

INSERT INTO public.reviews (id, gig_id, reviewer_id, reviewee_id, rating, comment)
VALUES (310, 113, 3, 4, 5, 'Helped proofread our design exhibition catalog. Clear and thorough.')
ON CONFLICT (id) DO UPDATE SET
  rating = EXCLUDED.rating, comment = EXCLUDED.comment;

-- 6. Update PostgreSQL Serial Sequences
SELECT setval('public.users_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.users));
SELECT setval('public.gigs_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.gigs));
SELECT setval('public.applications_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.applications));
SELECT setval('public.reviews_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.reviews));

COMMIT;
