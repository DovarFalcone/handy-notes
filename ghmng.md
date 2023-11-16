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
