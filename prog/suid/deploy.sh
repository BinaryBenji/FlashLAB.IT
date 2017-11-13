passwd ubuntu <<EOF
admin10
admin10
EOF

cd /home/ubuntu
echo "
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	system(\"ls /home/ubuntu/.passwd\");
	return (0);
}" > key.c
gcc key.c
echo "f4ds67f6dsq1f34sdq314fsd" > .passwd
chmod 440 key.c
chmod 440 .passwd
chown ubuntu:ubuntu key.c
chown root:root .passwd
chown root:ubuntu a.out
chmod 4550 a.out
