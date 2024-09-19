# UseWebhook CLI

CLI for [UseWebhook](https://usewebhook.com): a free tool to inspect webhooks from your browser and replay locally.

## Installation

The easiest way to install is using the automated install script:

```
curl -sSL https://raw.githubusercontent.com/anthonynsimon/usewebhook-cli/main/install.sh | bash
```

It will detect your OS and architecture, download the appropiate release and add it to your `/usr/local/bin`.

Alternatively, you can download the binary for your operating system from the [releases page](https://github.com/yourusername/usewebhook-cli/releases), or [build from source](#build-from-source) if you'd like.

## Usage

Create a new webhook and start listening:

```bash
$ usewebhook

> Dashboard URL: https://usewebhook.com?id=example
> Listening at: https://usewebhook.com/example
```

Listen for requests to a specific webhook:

```bash
$ usewebhook <webhook-URL>
```

Forward requests to a local endpoint:

```bash
$ usewebhook <webhook-URL> -f http://localhost:8080/your-endpoint
```

Replay a specific request from the webhook's history:

```bash
$ usewebhook <webhook-URL>  -r <request-ID> -f http://localhost:8080/your-endpoint
```


## Building from source

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

- **0.1.0:** Initial release

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
