# Quiz App - Simple Authentication Quiz Platform

A lightweight quiz application built with Ruby on Rails and PostgreSQL, featuring manual authentication (no Devise) and distinct user roles for regular users and administrators.

## 📋 Table of Contents

- [Overview](#overview)
- [Phase 1: MVP (Current)](#phase-1-mvp-current)
- [Phase 2: Enhanced Features](#phase-2-enhanced-features)
- [Phase 3: Advanced Features](#phase-3-advanced-features)
- [User Roles](#user-roles)
- [Security](#security)

## 🎯 Overview

This Quiz App allows regular users to take published quizzes and track their performance, while administrators can create, manage, and analyze quizzes. The application uses Rails' built-in `has_secure_password` for authentication, avoiding external authentication gems for simplicity and full control.

## ✅ Phase 1: MVP (Done)

### For All Users
- **User Authentication** - Sign up and login with email/password
- **Browse Quizzes** - View all published quizzes with categories
- **Take Quizzes** - Multiple choice questions with one-at-a-time interface
- **Instant Results** - Immediate score calculation and pass/fail determination
- **Quiz History** - Track all past attempts with scores and dates
- **Responsive Design** - Works on desktop, tablet, and mobile devices

### For Admin Users Only (Current)
- **Admin Dashboard** - Overview of platform statistics
- **Quiz Management** - Create, edit, delete, and publish/unpublish quizzes
- **Question Management** - Add, edit, delete, and reorder questions
- **Option Management** - Manage answer choices for each question
- **User Management** - View all users and promote regular users to admin
- **View All Results** - See detailed quiz attempts across all users
- **Quiz Analytics** - Track completion rates and performance metrics

## 🚀 Phase 2: Enhanced Features

### Quiz Enhancement
- **Quiz Categories & Tags** - Organize quizzes by subject (Math, Science, History) with multiple tags
- **Timer Feature** - Optional time limits per quiz with visible countdown
- **Attempt Limits** - Limit how many times a user can retake a specific quiz
- **Passing Score Configuration** - Set minimum percentage required to pass
- **Quiz Draft System** - Save quizzes as drafts before publishing

### Question Types Expansion
- **Multiple Answer Questions** - Select multiple correct answers
- **True/False Questions** - Simplified binary choice questions
- **Fill in the Blank** - Text input for short answer responses
- **Matching Questions** - Match items from two columns
- **Ordering Questions** - Arrange items in correct sequence

### User Experience
- **Search Functionality** - Search quizzes by title, description, or category
- **Quiz Filtering** - Filter by category, difficulty, popularity, or date
- **Save & Resume** - Incomplete quizzes can be saved and continued later
- **Bookmark Quizzes** - Save favorite quizzes for quick access
- **Leaderboards** - Top scores per quiz with user rankings
- **Retake Option** - Allow users to retake quizzes (if attempts remain)

### Admin Features
- **CSV Export** - Export all quiz results and analytics to CSV
- **Bulk Question Import** - Import questions from CSV/JSON files
- **Quiz Templates** - Create quiz from pre-existing templates
- **Question Bank** - Reuse questions across multiple quizzes
- **Advanced Analytics** - Question-level performance tracking and difficulty analysis

### Content Enhancement
- **Media Support** - Add images to questions and options
- **Rich Text Formatting** - Format question text with bold, italic, lists
- **Quiz Explanations** - Add explanations for correct/incorrect answers
- **Quiz Thumbnails** - Upload cover images for quizzes

## 🌟 Phase 3: Advanced Features

### Social & Engagement
- **Live Quiz Mode** - Host real-time quizzes with join codes (Kahoot-style)
- **Study Mode** - Practice with flashcards generated from missed questions
- **Achievements & Badges** - Gamification with unlockable achievements
  - Quiz Master: Complete 50 quizzes
  - Perfect Score: Get 100% on any quiz
  - Creator: Create 10 quizzes
  - Streak: Take quizzes 7 days in a row
- **Social Sharing** - Share quiz results on social media
- **Quiz Comments & Ratings** - Users can leave feedback and rate quizzes
- **Follow Creators** - Follow favorite quiz creators and get notifications

### Community Features
- **Public Profile Pages** - View user statistics, achievements, and created quizzes
- **Quiz Collections** - Curated playlists of quizzes on similar topics
- **User Challenges** - Challenge friends to beat your score
- **Weekly Tournaments** - Timed competitions with prizes
- **Quiz Recommendations** - AI-powered quiz suggestions based on history

### Advanced Quiz Capabilities
- **Adaptive Quizzes** - Difficulty adjusts based on user performance
- **Randomized Questions** - Draw random questions from question bank
- **Practice Mode** - Unlimited attempts with focus on weak areas
- **Audio Questions** - Embed audio clips in questions
- **Video Integration** - Embed YouTube/Vimeo videos in questions
- **Code Challenge Questions** - Execute and test code snippets

### Admin & Management
- **Role-Based Access Control (RBAC)** - Granular permissions (moderator, analyst)
- **Content Moderation** - Report and review inappropriate content
- **Automated Quiz Verification** - AI-assisted quiz quality checking
- **White-label Solution** - Custom branding for organizations
- **API Access** - RESTful API for third-party integrations
- **Webhook Support** - Real-time notifications for events
- **Advanced BI Analytics** - Custom dashboards with drill-down reports

### Technical Features
- **Real-time Notifications** - WebSocket-powered alerts
- **Offline Mode** - Download quizzes for offline taking (PWA)
- **Mobile App** - React Native or Flutter mobile application
- **Multi-language Support** - i18n for international users
- **Accessibility Features** - Screen reader support, keyboard navigation
- **Performance Optimization** - Caching, CDN, database optimization
- **Advanced Security** - Rate limiting, 2FA, audit logs

### Monetization Features (Optional)
- **Freemium Model** - Basic free, advanced features paid
- **Quiz Marketplace** - Creators earn from premium quiz sales
- **Subscription Plans** - Monthly/yearly subscriptions for premium content
- **Ad Integration** - Optional ad-supported free tier
- **Team/Classroom Plans** - Bulk user management for schools/companies

## 👥 User Roles

### Regular User
- Email and password authentication
- View and take published quizzes
- View personal quiz history and scores
- Cannot create or modify quizzes
- No access to admin areas

### Admin User
- All regular user capabilities
- Full CRUD operations on quizzes, questions, and options
- Access to admin dashboard
- View all user quiz attempts
- Promote/demote other users
- Publish/unpublish quizzes

## 🔒 Security

### Built-in Protections
- **Password Hashing:** bcrypt with cost factor 12
- **Session Security:** Encrypted cookies via Rails default
- **CSRF Protection:** Rails `protect_from_forgery`
- **XSS Prevention:** Rails auto-escaping in ERB templates
- **SQL Injection Prevention:** ActiveRecord parameterized queries

---

**Built with ❤️ using Ruby on Rails and PostgreSQL**