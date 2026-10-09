# Private browser setup

This configuration runs MiroFish in GitHub Codespaces. It is a development workspace, not an always-on production host. Codespaces and AI usage may incur charges according to your accounts.

1. Add repository-scoped **Codespaces secrets** in GitHub settings: `LLM_API_KEY`, `ZEP_API_KEY`, `LLM_BASE_URL`, and `LLM_MODEL_NAME`. Choose the API endpoint and model from your AI provider. Zep Cloud is required by this version. Do not use Actions secrets for this setup or commit credentials to the repository.
2. Open this repository's **Code > Codespaces > Create codespace on main**. Dependency installation runs automatically.
3. In its terminal run `bash .devcontainer/start.sh`.
4. Open the forwarded port **3000** from the Ports tab. Keep its visibility **Private**. Port 5001 is internal and does not need to be shared.
5. Start with a small, fictional scenario. Ten rounds is the default, though the simulation screen may override it. Review usage in your AI and Zep accounts.

If you add secrets after creating the workspace, stop and restart the Codespace so its environment refreshes. Keep the terminal running while using MiroFish. Stop the Codespace when finished.

The frontend uses the same-origin `/api` proxy, so it works from a phone or computer without exposing the backend port. GitHub authenticates access to private forwarded ports. Never switch the port to public: the upstream app does not supply its own login protection.

## Validation status

The configuration and shell syntax have been checked. Live dependency installation, private port forwarding, and an end-to-end simulation still require an active Codespace and valid API accounts. No API keys are included.

## OpenAI configuration

Use `https://api.openai.com/v1` for `LLM_BASE_URL`. The upstream backend defaults to `gpt-4o-mini`; use that as `LLM_MODEL_NAME` for the initial compatibility test if your project has access. Store your existing OpenAI API key as `LLM_API_KEY`, and your Zep Cloud key as `ZEP_API_KEY`. Zep signup: https://app.getzep.com/. API charges are separate from a ChatGPT subscription.

Frontend build passed during preparation. Full simulations have not yet been tested.
