import json


num_ref = 10


def generate_json():
    data = {
        "block_numbers": [5147955 for i in range(num_ref)],
        "tx_idxs": [31 for i in range(num_ref)],
        "log_idxs": [0 for i in range(num_ref)],
        "referrer_id": 1,
        "num_claims": 1,
    }

    json_data = json.dumps(data, indent=4)
    print(json_data)


if __name__ == "__main__":
    generate_json()
