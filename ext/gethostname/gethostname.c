#include <sys/types.h>
#include <sys/socket.h>
#include <string.h>
#include <arpa/inet.h>
#include <netdb.h>

#include "gethostname.h"

VALUE rb_mGethostname;

VALUE method_gethostname(VALUE self, VALUE hostname);

void
Init_gethostname(void)
{
  rb_mGethostname = rb_define_module("Gethostname");
  rb_define_singleton_method(rb_mGethostname, "gethostname", method_gethostname, 1);
}

VALUE method_gethostname(VALUE self, VALUE hostname) {
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
