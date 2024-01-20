The following transaction object representing a 1inch swap

```
{'toAmount': '43378', 'tx': {'from': '0xda5dd51a8869aa961b13a3fcae5ef5e2cd565bef', 'to': '0x1111111254eeb25477b68fb85ed929f73a960582', 'data': '0x0502b1c5000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc20000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000a7c00000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000180000000000000003b6d0340fe9e7931e55c514c33d489c88582fa36e84bd8e38b1ccac8', 'value': '0', 'gas': 145421, 'gasPrice': '19572556833'}}
```

may be created via the following python code, and querying the 1inch api:

```python
import requests

chainId = 1  # Chain ID for Binance Smart Chain (BSC)
web3RpcUrl = "https://bsc-dataseed.binance.org"  # URL for BSC node
headers = { "Authorization": "Bearer [RQhlHyWBu3DV0HHaHYyvGuwEbI4jwf9Z]", "accept": "application/json" }
walletAddress = "0xDA5DD51A8869aA961b13A3FCAe5ef5e2Cd565Bef"  # Your wallet address
privateKey = "0x...xxx"  # Your wallet's private key. NEVER SHARE THIS WITH ANYONE!

swapParams = {
    "src": "0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2",  # Token address of 1INCH
    "dst": "0x8AB2ff0116A279a99950C66A12298962D152B83c",  # Token address of DAI 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
    "amount": "1",  # Amount of 1INCH to swap (in wei)
    "from": walletAddress,
    "slippage": 1,  # Maximum acceptable slippage percentage for the swap (e.g., 1 for 1%)
    "disableEstimate": False,  # Set to True to disable estimation of swap details
    "allowPartialFill": False,  # Set to True to allow partial filling of the swap order
}

apiBaseUrl = f"https://api.1inch.dev/swap/v5.2/{chainId}"

def apiRequestUrl(methodName, queryParams):
    return f"{apiBaseUrl}{methodName}?{'&'.join([f'{key}={value}' for key, value in queryParams.items()])}"

url = apiRequestUrl("/swap", swapParams)
swapTransaction = requests.get(url,  headers={'Authorization': f'RQhlHyWBu3DV0HHaHYyvGuwEbI4jwf9Z'}).json()
print(swapTransaction)
```