Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4373D2A59D4
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Nov 2020 23:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729591AbgKCWNP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Nov 2020 17:13:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbgKCWNP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Nov 2020 17:13:15 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87222C061A47
        for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2020 14:13:15 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id x13so14789581pgp.7
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2020 14:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zwwyyZlsxtPwtkYdyrHXKpl0bLG1w1dXTG/u61TKkGA=;
        b=F/BOrbHN3ThwMUapjDBheSHLcKAGpUy6Fi0cQZ3GILWIaHyiysO/ujlkbPJcgcbjh0
         w6E+DHNJAHoizgUEehefyU1cf6wrED2iZyv+iY8CIaeCaIhRwQidQe3xkaaPP+KI22hb
         u8BIUatkMIHsDa4wAq1pyRIKBSD+s2JOsZ4OPT33horuipKp+MR/aX7ZS9SqAZwkQiVI
         i0j5z5zhMaezpCSA7Uf+3lB6K16LNpOglV9wAGyvXII29N96oPEAX2IRWkbCYC8ZYt2z
         /wIf39FAFL+Ihzou81o1Iof1oH/2ytzjixHpsImGN7qELA0A/ZhGHKhm8+tW7i3yryhP
         4beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zwwyyZlsxtPwtkYdyrHXKpl0bLG1w1dXTG/u61TKkGA=;
        b=ESxLaAk1ZNvBn4+oCxCD6O6iph8jI6jY638peLczm2yAbBBCPGDGoQwh6exfBJT1yc
         0t7ixpGhUkm7h4GLi1hd08tcSJoZYOiw1C96r5Qtyu4BVi/PXMKOOwdTGRqernAI56Qb
         3nNhikGGh+brvLm3sEggMwLDXXtZZ6td/7AYsG/0mdkNmul2U66qifbQk0ZCPxgfLKsw
         K//WfumBTd8XCdQGH5cuoEho42rTQ54WKn8/ynLucHcGE403SfeWOg0gxBSD5zt9jp8D
         UPmnrvPD+w+OIt+XnzNedYY5RAhmnLqUDnIVV8EgjjC/fnSVmOxbCkgCbgXmm9+Z3PDI
         ogMw==
X-Gm-Message-State: AOAM532qUg060a2OvC6nyrvLMSB6xY0CaUt+U4sBSFFD70QqSw0y0uQk
        yOgQkrEKucN1eUwdNf0NdvdIx++X6Cdvcjpne00Iug==
X-Google-Smtp-Source: ABdhPJxnsbrAtfA4NXmc2uzVJWXX0ZuiUkYkGDZKYbsbkTdK+xx71ztyA4HJy/MaKg0CErmSrOQqnK7oK84dOU4CrO4=
X-Received: by 2002:aa7:9a04:0:b029:163:fe2a:9e04 with SMTP id
 w4-20020aa79a040000b0290163fe2a9e04mr28701717pfj.30.1604441594716; Tue, 03
 Nov 2020 14:13:14 -0800 (PST)
MIME-Version: 1.0
References: <20201022012106.1875129-1-ndesaulniers@google.com> <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
In-Reply-To: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 3 Nov 2020 14:13:03 -0800
Message-ID: <CAKwvOdm3G1MPR38JckB9Dgg--=M90qimOcum2a18vvp+Gh9S2A@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-toolchains@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>,
        Alistair Delva <adelva@google.com>,
        Nick Clifton <nickc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Nov 1, 2020 at 6:21 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Oct 22, 2020 at 10:21 AM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
> > new file mode 100755
> > index 000000000000..82c0eea45845
> > --- /dev/null
> > +++ b/scripts/test_dwarf5_support.sh
> > @@ -0,0 +1,4 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +set -eu
> > +echo ".file 0 \"asdf\"" | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -
>
>
>
> Please tell me how this script detects the dwarf-5 capability.

Ah, sorry, I should have put more context.  Specifically, I wrote this
patch initially back in May, but testing combinations of:
- GCC + GNU as
- Clang + GNU as
- Clang + LLVM_IAS
I hit a few snags in GNU as.  I reported the issues, and they were
quickly fixed.  The fixes shipped in binutils 2.35 (or 2.35.1 as Jakub
notes).
https://sourceware.org/bugzilla/show_bug.cgi?id=25611
https://sourceware.org/bugzilla/show_bug.cgi?id=25612
https://sourceware.org/bugzilla/show_bug.cgi?id=25614 <-- .file 0
https://sourceware.org/bugzilla/show_bug.cgi?id=25917

This script is doing feature detection of `.file 0` directives (which
is new in DWARF5) in the assembler and actively emitted by Clang.  I'm
happy to add whatever other unit tests might be interesting for
detecting correct support for various features, if we find them to be
required, which I'd say `.file 0` certainly is.

Probably could test GCC + LLVM_IAS, too.

Hence we need to test compiler and assembler support; either may be lacking.

> This script fails for GCC 10.

What is your version of binutils? Less than 2.35 I suspect?  If so,
then that's expected and the script is working as intended.

Thanks for your feedback, I'll try to get a v2 out this week
incorporating feedback from you, Fangrui, and Jakub.

>
>
> masahiro@grover:~/workspace/linux-kbuild$
> ./scripts/test_dwarf5_support.sh  clang
> masahiro@grover:~/workspace/linux-kbuild$ echo $?
> 0
> masahiro@grover:~/workspace/linux-kbuild$
> ./scripts/test_dwarf5_support.sh gcc-10
> {standard input}: Assembler messages:
> {standard input}:1: Error: file number less than one
> masahiro@grover:~/workspace/linux-kbuild$ echo $?
> 1
>
>
>
>
> The manual says the fileno should be "a positive integer".
>
>
>   .file fileno filename
>
>   When emitting dwarf2 line number information .file assigns filenames
> to the .debug_line file name table.
>   The fileno operand should be a unique positive integer to use as the
> index of the entry in the table.
>   The filename operand is a C string literal.
>
>   The detail of filename indices is exposed to the user because the
> filename table is shared with the
>   .debug_info section of the dwarf2 debugging information, and thus
> the user must know the exact indices
>   that table entries will have.
>
>
>
> So, I modified the script as follows:
>
>
> masahiro@grover:~/workspace/linux-kbuild$ git diff
> diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
> index 82c0eea45845..8d7213e8e51f 100755
> --- a/scripts/test_dwarf5_support.sh
> +++ b/scripts/test_dwarf5_support.sh
> @@ -1,4 +1,4 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0
>  set -eu
> -echo ".file 0 \"asdf\"" | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -
> +echo ".file 1 \"asdf\"" | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -
>
>
>
>
> masahiro@grover:~/workspace/linux-kbuild$ ./scripts/test_dwarf5_support.sh  gcc
> masahiro@grover:~/workspace/linux-kbuild$ echo $?
> 0
>
>
>
> But, GCC 4.9 also passes this check.
>
> masahiro@grover:~/workspace/linux-kbuild$
> ~/tools/aarch64-linaro-4.9/bin/aarch64-linux-gnu-gcc --version
> aarch64-linux-gnu-gcc (Linaro GCC 4.9-2016.02) 4.9.4 20151028 (prerelease)
> Copyright (C) 2015 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>
> masahiro@grover:~/workspace/linux-kbuild$
> ./scripts/test_dwarf5_support.sh
> ~/tools/aarch64-linaro-4.9/bin/aarch64-linux-gnu-gcc
> masahiro@grover:~/workspace/linux-kbuild$ echo $?
> 0

-- 
Thanks,
~Nick Desaulniers
