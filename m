Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2ADE20FF3
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2019 23:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbfEPVVI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 May 2019 17:21:08 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41554 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbfEPVVI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 17:21:08 -0400
Received: by mail-lf1-f68.google.com with SMTP id d8so3739978lfb.8;
        Thu, 16 May 2019 14:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iqCUFlS+Yjw8tPSXYr3TsbX6qnkjSzlez9AobiS2yvw=;
        b=MTJ2ON2kOqc8B763X/6RcOIqkSknfKdLZuyUQ2Vnv/7dQW+2eFD7Aq8qziD9K2qwDW
         QSXz8/0ZlIDhuBvqhiwvpbpX71Y2SVB3plRIUTd0kto92LMJOltJD3RwhiUZHU+16Ire
         YVVym49y9ToMsZC2DPz2oclt5zTeuZMD3ObXvXqyGyY95rnhCiTBznw7ExbrFbUxmjiQ
         cDySVbD3XFQnjwibldD8oX+UP+bZbs1NKekJIhAPJvAjuv7eaXsFoQgCrJmuG5ImmQRt
         +ObMIrwMP5RmdACigFz7XaD7iqloyibbam7n/JvgsH/RlEMMk+8AXaY/tLDBiIXeuBdS
         L5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iqCUFlS+Yjw8tPSXYr3TsbX6qnkjSzlez9AobiS2yvw=;
        b=Hxh3gcGx/9gRhWGww2FH0u6qYiEgleCLZuIDwVdAX20+u1LP5GSXsqCINf/VK2zipo
         JSQUdsDCqQJUvksdQA0oaaPJNsCX5CuDKmNAyhZylSfDJ36S2Y11kYjms+amoejQ0YZ+
         Z7UaFRO8jy6mNGH3ryD5tJ8EqXfuDwgAO4jbMTzoWcWJVMNbdSb4hrbzbC23CKG1clqK
         H0XCpwqcKjaTYxK1RNTjWerqIZ74KH/XuP43nU1PjHAWHvKIZzmeRN59iTZ/ABvyenew
         onPyg5g0k4d6Y8xXVKxH221G3NoVBraIaPuNtHFx4fsdrD3l5cH0M9e5evwp1CDvLNif
         Z3fA==
X-Gm-Message-State: APjAAAWK576TSBaDBN4AZnO4KnKVE7Yv52IV8NV80YpU4i218il3qB2W
        PBBWYwr3KIB0d5zkuyZB62iyDgcw2R6KDzulKoM=
X-Google-Smtp-Source: APXvYqxzuIKpIYeOBKRKeaudOihUveYJAis++pWJZFE31eO8ROADQyM6htDwLA2EBxNzwpb80h0ULntFfRrljK3zjfM=
X-Received: by 2002:ac2:4d0d:: with SMTP id r13mr236704lfi.30.1558041665385;
 Thu, 16 May 2019 14:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
 <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com> <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
In-Reply-To: <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 16 May 2019 23:20:54 +0200
Message-ID: <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
To:     Ivan Babrou <ivan@cloudflare.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On Thu, May 16, 2019 at 10:11 PM Ivan Babrou <ivan@cloudflare.com> wrote:
>
> Hey Miguel,
>
> The first error is during perf build process (make -C tools/perf install):
>
> [17:38:21] In file included from /usr/include/string.h:635,
> [17:38:21]                  from ui/tui/helpline.c:4:
> [17:38:21] In function 'strncpy',
> [17:38:21]     inlined from 'tui_helpline__push' at ui/tui/helpline.c:27:2:
> [17:38:21] /usr/include/x86_64-linux-gnu/bits/string3.h:126:10: error:
> '__builtin_strncpy' specified bound 512 equals destination size
> [-Werror=stringop-truncation]
> [17:38:21]   126 |   return __builtin___strncpy_chk (__dest, __src,
> __len, __bos (__dest));
> [17:38:21]       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> [17:38:21] cc1: all warnings being treated as errors
> [17:38:21] /cfsetup_build/build/linux-4.19.43/tools/build/Makefile.build:96:
> recipe for target '/cfsetup_build/build/amd64/perf/ui/tui/helpline.o'
> failed
> [17:38:21] mv: cannot stat
> '/cfsetup_build/build/amd64/perf/ui/tui/.helpline.o.tmp': No such file
> or directory
> [17:38:21] make[6]: ***
> [/cfsetup_build/build/amd64/perf/ui/tui/helpline.o] Error 1
> [17:38:21] make[5]: *** [tui] Error 2
> [17:38:21] make[4]: *** [ui] Error 2
>
> I see that stringop-truncation is disabled in toplevel Makefile, but
> not sure if perf is using it.

Ah, alright -- CC'ing the perf maintainers then in case they want to chime in.

> If I disable perf build, the next thing is warnings like these:
>
> mm/slub.o: warning: objtool: init_cache_random_seq()+0x36: sibling
> call from callable instruction with modified stack frame
> mm/slub.o: warning: objtool: slab_out_of_memory()+0x3b: sibling call
> from callable instruction with modified stack frame
> mm/slub.o: warning: objtool: slab_pad_check.part.0()+0x7c: sibling
> call from callable instruction with modified stack frame
> mm/slub.o: warning: objtool: check_slab()+0x1c: sibling call from
> callable instruction with modified stack frame

AFAIK those are non-critical, i.e. stack traces may be wrong (or not),
but it does not mean the generated kernel itself is wrong. CC'ing the
objtool maintainers too.

> After patching that I see:
>
> In file included from /tmp/build/linux-4.19.43/arch/x86/crypto/aes_glue.c:6:
> /tmp/build/linux-4.19.43/include/linux/module.h:133:6: warning:
> 'init_module' specifies less restrictive attribute than its target
> 'aes_init': 'cold' [-Wmissing-attributes]
>   133 |  int init_module(void) __attribute__((alias(#initfn)));
>       |      ^~~~~~~~~~~
> /tmp/build/linux-4.19.43/arch/x86/crypto/aes_glue.c:64:1: note: in
> expansion of macro 'module_init'
>    64 | module_init(aes_init);
>       | ^~~~~~~~~~~
> /tmp/build/linux-4.19.43/arch/x86/crypto/aes_glue.c:54:19: note:
> 'init_module' target declared here
>    54 | static int __init aes_init(void)
>       |                   ^~~~~~~~

Ditto here, those can be ignored too (unless something has changed in
GCC that I am not aware of).

> I'm not really comfortable with all the warnings, so I stopped the
> build, maybe it indeed compiles through the end.

It does (on my GCC 9.1.1 compiled from source).

I am not sure what is the policy on backporting (someone from the
stable team can probably answer that; Greg?), but note that this
kernel (and 4.20 and 5.0) was released before GCC 9 did -- and some
(all?) of this was cleaned up before GCC 9 itself released, so we were
ahead of it :-)

Cheers,
Miguel
