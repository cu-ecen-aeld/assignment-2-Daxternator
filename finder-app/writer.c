#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <string.h>

int main(int argc, char *argv[]) {
    // Open syslog
    openlog("writer", LOG_PID|LOG_CONS, LOG_USER);

    // Check for correct argument count
    if (argc != 3) {
        syslog(LOG_ERR, "Invalid number of arguments. Usage: %s <string to write> <file path>", argv[0]);
        closelog();
        return 1;
    }

    // Extract arguments
    char *stringToWrite = argv[1];
    char *filePath = argv[2];

    // Attempt to open the file for writing
    FILE *file = fopen(filePath, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Could not open file %s for writing", filePath);
        closelog();
        return 1;
    }

    // Write the string to the file
    int numWritten = fprintf(file, "%s\n", stringToWrite);
    if (numWritten < 0) {
        syslog(LOG_ERR, "Failed to write to file %s", filePath);
        fclose(file);
        closelog();
        return 1;
    }

    // Log the write operation
    syslog(LOG_DEBUG, "Writing %s to %s", stringToWrite, filePath);

    // Clean up
    fclose(file);
    closelog();
    return 0;
}

