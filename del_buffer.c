void
del_buffer(char *buffer)
{
    for (int i = 0; i < 8; i++) {
        buffer[i] = 0;
    }
    return;
}