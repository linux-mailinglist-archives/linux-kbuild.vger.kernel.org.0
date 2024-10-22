Return-Path: <linux-kbuild+bounces-4236-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD129AB677
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 21:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B82321F21BD3
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 19:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23441C9ED4;
	Tue, 22 Oct 2024 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJ5OJg/r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D391C9DC5;
	Tue, 22 Oct 2024 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729624239; cv=none; b=NYEy8t0jx2IwiFf9KwK4mrsrBbb3mHdrduRbQ3Ci/z4EmZ1aCtSl7oFdS9vUxsn46aP/GQNaBkrKdAHN6db1zWbey2mdc5aJSCMPZqxUWl/+PP+HpvC7dFZM4p0ScToODkssAuuX0AoL2jGfV7/oHPt26biLAfJARouAN5NmvzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729624239; c=relaxed/simple;
	bh=6XvCVv0uG2NVfFeDidBGqbH6w9dTgYaGqeAeiqAp/dU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+lbLXTEfXKXA6xqBfFPHGI6H5sSSYBcFmKD7cNViBdPFfTIndr0/770D/EhkNVqjZu+9roWawec/Z6bniPdc8SDCvdJ5Jk1Nq9swSFuWhIohD/Tu+YpamotAg6NRRi4IFrxJlmzVtHB21zDo1mSpJSuPSADDSbcMSjceHG91XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJ5OJg/r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27013C4CECD;
	Tue, 22 Oct 2024 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729624239;
	bh=6XvCVv0uG2NVfFeDidBGqbH6w9dTgYaGqeAeiqAp/dU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nJ5OJg/rdZ+NSs7ncjh76j2SDsjlNWQfumW0IlzihN+ynKFcchMeH72Yr6ERd0XqG
	 KmC2G5KCrPSJ+ygaFkSaMjdhe+B3Dv4VIybWT2fOly9eRbng8yXVeJm5IouJVYHQpk
	 odQx1I9dnwHTM1zUXxBYk/WJbR+MQQcbDWjr22c2nQVlIWIIO53p7MTxREX05ALQTh
	 vXApxHGtCYsRhzwn+OcSUm9U29JRxceOIITDxxpOrszUOoykY9M4d4FH1cNRe0FP/w
	 CqTHF4zwV5ptMeGuvfctqMelt754umtf5Yuc6ydYpdAOQ7LSgbuRqlgKy5uyzHwq5S
	 ejwUA5m1hQgDg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f2b95775so7137142e87.1;
        Tue, 22 Oct 2024 12:10:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWStip2N/TtU09RCgWaIdbY9twUpWFKHShqQoLTnBM886iOa3TocveDxy8FLZYm190/FLj7zh0ZBYFPfA==@vger.kernel.org, AJvYcCXDxSwqc3gGzaBOmgV9zJOUb0QEFjP0khXwM0AsO7/9lRtOwb9RlvdRvfhLJ87W6zik6mHXLaH1lBMstAM=@vger.kernel.org, AJvYcCXNdKr8kVDBhlYtD7KJjOlxAxmm1R1ADyLUwf/GFNZgGzu3pFnUYdFoT66kOJV46+jPhtoQnd7aNrbFqW/e@vger.kernel.org
X-Gm-Message-State: AOJu0YwTJjS2fenW//wjZxx7e7b5+5YY5fTTPHJP0V3JwBelN4Q3myK9
	eREDHjveCIGN1iVCyPFzN0aaJWZokUHsl2KBdP4byKye8eKAC35E5fjbkQm2A/quyTC1YuQGFii
	zNU/1GMo0ld7xN5XMgZWHRWwgM3w=
X-Google-Smtp-Source: AGHT+IER06zDgUZG4vPBSu4dZIhTWtnwFKfYPfQNgO8CtaPukvwoerTkeUmIp/TdVEGEYDAEfZjZvE5RJaAaR2Ej2Yc=
X-Received: by 2002:a05:6512:a8e:b0:535:6baa:8c5d with SMTP id
 2adb3069b0e04-53b19206823mr497129e87.20.1729624237788; Tue, 22 Oct 2024
 12:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com> <20241021201657.GA898643@thelio-3990X>
In-Reply-To: <20241021201657.GA898643@thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 23 Oct 2024 04:10:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNASTkUTK8JZCzySNh3BVKxauusVKRhjnchy6iZz4qLbq8w@mail.gmail.com>
Message-ID: <CAK7LNASTkUTK8JZCzySNh3BVKxauusVKRhjnchy6iZz4qLbq8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
To: Nathan Chancellor <nathan@kernel.org>
Cc: Koakuma <koachan@protonmail.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, 
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 5:17=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Andreas,
>
> On Wed, Jul 17, 2024 at 11:10:14PM +0700, Koakuma wrote:
> > This changes the CFLAGS for building the SPARC kernel so that it can be
> > built with clang, as a follow up from the discussion in this thread:
> >
> > https://lore.kernel.org/lkml/JAYB7uS-EdLABTR4iWZdtFOVa5MvlKosIrD_cKTzge=
ozCOGRM7lhxeLigFB1g3exX445I_W5VKB-tAzl2_G1zCVJRQjp67ODfsSqiZWOZ9o=3D@proton=
mail.com/T/#u
> ...
> > Building with these changes still result in a working kernel,
> > at least for Sun T5120, Oracle T4-1, and qemu virtual machines.
> >
> > On the LLVM side, the effort for building Linux/SPARC is tracked here:
> > https://github.com/llvm/llvm-project/issues/40792
> >
> > Signed-off-by: Koakuma <koachan@protonmail.com>
> > ---
> > Changes in v2:
> > - Remove the -mv8plus change; it will be handled on clang side:
> >   https://github.com/llvm/llvm-project/pull/98713
> > - Add CLANG_TARGET_FLAGS as suggested in v1 review.
> > - Link to v1: https://lore.kernel.org/r/20240620-sparc-cflags-v1-1-bba7=
d0ff7d42@protonmail.com
> >
> > ---
> > Koakuma (2):
> >       sparc/build: Remove all usage of -fcall-used* flags
> >       sparc/build: Add SPARC target flags for compiling with clang
> >
> >  arch/sparc/Makefile      | 4 ++--
> >  arch/sparc/vdso/Makefile | 2 +-
> >  scripts/Makefile.clang   | 1 +
> >  3 files changed, 4 insertions(+), 3 deletions(-)
>
> Would you be able to help move this series [1] and its companion patch
> for the vDSO [2] along to Linus for 6.13? If you are not able to for
> whatever reason but the changes look reasonable to you, would you be
> able to provide an Ack so it can be chauffeured by someone else, such as
> Masahiro/Kbuild or Andrew/-mm?
>
> For the record, I retested these three changes on top of 6.12-rc4, where
> they still apply cleanly. Now that the LLVM PR linked above (98713) has
> been merged into LLVM main, a clang built straight from llvm-project.git
> can build the kernel with this series (I tested at dca43a1c82f1).
>
> [1]: https://lore.kernel.org/all/20240717-sparc-cflags-v2-0-259407e6eb5f@=
protonmail.com/
> [2]: https://lore.kernel.org/all/20240808-sparc-shr64-v2-1-fd18f1b2cea9@p=
rotonmail.com/
>
> Cheers,
> Nathan



I applied this patch set, but I still observe a build error.


masahiro@zoe:~/workspace/linux-kbuild(kbuild)$
~/tools/llvm-latest/bin/clang --version
ClangBuiltLinux clang version 20.0.0git
(https://github.com/llvm/llvm-project.git
d1401822e2d2753bed3ac597a42cc0b261de40a4)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /home/masahiro/tools/llvm-latest/bin
masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ make
LLVM=3D~/tools/llvm-latest/bin/  ARCH=3Dsparc sparc64_defconfig all
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
  SYNC    include/config/auto.conf.cmd
  HOSTCC  scripts/genksyms/genksyms.o
  HOSTCC  scripts/genksyms/parse.tab.o
  HOSTCC  scripts/genksyms/lex.lex.o
  HOSTLD  scripts/genksyms/genksyms
  HOSTCC  scripts/kallsyms
  UPD     include/generated/compile.h
  CC      scripts/mod/empty.o
clang: error: unsupported argument '--undeclared-regs' to option '-Wa,'
make[3]: *** [scripts/Makefile.build:229: scripts/mod/empty.o] Error 1
make[2]: *** [Makefile:1208: prepare0] Error 2
make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:347:
__build_one_by_one] Error 2
make: *** [Makefile:224: __sub-make] Error 2



--=20
Best Regards
Masahiro Yamada

