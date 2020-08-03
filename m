Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA9A23AC9F
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Aug 2020 20:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgHCSta (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Aug 2020 14:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgHCSt3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Aug 2020 14:49:29 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5764C061756
        for <linux-kbuild@vger.kernel.org>; Mon,  3 Aug 2020 11:49:29 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id z188so10831982pfc.6
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Aug 2020 11:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xo2g0ZZdJl+wryEK7qdihsTMQHTPQB2RjHE5hEFtg1o=;
        b=Qo7Mi4cLHZ/oUwJB/vQTyljNfA6w1NlYAnGD8hyPJ9jPd9wDst5b1hChLc+Y562YUX
         H47FJgjuM+SW7oZPpknzkLih3bkbBWnxnGk5gt0a3XTZ7+poYTh1X/m61bei26p10nWY
         ff+AnK30/MK1V9W65UZ9j1GD6d8Pia4TwnTg/zSbI6wNXo2lSodCQwRAH72twFWkdDCe
         ZX9db2X7nVmLbnopIOljvlw8ljoXZ+sjwugKQQL2ak6ZoNJU4ZuD/kml0tltjllHrEav
         dO6Dag7GkbAlcbeJIjIz9d11XCXU3GkF/2he6IlO51NL2ImHfAD58jsfBDEjGYMqub0Z
         9i6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xo2g0ZZdJl+wryEK7qdihsTMQHTPQB2RjHE5hEFtg1o=;
        b=XZBnQyVXv0fR6q4hpxVPP+pr6ZIFowOXFBStOCc3vLXT2+ChaOpYPTu2XGQBIQrl4i
         5LBr0vTp82KOpMDVXNbdkTqL5FjvjeG0XsVISEWLIBggH+BnZliWci5m8CfqLOmeXaNt
         q3zAd03uThztp86cfXJUcK4hiUpcq3xZpHPzKuK38IIwYFrBx9Met3PX/oZJ6UFpkk+p
         9nVlQWMMQL3KV+O2MyeSgPqtGCArwYV9EprR3O4bmMb62mq4HluyXGjeMfUQ8AQ7XWha
         KA9M4HI5RnGcNXLipdtDK0gHFUS6dq7gRgPbIAHsTYkJrOl4M6bz50prHmGoWUKCUXiH
         yEDw==
X-Gm-Message-State: AOAM531sKVOKtzb3z1VbDOeGCOSKnIxkP6CcDRvR40MZ72teYS2GkwkP
        XMmHkzJxKKHEzZ4QLoh3Q/LzcdeVy7mvbmh3H9DlZA==
X-Google-Smtp-Source: ABdhPJwcK0kD977AMGNMBr+ExlRdEb1ogbKe83zUVStJC7iUARcFsgFodDJLaQYPDKeEmG50fv58Yhhr7Hk3zC61bfI=
X-Received: by 2002:a63:b546:: with SMTP id u6mr15616172pgo.381.1596480568482;
 Mon, 03 Aug 2020 11:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdnni_G2tw+0eCLQQvvdcz97Fy1-cBjzPvLwbBNDu1-KqQ@mail.gmail.com>
 <20200728004736.3590053-1-nhuck@google.com> <alpine.DEB.2.21.2008012031540.14646@felia>
In-Reply-To: <alpine.DEB.2.21.2008012031540.14646@felia>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 3 Aug 2020 11:49:16 -0700
Message-ID: <CAKwvOd=V6-p1H1F65gFAQm+h4Qgt_98-XJeUSNaONmPE9yZciA@mail.gmail.com>
Subject: Re: [PATCH v7] Makefile: Add clang-tidy and static analyzer support
 to makefile
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Pirama Arumuga Nainar <pirama@google.com>,
        Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 1, 2020 at 12:23 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Hi Nathan, Hi Nick,
>
> I have been busy with other topics around the kernel and static analysis;
> but then, I read clang and static analysis in my mailbox in this patch.
>
> So, I thought let me give this patch a try on the weekend.
>
> I applied the patch on next-2020729; that worked.
>
> Then:
> $ make clang-tidy
> scripts/clang-tools/Makefile.clang-tools:13: *** clang-tidy requires
> CC=clang.  Stop.
>
> Okay, that is a good and clear error message.
>
> Then:
>
> $ make CC=clang-10 defconfig
> $ make CC=clang-10 clang-tidy
>
> python3 scripts/clang-tools/gen_compile_commands.py
> WARNING: Found 8 entries. Have you compiled the kernel?
> python3 scripts/clang-tools/run-clang-tools.py clang-tidy
> compile_commands.json
>
> Then actually an error in clang-tidy.
> Error: no checks enabled.
> USAGE: clang-tidy [options] <source0> [... <sourceN>]
> ...
>
> I will get to that later how I fixed that for my setup.
>
> Okay, good, that is clear... I need to compile it first, got it.

Hi Lukas,
Thank you so much for taking the time to apply the patch and help test it.

For the case of not doing a build first: gen_compile_commands.py
parses the .*.d files to build the compilation database and warns if
not many were found.  I think it might be interesting for it to just
invoke a build if it sees that, or maybe for the clang-tidy and
clang-analyzer targets to somehow invoke the default make target.  The
issue there might be that you need to invoke `make clang-tidy` with
`make CC=clang LD=ld.lld ... clang-tidy` in order to trigger a build
successfully.

Also, I wonder if gen_compile_commands.py should set a return code in
that case so that callers can handle such an exceptional case?  In
that case, I'd consider that a papercut or potential improvement to
scripts/get_compile_commands.py orthogonal to this patch.

>
> $ make CC=clang-10
> $ make CC=clang-10 clang-tidy
>
> Okay, I run except for the fix I needed.
>
> Where is the output from clang-tidy?
>
> It prints:
>
> python3 scripts/clang-tools/gen_compile_commands.py
> python3 scripts/clang-tools/run-clang-tools.py clang-tidy compile_commands.json
>
> That is it. Does that mean 0 warnings, or where do I find the output?
> The script suggests it should be in stderr once all the parallel runs
> collected it, right?
>
> I was confused; maybe a short summary output might help here.

I was also caught by this; for x86 defconfig, the kernel is actually
clean of instances of linuxkernel-* clang-tidy checks (there was also
an issue with the CWD for x86 in v6, but was resolved in v7 of this
patch).  I had to add a case that should fail to make clang-tidy have
output, and the check only checks for unchecked "ERR_PTR", "PTR_ERR",
"IS_ERR", "IS_ERR_OR_NULL", "ERR_CAST", "PTR_ERR_OR_ZERO".
(Documentation for that should be improved.) So if you add a function
that just constructs an `ERR_PTR(0)` and call it from code that gets
compiled in, then you'll start to see warnings from clang-tidy for x86
defconfig.  For aarch64 and arm, you'll see there are some unchecked
cases that look like low hanging fruit to fix.

It probably can be improved to note that there was no output, but that
will require more machinery to track how much output there was.  I'd
prefer to follow up with additional polish on top of this once this
lands.

>
> Then, I ran
>
> $ make CC=clang-10 clang-analyzer
>
> And I see a lot of warnings... I guess that is intended.
>
> There is a lot of:
>
> Suppressed XX warnings (XX in non-user code).
> Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
>
> To an outsider, it is unclear if that is intended or if the tool is broken
> in this setup.
>
> Is there are way to silent that meta-warning? Or is my setup broken?

See also my comment about disabling the clang-diagnostic-* analyzer
checks. We haven't had time to sort out the cause of them yet, and for
now they just look like noise.

>
> In summary, it is pretty clear how to run clang-tidy and clang-analyzer
> and it was a pretty smooth experience, even with no documentation at hand.
>
> It was fun for me. Keep up the good work!
>
> Just one issue... see below.
>
> > +    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
>
> You hardcoded here: clang-tidy
>
> But in my Ubuntu 18.04 setup, I got multiple versions of clang and
> clang-tidy installed; yeah, maybe my setup is broken, but maybe those from
> others are similar.
>
> When I run:
>
>   make CC=clang-10 clang-tidy
>
> it picks up the "wrong" clang-tidy version...
>
> My setup is:
>
> $ which clang-tidy
> /usr/bin/clang-tidy
>
> $ which clang-tidy-10
> /usr/bin/clang-tidy-10
>
> $ clang-tidy --version
> LLVM (http://llvm.org/):
>   LLVM version 6.0.0
>
>   Optimized build.
>   Default target: x86_64-pc-linux-gnu
>   Host CPU: znver1
>
> $ clang-tidy-10 --version
> LLVM (http://llvm.org/):
>   LLVM version 10.0.1
>
>   Optimized build.
>   Default target: x86_64-pc-linux-gnu
>   Host CPU: znver1
>
> When I run make CC=clang-10 clang-tidy, I would expect it to use
> clang-tidy-10, not clang-tidy. (clang-tidy errors just because it is too
> old; I guess it does have the linuxkernel-* options.)
>
> Now, I cannot fix that without touching your script. There is no way I can
> tell the build target to use clang-tidy-10.
>
> With a quick touch:
>
> -    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
> +    p = subprocess.run(["clang-tidy-10", "-p", args.path, checks, entry["file"]],
>
> I got it to work.
>
> Maybe you have a good idea how to get make clang-tidy to pick
> up the intended version without touching the python script itself?
>
> It is a minor issue, but it would be nice if that setting would work
> somehow.

Ah right, sorry, I tend to forget about the use case of having
multiple versions of clang installed.

I think the best approach here might be for the user (you, in this
case) to ensure that list of PATHs in the path list has the path to
the intended version of clang-tidy you'd like to run listed before
others.  That is similar to the recommendation for the LLVM=1 patch
set. ie.
commit a0d1c951ef08e ("kbuild: support LLVM=1 to switch the default
tools to Clang/LLVM")
specifically this part of the commit message:

> the suffixed versions in /usr/bin/ are symlinks to binaries in
> /usr/lib/llvm-#/bin/, so this can also be handled by PATH.

If `clang-tidy` on your system points to an old version of clang-tidy,
it may be worthwhile to uninstall the old version, and update the
symlink to point to a newer version.  That may be simpler than trying
to support invoking `make clang-tidy` for arbitrary versions or binary
names of clang-tidy.  I can understand having multiple versions of a
compiler installed for quickly checking compatibility (though these
days I prefer godbolt.org for that) or if a particular codebase is
stuck on an old version of a toolchain for whatever reason; but having
multiple versions of clang-tidy installed and supporting all of them
is a little harder to justify.
-- 
Thanks,
~Nick Desaulniers
