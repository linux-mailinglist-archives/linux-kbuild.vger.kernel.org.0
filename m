Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 681D621C64
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 19:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbfEQRXY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 13:23:24 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43370 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbfEQRXX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 13:23:23 -0400
Received: by mail-qt1-f196.google.com with SMTP id i26so8827655qtr.10
        for <linux-kbuild@vger.kernel.org>; Fri, 17 May 2019 10:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WEZ7AiajoAMSBYXOBuJNhhjKANkhKtoMOAplcmbEPfs=;
        b=K4m9yztG8Wq/hQHBRz2dza3n6qfE9FDCnzo0GZZYZ1kHQWaOcPYvgP2WNyuDf3dN4N
         9lr6CYXGHGCHFbPQfHTCJwM82G5zl917lxxTFq5mOjP0k0ICpxm3RYCEZF2kA4iK6ASe
         ypKJoT5bOd14UPcY0euHX+lddCo7MYZkTxXDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WEZ7AiajoAMSBYXOBuJNhhjKANkhKtoMOAplcmbEPfs=;
        b=s4WTOvFfnPSpRfPtIvvEu0XQb5eS0qXMWUu7ppFaS2S4uopMnCq2rSJin7JIjZUwmo
         Mf85KHTSdDCqLr/RjWvlVxJ4X489pvpjWWwO/rShhh4wNQPDSxM6nxYtwkKUS/YpBxYA
         +PjfnFzkBx/53TjqXHuQ1R2zmUVXGhfPiOnlRpiPy65Vw0XlvOv/1to4kJnlcBIoCKmm
         JAl14PzOug23bInx3GD6LsIzwtk4hNTqzPB6+bpXyY1hhUoYsCNFf1sCNJBxZLTbeVot
         wX0N+rFo7sUuzwqSfKIfrn91PPGJ8SN4ezwhR4dG2bVDSEVNWrB13UWoibgijGZNnj9Q
         Metg==
X-Gm-Message-State: APjAAAUejrVYkcQ/O+uVVjXeYs53wIanPIZO5j/TKQbsHIzH5b282M2P
        pfy6Upa84eEH86o+SRFpD8VVQeAFEsxT9MfmaY/ufA==
X-Google-Smtp-Source: APXvYqyr9QnyTM8BEaMPnV2eB92VgCk/mI9dzB9/xVz8fcWRZK0RY9dzJsypig9ucdPf1oKbLlluFRgd0bIemntKoqM=
X-Received: by 2002:ac8:27fb:: with SMTP id x56mr16696632qtx.14.1558113802118;
 Fri, 17 May 2019 10:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
 <20190516225013.nvhwqi5tfwtby6qb@treble> <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com> <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com> <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517152200.GI8945@kernel.org>
In-Reply-To: <20190517152200.GI8945@kernel.org>
From:   Ivan Babrou <ivan@cloudflare.com>
Date:   Fri, 17 May 2019 10:23:10 -0700
Message-ID: <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
To:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 8:22 AM Arnaldo Carvalho de Melo
<arnaldo.melo@gmail.com> wrote:
>
> Em Fri, May 17, 2019 at 11:01:45AM +0200, Miguel Ojeda escreveu:
> > On Fri, May 17, 2019 at 10:51 AM Greg KH <gregkh@linuxfoundation.org> w=
rote:
> > >
> > > On Fri, May 17, 2019 at 10:35:29AM +0200, Miguel Ojeda wrote:
> > > > On Fri, May 17, 2019 at 9:38 AM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> > > > >
> > > > > Right; if there is anything you can reproduce on linus.git I'll h=
appily
> > > > > have a look. If it doesn't reproduce all you have to do is find t=
he
> > > > > patches that make it work and ask Greg.
> > > >
> > > > Just to clarify: Linus' master is clean of these issues with GCC 9.=
1.1.
> > >
> > > Great!  Care to find the patches that did that work and send me the g=
it
> > > commit ids so that I can queue them up?  I don't have gcc9 here yet o=
n
> > > my systems, so I can not test for this.
> >
> > I am unsure about the perf and the objtools parts (Peter/Josh?), but
>
> I'm not noticing these while building upstream perf with gcc 9.1.1 on at
> least fedora:30.
>
>     33  fedora:30                     : Ok   gcc (GCC) 9.1.1 20190503 (Re=
d Hat 9.1.1-1)

I've tried to replicate this in fedora:30 docker container and it's there:

[root@linuxkit-025000000001 perf]# gcc --version
gcc (GCC) 9.1.1 20190503 (Red Hat 9.1.1-1)

[root@linuxkit-025000000001 perf]# pwd
/tmp/linux-4.19.44/tools/perf

[root@linuxkit-025000000001 perf]# make -j1
...
trace/beauty/ioctl.c: In function =E2=80=98ioctl__scnprintf_kvm_cmd=E2=80=
=99:
trace/beauty/ioctl.c:85:82: error: array subscript [-2147483648, -1]
is outside array bounds of =E2=80=98const char *[0]=E2=80=99 [-Werror=3Darr=
ay-bounds]
   85 |  if (nr < strarray__kvm_ioctl_cmds.nr_entries &&
strarray__kvm_ioctl_cmds.entries[nr] !=3D NULL)
      |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
In file included from trace/beauty/ioctl.c:82:
/tmp/linux-4.19.44/tools/perf/trace/beauty/generated/ioctl/kvm_ioctl_array.=
c:1:20:
note: while referencing =E2=80=98kvm_ioctl_cmds=E2=80=99
    1 | static const char *kvm_ioctl_cmds[] =3D {
      |                    ^~~~~~~~~~~~~~
In file included from /usr/include/string.h:494,
                 from util/debug.h:7,
                 from builtin-help.c:15:
In function =E2=80=98strncpy=E2=80=99,
    inlined from =E2=80=98add_man_viewer=E2=80=99 at builtin-help.c:192:2,
    inlined from =E2=80=98perf_help_config=E2=80=99 at builtin-help.c:284:3=
:
/usr/include/bits/string_fortified.h:106:10: error:
=E2=80=98__builtin_strncpy=E2=80=99 output truncated before terminating nul=
 copying as
many bytes from a string as its length [-Werror=3Dstringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__de=
st));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
builtin-help.c: In function =E2=80=98perf_help_config=E2=80=99:
builtin-help.c:187:15: note: length computed here
  187 |  size_t len =3D strlen(name);
      |               ^~~~~~~~~~~~
trace/beauty/ioctl.c: In function =E2=80=98ioctl__scnprintf_perf_cmd=E2=80=
=99:
trace/beauty/ioctl.c:109:84: error: array subscript [-2147483648, -1]
is outside array bounds of =E2=80=98const char *[0]=E2=80=99 [-Werror=3Darr=
ay-bounds]
  109 |  if (nr < strarray__perf_ioctl_cmds.nr_entries &&
strarray__perf_ioctl_cmds.entries[nr] !=3D NULL)
      |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
In file included from trace/beauty/ioctl.c:106:
/tmp/linux-4.19.44/tools/perf/trace/beauty/generated/ioctl/perf_ioctl_array=
.c:1:20:
note: while referencing =E2=80=98perf_ioctl_cmds=E2=80=99
    1 | static const char *perf_ioctl_cmds[] =3D {
      |                    ^~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

> > about the -Wmissing-attributes I cleaned, they were these:
>
> > a6e60d84989f ("include/linux/module.h: copy __init/__exit attrs to
> > init/cleanup_module")
> > c0d9782f5b6d ("Compiler Attributes: add support for __copy (gcc >=3D 9)=
")
> > ff98e20ef208 ("lib/crc32.c: mark crc32_le_base/__crc32c_le_base
> > aliases as __pure")
> >
> > Cheers,
> > Miguel
>
> --
>
> - Arnaldo
