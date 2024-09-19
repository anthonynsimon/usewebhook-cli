# UseWebhook CLI

[UseWebhook](https://usewebhook.com) CLI: Capture and inspect webhooks from your browser. Replay them on localhost.

![UseWebhook logo](https://github.com/user-attachments/assets/fc2d80a2-4d9b-4e9e-92b5-2bd1af8e2983)

## Installation

The easiest way is using the automated install script:

```
curl -sSL https://usewebhook.com/install.sh | bash
```

It will detect your OS and architecture, download the appropiate release and add it to your `/usr/local/bin`.

Alternatively, you can download the binary for your operating system from the [releases page](https://github.com/anthonynsimon/usewebhook-cli/releases), or [build from source](#build-from-source) if you'd like.

## Usage

Create a new webhook and start listening:

```bash
$ usewebhook

> Dashboard: https://usewebhook.com/?id=123
> Webhook URL: https://usewebhook.com/123
```

Listen for requests to a specific webhook:

```bash
$ usewebhook <webhook-URL>
```

Forward incoming requests to localhost:

```bash
$ usewebhook <webhook-URL> --forward-to http://localhost:8080/your-endpoint
```

Replay a specific request from the webhook's history:

```bash
$ usewebhook <webhook-URL> --request-id <request-ID> -f http://localhost:8080/your-endpoint
```


## Build from source

1. Ensure you have Go installed on your system.
2. Clone the repository:
   ```
   git clone https://github.com/anthonynsimon/usewebhook-cli
   ```
3. Navigate to the project directory:
   ```
   cd usewebhook-cli
   ```
4. Build the binary:
   ```
   go build -o usewebhook
   ```
5. Move the binary to your PATH:
   ```
   sudo mv ./usewebhook /usr/local/bin/
   ```


## Contributing

Contributions are welcome! In case you want to add a feature, please create a new issue and briefly explain what the feature would consist of.

Simply follow the next steps:

- Fork the project.
- Create a new branch.
- Make your changes and write tests when practical.
- Commit your changes to the new branch.
- Send a pull request, it will be reviewed shortly.

## Change log

> Note: Breaking changes might happen until v1.0.0 is reached

- **0.2.1:** CLI usage improvements
- **0.2.0:** Consistent CLI argument names
- **0.1.0:** Initial release

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
