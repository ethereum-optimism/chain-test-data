# chain-test-data

This repository provides pre-image data required to run `op-program` offline and verify sections of real chains.

The data is stored as GitHub release artifacts so they can be easily downloaded by tests in the optimism monorepo.

## Generating New Data

New chain data can be generated in the optimism monorepo and then uploaded to a new release created in this repo.
By convention, tags are just the date in `YYYY-MM-DD` format.

```shell
git clone https://github.com/ethereum-optimism/optimism
cd chain-test-data/op-program
SEPOLIA_L1URL=... \
 SEPOLIA_BEACON_URL=... \
 SEPOLIA_L2URL=... \
 make capture-chain-test-data
```

Then create a release (using a new tag) and upload the built artifacts from `./temp/compat/*.tar.bz` as release artifacts.
Then update the URL in the monorepo `op-program/Makefile` to point to the newly built tarball of chain data. 

The `capture-chain-test-data` target in `op-program/Makefile` of the monorepo can be modified to generate data for other
chains or to modify how it selects the part of the chain to capture.
