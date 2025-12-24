/*
  # Newsletter Subscriptions Table

  1. New Tables
    - `newsletter_subscriptions`
      - `id` (uuid, primary key) - Unique identifier for each subscription
      - `email` (text, unique, not null) - Subscriber email address
      - `subscribed_at` (timestamptz) - Timestamp when user subscribed
      - `active` (boolean) - Whether subscription is active
      - `ip_address` (text) - IP address for spam prevention
      - `user_agent` (text) - User agent for analytics
  
  2. Security
    - Enable RLS on `newsletter_subscriptions` table
    - Add policy for anonymous users to insert subscriptions
    - Add policy for service role to manage subscriptions
  
  3. Indexes
    - Index on email for fast lookups
    - Index on subscribed_at for analytics

  4. Important Notes
    - Uses default values for boolean and timestamp fields
    - Email is unique to prevent duplicate subscriptions
    - Active status allows for unsubscribe functionality
*/

CREATE TABLE IF NOT EXISTS newsletter_subscriptions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text UNIQUE NOT NULL,
  subscribed_at timestamptz DEFAULT now() NOT NULL,
  active boolean DEFAULT true NOT NULL,
  ip_address text,
  user_agent text
);

-- Enable RLS
ALTER TABLE newsletter_subscriptions ENABLE ROW LEVEL SECURITY;

-- Allow anonymous users to insert subscriptions
CREATE POLICY "Anyone can subscribe to newsletter"
  ON newsletter_subscriptions
  FOR INSERT
  TO anon
  WITH CHECK (true);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_newsletter_email ON newsletter_subscriptions(email);
CREATE INDEX IF NOT EXISTS idx_newsletter_subscribed_at ON newsletter_subscriptions(subscribed_at DESC);