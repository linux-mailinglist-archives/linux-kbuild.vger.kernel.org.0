Return-Path: <linux-kbuild+bounces-5044-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B69E8D76
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 09:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 127C71885307
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 08:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE191C0DED;
	Mon,  9 Dec 2024 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9sD4D13"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6E112CDAE;
	Mon,  9 Dec 2024 08:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733733117; cv=none; b=GyN2q3swJFgbQxQvSXe0sMGkkDCvK/7JML3JN5KiQu3aUzsNL4AO7fN4W9qQrprDke4DRqB3Lp47UAa/qZeTaM0RMyz1iGON+dhzxi088j5pEiuA42+61TFcFcMTPlIo4dtKkeN/pTWTz7MZjqNRQQAanJR88ViMFtAs5ZCGS4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733733117; c=relaxed/simple;
	bh=OXDcmuj6dJBmZafC8rFQNhhumNNdoBeDEizT1mjedQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJd0mtrMDEA3WDO/jCmvy/hepxG3U0Yq+7s3/3sKT7E7zI34mgRBXqxqUKHJzCKfh3wKSrbouH5GlFIYJqjcrLUPj4rASu4Vt4N2PtZG4NGJyXuNAnUo/ngvMOj/08ICvHl7dxV6JJimapOOyO5VpqWZkgYlilPRvoKTYh0KH/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9sD4D13; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB89AC4CED1;
	Mon,  9 Dec 2024 08:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733733116;
	bh=OXDcmuj6dJBmZafC8rFQNhhumNNdoBeDEizT1mjedQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G9sD4D13Apsbs2y/i67y1IztMC2/fYb3d/k3lTv9i44pvEibLhHW0uk2dVroGUVdL
	 37ij1KxX9LFj6jezjepyZ+gBd+BmMt7C0qmq5+PyYoMobULxydWhPU6h5MdgyeQpfx
	 6ffYK8RA6teMWab2+SHov+yzaCMQyExDRURx7JOL1rzhdoqQzRH6FlGyS7oPuxvJcx
	 iQ8ef/eMb0K5qOuIUkBM0LMxh6yrja6UIqzn/Gkuvw9G4ePZ7fVBQWxMmSQV6DExvP
	 myG5sgCT+qqCqfAhcaXIXL5j7+UyeKZBMJnF5U6dpYlpuyEKNR+Ljld1UOIDlnzBSc
	 bokz7daDF3pnQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401c52000fso836206e87.2;
        Mon, 09 Dec 2024 00:31:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV29L5zWvcBiFCWQRQ9Qvm615llkFxIO22JvpAfcpO9hh2gLZqUyGziNW3mL/SU0NZVmaaprae/9imsuFs=@vger.kernel.org, AJvYcCWIo9nmxoLwGchhPfVv99/wXZ3mWcX6WxmxWhnea3Ba8/F9lRZVM0wZwmvDDvsWJRgsMera2s/h5SI7+eFp@vger.kernel.org, AJvYcCWsfc3GIyBIK8XE8tPbUTX1Y187jx0z843Mewb09VPx1nCyAQ/fCvCXM3nmV464O9JNnYHzXTKK@vger.kernel.org
X-Gm-Message-State: AOJu0YzeF3neRozDYAMl2wfVKTxubFHCVwRdQ2yjQYe0JQBVXCFUzAXK
	xYNxe7afu27wy3J5BIlzwVgao1WX9TKCrtTyCy9zBH5AI2tyVhb5u5iPdiskTJ/wyKM7txF/6RT
	jIXjrOb9Wg/lDs0ana0C3PXDZ7SA=
X-Google-Smtp-Source: AGHT+IGMWZRZQy+J3n8zTwDkOHS4vYSTqxdMj4RkRBjWA19n5LCCT8s31zfp9zMsoNVhKTJA/CXUmvRP8sHSBYw8boA=
X-Received: by 2002:a05:6512:e9f:b0:53f:5e23:fb72 with SMTP id
 2adb3069b0e04-53f5e23fd21mr2030810e87.57.1733733114978; Mon, 09 Dec 2024
 00:31:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206085810.112341-1-chenhuacai@loongson.cn>
 <2024120635-wham-campsite-b62b@gregkh> <CAAhV-H4Db0tVrqcfXHceJeODgnK0ggHpx9_6vwXAAV0LohCD-w@mail.gmail.com>
 <2024120748-preaching-reshape-06e9@gregkh> <ccb1fa9034b177042db8fcbe7a95a2a5b466dc30.camel@xry111.site>
In-Reply-To: <ccb1fa9034b177042db8fcbe7a95a2a5b466dc30.camel@xry111.site>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 9 Dec 2024 09:31:43 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEV+HC+2HMLhDaLfAufQLrXRs2J7akMNr1mjejDYc7kdw@mail.gmail.com>
Message-ID: <CAMj1kXEV+HC+2HMLhDaLfAufQLrXRs2J7akMNr1mjejDYc7kdw@mail.gmail.com>
Subject: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where possible
To: Xi Ruoyao <xry111@xry111.site>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, stable@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 7 Dec 2024 at 11:46, Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Sat, 2024-12-07 at 10:32 +0100, Greg Kroah-Hartman wrote:
> > On Sat, Dec 07, 2024 at 05:21:00PM +0800, Huacai Chen wrote:
> > > Hi, Greg,
> > >
> > > On Fri, Dec 6, 2024 at 9:04=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Dec 06, 2024 at 04:58:07PM +0800, Huacai Chen wrote:
> > > > > Backport this series to 6.1&6.6 because LoongArch gets build erro=
rs with
> > > > > latest binutils which has commit 599df6e2db17d1c4 ("ld, LoongArch=
: print
> > > > > error about linking without -fPIC or -fPIE flag in more detail").
> > > > >
> > > > >   CC      .vmlinux.export.o
> > > > >   UPD     include/generated/utsversion.h
> > > > >   CC      init/version-timestamp.o
> > > > >   LD      .tmp_vmlinux.kallsyms1
> > > > > loongarch64-unknown-linux-gnu-ld: kernel/kallsyms.o:(.text+0): re=
location R_LARCH_PCALA_HI20 against `kallsyms_markers` can not be used when=
 making a PIE object; recompile with -fPIE
> > > > > loongarch64-unknown-linux-gnu-ld: kernel/crash_core.o:(.init.text=
+0x984): relocation R_LARCH_PCALA_HI20 against `kallsyms_names` can not be =
used when making a PIE object; recompile with -fPIE
> > > > > loongarch64-unknown-linux-gnu-ld: kernel/bpf/btf.o:(.text+0xcc7c)=
: relocation R_LARCH_PCALA_HI20 against `__start_BTF` can not be used when =
making a PIE object; recompile with -fPIE
> > > > > loongarch64-unknown-linux-gnu-ld: BFD (GNU Binutils) 2.43.50.2024=
1126 assertion fail ../../bfd/elfnn-loongarch.c:2673
> > > > >
> > > > > In theory 5.10&5.15 also need this, but since LoongArch get upstr=
eam at
> > > > > 5.19, so I just ignore them because there is no error report abou=
t other
> > > > > archs now.
> > > >
> > > > Odd, why doesn't this affect other arches as well using new binutil=
s?  I
> > > > hate to have to backport all of this just for one arch, as that fee=
ls
> > > > odd.
> > > The related binutils commit is only for LoongArch, so build errors
> > > only occured on LoongArch. I don't know why other archs have no
> > > problem exactly, but may be related to their CFLAGS (for example, if
> > > we disable CONFIG_RELOCATABLE, LoongArch also has no build errors
> > > because CFLAGS changes).
> >
> > does LoongArch depend on that option?
>
> "That option" is -mdirect-extern-access.  Without it we'll use GOT in
> the kernel image to address anything out of the current TU, bloating the
> kernel size and making it slower.
>

An alternative to this might be to add

-include $(srctree)/include/linux/hidden.h

to KBUILD_CFLAGS_KERNEL, so that the compiler understands that all
external references are resolved at link time, not at load/run time.

> The problem is the linker failed to handle a direct access to undefined
> weak symbol on LoongArch.
...
> With Binutils trunk, an error is emitted instead of silently producing
> buggy executable.  Still I don't think emitting an error is correct when
> linking a static PIE (our vmlinux is a static PIE).  Instead the linker
> should just rewrite
>
>     pcalau12i rd, %pc_hi20(undef_weak)
>
> to
>
>     move rd, $zero
>

Is that transformation even possible at link time? Isn't pc_hi20 part of a =
pair?

> Also the "recompile with -fPIE" suggestion in the error message is
> completely misleading.  We are *already* compiling relocatable kernel
> with -fPIE.
>

And this is the most important difference between LoongArch and the
other arches - LoongArch already uses PIC code explicitly. Other
architectures use ordinary position dependent codegen and linking, or
-in the case of arm64- use position dependent codegen and PIE linking,
where the fact that this is even possible is a happy accident.

...
> > What happens if it is enabled for other arches?  Why doesn't it break
> > them?
>
> The other arches have copy relocation, so their -mdirect-extern-access
> is intended to work with dynamically linked executable, thus it's the
> default and not as strong as ours.  On them -mdirect-extern-access still
> uses GOT to address weak symbols.
>
> We don't have copy relocation, thus our default is -mno-direct-extern-
> access, and -mdirect-extern-access is only intended for static
> executables (including OS kernel, embedded firmware, etc).  So it's
> designed to be stronger, unfortunately the toolchain failed to implement
> it correctly.
>

This has nothing to do with copy relocations - those are only relevant
when shared libraries come into play.

Other architectures don't break because they either a) use position
dependent codegen with absolute addressing, and simply resolve
undefined weak references as 0x0, or b) use GOT indirection, where the
reference is a GOT load and the address in the GOT is set to 0x0.

So the issue here appears to be that the compiler fails to emit a GOT
entry for this reference, even though it is performing PIC codegen.
This is probably due to -mdirect-extern-access being taken into
account too strictly. The upshot is that a relative reference is
emitted to an undefined symbol, and it is impossible for a relative
reference to [reliably] yield NULL, and so the reference produces a
bogus non-NULL address.

As these patches deal with symbols that are only undefined in the
preliminary first linker pass, and are guaranteed to exist afterwards,
silently emitting a bogus relative reference was not a problem in
these cases. Obviously, throwing an error is.

The patches should be rather harmless in practice, but I know Masahiro
did not like the approach for the kallsyms markers, and made some
subsequent modifications to it.

Given that this is relatively new toolchain behavior, I'd suggest
fixing the compiler to emit weak external references via GOT entries
even when  -mdirect-extern-access is in effect.

