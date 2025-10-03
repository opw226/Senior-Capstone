# 2025-10-03T10:16:08.258509100
import vitis

client = vitis.create_client()
client.set_workspace(path="257")

comp = client.create_hls_component(name = "ThreeLaneLogic",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

vitis.dispose()

