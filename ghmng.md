
- **Contributor Steps:**
  1. **Create Feature Branch:** Create a new branch for your feature or bug fix.
  2. **Make Changes:** Make the necessary changes to the documentation.
  3. **Commit Changes:** Commit your changes to the local branch.
  4. **Create Pull Request:** Create a Pull Request from your new branch.

- **Maintainer Steps:**
  1. **Review Pull Request:** Review the changes proposed in the pull request.
  2. **Merge Pull Request:** If the changes are acceptable, merge the pull request into the main repository.
  3. **Deploy to Develop:** After merging, deploy the changes to the development environment to ensure they work in a more realistic setting.
  4. ""Deploy to Main:** After Develop is tested and all changes are gathered. Raise a PR pullung develop into main.

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
