Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46C9520F81
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2019 22:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfEPULl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 May 2019 16:11:41 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39831 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbfEPULl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 16:11:41 -0400
Received: by mail-qt1-f194.google.com with SMTP id y42so5492844qtk.6
        for <linux-kbuild@vger.kernel.org>; Thu, 16 May 2019 13:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gKeIhPnH99hjNUa5pK0cJwTj1MnIIjn2MHZBpknupJo=;
        b=G8GBDnVJ6WBOvoYX33F4pwI1EuqmsWU/fR4z+AkOqGMk8vU3q3zzemcDpUlj2WuXPa
         ujUT7DlQU76D+b7TnslSlBrASOfzao5PNeN0vdDnvTZCqVHYeed8PF/I1zrVdl8tJ1Hw
         4YcJHakmfSo4R7qPhK1QvU0EwGPAbDEcOkZVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gKeIhPnH99hjNUa5pK0cJwTj1MnIIjn2MHZBpknupJo=;
        b=VutNzfBaDgFKh1LQq2YFn3PPyw7Xv9yfrD/m81//H7bk67jIqav54ZLIevBiYjDobR
         ULFab31Ro+pqQ4xk8vv0nx53NIwqwufP7GLPUETJ8n8MZ4Jm2wai6s4+Rtw5NLAhelCC
         sjzA7X9rZTogn1uq+Fv69I6CjXaJfORr84LulLnfJFxpW0DuhsuJ2QjxUfxbYRr741xC
         P5LYgtJj8C8cYE2kpFmupdzCTszKpBTJh+1HvOeIBwXMUeSHaqYuwMAxU/8CHFaRbu+m
         1wMT1t1TSlPTeENRsNtpIAEGdGWe7Yji6314XKt3ChDCCIkST9G/dV7vct5tg340KLUJ
         KEJw==
X-Gm-Message-State: APjAAAVX2lhMcbGRlA46O9u6Hw06kwZjbY2LtwXqqwHk54QKoT3aLKqq
        Ab4f9Bt4UKgbB0L7/BU159N0P/ivIN5PZJfRYiaxdg==
X-Google-Smtp-Source: APXvYqzm2qf3DKkbYoyU6b5nqTCPpqM+ELHKQG41G6Y0yQ4wF/QpjL1co+JFCNu/ISJEPYn56X20ZKex6r6WP2vCcnQ=
X-Received: by 2002:ad4:5146:: with SMTP id g6mr40206763qvq.136.1558037500262;
 Thu, 16 May 2019 13:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
 <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
In-Reply-To: <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
From:   Ivan Babrou <ivan@cloudflare.com>
Date:   Thu, 16 May 2019 13:11:29 -0700
Message-ID: <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hey Miguel,

The first error is during perf build process (make -C tools/perf install):

[17:38:21] In file included from /usr/include/string.h:635,
[17:38:21]                  from ui/tui/helpline.c:4:
[17:38:21] In function 'strncpy',
[17:38:21]     inlined from 'tui_helpline__push' at ui/tui/helpline.c:27:2:
[17:38:21] /usr/include/x86_64-linux-gnu/bits/string3.h:126:10: error:
'__builtin_strncpy' specified bound 512 equals destination size
[-Werror=stringop-truncation]
[17:38:21]   126 |   return __builtin___strncpy_chk (__dest, __src,
__len, __bos (__dest));
[17:38:21]       |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[17:38:21] cc1: all warnings being treated as errors
[17:38:21] /cfsetup_build/build/linux-4.19.43/tools/build/Makefile.build:96:
recipe for target '/cfsetup_build/build/amd64/perf/ui/tui/helpline.o'
failed
[17:38:21] mv: cannot stat
'/cfsetup_build/build/amd64/perf/ui/tui/.helpline.o.tmp': No such file
or directory
[17:38:21] make[6]: ***
[/cfsetup_build/build/amd64/perf/ui/tui/helpline.o] Error 1
[17:38:21] make[5]: *** [tui] Error 2
[17:38:21] make[4]: *** [ui] Error 2

I see that stringop-truncation is disabled in toplevel Makefile, but
not sure if perf is using it.

If I disable perf build, the next thing is warnings like these:

mm/slub.o: warning: objtool: init_cache_random_seq()+0x36: sibling
call from callable instruction with modified stack frame
mm/slub.o: warning: objtool: slab_out_of_memory()+0x3b: sibling call
from callable instruction with modified stack frame
mm/slub.o: warning: objtool: slab_pad_check.part.0()+0x7c: sibling
call from callable instruction with modified stack frame
mm/slub.o: warning: objtool: check_slab()+0x1c: sibling call from
callable instruction with modified stack frame

After patching that I see:

In file included from /tmp/build/linux-4.19.43/arch/x86/crypto/aes_glue.c:6:
/tmp/build/linux-4.19.43/include/linux/module.h:133:6: warning:
'init_module' specifies less restrictive attribute than its target
'aes_init': 'cold' [-Wmissing-attributes]
  133 |  int init_module(void) __attribute__((alias(#initfn)));
      |      ^~~~~~~~~~~
/tmp/build/linux-4.19.43/arch/x86/crypto/aes_glue.c:64:1: note: in
expansion of macro 'module_init'
   64 | module_init(aes_init);
      | ^~~~~~~~~~~
/tmp/build/linux-4.19.43/arch/x86/crypto/aes_glue.c:54:19: note:
'init_module' target declared here
   54 | static int __init aes_init(void)
      |                   ^~~~~~~~

I'm not really comfortable with all the warnings, so I stopped the
build, maybe it indeed compiles through the end.

That's with GCC 9.1 on Debian Stretch (custom built package, Debian
has older one).


On Thu, May 16, 2019 at 12:24 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Ivan,
>
> On Wed, May 15, 2019 at 8:55 PM Ivan Babrou <ivan@cloudflare.com> wrote:
> >
> > Hey,
> >
> > It looks like it's not possible to build Linux 4.19.43 (latest LTS as
> > of today) with GCC 9.1 (latest stable GCC). From what I see, some
> > support for GCC 9 was added by Miguel (cc'd) in 4.20, but it was never
> > backported into 4.19.
>
> I just compiled 4.19.43 allmodconfig with GCC 9.1.1 and it succeeded
> (even if it gives a lot of warnings from objtool and
> -Wmissing-attributes).
>
> Which errors are you seeing? On which config?
>
> Cheers,
> Miguel
