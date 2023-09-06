# 阿里云部署配置

```json
{
    "metadata": {
        "name": "chatglm2_6b_checkpoint_v2",
        "instance": 1
    },
    "cloud": {
        "computing": {
            "instance_type": "ecs.gn7i-c8g1.2xlarge",
            "instances": null
        },
        "networking": {
            "vswitch_id": "vsw-2zeq0z469mkunwloht7s0",
            "security_group_id": "sg-2ze948tjmfrayn9ocuzr",
            "vpc_id": "vpc-2zerk45j66f4stey5hgj2"
        }
    },
    "storage": [
        {
            "oss": {
                "path": "oss://pai-eas-lingshi/chatglm2-6b/model/",
                "readOnly": false
            },
            "properties": {
                "resource_type": "model"
            },
            "mount_path": "/mnt/model"
        },
        {
            "oss": {
                "path": "oss://pai-eas-lingshi/chatglm2-6b/checkpoint/v1/",
                "readOnly": false
            },
            "properties": {
                "resource_type": "model"
            },
            "mount_path": "/mnt/checkpoint-1"
        },
        {
            "oss": {
                "path": "oss://pai-eas-lingshi/chatglm2-6b/code/",
                "readOnly": false
            },
            "properties": {
                "resource_type": "code"
            },
            "mount_path": "/mnt/code"
        }
    ],
    "containers": [
        {
            "image": "eas-registry-vpc.cn-beijing.cr.aliyuncs.com/pai-eas/chatglm-webui:1.0",
            "script": "python /mnt/code/ptuning/web_demo.sh --listen --port=8000",
            "port": 8000,
            "prepare": {
                "pythonRequirements": [
                    "/mnt/code/requirements.txt"
                ]
            }
        }
    ]
} 
 
```