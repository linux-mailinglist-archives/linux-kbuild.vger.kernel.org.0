Return-Path: <linux-kbuild+bounces-5029-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 781D69E7F94
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Dec 2024 11:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE27528252C
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Dec 2024 10:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2CE13777E;
	Sat,  7 Dec 2024 10:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="PsYqeXBr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4A5335C0;
	Sat,  7 Dec 2024 10:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733568406; cv=none; b=DpYeloxyOPU/90kDLplqdSYHkRrNqCZ7ZCbZt0dPnleIabNHGpYmRSt4g2uq9oGZ10/zQKXvlOJIv0hvwwPVFp8iTchfFp1w/MRbu4dfWjxaqJUh91edMvduAyAgpy0DMcCzyF+SJg2lmG3FXx/hzJgn13fiCrMApspqJqPmSRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733568406; c=relaxed/simple;
	bh=ULDydNaHWeQGXAplfVfriPEbhSJ5GxwWjr7eXiouAkQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zz0fqEASe2FcuzFePpaBP+P7/IpMWZklSHjOvT5DbHOWpvaWc1JAnrfqT49OdyKIVDWBwor2KXQxah8MWwpOUu94ELgIet38eA8Z4UxTb10eVsDi2lPrsWoRY/Co0uIZEQBTtzfwtsiGOnTSppwO1nocYymRgYGeeYo7QC5Whag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=PsYqeXBr; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1733568396;
	bh=NhTGUNDNPCdx2iRQ7zdDmyz3eSPXRMc5mwcTN3O7rc0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PsYqeXBruojItgwrjfBzoEewGL3m6iQulCCvbRWoQpKXw01q4dosuRI56Jh3MUvAP
	 Tca/438m/Uic6kC65pDbbKRh1qudhlBjF+yd+D0JAbJ/uUKKoHXXsiyF3POQt+5r5z
	 DX6qEE/sSzYZ5Jd3YMpQrFGA+vybffagZ6MGcf04=
Received: from [IPv6:240e:454:83f0:f04c:12cb:a780:d20f:7e2b] (unknown [IPv6:240e:454:83f0:f04c:12cb:a780:d20f:7e2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id F130C1A3F7A;
	Sat,  7 Dec 2024 05:46:29 -0500 (EST)
Message-ID: <ccb1fa9034b177042db8fcbe7a95a2a5b466dc30.camel@xry111.site>
Subject: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where
 possible
From: Xi Ruoyao <xry111@xry111.site>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huacai Chen
	 <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>, 
 Xuerui Wang <kernel@xen0n.name>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor	 <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Nicolas Schier	 <nicolas@fjasle.eu>,
 stable@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, Ard Biesheuvel	
 <ardb@kernel.org>
Date: Sat, 07 Dec 2024 18:46:21 +0800
In-Reply-To: <2024120748-preaching-reshape-06e9@gregkh>
References: <20241206085810.112341-1-chenhuacai@loongson.cn>
	 <2024120635-wham-campsite-b62b@gregkh>
	 <CAAhV-H4Db0tVrqcfXHceJeODgnK0ggHpx9_6vwXAAV0LohCD-w@mail.gmail.com>
	 <2024120748-preaching-reshape-06e9@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-12-07 at 10:32 +0100, Greg Kroah-Hartman wrote:
> On Sat, Dec 07, 2024 at 05:21:00PM +0800, Huacai Chen wrote:
> > Hi, Greg,
> >=20
> > On Fri, Dec 6, 2024 at 9:04=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >=20
> > > On Fri, Dec 06, 2024 at 04:58:07PM +0800, Huacai Chen wrote:
> > > > Backport this series to 6.1&6.6 because LoongArch gets build errors=
 with
> > > > latest binutils which has commit 599df6e2db17d1c4 ("ld, LoongArch: =
print
> > > > error about linking without -fPIC or -fPIE flag in more detail").
> > > >=20
> > > > =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vmlinux.export.o
> > > > =C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/utsversion.h
> > > > =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 init/version-timestamp.o
> > > > =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1
> > > > loongarch64-unknown-linux-gnu-ld: kernel/kallsyms.o:(.text+0): relo=
cation R_LARCH_PCALA_HI20 against `kallsyms_markers` can not be used when m=
aking a PIE object; recompile with -fPIE
> > > > loongarch64-unknown-linux-gnu-ld: kernel/crash_core.o:(.init.text+0=
x984): relocation R_LARCH_PCALA_HI20 against `kallsyms_names` can not be us=
ed when making a PIE object; recompile with -fPIE
> > > > loongarch64-unknown-linux-gnu-ld: kernel/bpf/btf.o:(.text+0xcc7c): =
relocation R_LARCH_PCALA_HI20 against `__start_BTF` can not be used when ma=
king a PIE object; recompile with -fPIE
> > > > loongarch64-unknown-linux-gnu-ld: BFD (GNU Binutils) 2.43.50.202411=
26 assertion fail ../../bfd/elfnn-loongarch.c:2673
> > > >=20
> > > > In theory 5.10&5.15 also need this, but since LoongArch get upstrea=
m at
> > > > 5.19, so I just ignore them because there is no error report about =
other
> > > > archs now.
> > >=20
> > > Odd, why doesn't this affect other arches as well using new binutils?=
=C2=A0 I
> > > hate to have to backport all of this just for one arch, as that feels
> > > odd.
> > The related binutils commit is only for LoongArch, so build errors
> > only occured on LoongArch. I don't know why other archs have no
> > problem exactly, but may be related to their CFLAGS (for example, if
> > we disable CONFIG_RELOCATABLE, LoongArch also has no build errors
> > because CFLAGS changes).
>=20
> does LoongArch depend on that option?

"That option" is -mdirect-extern-access.  Without it we'll use GOT in
the kernel image to address anything out of the current TU, bloating the
kernel size and making it slower.

The problem is the linker failed to handle a direct access to undefined
weak symbol on LoongArch.  With GCC 14.2 and Binutils 2.43:

$ cat t.c
extern int x __attribute__ ((weak));

int main()
{
	__builtin_printf("%p\n", &x);
}
$ cc t.c -mdirect-extern-access -static-pie -fPIE
$ ./a.out
0x7ffff27ac000

The output should be (nil) instead, as an undefined weak symbol should
be resolved to address 0.  I'm not sure why the kernel was not blown up
by this issue.

With Binutils trunk, an error is emitted instead of silently producing
buggy executable.  Still I don't think emitting an error is correct when
linking a static PIE (our vmlinux is a static PIE).  Instead the linker
should just rewrite

    pcalau12i rd, %pc_hi20(undef_weak)

to

    move rd, $zero

Also the "recompile with -fPIE" suggestion in the error message is
completely misleading.  We are *already* compiling relocatable kernel
with -fPIE.

I'm making some Binutils patches to implement the rewrite and reword the
error message (for instances where emitting an error is the correct
thing, e.g. someone attempts to build a dynamically linked program with
-mdirect-extern-access).

> What happens if it is enabled for other arches?  Why doesn't it break
> them?

The other arches have copy relocation, so their -mdirect-extern-access
is intended to work with dynamically linked executable, thus it's the
default and not as strong as ours.  On them -mdirect-extern-access still
uses GOT to address weak symbols.

We don't have copy relocation, thus our default is -mno-direct-extern-
access, and -mdirect-extern-access is only intended for static
executables (including OS kernel, embedded firmware, etc).  So it's
designed to be stronger, unfortunately the toolchain failed to implement
it correctly.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

