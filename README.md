# Asset Protect Action

Unpacks all the zip assets in a folder that was created using the `pack.sh` script.
The script uses a password protected zip to protect assets in a public repository that should not be shared. 

## Inputs

### `path`

**Required** The path to the `.zip` asset files

### `password`

**Required** The password for the `.zip` files

### `output`

The path to extract the `.zip` asset files. Default: same folder as the zip files

## Example usage

```yml
uses: kuma-gee/action-protect-action@v1
with:
    path: assets
    password: a-password-01
    output: out
```