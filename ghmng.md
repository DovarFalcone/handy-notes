# Migrating Documentation to MKDocs Format: A Proposal

## Overview

In our pursuit of operational efficiency and streamlined knowledge access, we propose a significant enhancement—migrating our documentation to the MKDocs format. This transition is designed to revolutionize the way we access crucial design guidelines, playbooks, and guiding principles, ensuring a more efficient and repeatable retrieval process.

## The Challenge

Currently, our documentation is spread across various team sites and SharePoint folders, often in the form of PowerPoint presentations. This scattered approach poses challenges in locating and updating critical information promptly. To address this, we propose adopting MKDocs, a lightweight documentation framework utilizing Markdown files.

## Key Advantages

### Centralized Access

MKDocs offers a centralized platform for documentation, providing easy access to design guidelines, playbooks, and guiding principles from a unified source. This centralization simplifies searches and eliminates the need to navigate through multiple sources.

### Quick and Repeatable Access

With MKDocs, accessing documentation becomes swift and repeatable. Team members can efficiently retrieve information without spending valuable time searching through disparate sources, fostering increased productivity and agile responses to business needs.

### Conversion of Existing Material

Recognizing the value of existing materials, the transition to MKDocs involves converting current documentation into Markdown files. This approach preserves and builds upon existing knowledge, minimizing disruptions and providing a foundation for future updates.

### Standardized Formatting

MKDocs utilizes Markdown, a lightweight and standardized markup language. This ensures consistency in formatting, creating visually cohesive and easily readable documentation. Standardization facilitates collaboration and reduces the learning curve for team members.

### Version Control and Collaboration

MKDocs seamlessly integrates with version control systems, allowing systematic tracking of changes. This enhances collaboration and ensures a maintained repository of accurate and up-to-date documentation.

## Next Steps

We propose initiating a pilot project to migrate a select set of documentation to MKDocs. This pilot will help assess the feasibility, benefits, and potential challenges associated with the transition. Your feedback and collaboration in this endeavor will be invaluable in shaping the success of this initiative.

## Conclusion

We firmly believe that migrating to MKDocs will significantly elevate our documentation management, fostering improved efficiency and knowledge sharing across our organization.

- **Contributor Steps:**
  1. **Create Feature Branch:** Create a new branch for your feature or bug fix.
  2. **Make Changes:** Make the necessary changes to the documentation.
  3. **Commit Changes:** Commit your changes to the local branch.
  4. **Create Pull Request:** Create a Pull Request from your new branch.

- **Maintainer Steps:**
  1. **Review Pull Request:** Review the changes proposed in the pull request.
  2. **Merge Pull Request:** If the changes are acceptable, merge the pull request into the main repository.
  3. **Deploy to Develop:** After merging, deploy the changes to the development environment to ensure they work in a more realistic setting.
  4. **Deploy to Main:** After Develop is tested and all changes are gathered. Raise a PR pullung develop into main.

---

graph LR
    subgraph Contributor
        B[Create Feature Branch]
        C[Make Changes]
        D[Commit Changes]
    end

    subgraph GitHub
        F[Clone Repository]
        G[Create Pull Request]
        H[Deploy to Develop]
        I[Deploy to Prod]
    end

    subgraph Maintainer
        J[Review Pull Request]
        K[Merge Pull Request]
    end

    B --> C --> D -.-> G
    F --> G --> H --> I
    J --> K -.-> H
    G -.-> J
    F -.-> B
