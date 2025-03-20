Return-Path: <linux-kbuild+bounces-6267-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA878A6AB4A
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 17:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 591CE8A74BA
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 16:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C195921CC55;
	Thu, 20 Mar 2025 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/m0Vqel"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9552717591;
	Thu, 20 Mar 2025 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742488909; cv=none; b=DZqaraW4bd6N+PYIvXMEg6eTiiJU34GfxPSuB4wLtCM22pm+7C9JUY17MaFjX8zm3+4SVBJHs1gVn1PWHNJV5/foQPPZlwRXn+11RysZHxlR2GzoaUz/aotnhL2+o3ml9hndsIKEvzDcI9QQYXbOKlliOEjOdVV0ceIf3OvVIjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742488909; c=relaxed/simple;
	bh=4o2nxI0GvC/k5QTevrl92f6La2EgrldXcycsukxcDUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n6mhNZ2erXjUUWuJl+uTWP3r/OosffvYVa6/BLy25o1VyxFFncK/d5oGr3AZEtRRHPPXjPGIjLBsrjDpfsT8wCpvdkpnvzGtveU0bs+GfiDFpvx5BVHsQX92upa1WwAnHIPK5J8rByCy3VWrEQ/MUyOx0gX3brUPpEUmQB82KpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/m0Vqel; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B56C4AF09;
	Thu, 20 Mar 2025 16:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742488909;
	bh=4o2nxI0GvC/k5QTevrl92f6La2EgrldXcycsukxcDUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m/m0VqelfLaOpzKsTNaOLTfePUN9dGDAptyLD2/5cU981SxXtNkyYqPPYGr1zMHkE
	 ysDTrOmTvLWPoHIaLO58IBj9QYncGhyheUKOmgBJtk0mTqZMbxN3RR0D8Bz+sbyEKJ
	 SAhA6Hx31v/8oMW2OBfkdA2ccSENod8/HYlXpfGabc5My5SfN4O4Iw39PqzsKrSzSj
	 6BSi79v0eNh9QGp0Mm2p8ZgwD5hFHQTY+hczK8ou+fvzmXNgJqsiN9wvCfXnXTZYpi
	 1XmmzjQvGGyVFuN0ftXDcDl38ofIqjNWDCWQEpxuwFqxPnvl0llcm0H2jrEHceb8vJ
	 MhKzFuRO2XR3w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so1111348e87.1;
        Thu, 20 Mar 2025 09:41:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEMMrkYJJUepE0l8g06sVlq5vKa6i0QehIuRdK+5J88oyiOKrmRinBgR5yokteWlwbgbfc6OX9dY/vtRc=@vger.kernel.org, AJvYcCWy/NRFCDAAGqlyX/Hj52nTLprUuqU/OK/WTr7uBDhqZBS1MXJ34qPyQg63J8sdbKvxpOCG0IOl+g6T8dv+@vger.kernel.org
X-Gm-Message-State: AOJu0YyAbnMpas6e0gZY3zQ0KjXMrONnBOnNNl/z8ymlRsPOQ56OTgc2
	DWBUoPSKcgYewDLAo8IlVJh6mhvoTP+zFn4zkC34jhhSYtc1LATlgvEO0Y1MbuBcPMJNg736pg6
	1isCinTFcy3KlC151F2bb42mwGPU=
X-Google-Smtp-Source: AGHT+IEo02YsEG7EonianAke3+7Kn0h0ddtVhFGHF4mCLji3NulGiHMvab3VtYH9CzstumAT6CZ6y0DC0stLI/rZDas=
X-Received: by 2002:a05:6512:12c4:b0:545:2ab1:3de with SMTP id
 2adb3069b0e04-54acb1b79a6mr2750243e87.13.1742488907332; Thu, 20 Mar 2025
 09:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320070746.101552-2-ardb+git@google.com> <CABCJKuc3zZOG4qgoFca_g80GMkzviVRemGLJB8GaA88u27Mt8A@mail.gmail.com>
 <CAMj1kXFZFgYp40xD72s0oMThgxK7J-yyCYUQkkBQjh3xR+fNeQ@mail.gmail.com> <CABCJKueFujwW_=JMZHTf+Y3qN9=uvQYSoDcg_6v=9svUYTsMGQ@mail.gmail.com>
In-Reply-To: <CABCJKueFujwW_=JMZHTf+Y3qN9=uvQYSoDcg_6v=9svUYTsMGQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 20 Mar 2025 17:41:36 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHCX9oinqQ6xSMgKHdVqp16svPrs9bZu0tX_iD6h76NtA@mail.gmail.com>
X-Gm-Features: AQ5f1JoVJC_tPxpybg66O-Rx4_hPF8DalCfneXHub3kKa-OJHmWT1krw9YxBf2c
Message-ID: <CAMj1kXHCX9oinqQ6xSMgKHdVqp16svPrs9bZu0tX_iD6h76NtA@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: define __GENKSYMS__ when processing asm-protoypes.h
To: Sami Tolvanen <samitolvanen@google.com>, Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, brgerst@gmail.com, 
	x86@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	linux-kernel@vger.kernel.org, nogikh@google.com, 
	syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Mar 2025 at 17:22, Sami Tolvanen <samitolvanen@google.com> wrote=
:
>
> On Thu, Mar 20, 2025 at 9:09=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> =
wrote:
> >
> > On Thu, 20 Mar 2025 at 15:48, Sami Tolvanen <samitolvanen@google.com> w=
rote:
> > >
> > > Hi Ard,
> > >
> > > On Thu, Mar 20, 2025 at 12:07=E2=80=AFAM Ard Biesheuvel <ardb+git@goo=
gle.com> wrote:
> > > >
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Ensure that __GENKSYMS__ is #define'd when passing asm/asm-prototyp=
es.h
> > > > through the compiler to capture the exported symbols. This ensures =
that
> > > > exported symbols such as __ref_stack_chk_guard on x86, which is dec=
lared
> > > > conditionally, is visible to the tool.
> > > >
> > > > Otherwise, an error such as the below may be raised, breaking the b=
uild
> > > > when CONFIG_GENDWARFKSYMS=3Dy
> > > >
> > > >   <stdin>:4:15: error: use of undeclared identifier '__ref_stack_ch=
k_guard'
> > > >
> > > > Cc: Sami Tolvanen <samitolvanen@google.com>
> > > > Reported-by: syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
> > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > ---
> > > >  scripts/Makefile.build | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > > index 993708d11874..7855cdc4e763 100644
> > > > --- a/scripts/Makefile.build
> > > > +++ b/scripts/Makefile.build
> > > > @@ -305,6 +305,7 @@ $(obj)/%.rs: $(obj)/%.rs.S FORCE
> > > >  getasmexports =3D                                                 =
               \
> > > >     { echo "\#include <linux/kernel.h>" ;                          =
     \
> > > >       echo "\#include <linux/string.h>" ;                          =
     \
> > > > +     echo "\#define  __GENKSYMS__" ;                              =
     \
> > > >       echo "\#include <asm/asm-prototypes.h>" ;                    =
     \
> > > >       $(call getexportsymbols,EXPORT_SYMBOL(\1);) ; }
> > >
> > > This works with gendwarfksyms since __GENKSYMS__ is defined after the
> > > EXPORT_SYMBOL() definition, but I'm now getting warnings with
> > > genksyms:
> > >
> > >   AS      arch/x86/lib/clear_page_64.o
> > > <stdin>:3:10: warning: "__GENKSYMS__" redefined
> > > <command-line>: note: this is the location of the previous definition
> > >
> >
> > Oops.
> >
> > Do you think the fix below should be sufficient?
> >
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -314,7 +314,7 @@
> >  else
> >  cmd_gensymtypes_S =3D                                                 =
   \
> >         $(getasmexports) |                                             =
 \
> > -       $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
> > +       $(CPP) $(c_flags) -xc - | $(genksyms)
> >  endif # CONFIG_GENDWARFKSYMS
> >
> >  quiet_cmd_cpp_s_S =3D CPP $(quiet_modtag) $@
>
> EXPORT_SYMBOL() has a different definition when __GENKSYMS__ is
> defined, so I think with genksyms we actually do need this on the
> command line. I suppose you could wrap the getasmexports definition in
> #ifndef __GENKSYMS__ to avoid the warning, or just use
> __GENDWARFKSYMS__ like you suggested earlier.
>

Yeah, on second thought, we could just do what Masahiro suggested, and
drop the conditional from asm/asm-prototypes.h

The issue in question only affects definitions, not declarations, and
so having the declaration visible shouldn't be a problem.

Ingo, mind dropping this patch again? We'll do the below instead (I'll
send out the patch in a minute)


--- a/arch/x86/include/asm/asm-prototypes.h
+++ b/arch/x86/include/asm/asm-prototypes.h
@@ -20,6 +20,6 @@
 extern void cmpxchg8b_emu(void);
 #endif

-#if defined(__GENKSYMS__) && defined(CONFIG_STACKPROTECTOR)
+#ifdef CONFIG_STACKPROTECTOR
 extern unsigned long __ref_stack_chk_guard;
 #endif

