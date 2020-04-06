Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E130119F39C
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2020 12:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgDFKfR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Apr 2020 06:35:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40515 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgDFKfR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Apr 2020 06:35:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id s8so14663356wrt.7;
        Mon, 06 Apr 2020 03:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=ll9SSeRS7TM8pDXinZRrkXHz1Y8CIP/AsFc3Eg3lKHU=;
        b=KkHcB8mIRe2csbG1xGClbvoCJEVvKMGwEC8sLetmFO5ZpLhVUU8OOisiY8+5IG4TUK
         201f2E6NbeOBH05Dc6X8mx10e8cFXDTNcuK5mTD0msms0HC4ugCPD34jVVa1M4ocN46a
         xYmJEOGszwYHJ6ki+/5HCj9nIYwN8/SlUHxFjNUbnbqbQJ1GwecvTr+E0d9FOHFP818C
         2u/dyhlxsYy0J0bL8A46ildZaH0isnc21X+aERIan3OXoI4PTsUW9n3+KFpnYq1T5IFH
         pWbkw6TLKMelfDlxuD9F+wJejPz/aJhUjp6GbQdbbxoCRuOFUB/uPIxRKolz+zdPa4R4
         uG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=ll9SSeRS7TM8pDXinZRrkXHz1Y8CIP/AsFc3Eg3lKHU=;
        b=OkWyIOmnSkvwdiFMOMVBFBZ2lcf5F90kl3nDj+Y4tdoPXuXFbb/HuFKHLOhWxQyo0+
         30SxW9jXvhB9kxRboPmC7Hg+kMM+KbZ6V9tn3ql7yOixc0vFybRiQnSCG8nCfe3uK3VU
         Z3l8wrEonfFFnMilEvb6C0Zi7YuouV2m/tkItiPSBuDRN3cpXEaN4GdbD6RK8wb0Fnbk
         wlvtMEZLPeW2Cqo0/eNQavgnVSMH4/KWqO97KGwhMEI/WYlwYMgadDRx9Rskrjv0ea8U
         Vugibm9Q2r8wNLbFdWMJ5i+cQBADpatoQiaJR4clIOdEDM6Gd8jtIPAIRdpgepBDkrYY
         Oicw==
X-Gm-Message-State: AGi0PuZtZgybh6CJnWOBJdXMZlJfMMtex8NnITzN8ooakHHJdRHS2BeA
        xmW14zJsyoWs+371hpsWMNzTpWBjOcWozDazMXw=
X-Google-Smtp-Source: APiQypJb1NemF5dZGHUU1yFzayScs3Ti0BRgvyqXOwdMRvCimcCtZclAQebffQJ6zr6okQ0UZDqsLJRWxyAMr9IBGmk=
X-Received: by 2002:adf:b64f:: with SMTP id i15mr4196654wre.351.1586169315956;
 Mon, 06 Apr 2020 03:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <202004020117.6E434C035@keescook> <CA+icZUW0R9LDGJ1YjJAB2oWkcEQxCO79xYmdVEoh=P8Fy_AL1A@mail.gmail.com>
 <CA+icZUVowLVpAxiWw=FJHfQ38KtU7AXXkVnw46D2XLM41-NCEA@mail.gmail.com> <CAK7LNAQ6ji3=2+7R1DL7eFveH7L7No6e3XkqfqgiH5QFyQj==A@mail.gmail.com>
In-Reply-To: <CAK7LNAQ6ji3=2+7R1DL7eFveH7L7No6e3XkqfqgiH5QFyQj==A@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 6 Apr 2020 12:35:35 +0200
Message-ID: <CA+icZUV3rhvmBv91KMKCgvGSvJUoWDVfaV+08eC-kTMdThRn6w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 5, 2020 at 3:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sun, Apr 5, 2020 at 8:23 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Thu, Apr 2, 2020 at 4:24 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > On Thu, Apr 2, 2020 at 10:18 AM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > When doing Clang builds of the kernel, it is possible to link with
> > > > either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> > > > discover this from a running kernel. Add the "$LD -v" output to
> > > > /proc/version.
> > > >
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > >
> >
> > Please feel free and add:
> >
> > Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
>
>
> Thanks.
>
> I collected all Reviewed-by and Tested-by.
>

How to test scripts/mkcompile_h?

I did:

$ cd /path/to/linux

$ head -10 scripts/mkcompile_h
#!/bin/sh
# SPDX-License-Identifier: GPL-2.0

TARGET=$1
ARCH=$2
SMP=$3
PREEMPT=$4
PREEMPT_RT=$5
CC=$6
LD=$7

$ scripts/mkcompile_h include/generated/compile.h x86_64 SMP "" ""
clang-10 ld.lld-10
  UPD     include/generated/compile.h

$ cat include/generated/compile.h
/* This file is auto generated, version 1 */
/* SMP */
#define UTS_MACHINE "x86_64"
#define UTS_VERSION "#1 SMP Mon Apr 6 12:29:53 CEST 2020"
#define LINUX_COMPILE_BY "dileks"
#define LINUX_COMPILE_HOST "iniza"
#define LINUX_COMPILER "clang version 10.0.0-2, LLD 10.0.0"

This is with clang-10 and ld.lld-10 from Debian/unstable:

$ clang-10 -v
clang version 10.0.0-2
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin
Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/10
Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/8
Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/9
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/10
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/8
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/9
Selected GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/10
Candidate multilib: .;@m64
Candidate multilib: 32;@m32
Candidate multilib: x32;@mx32
Selected multilib: .;@m64

$ ld.lld-10 -v
LLD 10.0.0 (compatible with GNU linkers)

Thanks.

- sed@ -
