# Spring AI POC

This proof-of-concept project is built with Spring Boot and Spring AI to showcase how easy it is to integrate multiple
AI-driven APIs within a single application. It provides a clean abstraction layer for sending chat-style prompts and
receiving responses from different providers, allowing you to:

- Define a unified service interface for any AI-driven “chat” functionality.
- Switch between providers (OpenAI or Google Gemini or DeepSeek AI) at runtime by toggling Spring profiles.
- Configure API keys and other settings through Spring’s configuration system or environment variables.
- Send a simple JSON payload to a REST endpoint and get back a provider-specific response without changing any core
  business code.

By illustrating these integration points, this POC helps developers understand how to rapidly add AI capabilities—such
as natural language completion or conversational responses—to existing Spring applications.

## Features

### **Supported AI Providers**

- OpenAI: https://docs.spring.io/spring-ai/reference/api/chat/openai-chat.html
- Google Gemini: https://ai.google.dev/gemini-api/docs/openai
- DeepSeek AI: https://docs.spring.io/spring-ai/reference/api/chat/deepseek-chat.html

#### **Spring Profiles**

- `google-ai` profile activates Google Gemini integration.
- `open-ai` profile activates OpenAI integration.
- `deepseek-ai` profile actives DeepSeek AI integration

> **Note:** Only one profile can be active at a time.

#### **Google Gemini API Key**

- The Google API Key can be provided via the `GOOGLE_AI_API_KEY` environment variable in `docker-compose.yml` file or
  overridden in your IDE.
- How to get the key:
    - Go to [Google AI Studio → API Keys](https://aistudio.google.com/apikey) and create a API Key.

> **Note:** [Google Cloud offers a Free Tier.](https://ai.google.dev/gemini-api/docs/pricing)

#### **OpenAI Secret Key**

- The OpenAI Secret Key can be provided via the `OPEN_AI_SECRET_KEY` environment variable in `docker-compose.yml` file
  or overridden in your IDE.
- How to get the key:
    - Go to [OpenAI Platform → API Keys](https://platform.openai.com/account/api-keys) and generate new secret key.

> **Note:** OpenAI does not offer a Free Tier; you must preload your account balance to use the API.

#### **DeepSeek API Key**

- The DeepSeek API Key can be provided via the `DEEPSEEK_AI_API_KEY` environment variable in `docker-compose.yml` file
  or overridden in your IDE.
- How to obtain the key:
    - Go to [DeepSeek Platform → API keys](https://platform.deepseek.com/api_keys) and create new API key.

> **Note:** DeepSeek AI does not offer a Free Tier; you must preload your account balance to use the API.

---

### **Prerequisites**

- **Java 21**
- **Maven 3.9.x**
- **Spring Boot 3.x.x**
- **Spring AI 1.0.0-M6**

---

## 📄 **Usage**

### Send a Prompt

To send a prompt, make a `POST` request to `/chat` with the following JSON payload.

**Sample Request:**

```json
{
  "prompt": "Hi, how is the weather in San Francisco?"
}
```

**Sample Response:**

```json
{
  "model": "GOOGLE_AI",
  "result": "The weather in San Francisco is currently:\n\n*   **Partly cloudy**\n*   **Temperature:** Around 60°F (16°C)\n*   **Wind:** Light winds\n*   **Humidity:** Moderate\n\nOverall, it's a typical San Francisco day with a mix of sunshine and clouds. Be prepared for potential changes in the weather throughout the day as the fog can roll in and out."
}
```

### Receive Active Chat Model

To receive an active chat model, make a `GET` request to `/model` with the following JSON payload.

**Sample Response:**

```json
{
  "activeChatModel": "GOOGLE_AI"
}
```
