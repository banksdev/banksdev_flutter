final String readRepos = r'''
query ReadRepos($name: String!){
  user(login: $name) {
    avatarUrl
    repositories(last: 10) {
      nodes {
        id
        name
        url
        resourcePath
        updatedAt
        pushedAt
        pullRequests(first: 10, states: OPEN) {
          edges {
            node {
              title
              createdAt
              author {
                login
              }
            }
          }
        }
        collaborators {
          edges {
            node {
              id
              login
            }
          }
        }
        languages {
          totalCount
        }
      }
    }
  }
}

''';
