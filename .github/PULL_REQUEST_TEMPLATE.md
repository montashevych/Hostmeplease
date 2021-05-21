## What?
Explain the changes you’ve made. It doesn’t need to be fancy and you don’t have to get to technical, yet. Just explicit prose on your net change will typically suffice.
Explanation: Added support for authentication. 

## Why?
The “why” is sometimes more important than the “what” of a code change, but we tend to put it after the “what” since we aren’t evaluating theory, we’re evaluating tangible code changes.
Explanation: These changes complete the user login and account creation experience. See #JIRA-123 for more information.

## How?
Of course, the PR diff will tell most of the story of the “how”, but make sure to draw attention to the significant design decisions. You decided to write a recursive method instead of a loop, pointing out the merits of this will help the reviewer understand your reasoning and in turn provide a better review.
Explanation: This includes a migration, model and controller for user authentication. I'm using Devise to do the heavy lifting. I ran Devise migrations and those are included here.

## Testing?
Did you write tests?

## Screenshots (optional)
Of course, screenshots are especially helpful for UI-related changes. A simple screenshot of the before and after, or of the current state vs. your local development view, helps the reviewer tremendously.

## Anything Else?
You may want to delve into possible architecture changes or technical debt here. Call out challenges, optimizations, etc.
