Return-Path: <linux-kbuild+bounces-7073-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A255DAB265D
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 05:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB07A1896972
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 03:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C5F175D5D;
	Sun, 11 May 2025 03:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3cpfDow"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA94D1684B4;
	Sun, 11 May 2025 03:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746935437; cv=none; b=GVd/8GUyRUpcz1Titi2ZBTgX0yr9ohayA1E3a98caRdkN07adONkB/WNVDo463y8HtFkSGUjZHGnlIwe6Y0SbTPSV6OzZG2xSXGkJyK/6XWDxvtOphv4OSIP3vrtgHNAA9bCPcwIqM+lNPJh6PtZmOZ+EpuefHw5Sio12vni6Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746935437; c=relaxed/simple;
	bh=J+A74QbLhwUdNkVkdHmAd6rUZ4XWtsuTF9rJXebCP84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NId+RwChjfnyW2a3gzHA4oSd1/fLbjJxPAjEstNdMEMh2LJ4x3ljmEet7DnTejFvqJzl19LuQIDELNG4wb7U+u7Aexk7yb4cLe5d5ATbXVuUful6JbYoB/yw5AjkMshxNS/kMd+jQQob+O0iAjisBfxKjKy0vsn59hnle/zvRUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3cpfDow; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394A6C4CEE4;
	Sun, 11 May 2025 03:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746935437;
	bh=J+A74QbLhwUdNkVkdHmAd6rUZ4XWtsuTF9rJXebCP84=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I3cpfDowyrkk/YrzLCfJ6CUD45b0sKKj5nFZcfbZ6UFFLhOwFlRwBW2bINqxsF/Gl
	 7x0xQJc+fNCO9FBEYGAMM4oBnFUCjolHKfp5ooz8wOsfn17VquHriO7p2DiDfsudsc
	 4chivxQc5jglY+wYV9Fi29S2Li4Ea+wBgQh78OMNcJhucPZ/oG9yAzKcDmo9l/oGNU
	 qlrcnLHVSElb0hFsx3Dqswt0OI0VUNfKsKKmt06M3CWSwMixWNa1viXfLsG9txCsYZ
	 r3nA5XRbKlCqDWSXy/BRqqrgCjG/irjn+zTMLZ960B7fL6D+7eWkaZ2s7Wg88yCOd/
	 bidrWSEdFGemw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-310447fe59aso31121901fa.0;
        Sat, 10 May 2025 20:50:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVE4mstrYOnrDJV9m9p8EHIg810tKw/QFBdov6+4oEQw6Cm2iVDl+AQktqOYHBxVuSrS0D6Gech2nfWkDg=@vger.kernel.org, AJvYcCWpG1Yw0+7PxY6RjSNOXwJFSgdsgFcbHMAbhjBOeM6+SjAZrcNVnbDBA8OQExJ+abz8qLOtNqJJk+NnWQ89@vger.kernel.org, AJvYcCX2xkJMm21LCShQwSnuxowYkprwSbgoHNQUUbYoQQ3F9H4TwxFTEJUlF9jL/TAejkK69ZA2yaPy@vger.kernel.org
X-Gm-Message-State: AOJu0YzcFUSWNv6hk8KVxwxbFQ80NlSLymidjt04LmJJuOZfJAdxj96G
	Fup5CcEnXp2FHd73K/tDrSftPNgSUUdlf5sosuAD1T08NyAZHpguW0x5tVBL+IAEQvgRgD+1ROT
	BEMmuVChtCAFam2QIEvssJNC1AGM=
X-Google-Smtp-Source: AGHT+IEXi+y5bJZ2A+O8OdHl+jmFjBuQpNo/7w/wMarDXkz2eTJtgJkmyH6jLcNjLTeT8LLpfk3TN8cglWuAQNc3Q+o=
X-Received: by 2002:a05:651c:1b05:b0:30c:5190:b264 with SMTP id
 38308e7fff4ca-326c4579297mr35927931fa.20.1746935435907; Sat, 10 May 2025
 20:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-default-const-init-clang-v2-1-fcfb69703264@kernel.org>
 <CAK7LNATmW6SfUkF4uZBLVCDUK9NRpWUrmenat1HsSkLHDNmVTQ@mail.gmail.com> <20250509132805.GA4132662@ax162>
In-Reply-To: <20250509132805.GA4132662@ax162>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 11 May 2025 12:49:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQn6tBZ9b4sO+eNOErpLcOC3X_fG4_QNcNs_ffQtkb2eg@mail.gmail.com>
X-Gm-Features: AX0GCFsAAXQA2N6SPp0lLNhRvTGD-bocaHIXpy45mgccajjp7K3FEydyMEJrqBE
Message-ID: <CAK7LNAQn6tBZ9b4sO+eNOErpLcOC3X_fG4_QNcNs_ffQtkb2eg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Disable -Wdefault-const-init-unsafe
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Marcus Seyfarth <m.seyfarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 10:28=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Fri, May 09, 2025 at 10:04:23PM +0900, Masahiro Yamada wrote:
> > On Wed, May 7, 2025 at 6:06=E2=80=AFAM Nathan Chancellor <nathan@kernel=
.org> wrote:
> > >
> > > A new on by default warning in clang [1] aims to flags instances wher=
e
> > > const variables without static or thread local storage or const membe=
rs
> > > in aggregate types are not initialized because it can lead to an
> > > indeterminate value. This is quite noisy for the kernel due to
> > > instances originating from header files such as:
> > >
> > >   drivers/gpu/drm/i915/gt/intel_ring.h:62:2: error: default initializ=
ation of an object of type 'typeof (ring->size)' (aka 'const unsigned int')=
 leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
> > >      62 |         typecheck(typeof(ring->size), next);
> > >         |         ^
> > >   include/linux/typecheck.h:10:9: note: expanded from macro 'typechec=
k'
> > >      10 | ({      type __dummy; \
> > >         |              ^
> > >
> > >   include/net/ip.h:478:14: error: default initialization of an object=
 of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the =
object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
> > >     478 |                 if (mtu && time_before(jiffies, rt->dst.exp=
ires))
> > >         |                            ^
> > >   include/linux/jiffies.h:138:26: note: expanded from macro 'time_bef=
ore'
> > >     138 | #define time_before(a,b)        time_after(b,a)
> > >         |                                 ^
> > >   include/linux/jiffies.h:128:3: note: expanded from macro 'time_afte=
r'
> > >     128 |         (typecheck(unsigned long, a) && \
> > >         |          ^
> > >   include/linux/typecheck.h:11:12: note: expanded from macro 'typeche=
ck'
> > >      11 |         typeof(x) __dummy2; \
> > >         |                   ^
> > >
> > >   include/linux/list.h:409:27: warning: default initialization of an =
object of type 'union (unnamed union at include/linux/list.h:409:27)' with =
const member leaves the object uninitialized [-Wdefault-const-init-field-un=
safe]
> > >     409 |         struct list_head *next =3D smp_load_acquire(&head->=
next);
> > >         |                                  ^
> > >   include/asm-generic/barrier.h:176:29: note: expanded from macro 'sm=
p_load_acquire'
> > >     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
> > >         |                             ^
> > >   arch/arm64/include/asm/barrier.h:164:59: note: expanded from macro =
'__smp_load_acquire'
> > >     164 |         union { __unqual_scalar_typeof(*p) __val; char __c[=
1]; } __u;   \
> > >         |                                                            =
      ^
> > >   include/linux/list.h:409:27: note: member '__val' declared 'const' =
here
> > >
> > >   crypto/scatterwalk.c:66:22: error: default initialization of an obj=
ect of type 'struct scatter_walk' with const member leaves the object unini=
tialized [-Werror,-Wdefault-const-init-field-unsafe]
> > >      66 |         struct scatter_walk walk;
> > >         |                             ^
> > >   include/crypto/algapi.h:112:15: note: member 'addr' declared 'const=
' here
> > >     112 |                 void *const addr;
> > >         |                             ^
> > >
> > >   fs/hugetlbfs/inode.c:733:24: error: default initialization of an ob=
ject of type 'struct vm_area_struct' with const member leaves the object un=
initialized [-Werror,-Wdefault-const-init-field-unsafe]
> > >     733 |         struct vm_area_struct pseudo_vma;
> > >         |                               ^
> > >   include/linux/mm_types.h:803:20: note: member 'vm_flags' declared '=
const' here
> > >     803 |                 const vm_flags_t vm_flags;
> > >         |                                  ^
> > >
> > > Silencing the instances from typecheck.h is difficult because '=3D {}=
' is
> > > not available in older but supported compilers and '=3D {0}' would ca=
use
> > > warnings about a literal 0 being treated as NULL. While it might be
> > > possible to come up with a local hack to silence the warning for
> > > clang-21+, it may not be worth it since -Wuninitialized will still
> > > trigger if an uninitialized const variable is actually used.
> > >
> > > In all audited cases of the "field" variant of the warning, the membe=
rs
> > > are either not used in the particular call path, modified through oth=
er
> > > means such as memset() / memcpy() because the containing object is no=
t
> > > const, or are within a union with other non-const members.
> > >
> > > Since this warning does not appear to have a high signal to noise rat=
io,
> > > just disable it.
> > >
> > > Cc: stable@vger.kernel.org
> > > Link: https://github.com/llvm/llvm-project/commit/576161cb6069e2c7656=
a8ef530727a0f4aefff30 [1]
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > Closes: https://lore.kernel.org/CA+G9fYuNjKcxFKS_MKPRuga32XbndkLGcY-P=
VuoSwzv6VWbY=3Dw@mail.gmail.com/
> > > Reported-by: Marcus Seyfarth <m.seyfarth@gmail.com>
> > > Closes: https://github.com/ClangBuiltLinux/linux/issues/2088
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > > Changes in v2:
> > > - Disable -Wdefault-const-init-var-unsafe as well, as '=3D {}' does n=
ot
> > >   work in typecheck() for all supported compilers and it may not be
> > >   worth a local hack.
> > > - Link to v1: https://lore.kernel.org/r/20250501-default-const-init-c=
lang-v1-0-3d2c6c185dbb@kernel.org
> >
> >
> >
> > Applied to linux-kbuild.
> > Thanks.
> >
> > I fixed up the conflict with the -Wdefault-const-init-field-unsafe patc=
h.
> >
> > Please check if it is correct.
>
> This patch should replace the -Wdefault-const-init-field-unsafe patch,
> not be applied on top. -Wdefault-const-init-unsafe contains both
> -Wdefault-const-init-field-unsafe and -Wdefault-const-init-var-unsafe.
>
> Cheers,
> Nathan

Sorry, you are right.
I dropped the first one.
Thanks.




--=20
Best Regards
Masahiro Yamada

