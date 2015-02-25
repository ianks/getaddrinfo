#include <sys/types.h>
#include <sys/socket.h>
#include <string.h>
#include <arpa/inet.h>
#include <netdb.h>

#include "gethostbyname.h"

VALUE rb_mGethostbyname;

VALUE method_gethostbyname(VALUE self, VALUE hostname);

void
Init_gethostbyname(void)
{
  rb_mGethostbyname = rb_define_module("Gethostbyname");
  rb_define_singleton_method(rb_mGethostbyname, "gethostbyname", method_gethostbyname, 1);
}

VALUE method_gethostbyname(VALUE self, VALUE hostname) {
  VALUE result = rb_ary_new();

  struct hostent *he;
  struct in_addr **addr_list;

  if ((he = gethostbyname(StringValueCStr(hostname))) == NULL)
    return result;

  addr_list = (struct in_addr **) he->h_addr_list;

  int i;
  for (i = 0; addr_list[i] != NULL; i++) {
    rb_ary_push(result, rb_str_new2(inet_ntoa(*addr_list[i])));
  }

  return result;
}
