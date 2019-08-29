Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE536A1419
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2019 10:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfH2IuD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Aug 2019 04:50:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40028 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfH2IuC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Aug 2019 04:50:02 -0400
Received: by mail-wm1-f65.google.com with SMTP id t9so2905911wmi.5;
        Thu, 29 Aug 2019 01:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=jGqsZBQK7NqMe1GSC7sANXtWJk7x0h+B0OmREYTw6G0=;
        b=aFP8yM62cdHBPj7FVIf0oxFDOITeF3mIBqIRRjYhvzx0/5VTDrpWeMMzecthoQ5pM6
         y0RRLHZDMhW4UuZE1NgvmNV54rl/mOJxGOJNDu+lZU8JsuGRiWC2P5Jb70T0X7C3gq2d
         wST680hk4XMHUGxWS+e547eCga+Ro3s7DN6YUVeLNwf6crpHQgozB4hmSFXSlqwNAFAK
         l5LvaAy6YIrHBr1UO1pIR3qo4bRGtWRn7zYH0tfDDbFaeDhr68IE0+yOO18ev/M6LclY
         DeybmNJATQ4Y7+DoTqUuV+ZCebR3H6hB/Qloc59iSVMdDcRySixh3LgVOBok0LhD9Mit
         z2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=jGqsZBQK7NqMe1GSC7sANXtWJk7x0h+B0OmREYTw6G0=;
        b=Sspcw1KeFWW1KhJcwFI1sJlFcP8UohEkHKUJyz6IQDLvEyL0z4iJHBxXyJJ3b0BQ0Y
         C6aDR97E5AOApHvUgwQa+7xiDk7MLlY0HItFSAtNCh3pc4PmV9UVx+N94c2dkts9i7HM
         r7PeIzBDSep+MwXQ3Z4sdYm/96swZbCoL0mzy3XBv0IPX3vJDy5PcctkZnVSU6FstgB4
         yGMBKM9npioQRFVWQdgCa/ft7I0nKwZlYxk3mcK8U/yRkd3cxhISgKKYy8nnJGr7SN3x
         zji2CGN2lqaq8TvNhN45r9CKXFjQhU8zocWedeC4O9zjYydTw7jBq/l99kk6+17/GfSV
         UorA==
X-Gm-Message-State: APjAAAW3IC/Vkc+8WCd/Gn91yizdI7eaHbJWB7mJGK1kLRTZrLi1GRWV
        p2nORmbL8wmkCI76WAXqigk56pmhxYGljrMrDcR47IKi
X-Google-Smtp-Source: APXvYqzf6DbuJoQrt0d/PlPEmFcufFFPnMWMfhRgPT3fPSlwC+6iVBVBtuYEGcA3/GuTNrkcl7OLaKwMOgcim7Vbdvc=
X-Received: by 2002:a7b:cf21:: with SMTP id m1mr10608663wmg.150.1567068599232;
 Thu, 29 Aug 2019 01:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com> <CAKwvOdmFjOMPW3_V+2ZnYFUyjWWuW2919cCk=ePn30f2szsi2g@mail.gmail.com>
In-Reply-To: <CAKwvOdmFjOMPW3_V+2ZnYFUyjWWuW2919cCk=ePn30f2szsi2g@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 29 Aug 2019 10:49:47 +0200
Message-ID: <CA+icZUWv0vAOSq_4BfbqrTdUSnN_D4ETVfpSHiATokCsY2R9pg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: refactor scripts/Makefile.extrawarn
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 29, 2019 at 12:38 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Tue, Aug 27, 2019 at 10:54 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Instead of the warning-[123] magic, let's accumulate compiler options
> > to KBUILD_CFLAGS directly as the top Makefile does. I think this makes
> > easier to understand what is going on in this file.
> >
> > This commit slightly changes the behavior, I think all of which are OK.
> >
> > [1] Currently, cc-option calls are needlessly evaluated. For example,
> >       warning-3 +=3D $(call cc-option, -Wpacked-bitfield-compat)
> >     needs evaluating only when W=3D3, but it is actually evaluated for
> >     W=3D1, W=3D2 as well. With this commit, only relevant cc-option cal=
ls
> >     will be evaluated. This is a slight optimization.
> >
> > [2] Currently, unsupported level like W=3D4 is checked by:
> >       $(error W=3D$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
> >     This will no longer be checked, but I do not think it is a big
> >     deal.
> >
> > [3] Currently, 4 Clang warnings (Winitializer-overrides, Wformat,
> >     Wsign-compare, Wformat-zero-length) are shown by any of W=3D1, W=3D=
2,
> >     and W=3D3. With this commit, they will be warned only by W=3D1. I
> >     think this is a more correct behavior since each warning belongs
> >     to only one warning level.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  scripts/Makefile.extrawarn | 104 +++++++++++++++++++------------------
> >  1 file changed, 53 insertions(+), 51 deletions(-)
> >
> > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > index a74ce2e3c33e..1fa53968e292 100644
> > --- a/scripts/Makefile.extrawarn
> > +++ b/scripts/Makefile.extrawarn
> > @@ -1,14 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > -#
> >  # make W=3D... settings
> > -#
> > -# W=3D1 - warnings that may be relevant and does not occur too often
> > -# W=3D2 - warnings that occur quite often but may still be relevant
> > -# W=3D3 - the more obscure warnings, can most likely be ignored
> > -#
> > -# $(call cc-option, -W...) handles gcc -W.. options which
> > -# are not supported by all versions of the compiler
> >  # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >
> >  KBUILD_CFLAGS +=3D $(call cc-disable-warning, packed-not-aligned)
> > @@ -17,58 +9,68 @@ ifeq ("$(origin W)", "command line")
> >    export KBUILD_ENABLE_EXTRA_GCC_CHECKS :=3D $(W)
> >  endif
> >
> > -ifdef KBUILD_ENABLE_EXTRA_GCC_CHECKS
> > -warning-  :=3D $(empty)
> > +#
> > +# W=3D1 - warnings that may be relevant and does not occur too often
> > +#
> > +ifneq ($(findstring 1, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
> >
> > -warning-1 :=3D -Wextra -Wunused -Wno-unused-parameter
> > -warning-1 +=3D -Wmissing-declarations
> > -warning-1 +=3D -Wmissing-format-attribute
> > -warning-1 +=3D -Wmissing-prototypes
> > -warning-1 +=3D -Wold-style-definition
> > -warning-1 +=3D -Wmissing-include-dirs
> > -warning-1 +=3D $(call cc-option, -Wunused-but-set-variable)
> > -warning-1 +=3D $(call cc-option, -Wunused-const-variable)
> > -warning-1 +=3D $(call cc-option, -Wpacked-not-aligned)
> > -warning-1 +=3D $(call cc-option, -Wstringop-truncation)
> > +KBUILD_CFLAGS +=3D -Wextra -Wunused -Wno-unused-parameter
> > +KBUILD_CFLAGS +=3D -Wmissing-declarations
> > +KBUILD_CFLAGS +=3D -Wmissing-format-attribute
> > +KBUILD_CFLAGS +=3D -Wmissing-prototypes
> > +KBUILD_CFLAGS +=3D -Wold-style-definition
> > +KBUILD_CFLAGS +=3D -Wmissing-include-dirs
> > +KBUILD_CFLAGS +=3D $(call cc-option, -Wunused-but-set-variable)
> > +KBUILD_CFLAGS +=3D $(call cc-option, -Wunused-const-variable)
> > +KBUILD_CFLAGS +=3D $(call cc-option, -Wpacked-not-aligned)
> > +KBUILD_CFLAGS +=3D $(call cc-option, -Wstringop-truncation)
> >  # The following turn off the warnings enabled by -Wextra
> > -warning-1 +=3D -Wno-missing-field-initializers
> > -warning-1 +=3D -Wno-sign-compare
> > -
> > -warning-2 +=3D -Wcast-align
> > -warning-2 +=3D -Wdisabled-optimization
> > -warning-2 +=3D -Wnested-externs
> > -warning-2 +=3D -Wshadow
> > -warning-2 +=3D $(call cc-option, -Wlogical-op)
> > -warning-2 +=3D -Wmissing-field-initializers
> > -warning-2 +=3D -Wsign-compare
> > -warning-2 +=3D $(call cc-option, -Wmaybe-uninitialized)
> > -warning-2 +=3D $(call cc-option, -Wunused-macros)
> > -
> > -warning-3 :=3D -Wbad-function-cast
> > -warning-3 +=3D -Wcast-qual
> > -warning-3 +=3D -Wconversion
> > -warning-3 +=3D -Wpacked
> > -warning-3 +=3D -Wpadded
> > -warning-3 +=3D -Wpointer-arith
> > -warning-3 +=3D -Wredundant-decls
> > -warning-3 +=3D -Wswitch-default
> > -warning-3 +=3D $(call cc-option, -Wpacked-bitfield-compat)
> > -
> > -warning :=3D $(warning-$(findstring 1, $(KBUILD_ENABLE_EXTRA_GCC_CHECK=
S)))
> > -warning +=3D $(warning-$(findstring 2, $(KBUILD_ENABLE_EXTRA_GCC_CHECK=
S)))
> > -warning +=3D $(warning-$(findstring 3, $(KBUILD_ENABLE_EXTRA_GCC_CHECK=
S)))
> > -
> > -ifeq ("$(strip $(warning))","")
> > -        $(error W=3D$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
> > -endif
> > +KBUILD_CFLAGS +=3D -Wno-missing-field-initializers
> > +KBUILD_CFLAGS +=3D -Wno-sign-compare
> >
> > -KBUILD_CFLAGS +=3D $(warning)
> >  else
> >
> > +# W=3D1 also stops suppressing some warnings
> > +
> >  ifdef CONFIG_CC_IS_CLANG
> >  KBUILD_CFLAGS +=3D -Wno-initializer-overrides
> >  KBUILD_CFLAGS +=3D -Wno-format
> >  KBUILD_CFLAGS +=3D -Wno-sign-compare
> >  KBUILD_CFLAGS +=3D -Wno-format-zero-length
> >  endif
>
> I find this part of the patch exceedingly confusing, and I think it
> mistakenly changes the behavior of W=3D2, W=3D3, and W=3D4.  If W !=3D 1 =
&& CC
> =3D=3D clang, then disable some flags?  What?  So W=3D2,3,4 those are
> disabled, but at W=3D1 are not?  Didn't the previous version set these
> unless any W=3D was set?
>
> > +
> > +endif
> > +
> > +#
> > +# W=3D2 - warnings that occur quite often but may still be relevant
> > +#
> > +ifneq ($(findstring 2, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
> > +
> > +KBUILD_CFLAGS +=3D -Wcast-align
> > +KBUILD_CFLAGS +=3D -Wdisabled-optimization
> > +KBUILD_CFLAGS +=3D -Wnested-externs
> > +KBUILD_CFLAGS +=3D -Wshadow
> > +KBUILD_CFLAGS +=3D $(call cc-option, -Wlogical-op)
> > +KBUILD_CFLAGS +=3D -Wmissing-field-initializers
> > +KBUILD_CFLAGS +=3D -Wsign-compare
> > +KBUILD_CFLAGS +=3D $(call cc-option, -Wmaybe-uninitialized)
> > +KBUILD_CFLAGS +=3D $(call cc-option, -Wunused-macros)
> > +
> > +endif
> > +
> > +#
> > +# W=3D3 - the more obscure warnings, can most likely be ignored
> > +#
> > +ifneq ($(findstring 3, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
> > +
> > +KBUILD_CFLAGS +=3D -Wbad-function-cast
> > +KBUILD_CFLAGS +=3D -Wcast-qual
> > +KBUILD_CFLAGS +=3D -Wconversion
> > +KBUILD_CFLAGS +=3D -Wpacked
> > +KBUILD_CFLAGS +=3D -Wpadded
> > +KBUILD_CFLAGS +=3D -Wpointer-arith
> > +KBUILD_CFLAGS +=3D -Wredundant-decls
> > +KBUILD_CFLAGS +=3D -Wswitch-default
> > +KBUILD_CFLAGS +=3D $(call cc-option, -Wpacked-bitfield-compat)
> > +
> >  endif
> > --
> > 2.17.1
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers

Just a quick test...

...with clang-9 (built with tc-build from llvm-project.git#release/9.x)

$ mycompiler --version
ClangBuiltLinux clang version 9.0.0
(git://github.com/llvm/llvm-project
e82a53603ae3fed2215a44b5ac603db00a780c02) (based on LLVM 9.0.0)
Target: x86_64-unknown-linux-gnu
Thread model: posix
InstalledDir: /home/sdi/src/llvm-toolchain/install/bin

$ mylinker --version
LLD 9.0.0 (git://github.com/llvm/llvm-project
e82a53603ae3fed2215a44b5ac603db00a780c02) (compatible with GNU
linkers)

With each run (changing W=3D...), I stopped my build-script manually,
that's why the numbers differ.

[ NO W-N ]

sdi@iniza:~/src/linux-kernel$ for i in Wno-initializer-overrides
Wno-format Wno-sign-compare Wno-format-zero-length ; do echo [ $i ] ;
grep $i build-log_5.3.0-rc6-2-amd64-cbl-asmgoto.txt_NO-W-N | wc -l ;
done
[ Wno-initializer-overrides ]
178
[ Wno-format ]
178
[ Wno-sign-compare ]
178
[ Wno-format-zero-length ]
178

[ W=3D1 ]

sdi@iniza:~/src/linux-kernel$ for i in Wno-initializer-overrides
Wno-format Wno-sign-compare Wno-format-zero-length ; do echo [ $i ] ;
grep $i build-log_5.3.0-rc6-2-amd64-cbl-asmgoto.txt_W-1 | wc -l ; done
[ Wno-initializer-overrides ]
0
[ Wno-format ]
169
[ Wno-sign-compare ]
169
[ Wno-format-zero-length ]
0

[ W=3D2 ]

sdi@iniza:~/src/linux-kernel$ for i in Wno-initializer-overrides
Wno-format Wno-sign-compare Wno-format-zero-length ; do echo [ $i ] ;
grep $i build-log_5.3.0-rc6-2-amd64-cbl-asmgoto.txt_W-2 | wc -l ; done
[ Wno-initializer-overrides ]
129
[ Wno-format ]
129
[ Wno-sign-compare ]
129
[ Wno-format-zero-length ]
129

[ W=3D3 ]

sdi@iniza:~/src/linux-kernel$ for i in Wno-initializer-overrides
Wno-format Wno-sign-compare Wno-format-zero-length ; do echo [ $i ] ;
grep $i build-log_5.3.0-rc6-2-amd64-cbl-asmgoto.txt_W-3 | wc -l ; done
[ Wno-initializer-overrides ]
114
[ Wno-format ]
114
[ Wno-sign-compare ]
114
[ Wno-format-zero-length ]
114

[ W=3D4 ]

sdi@iniza:~/src/linux-kernel$ for i in Wno-initializer-overrides
Wno-format Wno-sign-compare Wno-format-zero-length ; do echo [ $i ] ;
grep $i build-log_5.3.0-rc6-2-amd64-cbl-asmgoto.txt_W-4 | wc -l ; done
[ Wno-initializer-overrides ]
495
[ Wno-format ]
495
[ Wno-sign-compare ]
495
[ Wno-format-zero-length ]
495

W=3D1 is not passing -Wno-initializer-overrides and -Wno-format-zero-length=
.
Unsure if other KBUILD_CFLAGS  in W=3D1 disables them.

So, if it is desired to pass the CLANG extrawarn compiler-options to
all W=3D... then I ask myself why the CLANG block is in the W=3D1 block
only?
So if CLANG extrawarn options are independent of any W=3D... make-option
then I prefer to put it in a seperate block with an appropriate
comment.

According to the commit message W=3D4 is unsupported, but I can do a
'make V=3D1 W=3D4'.
If I pass an unsupported value to W=3D... then I expect an warning or
info or exit or whatever.

My =E2=82=AC0,02.

- Sedat -
