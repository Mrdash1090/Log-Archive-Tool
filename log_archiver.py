import os
import tarfile
from database import datetime
import argparse



def compress_logs(log_directory,output_directory):
	#Ensure the log directory Exsists
	if not os.path.isdir(log_directory):
		print(f"Error: The directory '{log_directory}' does not exist.")
		return
		
	#Ensure output Directory exists or create it
	if not os.path.exists(output_directory):
		os.makedirs(output_directory)
		
		
	# Generate a timestamped filename for the archive
	timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
	archive_name=f"logs_archive_{timestamp}.tar.gz"
	archive_path = os.path.join(output_directory,archive_name)
	
	
	#Compress the log
	with tarfile.open(archive_path, "w:gz") as tar:
		tar.add(log_directory, arcname=os.path.basename(log_directory))
		
	#Log the date and time of archive
	log_file = os.path.join(output_directory,"archive_log.txt")
	with open(log_file,"a") as log:
		log.write(f"Archived {log_directory} to {archive_path} at {timestamp}\n")
	
	print(f"Logs compressed to: {archive_path}")
	print(f"Archive log updated at: {log_file}")




def main():
	parser = argparse.ArgumentParser(description="Archive and Compless logs from a deirectory.")
	parser.add_argument("log_directory", help="The directory containing logs to be archived.")
	parser.add_argument("-o", "--output_directory", default="log_archives",help="The directory to store the compressed log files. Default is 'log_atchive'.")
	
	args = parser.parse_args()
	compress_logs(args.log_directory, args.output_directory)



if __name__ == "__main__":
	main()