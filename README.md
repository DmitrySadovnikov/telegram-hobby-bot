# Telegram Hobby Bot API

This is a Telegram bot for generating hobbies, accessible via the handle `@regional_fatigue_hobbybot`. The bot is built using Ruby on Rails and provides several API endpoints to interact with hobbies.

## Endpoints

### POST /api/v1/hobbies/message

This endpoint processes incoming messages from the Telegram bot.

**Request Parameters:**
- `message`: A JSON object containing the message details.
    - `text`: The text of the message.
    - `chat`: A JSON object containing chat details.
        - `id`: The chat ID.

**Response:**
- Status: `200 OK` if the message is processed successfully.
- Status: `200 OK` with an empty JSON object if the `message` parameter is missing.

### GET /api/v1/hobbies/titles

This endpoint retrieves a list of all hobby titles.

**Response:**
- Status: `200 OK`
- JSON object containing a collection of hobby titles.

### GET /api/v1/hobbies/random

This endpoint retrieves a random hobby title.

**Response:**
- Status: `200 OK`
- JSON object containing a single random hobby title.

## Usage

To use this API, send HTTP requests to the appropriate endpoints as described above. The API is designed to be used by the Telegram bot to provide hobby suggestions and handle user messages.
