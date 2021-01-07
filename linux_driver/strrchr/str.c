#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[])
{
	char* pstr = argv[1];
	char *tail = strrchr(pstr, '*');
	char *head = strchr(pstr, '*');


	printf("pstr = %s, tail = %s\n", pstr, tail);
	printf("head = %s\n", head);

	return 0;
}
