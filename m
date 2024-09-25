Return-Path: <linux-kbuild+bounces-3726-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC14D9850FC
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 04:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32A962847A7
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 02:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0334213B783;
	Wed, 25 Sep 2024 02:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=midstall.com header.i=tristan.ross@midstall.com header.b="DZHVQJN3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2960BA55;
	Wed, 25 Sep 2024 02:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727231984; cv=pass; b=egqQwlPu1hh8tDEIe6SPA2c68D6GKkEZKap1LNG+fhvIZW5jWCnJHGBNAs4GKsiCGGrrzQz1NWCacu9mVjH7AGrjHBAaA/ULMtTQ0iTR8021mLeN3ZOckrbPW7CNJbaUSH9H1JR1LrAu7cfk437v6v4G79hy+x3X2XzdgPr2/k8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727231984; c=relaxed/simple;
	bh=KBq3L/tgBOQo38ht7Jo8RF5vs4fSLBlXE86WnspFstY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Yj40xQCful4KOzGZwLt3XT97cfJgSzfMiQna31EfEmL0y0YUnbSrhsAEMaFb8CXUncw6hUv30shGbvf+hugXr1x+G8urqZ0exvwAdGzmhtdN/T0zbNk8/7wkvmYjm2q03x23TLbKml2rzJK2JxcCweVTYx1HAly7wzUWlaiqwd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=midstall.com; spf=pass smtp.mailfrom=midstall.com; dkim=pass (1024-bit key) header.d=midstall.com header.i=tristan.ross@midstall.com header.b=DZHVQJN3; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=midstall.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=midstall.com
ARC-Seal: i=1; a=rsa-sha256; t=1727231943; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EnJgzRANJfEpR8HlUzJciEC5ENNQKdocB90lU56ZTElvpuBaM2HxvqsABJgC412A80ga/1X1Lv5qWmCMSlUSTVJ7yr//i/f8UHFzziercTEBZiR4kj1CF7cPiKiQjhuef3QWGDa26K+sRqohCJBORK1wLIpS36mUVDTlTUyu0AY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727231943; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zfP6tk72gDTaS0kfkEVIpmWor1jmd723y6OtaVebG7I=; 
	b=BmRfhOkA84LWvevM5HD8t89vgeXoevX7HcI9wo7MxT0yMFAVkUPRSE+I9DkKBT5qvKBNltFRHkLlIbkYAaQ0+PxegqfQMMUYKtGVMpg936nGKBUBri4AK/1CqkG/GwLc+TkZpSL4pCPKG3SxU+PHnwQ8qasBq/s40vzO3QRGegQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=midstall.com;
	spf=pass  smtp.mailfrom=tristan.ross@midstall.com;
	dmarc=pass header.from=<tristan.ross@midstall.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727231943;
	s=zmail; d=midstall.com; i=tristan.ross@midstall.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zfP6tk72gDTaS0kfkEVIpmWor1jmd723y6OtaVebG7I=;
	b=DZHVQJN3+gEh6YrB1ik+MPrVyPNEBJKUdBVt+3S/6StvCo0Z5QIPhEzwuqsla/iu
	VkAf0+e5De0xaSgIDDokavtQ6ODBDz25TtC9E9ZZtnZRmeSEPBbkekVPXsz6+lD/PLl
	YNIbMKZ0nwsRRBcNqUcEN57VCl0rNLiYWJT+sU60=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1727231940772585.4316937211197; Tue, 24 Sep 2024 19:39:00 -0700 (PDT)
Date: Tue, 24 Sep 2024 19:39:00 -0700
From: Tristan ross <tristan.ross@midstall.com>
To: "Fangrui Song" <maskray@google.com>
Cc: "Yuxuan Shui" <yshuiv7@gmail.com>,
	"Masahiro Yamada" <masahiroy@kernel.org>,
	"llvm" <llvm@lists.linux.dev>, "nathan" <nathan@kernel.org>,
	"nicolas" <nicolas@fjasle.eu>,
	"linux-kbuild" <linux-kbuild@vger.kernel.org>,
	"tglx" <tglx@linutronix.de>, "mingo" <mingo@redhat.com>,
	"bp" <bp@alien8.de>, "dave.hansen" <dave.hansen@linux.intel.com>,
	"x86" <x86@kernel.org>, "hpa" <hpa@zytor.com>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <192270bd88d.f4dae43a112354.5469673441409436657@midstall.com>
In-Reply-To: <CAFP8O3Kqx-gdTBFn_hesWzd-6NCpGEz1=fMoJXuX+n4c7sp0Bw@mail.gmail.com>
References: <20240208012057.2754421-2-yshuiv7@gmail.com> <CAK7LNAT0KT7sbZJZNXtq5waM-UjUm4zHyf9xHZc3uHLvZ_eAfA@mail.gmail.com> <CAFP8O3Kqx-gdTBFn_hesWzd-6NCpGEz1=fMoJXuX+n4c7sp0Bw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix building with LLVM on NixOS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

LLVM maintainer for Nix here, I do agree that our wrapper is causing issues=
 here. However, we're looking to fix this by mimicking GNU ld's behavior fo=
r checking --dynamic-linker. We're also going to look into getting LLVM lld=
 to support the same behavior in case others have this issue. We might not =
be the only ones who could be affected so adding this behavior into LLVM de=
finitely will be useful. I tested aarch64 building of the kernel and it wor=
ks after we fixed our handling of hardening options. However, aside from aa=
rch64 and x86_64, I am not sure what other things could be failing. I hope =
this clarifies things.

Thank you,
Tristan Ross

(Sorry if I sent two emails, I forgot to reply all last time. First time us=
ing the LKML)


 ---- On Mon, 12 Feb 2024 13:59:13 -0800  Fangrui Song  wrote ---=20
 > On Mon, Feb 12, 2024 at 1:30=E2=80=AFPM Masahiro Yamada masahiroy@kernel=
.org> wrote:
 > >
 > > +Cc: Fangrui Song maskray@google.com>
 > >
 > >
 > >
 > > On Thu, Feb 8, 2024 at 10:22=E2=80=AFAM Yuxuan Shui yshuiv7@gmail.com>=
 wrote:
 > > >
 > > > NixOS is designed to have immutable packages, and explicit dependenc=
ies.
 > > > It allows multiple different versions of the same shared library to
 > > > co-exist in its file system.
 > > >
 > > > Each application built with Nix, the NixOS package manager, will hav=
e
 > > > paths to its dependency shared libraries hardcoded into its executab=
le,
 > > > this includes the dynamic linker. To achieve this, Nix adds a
 > > > --dynamic-linker linker flag when building any application.
 > > >
 > > > This isn't a problem if the kernel is built with ld.bfd, because ld.=
bfd
 > > > ignores the --dynamic-linker flag when the resulting binary doesn't =
have
 > > > a DT_NEEDED entry. However, ld.lld respects --dynamic-linker
 > > > unconditionally, which breaks linking in several cases.
 > > >
 > > > This commit adds an explicit --no-dynamic-linker flag which override=
s
 > > > the flag added by Nix.
 > >
 > >
 > >
 > > I expect some Acks from LLVM folks (especially, from Frangrui)
 > > if this is the right thing to do.
 >=20
 > GNU ld seems to ignore --dynamic-linker for a position-dependent
 > executable (ET_EXEC) when there is no DT_NEEDED entry.
 > ld.lld respects --dynamic-linker in this case. Before this kernel
 > report, I do not know any user inconvenienced by this difference.
 > (mold respects --dynamic-linker as well.)
 > This could be helpful to test an executable with PT_INTERP but no DT_NEE=
DED.
 >=20
 > I think this patch does not fix non-x86 builds.
 > It feels to me that NixOS should provide a linker wrapper that does
 > not force --dynamic-linker=3D.
 > While it's extremely uncommon (and generally not recommended), certain
 > programs invoke the linker directly (instead of using a compiler
 > driver).
 > Such programs would run into a problem when they make a
 > position-dependent executable with no dependency as well.
 > I don't feel that NixOS forcing --dynamic-linker=3D is enough
 > justification to change linkers.
 >=20
 > > > Signed-off-by: Yuxuan Shui yshuiv7@gmail.com>
 > > > ---
 > > >  Makefile                      | 3 +++
 > > >  arch/x86/boot/Makefile        | 2 +-
 > > >  arch/x86/realmode/rm/Makefile | 2 +-
 > > >  3 files changed, 5 insertions(+), 2 deletions(-)
 > > >
 > > > diff --git a/Makefile b/Makefile
 > > > index a171eafce2a3b..10ed19caecb1b 100644
 > > > --- a/Makefile
 > > > +++ b/Makefile
 > > > @@ -531,6 +531,9 @@ RUSTFLAGS_KERNEL =3D
 > > >  AFLAGS_KERNEL  =3D
 > > >  LDFLAGS_vmlinux =3D
 > > >
 > > > +LDFLAGS_MODULE +=3D --no-dynamic-linker
 > > > +LDFLAGS_vmlinux +=3D --no-dynamic-linker
 > > > +
 > > >  # Use USERINCLUDE when you must reference the UAPI directories only=
.
 > > >  USERINCLUDE    :=3D \
 > > >                 -I$(srctree)/arch/$(SRCARCH)/include/uapi \
 > > > diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
 > > > index 3cece19b74732..390a4604166eb 100644
 > > > --- a/arch/x86/boot/Makefile
 > > > +++ b/arch/x86/boot/Makefile
 > > > @@ -102,7 +102,7 @@ $(obj)/zoffset.h: $(obj)/compressed/vmlinux FORC=
E
 > > >  AFLAGS_header.o +=3D -I$(objtree)/$(obj)
 > > >  $(obj)/header.o: $(obj)/zoffset.h
 > > >
 > > > -LDFLAGS_setup.elf      :=3D -m elf_i386 -z noexecstack -T
 > > > +LDFLAGS_setup.elf      :=3D --no-dynamic-linker -m elf_i386 -z noex=
ecstack -T
 > > >  $(obj)/setup.elf: $(src)/setup.ld $(SETUP_OBJS) FORCE
 > > >         $(call if_changed,ld)
 > > >
 > > > diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Ma=
kefile
 > > > index f614009d3e4e2..4b42006d9ce02 100644
 > > > --- a/arch/x86/realmode/rm/Makefile
 > > > +++ b/arch/x86/realmode/rm/Makefile
 > > > @@ -50,7 +50,7 @@ $(obj)/pasyms.h: $(REALMODE_OBJS) FORCE
 > > >  targets +=3D realmode.lds
 > > >  $(obj)/realmode.lds: $(obj)/pasyms.h
 > > >
 > > > -LDFLAGS_realmode.elf :=3D -m elf_i386 --emit-relocs -T
 > > > +LDFLAGS_realmode.elf :=3D --no-dynamic-linker -m elf_i386 --emit-re=
locs -T
 > > >  CPPFLAGS_realmode.lds +=3D -P -C -I$(objtree)/$(obj)
 > > >
 > > >  targets +=3D realmode.elf
 > > > --
 > > > 2.43.0
 > > >
 > >
 > >
 > > --
 > > Best Regards
 > > Masahiro Yamada
 > >
 >=20
 >=20
 > --=20
 > =E5=AE=8B=E6=96=B9=E7=9D=BF
 >=20
 >=20
 >=20
Tristan ross
CEO & Founder of Midstall Software



