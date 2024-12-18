# RAG Chat App with Azure OpenAI and Azure AI Search (Python)

## Overview

This solution creates a ChatGPT-like frontend experience over your own documents using RAG (Retrieval Augmented Generation). It uses Azure OpenAI Service to access GPT models, and Azure AI Search for data indexing and retrieval.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Azure Account Requirements](#azure-account-requirements)
- [Getting Started](#getting-started)
  - [GitHub Codespaces](#github-codespaces)
  - [VS Code Dev Containers](#vs-code-dev-containers)
  - [Local Environment](#local-environment)
- [Deploying](#deploying)
- [Running the Development Server](#running-the-development-server)
- [Using the App](#using-the-app)
- [Clean Up](#clean-up)
- [Guidance](#guidance)
  - [Resources](#resources)
  - [Getting Help](#getting-help)
  - [Note](#note)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Features

- Chat with your domain data using Azure OpenAI and Azure AI Search.
- Supports multiple RAG approaches.
- Integrated vectorization for enhanced search functionality.
- Persistent chat history with Azure Cosmos DB.
- Optional features like authentication, speech input/output, and more.

## Azure Account Requirements

**IMPORTANT:** In order to deploy and run this example, you'll need:

- **Azure account**. If you're new to Azure, [get an Azure account for free](https://azure.microsoft.com/free/cognitive-search/) and you'll get some free Azure credits to get started.
- **Azure account permissions**.

## Getting Started

You have a few options for setting up this project. The easiest way to get started is GitHub Codespaces, but you can also set it up locally if desired.

### GitHub Codespaces

You can run this repo virtually by using GitHub Codespaces, which will open a web-based VS Code in your browser:

[![Open in GitHub Codespaces](https://img.shields.io/static/v1?style=for-the-badge&label=GitHub+Codespaces&message=Open&color=brightgreen&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=599293758&machine=standardLinux32gb&devcontainer_path=.devcontainer%2Fdevcontainer.json&location=WestUs2)

### VS Code Dev Containers

A related option is VS Code Dev Containers, which will open the project in your local VS Code using the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers):

1. Start Docker Desktop (install it if not already installed)
2. Open the project:
    [![Open in Dev Containers](https://img.shields.io/static/v1?style=for-the-badge&label=Dev%20Containers&message=Open&color=blue&logo=visualstudiocode)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/azure-samples/azure-search-openai-demo)

3. In the VS Code window that opens, once the project files show up (this may take several minutes), open a terminal window.

### Local Environment

1. Install the required tools:
    - [Azure Developer CLI](https://aka.ms/azure-dev/install)
    - [Python 3.9, 3.10, or 3.11](https://www.python.org/downloads/)
    - [Node.js 18+](https://nodejs.org/download/)
    - [Git](https://git-scm.com/downloads)
    - [Powershell 7+ (pwsh)](https://github.com/powershell/powershell) - For Windows users only.

2. Create a new folder and switch to it in the terminal.
3. Run this command to download the project code:

    ```shell
    azd init -t azure-search-openai-demo
    ```

    Note that this command will initialize a git repository, so you do not need to clone this repository.

## Deploying

The steps below will provision Azure resources and deploy the application code to Azure Container Apps. To deploy to Azure App Service instead, follow the app service deployment guide.

1. Login to your Azure account:

    ```shell
    azd auth login
    ```

    For GitHub Codespaces users, if the previous command fails, try:

    ```shell
    azd auth login --use-device-code
    ```

2. Create a new azd environment:

    ```shell
    azd env new
    ```

    Enter a name that will be used for the resource group. This will create a new folder in the `.azure` folder, and set it as the active environment for any calls to `azd` going forward.

3. Run `azd up` - This will provision Azure resources and deploy this sample to those resources, including building the search index based on the files found in the [data](http://_vscodecontentref_/1) folder.

    - **Important**: Beware that the resources created by this command will incur immediate costs, primarily from the AI Search resource. These resources may accrue costs even if you interrupt the command before it is fully executed. You can run `azd down` or delete the resources manually to avoid unnecessary spending.

## Running the Development Server

To run the development server locally:

1. Run `azd auth login`
2. Start the server:

    Windows:

    ```shell
    ./app/start.ps1
    ```

    Linux/Mac:

    ```shell
    ./app/start.sh
    ```

    VS Code: Run the "VS Code Task: Start App" task.

## Using the App

- In Azure: navigate to the Azure WebApp deployed by azd. The URL is printed out when azd completes (as "Endpoint"), or you can find it in the Azure portal.
- Running locally: navigate to 127.0.0.1:50505

Once in the web app:

- Try different topics in chat or Q&A context. For chat, try follow up questions, clarifications, ask to simplify or elaborate on answer, etc.
- Explore citations and sources
- Click on "settings" to try different options, tweak prompts, etc.

## Clean Up

To clean up all the resources created by this sample:

1. Run `azd down`
2. When asked if you are sure you want to continue, enter `y`
3. When asked if you want to permanently delete the resources, enter `y`

The resource group and all the resources will be deleted.

## Guidance

You can find extensive documentation in the docs folder:

- Deploying:
  - Troubleshooting deployment
    - Debugging the app on App Service
  - Deploying with azd: deep dive and CI/CD
  - Deploying with existing Azure resources
  - Deploying from a free account
  - Enabling optional features
    - Login and access control
    - GPT-4 Turbo with Vision
    - Private endpoints
  - Sharing deployment environments
- Local development
- Customizing the app
- Data ingestion
- Monitoring with Application Insights
- Productionizing
- Alternative RAG chat samples

### Resources

- [📖 Blog: Access Control in Generative AI applications with Azure AI Search](https://techcommunity.microsoft.com/blog/azure-ai-services-blog/access-control-in-generative-ai-applications-with-azure-ai-search/3956408)
- [📺 Talk: Quickly build and deploy OpenAI apps on Azure, infused with your own data](https://www.youtube.com/watch?v=j8i-OM5kwiY)
- [📺 Talks: AI Chat App Hack series](https://www.youtube.com/playlist?list=PL5lwDBUC0ag6_dGZst5m3G72ewfwXLcXV)

### Getting Help

This is a sample built to demonstrate the capabilities of modern Generative AI apps and how they can be built in Azure. For help with deploying this sample, please post in [GitHub Issues](https://github.com/Azure-Samples/azure-search-openai-demo/issues). If you're a Microsoft employee, you can also post in [our Teams channel](https://aka.ms/azai-python-help).

This repository is supported by the maintainers, _not_ by Microsoft Support, so please use the support mechanisms described above, and we will do our best to help you out.

### Note

> Note: The PDF documents used in this demo contain information generated using a language model (Azure OpenAI Service). The information contained in these documents is only for demonstration purposes and does not reflect the opinions or beliefs of Microsoft. Microsoft makes no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability or availability with respect to the information contained in this document. All rights reserved to Microsoft.

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit <https://cla.opensource.microsoft.com>.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## License

This project is licensed under the MIT License - see the [LICENSE](http://_vscodecontentref_/2) file for details.

## Acknowledgements

Thank you to all the contributors who have helped make this project a success.
