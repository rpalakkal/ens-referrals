# ENS Referrals (R&D Prototype)

The `ENSReferrals` contract allows **ENS referrers** to receive self-serve referral rewards for ENS `.eth` name registrations and renewals. Referrer frontends can register for a `uint16 referrerId` to identify their referrals. They can inject this `referrerId` into their name registrations and renewals by:

- encoding it as `referrerId = duration % 86400` for a new `.eth` registration
- encoding it as `referrerId = expiry % 86400` for a `.eth` renewal

The `ENSReferrals` contract allows referrers to prove in ZK that they sourced new registrations or renewals for the protocol and records the amount of reward to be remitted. For integration, the ENS DAO would need to approve an implementation that actually remits funds. We handle registrations and renewals as follows:

- **Registrations:** Any name registration is eligible, but we exclude all premium fees in the computation of fees eligible for rewards. In particular, premium fees for 3- and 4-letter names and temporary premiums are excluded. The total ETH-denominated base registration fees paid are summed over the proven registrations and sent to `ENSReferrals` in a callback.
- **Renewals:** Any renewal is eligible, but again we exclude all premium fees. The total ETH-denominated base renewal fees paid are summed over the proven renewals and sent to `ENSReferrals` in a callback.

This is built using the [AxiomIncentives](https://github.com/axiom-crypto/axiom-incentives) system built using [Axiom](https://axiom.xyz), which allows rewarding users based on ZK-proven on-chain activity. This system identifies each claimed renewal or registration with a `claimId` which is a monotone increasing identifier for all Ethereum receipts; to prevent double claiming, we enforce that claims must be made in increasing order of `claimId`. In addition, we exclude `referrerId = 0`, which corresponds to the default behavior of the official ENS frontend. For each referrer claim, the ZK-proven results via Axiom that are provided to `ENSReferrals` via callback are:

- `uint256 startClaimId` -- the smallest `claimId` in the claimed batch
- `uint256 endClaimId` -- the largest `claimId` in the claimed batch
- `uint256 incentiveId` -- the `referrerId` for all claims in this batch
- `uint256 totalValue` -- the total value of ETH-denominated base registration or renewal fees in this batch.

This work is the result of a collaboration between [Axiom](https://axiom.xyz/) and [NameHash Labs](https://namehashlabs.org/).

## Development

To set up the development environment, run:

```
forge install
npm install   # or `yarn install` or `pnpm install`
```
