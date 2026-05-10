#include <stdio.h>
#include <ctype.h>

int main(int argc, char *argv[]) {
    // Ensure the user provides a file to read
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file in binary read mode ("rb")
    FILE *file = fopen(argv[1], "rb");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    unsigned char buffer[16];
    size_t bytes_read;
    unsigned int offset = 0;

    // Read up to 16 bytes at a time until the end of the file
    while ((bytes_read = fread(buffer, 1, sizeof(buffer), file)) > 0) {
        // 1. Print the offset (address) in hex, padded to 8 digits
        printf("%08x ", offset);

        // 2. Print the hex values of the bytes
        for (size_t i = 0; i < 16; i++) {
            if (i < bytes_read) {
                printf("%02x ", buffer[i]);
            } else {
                // Print padding spaces if the last line has fewer than 16 bytes
                // so the ASCII column stays aligned.
                printf("   "); 
            }
        }

        // 3. Print the ASCII representation
        printf("|");
        for (size_t i = 0; i < bytes_read; i++) {
            // isprint() checks if the character is a standard printable character
            if (isprint(buffer[i])) {
                printf("%c", buffer[i]);
            } else {
                printf("."); // Replace non-printable characters with a dot
            }
        }
        printf("|\n");

        // Increment the offset by however many bytes we successfully read
        offset += bytes_read;
    }

    fclose(file);
    return 0;
}