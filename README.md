# chain-test-data

This repository provides pre-image data required to run `op-program` offline and verify sections of real chains.

The data is stored as GitHub release artifacts so they can be easily downloaded by tests in the optimism monorepo.

## Generating New Data

New chain data is automatically captured and uploaded as a new release by CI whenever a new tag is created in this repo.
By convention, tags are just the date in `YYYY-MM-DD` format.

```shell
git clone https://github.com/ethereum-optimism/chain-test-data
cd chain-test-data
RELEASE_NAME=$(date +%Y-%m-%d)
git tag "$RELEASE_NAME"
git push origin "$RELEASE_NAME"
```

Once CI has completed, update the URL in the monorepo `op-program/Makefile` to point to the newly built tarball of 
chain data. 

To generate data, CI just runs the `capture-chain-test-data` target in `op-program/Makefile` of the monorepo. It can
be modified to generate data for other chains or to modify how it selects the part of the chain to capture.
