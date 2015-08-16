# Accounter
### Workflow
https://drive.google.com/open?id=0B3x3REXwXKGhdjQ3YzZreV9ZeDA

Income is added to the highest bucket, then the next highest and so on until it runs out of buckets or money.

Expenses are subtracted from the lowest bucket, then the next bucket, and so until the entire expense has been accounted for.

Expenses may be subtracted from a specific bucket.

Income may be added to a specific bucket.

## Bucket Orders Controller
- Index
  Shows all Bucket Orders

- Show
  Shows a specific Bucket Order
  Each bucket in the order displays its current amount

## Income Controller
- Add Income
  Income is added to buckets according to the bucket hierarchy.

- Add Income To Bucket
  Adds the entire amount of the specified income to the specified bucket


## Expense Controller
- Subtract Expense
  The Expense is subtracted from the buckets according to the bucket hierarchy

- Subtract Expense From Bucket
  The Expense is subtracted from the specified bucket.

### Models

## Bucket Order
An array of buckets, ordered by savings priority
* Ordered Buckets [Array of IDs]

## Bucket
A labeled container for money
* Name
* Amount

## Expense
A labeled representation of an expense
* Name
* Start Amount
* Remaining Amount
* Date of Expense

## Income
A labeled representation of an income
* Name
* Start Amount
* Remaining Amount
* Date of Income
* Source

## Transaction
A record of a given addition or subtraction of funds
* Transfered Amount

