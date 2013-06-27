# MixNotes

### Purpose

The inspiration behind this application came from my work mixing studio recordings for myself and other musicians. Particularly in cases of remote collaboration, I found myself sifting through countless e-mails compiling the modifications that I needed to make to a mix. Clearly, it would have been useful to have a web application uniquely suited for that purpose.

In response to this problem, I began developing MixNotes, a Rails app that enables users to upload and share their works-in-progress with others. Users can leave comments that are timestamped to a particular point in the song as well as reply to other users' comments. This allows for the existence of several concurrent but unrelated dialogues.

### Project Status

MixNotes incorporates a feature that aggregates the user's recent activity into a single feed. In order to increase the usefulness of this feature, I would like to expand it to include any activity regarding a mix on which he or she is a collaborator. It is likely that as this feature becomes stable, it will assume a more prominent role in the application.

While the program is currently functional, with all integration tests passing, it isn't ready to be deployed into production--the code is still in heavy development and stands to change significantly. If it were to be deployed, however, it would be necessary to set up an AWS S3 account, as the program depends on the presence of environment variables containing AWS credentials.

### Current Features

Users can:

* Upload mixes (audio files)
* Listen to their mixes using a graphical player
* Delete their own mixes
* Give other users access to their mixes
* Decline access to other users' mixes
* Comment on mixes (with timestamps)
* Immediately resume playback from a timestamp
* Reply to other users' comments
* Delete their own comments and replies
* View a list of their recent activity

### Author

Jack Whitis

### License

Copyright (c) 2013 Jack Whitis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.