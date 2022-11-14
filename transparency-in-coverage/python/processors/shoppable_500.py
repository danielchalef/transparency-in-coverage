from core import stream_json_to_csv
from helpers import create_output_dir, import_set
import logging
import argparse

parser = argparse.ArgumentParser()
src_group = parser.add_mutually_exclusive_group(required=True)
src_group.add_argument("-u", "--url")
src_group.add_argument("-f", "--file")
parser.add_argument("-o", "--out", required=True)
args = parser.parse_args()

logger = logging.getLogger("core")
logger.setLevel(level=logging.DEBUG)

output_dir = args.out

# source: https://www.cms.gov/healthplan-price-transparency/resources/500-items-services
hcpcs_code_set = import_set(
    "data/tic_500_shoppable_services.csv", ints=False, header=True
)

mrf_path = args.url if args.url else args.file

create_output_dir(output_dir, overwrite=False)
stream_json_to_csv(
    mrf_path, output_dir=output_dir, code_list=hcpcs_code_set, npi_list=None
)
