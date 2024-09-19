# UseWebhook CLI

CLI for UseWebhook.com: free tool to inspect and replay webhook requests locally.

## Installation

To install UseWebhook CLI, you can download the binary for your operating system from the [releases page](https://github.com/yourusername/usewebhook-cli/releases) or [build it](#build-from-source) from source.

### Automated install script

```
curl -sSL https://github.com/anthonynsimon/usewebhook-cli/blob/main/install.sh | bash
```

## Usage

To use UseWebhook CLI, run the following command:

```
# Start listening for requests (will create a new webhook)
$ usewebhook

# Listen for requests to a specific webhook
$ usewebhook <webhook-ID or URL>

# Forward requests to a local endpoint
$ usewebhook <webhook-ID or URL> -f http://localhost:8080/your-destination-endpoint
```


Show help:

```
$ usewebhook --help

Listen and forward requests to your usewebhook.com endpoint

Usage:
  usewebhook <webhook-ID or URL> [flags]

Flags:
  -f, --forward-to string   forward incoming requests to the provided URL (optional)
  -h, --help                help for usewebhook
  -l, --log-details         log full request details (default: false)
  -r, --request string      the request ID to fetch (optional)
  -v, --version             version for usewebhook
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
