## Convert yaml policy to JSON

```sh
yq -o json policy.yaml > policy.json
```

## Create IAM policy

```sh
aws iam create-policy \
--policy-name my-fun-policy \
--policy-document file://policy.json
```

## Create a new policy version and set it as default

The only way to update a managed policy
Can create up tp 5 versions of a specific policy

```sh
aws iam create-policy-version \
--policy-arn arn:aws:iam::647264525674:policy/my-fun-policy \
--policy-document file://policy.json \
--set-as-default
```

## List policy versions

```sh
aws iam list-policy-versions \
--policy-arn arn:aws:iam::647264525674:policy/my-fun-policy
```

## Delete a policy version

```sh
aws iam delete-policy-version \
--policy-arn arn:aws:iam::647264525674:policy/my-fun-policy \
--version-id v1
```

## Attach the policy to a user

```sh
aws iam attach-user-policy \
--policy-arn arn:aws:iam::647264525674:policy/my-fun-policy \
--user-name aws-examples
```