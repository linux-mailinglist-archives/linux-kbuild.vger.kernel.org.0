Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 786AE3B81C
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2019 17:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390229AbfFJPOO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Jun 2019 11:14:14 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38187 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389999AbfFJPON (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jun 2019 11:14:13 -0400
Received: by mail-qk1-f194.google.com with SMTP id a27so5725770qkk.5;
        Mon, 10 Jun 2019 08:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=H1ewjkywcnvrKPXKSSfpUYd1qCcjhNSySsf/rZqj7Ns=;
        b=j1olzPPxA5uxh7fdPaHv/cZNv9rpoEDaN+shBv2XshIazCzhher8AKYrwcmlE3pLdu
         GlS8Ot9f248QRbuMweUx6j70kxQhmIsvQmLmn94T7rxwCxtlF1wPZDcU1K7bolCdSGaj
         y/wQEicVkrVuOg/vHyM6C3lPAUXXJa+VGwl4lzerIqPJ7WJ35XrDY0HHrS+4NK9E/OOW
         N0AlNYh6BoKCJgc0cvHuDorCjRHqirqmItct/LfFmnoXD8SDolthlwpgrdIcdxaYX1A9
         nrHHzs2JTZyCyqZr3rGByY9esOa0CTDKpL1Zht2tjZDpRdMEuJdvszs1O3msoJgcHz+s
         KthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=H1ewjkywcnvrKPXKSSfpUYd1qCcjhNSySsf/rZqj7Ns=;
        b=nz/iBXgDOCJC3Xh3b/V6iXQGeFMU4Ozws68osZ0Vu/yjUl8CwpWoUcn8P6pAi6lyBO
         Qufj0VvlHsLeAH1zwRIg/sSUZlWudn9CEthctRQwlyZwN3Ur2PbbazmCPXdP7XDb25iA
         lUq5o/oZBksJQKCbIZ7mnGxQm+3Bz1tubVdaOXvcLhM3oH5uX8SmLTW8nFZMkvsO3XEa
         wDWnCAADEar0QRqekI7f5dQ4ITWawHot4MkpzuhCZvMFbD7W6R7n0Fycz1TVX1YdhRRs
         DbDGhN25dwmiXMtByD9qYJShHSJzq9IyoTZszpt3wdHH5Ppu2scP4r5pxc9OcNlw5Iyx
         IiDg==
X-Gm-Message-State: APjAAAVkbp7C+cqcnORiUaTAH0cTdOu54dR+5OoRR7QlwaeSjL0Z/tmV
        HARV1B+MwgP8IlBZXDEMiUs=
X-Google-Smtp-Source: APXvYqyUNRjIipFfIT4MALvCaJkF3qclRIJ48vlLMdX5moHThpAqIxevAnTAHyZhmgOLfFRN8KmOrA==
X-Received: by 2002:ae9:ec10:: with SMTP id h16mr37615196qkg.215.1560179652374;
        Mon, 10 Jun 2019 08:14:12 -0700 (PDT)
Received: from quaco.ghostprotocols.net (179-240-164-83.3g.claro.net.br. [179.240.164.83])
        by smtp.gmail.com with ESMTPSA id a139sm5364633qkb.48.2019.06.10.08.14.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 10 Jun 2019 08:14:11 -0700 (PDT)
From:   Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id BE41B41149; Mon, 10 Jun 2019 12:14:07 -0300 (-03)
Date:   Mon, 10 Jun 2019 12:14:07 -0300
To:     Ivan Babrou <ivan@cloudflare.com>
Cc:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190610151407.GS21245@kernel.org>
References: <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com>
 <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com>
 <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517152200.GI8945@kernel.org>
 <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
 <4FE2D490-F379-4CAE-9784-9BF81B7FE258@kernel.org>
 <CABWYdi2XXPYuavF0p=JOEY999M4z3_rk-8xsi3N=do=d7k09ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABWYdi2XXPYuavF0p=JOEY999M4z3_rk-8xsi3N=do=d7k09ig@mail.gmail.com>
X-Url:  http://acmel.wordpress.com
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Mon, Jun 10, 2019 at 12:21:51AM -0700, Ivan Babrou escreveu:
> Looks like 4.19.49 received some patches for GCC 9+, but unfortunately
> perf still doesn't want to compile:
> 
> [07:15:32]In file included from /usr/include/string.h:635,
> [07:15:32] from util/debug.h:7,
> [07:15:32] from builtin-help.c:15:
> [07:15:32]In function 'strncpy',
> [07:15:32] inlined from 'add_man_viewer' at builtin-help.c:192:2,
> [07:15:32] inlined from 'perf_help_config' at builtin-help.c:284:3:
> [07:15:32]/usr/include/x86_64-linux-gnu/bits/string3.h:126:10: error:
> '__builtin_strncpy' output truncated before terminating nul copying as
> many bytes from a string as its length [-Werror=stringop-truncation]
> [07:15:32] 126 | return __builtin___strncpy_chk (__dest, __src, __len,
> __bos (__dest));
> [07:15:32] | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> [07:15:32]builtin-help.c: In function 'perf_help_config':
> [07:15:32]builtin-help.c:187:15: note: length computed here
> [07:15:32] 187 | size_t len = strlen(name);
> [07:15:32] | ^~~~~~~~~~~~
> [07:15:32]cc1: all warnings being treated as errors

The patch below should've taken care of that, and it has a Fixes: tag,
i.e. the stable scripts should've noticed that, and it was noticed with
gcc 8.2.

- Arnaldo

commit b6313899f4ed2e76b8375cf8069556f5b94fbff0
Author: Arnaldo Carvalho de Melo <acme@redhat.com>
Date:   Thu Dec 6 11:20:21 2018 -0300

    perf help: Remove needless use of strncpy()

    Since we make sure the destination buffer has at least strlen(orig) + 1,
    no need to do a strncpy(dest, orig, strlen(orig)), just use strcpy(dest,
    orig).

    This silences this gcc 8.2 warning on Alpine Linux:

      In function 'add_man_viewer',
          inlined from 'perf_help_config' at builtin-help.c:284:3:
      builtin-help.c:192:2: error: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]
        strncpy((*p)->name, name, len);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      builtin-help.c: In function 'perf_help_config':
      builtin-help.c:187:15: note: length computed here
        size_t len = strlen(name);
                     ^~~~~~~~~~~~

    Cc: Adrian Hunter <adrian.hunter@intel.com>
    Cc: Jiri Olsa <jolsa@kernel.org>
    Cc: Namhyung Kim <namhyung@kernel.org>
    Fixes: 078006012401 ("perf_counter tools: add in basic glue from Git")
    Link: https://lkml.kernel.org/n/tip-2f69l7drca427ob4km8i7kvo@git.kernel.org
    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

> On Fri, May 17, 2019 at 11:27 AM Arnaldo Carvalho de Melo
> <arnaldo.melo@gmail.com> wrote:
> >
> > On May 17, 2019 2:23:10 PM GMT-03:00, Ivan Babrou <ivan@cloudflare.com> wrote:
> > >On Fri, May 17, 2019 at 8:22 AM Arnaldo Carvalho de Melo
> > ><arnaldo.melo@gmail.com> wrote:
> > >>
> > >> Em Fri, May 17, 2019 at 11:01:45AM +0200, Miguel Ojeda escreveu:
> > >> > On Fri, May 17, 2019 at 10:51 AM Greg KH
> > ><gregkh@linuxfoundation.org> wrote:
> > >> > >
> > >> > > On Fri, May 17, 2019 at 10:35:29AM +0200, Miguel Ojeda wrote:
> > >> > > > On Fri, May 17, 2019 at 9:38 AM Peter Zijlstra
> > ><peterz@infradead.org> wrote:
> > >> > > > >
> > >> > > > > Right; if there is anything you can reproduce on linus.git
> > >I'll happily
> > >> > > > > have a look. If it doesn't reproduce all you have to do is
> > >find the
> > >> > > > > patches that make it work and ask Greg.
> > >> > > >
> > >> > > > Just to clarify: Linus' master is clean of these issues with
> > >GCC 9.1.1.
> > >> > >
> > >> > > Great!  Care to find the patches that did that work and send me
> > >the git
> > >> > > commit ids so that I can queue them up?  I don't have gcc9 here
> > >yet on
> > >> > > my systems, so I can not test for this.
> > >> >
> > >> > I am unsure about the perf and the objtools parts (Peter/Josh?),
> > >but
> > >>
> > >> I'm not noticing these while building upstream perf with gcc 9.1.1 on
> >                                                                        ^^^^^^^^^^^^^^^
> >
> > >at
> > >> least fedora:30.
> > >>
> > >>     33  fedora:30                     : Ok   gcc (GCC) 9.1.1 20190503
> > >(Red Hat 9.1.1-1)
> > >
> > >I've tried to replicate this in fedora:30 docker container and it's
> > >there:
> > >
> > >[root@linuxkit-025000000001 perf]# gcc --version
> > >gcc (GCC) 9.1.1 20190503 (Red Hat 9.1.1-1)
> > >
> > >[root@linuxkit-025000000001 perf]# pwd
> > >/tmp/linux-4.19.44/tools/perf
> >              ^^^^^^^^^^^^^^
> >
> > That is not upstream perf, please look for patches from 4.19 to Linus' master Branch for fixes.
> >
> > I'll triple check here in a f30 container just in case meanwhile.
> >
> > Thanks,
> >
> > - Arnaldo
> > >
> > >[root@linuxkit-025000000001 perf]# make -j1
> > >...
> > >trace/beauty/ioctl.c: In function ‘ioctl__scnprintf_kvm_cmd’:
> > >trace/beauty/ioctl.c:85:82: error: array subscript [-2147483648, -1]
> > >is outside array bounds of ‘const char *[0]’ [-Werror=array-bounds]
> > >   85 |  if (nr < strarray__kvm_ioctl_cmds.nr_entries &&
> > >strarray__kvm_ioctl_cmds.entries[nr] != NULL)
> > >      |
> > >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> > >In file included from trace/beauty/ioctl.c:82:
> > >/tmp/linux-4.19.44/tools/perf/trace/beauty/generated/ioctl/kvm_ioctl_array.c:1:20:
> > >note: while referencing ‘kvm_ioctl_cmds’
> > >    1 | static const char *kvm_ioctl_cmds[] = {
> > >      |                    ^~~~~~~~~~~~~~
> > >In file included from /usr/include/string.h:494,
> > >                 from util/debug.h:7,
> > >                 from builtin-help.c:15:
> > >In function ‘strncpy’,
> > >    inlined from ‘add_man_viewer’ at builtin-help.c:192:2,
> > >    inlined from ‘perf_help_config’ at builtin-help.c:284:3:
> > >/usr/include/bits/string_fortified.h:106:10: error:
> > >‘__builtin_strncpy’ output truncated before terminating nul copying as
> > >many bytes from a string as its length [-Werror=stringop-truncation]
> > >106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos
> > >(__dest));
> > >|
> > >^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >builtin-help.c: In function ‘perf_help_config’:
> > >builtin-help.c:187:15: note: length computed here
> > >  187 |  size_t len = strlen(name);
> > >      |               ^~~~~~~~~~~~
> > >trace/beauty/ioctl.c: In function ‘ioctl__scnprintf_perf_cmd’:
> > >trace/beauty/ioctl.c:109:84: error: array subscript [-2147483648, -1]
> > >is outside array bounds of ‘const char *[0]’ [-Werror=array-bounds]
> > >  109 |  if (nr < strarray__perf_ioctl_cmds.nr_entries &&
> > >strarray__perf_ioctl_cmds.entries[nr] != NULL)
> > >      |
> > >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> > >In file included from trace/beauty/ioctl.c:106:
> > >/tmp/linux-4.19.44/tools/perf/trace/beauty/generated/ioctl/perf_ioctl_array.c:1:20:
> > >note: while referencing ‘perf_ioctl_cmds’
> > >    1 | static const char *perf_ioctl_cmds[] = {
> > >      |                    ^~~~~~~~~~~~~~~
> > >cc1: all warnings being treated as errors
> > >
> > >> > about the -Wmissing-attributes I cleaned, they were these:
> > >>
> > >> > a6e60d84989f ("include/linux/module.h: copy __init/__exit attrs to
> > >> > init/cleanup_module")
> > >> > c0d9782f5b6d ("Compiler Attributes: add support for __copy (gcc >=
> > >9)")
> > >> > ff98e20ef208 ("lib/crc32.c: mark crc32_le_base/__crc32c_le_base
> > >> > aliases as __pure")
> > >> >
> > >> > Cheers,
> > >> > Miguel
> > >>
> > >> --
> > >>
> > >> - Arnaldo
> >

-- 

- Arnaldo
