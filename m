Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934A425B079
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Sep 2020 17:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbgIBP7O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Sep 2020 11:59:14 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:30974 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbgIBP7M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Sep 2020 11:59:12 -0400
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 082FwpUC011268;
        Thu, 3 Sep 2020 00:58:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 082FwpUC011268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599062332;
        bh=xg1lHOdLvPs4wIcNE5BTYeU/mB/VXpUhZ8/utbHvD+U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ersggAhpAUae67ViM5hc/9a2Dj6H8eS574gFJR5TCSNbGQw1BwklAG3zygAIFOgGv
         KAYObhGn12sUj+5ADdKlhcT9wwePs5+594QWDA8E8v918C8q5H5bDfy1R55FCyCeTU
         s+FHKGtFx6APVNn9xyk3JQfMNtOafheIQdpYYlEFnxKKHRoHP4E2i6P/5Vb2J7Fxjb
         ssdQi2gJDcHK+O97RlGZKeiO+OosSaXInMVoXvdSLZiGuciTC2JJbgyEPNggf28JBq
         wO+NzsR7vogAjBiz9vt0L6/1p0xPhH5YNjW/yhBvvG7mJ1DTELJOHPyK1PNBkcj5s5
         DAOuzt92Aq8Pw==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id l9so2489070plt.8;
        Wed, 02 Sep 2020 08:58:52 -0700 (PDT)
X-Gm-Message-State: AOAM530q6Gs0+wtqASH/okUx9kGCBw4rV8TUTOpa2wsGz+Wnx41HfHXt
        AX8xyxLJ0CZOzh7LdCTWge8ab46sbMMDo0rgoik=
X-Google-Smtp-Source: ABdhPJyhRe9uyya+PU49N3I9jbZZWiwmQ6B5Tpviu+McET8binEp6ah2KEbgcxq6Xm4KhXl+4XoVZHEzI7W9o2I2ARw=
X-Received: by 2002:a17:90b:1211:: with SMTP id gl17mr2877937pjb.87.1599062331269;
 Wed, 02 Sep 2020 08:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200805102550.GO2674@hirez.programming.kicks-ass.net> <20200806120438.GG35926@hirez.programming.kicks-ass.net>
In-Reply-To: <20200806120438.GG35926@hirez.programming.kicks-ass.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 3 Sep 2020 00:58:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQE2jPUQJUa1yi7+=w--Jj-wwnGVR2hyPQZxR7Yp9odBA@mail.gmail.com>
Message-ID: <CAK7LNAQE2jPUQJUa1yi7+=w--Jj-wwnGVR2hyPQZxR7Yp9odBA@mail.gmail.com>
Subject: Re: [PATCH -v2] scipts/tags.sh: Add custom sort order
To:     "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000003ac72b05ae56b6fc"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--0000000000003ac72b05ae56b6fc
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 7, 2020 at 2:28 AM <peterz@infradead.org> wrote:
>
>
> One long standing annoyance I have with using vim-tags is that our tags
> file is not properly sorted. That is, the sorting exhuberant Ctags does
> is only on the tag itself.
>
> The problem with that is that, for example, the tag 'mutex' appears a
> mere 505 times, 492 of those are structure members. However it is _far_
> more likely that someone wants the struct definition when looking for
> the mutex tag than any of those members. However, due to the nature of
> the sorting, the struct definition will not be first.
>
> So add a script that does a custom sort of the tags file, taking the tag
> kind into account.
>
> The kind ordering is roughly: 'type', 'function', 'macro', 'enum', rest.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
> Changes since v1:
>  - removed the need for tags.unsorted by using a pipe
>
> Due to this change 'make tags' is now actually faster than it was before
> due to less sorting.
>
>  scripts/sort-tags.awk | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  scripts/tags.sh       | 11 +++++--
>  2 files changed, 87 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/sort-tags.awk b/scripts/sort-tags.awk
> new file mode 100755
> index 000000000000..1eb50406c9d3
> --- /dev/null
> +++ b/scripts/sort-tags.awk
> @@ -0,0 +1,79 @@
> +#!/usr/bin/awk -f
> +
> +# $ ctags --list-kinds
> +# C
> +#   c  classes
> +#   s  structure names
> +#   t  typedefs
> +#   g  enumeration names
> +#   u  union names
> +#   n  namespaces
> +
> +#   f  function definitions
> +#   p  function prototypes [off]
> +#   d  macro definitions
> +
> +#   e  enumerators (values inside an enumeration)
> +#   m  class, struct, and union members
> +#   v  variable definitions
> +
> +#   l  local variables [off]
> +#   x  external and forward variable declarations [off]
> +
> +BEGIN {
> +       FS = "\t"
> +
> +       sort = "LC_ALL=C sort"
> +
> +       # our sort order for C kinds:
> +       order["c"] = "A"
> +       order["s"] = "B"
> +       order["t"] = "C"
> +       order["g"] = "D"
> +       order["u"] = "E"
> +       order["n"] = "F"
> +       order["f"] = "G"
> +       order["p"] = "H"
> +       order["d"] = "I"
> +       order["e"] = "J"
> +       order["m"] = "K"
> +       order["v"] = "L"
> +       order["l"] = "M"
> +       order["x"] = "N"
> +}
> +
> +# pass through header
> +/^!_TAG/ {
> +       print $0
> +       next
> +}
> +
> +{
> +       # find 'kinds'
> +       for (i = 1; i <= NF; i++) {
> +               if ($i ~ /;"$/) {
> +                       kind = $(i+1)
> +                       break;
> +               }
> +       }
> +
> +       # create sort key
> +       if (order[kind])
> +               key = $1 order[kind];
> +       else
> +               key = $1 "Z";
> +
> +       # get it sorted
> +       print key "\t" $0 |& sort
> +}
> +
> +END {
> +       close(sort, "to")
> +       while ((sort |& getline) > 0) {
> +               # strip key
> +               sub(/[^[:space:]]*[[:space:]]*/, "")
> +               print $0
> +       }
> +       close(sort)
> +}
> +
> diff --git a/scripts/tags.sh b/scripts/tags.sh
> index 4e18ae5282a6..51087c3d8b1e 100755
> --- a/scripts/tags.sh
> +++ b/scripts/tags.sh
> @@ -251,8 +251,10 @@ setup_regex()
>
>  exuberant()
>  {
> +       (
> +
>         setup_regex exuberant asm c
> -       all_target_sources | xargs $1 -a                        \
> +       all_target_sources | xargs $1                           \
>         -I __initdata,__exitdata,__initconst,__ro_after_init    \
>         -I __initdata_memblock                                  \
>         -I __refdata,__attribute,__maybe_unused,__always_unused \
> @@ -266,12 +268,15 @@ exuberant()
>         -I DEFINE_TRACE,EXPORT_TRACEPOINT_SYMBOL,EXPORT_TRACEPOINT_SYMBOL_GPL \
>         -I static,const                                         \
>         --extra=+fq --c-kinds=+px --fields=+iaS --langmap=c:+.h \
> +       --sort=no -o -                                          \
>         "${regex[@]}"
>
>         setup_regex exuberant kconfig
> -       all_kconfigs | xargs $1 -a                              \
> -       --langdef=kconfig --language-force=kconfig "${regex[@]}"
> +       all_kconfigs | xargs $1                                 \
> +       --langdef=kconfig --language-force=kconfig --sort=no    \
> +       -o - "${regex[@]}"
>
> +       ) | scripts/sort-tags.awk > tags
>  }
>
>  emacs()


Sorry for the long delay.

First, this patch breaks 'make TAGS'
if 'etags' is a symlink to exuberant ctags.


masahiro@oscar:~/ref/linux$ etags --version
Exuberant Ctags 5.9~svn20110310, Copyright (C) 1996-2009 Darren Hiebert
  Addresses: <dhiebert@users.sourceforge.net>, http://ctags.sourceforge.net
  Optional compiled features: +wildcards, +regex

masahiro@oscar:~/ref/linux$ make TAGS
  GEN     TAGS
etags: Warning: include/linux/seqlock.h:738: null expansion of name pattern "\2"
sed: can't read TAGS: No such file or directory
make: *** [Makefile:1820: TAGS] Error 2




The reason is the hard-coded ' > tags',
and easy to fix.



But, honestly, I am not super happy about this patch.

Reason 1
  In my understanding, sorting by the tag kind only works
  for ctags. My favorite editor is emacs.
  (Do not get me wrong. I do not intend emacs vs vi war).
  So, I rather do 'make TAGS' instead of 'make tags',
  but this solution would not work for etags because
  etags has a different format.
  So, I'd rather want to see a more general solution.

Reason 2
  We would have more messy code, mixing two files/languages



When is it useful to tag structure members?

If they are really annoying, why don't we delete them
instead of moving them to the bottom of the tag file?



I attached an alternative solution,
and wrote up my thoughts in the log.

What do you think?


-- 
Best Regards
Masahiro Yamada

--0000000000003ac72b05ae56b6fc
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-scripts-tags.sh-remove-m-v-x-tag-kinds-from-exuberan.patch"
Content-Disposition: attachment; 
	filename="0001-scripts-tags.sh-remove-m-v-x-tag-kinds-from-exuberan.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kelke9dc0>
X-Attachment-Id: f_kelke9dc0

RnJvbSAxYTAwM2ZjZTdlNGY4NDYwZWYzMjU2ZmI1ZDk1OGZiNWM2Y2M2MzFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgpEYXRlOiBXZWQsIDIgU2VwIDIwMjAgMjE6NDk6NTkgKzA5MDAKU3ViamVjdDogW1BBVENIXSBz
Y3JpcHRzL3RhZ3Muc2g6IHJlbW92ZSBtLCB2LCB4IHRhZyBraW5kcyBmcm9tIGV4dWJlcmFudCB0
YWdzCgpFeHViZXJhbnQgQ3RhZ3Mgc3VwcG9ydHMgdGhlIGZvbGxvd2luZyBraW5kcyBvZiB0YWdz
OgoKICAkIGN0YWdzIC0tbGlzdC1raW5kcz1jCiAgYyAgY2xhc3NlcwogIGQgIG1hY3JvIGRlZmlu
aXRpb25zCiAgZSAgZW51bWVyYXRvcnMgKHZhbHVlcyBpbnNpZGUgYW4gZW51bWVyYXRpb24pCiAg
ZiAgZnVuY3Rpb24gZGVmaW5pdGlvbnMKICBnICBlbnVtZXJhdGlvbiBuYW1lcwogIGwgIGxvY2Fs
IHZhcmlhYmxlcyBbb2ZmXQogIG0gIGNsYXNzLCBzdHJ1Y3QsIGFuZCB1bmlvbiBtZW1iZXJzCiAg
biAgbmFtZXNwYWNlcwogIHAgIGZ1bmN0aW9uIHByb3RvdHlwZXMgW29mZl0KICBzICBzdHJ1Y3R1
cmUgbmFtZXMKICB0ICB0eXBlZGVmcwogIHUgIHVuaW9uIG5hbWVzCiAgdiAgdmFyaWFibGUgZGVm
aW5pdGlvbnMKICB4ICBleHRlcm5hbCBhbmQgZm9yd2FyZCB2YXJpYWJsZSBkZWNsYXJhdGlvbnMg
W29mZl0KClRoaXMgY29tbWl0IGV4Y2x1ZGVzICdtJywgJ3YnLCBhbmQgJ3gnLgoKUGV0ZXIgWmlq
bHN0cmEgc3RhdGVzOgoiVGhlIHByb2JsZW0gd2l0aCB0aGF0IGlzIHRoYXQsIGZvciBleGFtcGxl
LCB0aGUgdGFnICdtdXRleCcgYXBwZWFycyBhCm1lcmUgNTA1IHRpbWVzLCA0OTIgb2YgdGhvc2Ug
YXJlIHN0cnVjdHVyZSBtZW1iZXJzLiBIb3dldmVyIGl0IGlzIF9mYXJfCm1vcmUgbGlrZWx5IHRo
YXQgc29tZW9uZSB3YW50cyB0aGUgc3RydWN0IGRlZmluaXRpb24gd2hlbiBsb29raW5nIGZvcgp0
aGUgbXV0ZXggdGFnIHRoYW4gYW55IG9mIHRob3NlIG1lbWJlcnMuIgooaHR0cHM6Ly9sa21sLm9y
Zy9sa21sLzIwMjAvOC82LzUxMiIpCgpTbywgJ20nIGlzIHJhdGhlciBhbm5veWluZyB0aGFuIHVz
ZWZ1bC4gRm9yIHRoZSBzYW1lIHJlYXNvbiwgaXQgc2VlbXMKYmV0dGVyIHRvIHR1cm4gb2ZmICd2
Jy4KCllvdSBtYXkgYXJndWUgYWJvdXQgdGhlIGNyaXRlcmlhLCBidXQgd2UgbmVlZCB0byBkcmF3
IGEgbGluZSBzb21ld2hlcmUKdG8gbWFrZSBpdCByZWFzb25hYmxlIGZvciB0aGUgbWFqb3JpdHkg
b2YgcGVvcGxlLgoKV2UgZmxpcHBlZCAncCcgYW5kICd4JyBpbiB0aGUgcGFzdDoKClsxXSBjb21t
aXQgZjYzMzNlYjRlNzg4ICgia2J1aWxkOiBBZGQgY3RhZ3Mgc3VwcG9ydCBmb3IgZnVuY3Rpb24K
ICAgIHByb3RvdHlwZXMgYW5kIGV4dGVybmFsIHZhcmlhYmxlIGRlY2xhcmF0aW9ucyIpIGFkZGVk
ICdwJyBhbmQgJ3gnLAogICAgYnV0IGRpZCBub3QgZXhwbGFpbiB3aGVuIHRoZXkgYXJlIGFjdHVh
bGx5IHVzZWZ1bC4KClsyXSBjb21taXQgN2RiODZkYzk3ZmIwICgiY3RhZ3M6IHVzYWJpbGl0eSBm
aXgiKSByZW1vdmVkICdwJyBhbmQgJ3gnLAogICAgc3RhdGluZyBib3RoIG9mIHRoZW0gbWFrZSBu
byByZWFsIHNlbnNlLgoKWzNdIGNvbW1pdCAwYTE4YTkzODZjMDUgKCJ0YWdzOiBwdXQgZnVuY3Rp
b24gcHJvdG90eXBlcyBiYWNrISIpCiAgICByZS1hZGRlZCAncCcgYW5kICd4JywgYnV0IHRoZSBj
b21taXQgbG9nIG9ubHkgbWVudGlvbmVkICdwJy4KCk9LLCBbM10gY2xlYXJseSBleHBsYWluZWQg
d2h5ICdwJyBpcyB1c2VmdWwsIGJ1dCB0dXJuZWQgLS1jLWtpbmRzPStweAppbnRvIC0tYy1raW5k
cz0tcHguIFNvLCAneCcgd2FzIGFsc28gKGFjY2lkZW50YWxseT8pIGRpc2FibGVkLiBJIHRoaW5r
Cml0IHNob3VsZCBoYXZlIGJlZW4gLS1jLWtpbmRzPStwLXgsIG9yIG1vcmUgc2ltcGx5IC0tYy1r
aW5kcz0rcCBzaW5jZQoneCcgaXMgb2ZmIGJ5IGRlZmF1bHQuCgpJdCBzZWVtcyBhIGJ1ZyBvZiBb
M10sIHNvIEkgZGlzYWJsZWQgJ3gnIHRvIGdldCBiYWNrIHRoZSBwcmUtWzNdCmJlaGF2aW9yLgoK
J21ha2UgdGFncycgYW5kICdtYWtlIFRBR1MnIHdpbGwgcnVuIGZhc3RlciwgY3JlYXRlIG11Y2gg
c21hbGxlciB0YWdzCmlmIEN0YWdzIGlzIGV4dWJlcmFudC4KClJldmlld2VkLWJ5OiBQZXRlciBa
aWpsc3RyYSAoSW50ZWwpIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogTWFz
YWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KLS0tCiBzY3JpcHRzL3RhZ3Muc2gg
fCAxNSArLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy90YWdzLnNoIGIvc2NyaXB0cy90YWdz
LnNoCmluZGV4IDMyZDNmNTNhZjEwYi4uNDQwZjRlY2FkNDNiIDEwMDc1NQotLS0gYS9zY3JpcHRz
L3RhZ3Muc2gKKysrIGIvc2NyaXB0cy90YWdzLnNoCkBAIC0xNzksMTkgKzE3OSw2IEBAIHJlZ2V4
X2M9KAogCScvXkRFRl9QQ0lfQUNfXChcfE5PXClSRVQoXChbWzphbG51bTpdX10qXCkuKi9cMi8n
CiAJJy9eUENJX09QX1JFQUQoXChcdypcKS4qWzEtNF0pL3BjaV9idXNfcmVhZF9jb25maWdfXDEv
JwogCScvXlBDSV9PUF9XUklURShcKFx3KlwpLipbMS00XSkvcGNpX2J1c193cml0ZV9jb25maWdf
XDEvJwotCScvXDxERUZJTkVfXChSVF9NVVRFWFx8TVVURVhcfFNFTUFQSE9SRVx8U1BJTkxPQ0tc
KShcKFtbOmFsbnVtOl1fXSpcKS9cMi92LycKLQknL1w8REVGSU5FX1woUkFXX1NQSU5MT0NLXHxS
V0xPQ0tcfFNFUUxPQ0tcKShcKFtbOmFsbnVtOl1fXSpcKS9cMi92LycKLQknL1w8REVDTEFSRV9c
KFJXU0VNXHxDT01QTEVUSU9OXCkoXChbWzphbG51bTpdX11cK1wpL1wyL3YvJwotCScvXDxERUNM
QVJFX0JJVE1BUChcKFtbOmFsbnVtOl1fXSpcKS9cMS92LycKLQknL1woXlx8XHNcKVwoXHxMXHxI
XClMSVNUX0hFQUQoXChbWzphbG51bTpdX10qXCkvXDMvdi8nCi0JJy9cKF5cfFxzXClSQURJWF9U
UkVFKFwoW1s6YWxudW06XV9dKlwpL1wyL3YvJwotCScvXDxERUZJTkVfUEVSX0NQVShbXixdKiwg
KlwoW1s6YWxudW06XV9dKlwpL1wxL3YvJwotCScvXDxERUZJTkVfUEVSX0NQVV9TSEFSRURfQUxJ
R05FRChbXixdKiwgKlwoW1s6YWxudW06XV9dKlwpL1wxL3YvJwotCScvXDxERUNMQVJFX1dBSVRf
UVVFVUVfSEVBRChcKFtbOmFsbnVtOl1fXSpcKS9cMS92LycKLQknL1w8REVDTEFSRV9cKFRBU0tM
RVRcfFdPUktcfERFTEFZRURfV09SS1wpKFwoW1s6YWxudW06XV9dKlwpL1wyL3YvJwotCScvXChe
XHNcKU9GRlNFVChcKFtbOmFsbnVtOl1fXSpcKS9cMi92LycKLQknL1woXlxzXClERUZJTkUoXChb
WzphbG51bTpdX10qXCkvXDIvdi8nCi0JJy9cPFwoREVGSU5FXHxERUNMQVJFXClfSEFTSFRBQkxF
KFwoW1s6YWxudW06XV9dKlwpL1wyL3YvJwogCScvXDxERUZJTkVfSURcKFJcfEFcKShcKFtbOmFs
bnVtOl1fXVwrXCkvXDIvJwogCScvXDxERUZJTkVfV0RfQ0xBU1MoXChbWzphbG51bTpdX11cK1wp
L1wxLycKIAknL1w8QVRPTUlDX05PVElGSUVSX0hFQUQoXChbWzphbG51bTpdX11cK1wpL1wxLycK
QEAgLTI1NSw3ICsyNDIsNyBAQCBleHViZXJhbnQoKQogCS1JIEVYUE9SVF9TWU1CT0wsRVhQT1JU
X1NZTUJPTF9HUEwsQUNQSV9FWFBPUlRfU1lNQk9MICAgXAogCS1JIERFRklORV9UUkFDRSxFWFBP
UlRfVFJBQ0VQT0lOVF9TWU1CT0wsRVhQT1JUX1RSQUNFUE9JTlRfU1lNQk9MX0dQTCBcCiAJLUkg
c3RhdGljLGNvbnN0CQkJCQkJXAotCS0tZXh0cmE9K2ZxIC0tYy1raW5kcz0rcHggLS1maWVsZHM9
K2lhUyAtLWxhbmdtYXA9YzorLmggXAorCS0tZXh0cmE9K2ZxIC0tYy1raW5kcz0rcC1tdiAtLWZp
ZWxkcz0raWFTIC0tbGFuZ21hcD1jOisuaCBcCiAJIiR7cmVnZXhbQF19IgogCiAJc2V0dXBfcmVn
ZXggZXh1YmVyYW50IGtjb25maWcKLS0gCjIuMjUuMQoK
--0000000000003ac72b05ae56b6fc--
