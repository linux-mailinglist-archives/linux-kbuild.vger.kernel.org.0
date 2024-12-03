Return-Path: <linux-kbuild+bounces-4977-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3269E2BE9
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 20:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58F49B27CF7
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 16:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2817A1F4283;
	Tue,  3 Dec 2024 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cN7BVadz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0000F2BD1D;
	Tue,  3 Dec 2024 16:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733243460; cv=none; b=j18aJJg/4uP8dboD7XK5YQTxmza27j/FMpaiZWsBGNHsRN60cIkFC/irumvGzkhrjuYOomskaLtTtoKDpe9ckcNicMZDYbJojzEobfNXRl/yq1A/LJjkcmGQm/3DEohci76yaMOYItyDWO3FmhaTfjRbzIzB5bi3lZLAJ/8w3oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733243460; c=relaxed/simple;
	bh=9WLbfDlWBf7lIxo4Ik3otfBy5WpGKtytQam0hLGECxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ov+lT07TXUKDE1oyQVsmP6NL9mM7hFqpJ6H7VKBSZeI0/0iHNCp84tNEXghDOybhdT6nvl+Raw3y1LJp6+AvkkXdeDiTrhdDahi29bmrH0GA/p7W6hKxE6nGLlEg1EMN8M5ofxBMqSrM/zpdgmJ2+0CGC5IdEQMYxxGfI+sjna4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cN7BVadz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB999C4CECF;
	Tue,  3 Dec 2024 16:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733243459;
	bh=9WLbfDlWBf7lIxo4Ik3otfBy5WpGKtytQam0hLGECxM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cN7BVadzHZTZ8k/0Mao8K9b9j6SR4AxtW/zY1WyAYeB38yABXh70gFT0r3hCbbQtU
	 haHWv9xZrY/MMfPCXS2FjiqnMHOKkQXmLHCJn2ADVEc/6rnH167Iyaeq8R9DAWwzcL
	 UctflHT2ci0CycvYKWUGCJzKZ37ZV/ifSSx3Iyq8iczJFSHsS8gZEKxXLOHCrrTgvj
	 UVw3Gs+zc7U9+78PvcQPUrE2boSGL5bf08XAwcSmjhNnpPDpg0w9WUSNmGDKljaIbT
	 DaRRo2AmECvdIVJUfBs5DMO6s8eL4BNSFO8zQLAifTwj0BxljC1R70jTs7/OW04nZm
	 wJMIwPKbT6AnQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffc3f2b3a9so77119361fa.1;
        Tue, 03 Dec 2024 08:30:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCDSpYM54uEj4ZikTckkqvdhSqDsCAKal0pjPQvJ50883ZbHG2LjELtp+AbPKUrGaYKebI2NO9IjnzL4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBEy0ejqPC8WYXGDyNUriOjOmRT1Rp+2KkAJjHH2fsH3ePNrnk
	iCVANAFLI0A7/ADqfg7yhT688DUWD+akWPZbOeGzZh3q9yKRY5C6qRNAHAVaG9T9qZRUUrdT36D
	NEFZd6h4nt2u0Kq3DlC5/hIbXjiQ=
X-Google-Smtp-Source: AGHT+IE89g3zw4bi/PoiZ1mYdJHT7q8RiN7r1eQmEL3MXVMc3aYkDMi2ulypAM0VD26e9gpMvQJJzIFok/4p8MxS4dE=
X-Received: by 2002:a05:6512:1189:b0:53d:eef7:a017 with SMTP id
 2adb3069b0e04-53e129ff019mr3272024e87.15.1733243458067; Tue, 03 Dec 2024
 08:30:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <81560af7526138aa5221e5900ee7462f55bb090d.camel@HansenPartnership.com>
 <CAMj1kXFGEeAkxpqsfp0G3VqTRs+Sve-pULDXBKvzSqAc_AVFMA@mail.gmail.com> <6d21ce25bab39922c5c8b9f9433267e9d3e40d52.camel@HansenPartnership.com>
In-Reply-To: <6d21ce25bab39922c5c8b9f9433267e9d3e40d52.camel@HansenPartnership.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 3 Dec 2024 17:30:47 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE5H9_FMeyx-P=1P-q_OignBD9fBZm4xcc+-tKQ7yE2OA@mail.gmail.com>
Message-ID: <CAMj1kXE5H9_FMeyx-P=1P-q_OignBD9fBZm4xcc+-tKQ7yE2OA@mail.gmail.com>
Subject: Re: section mismatch error in aesgcm causing a build failure
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: linux-crypto@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Dec 2024 at 15:56, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Tue, 2024-12-03 at 09:35 +0100, Ard Biesheuvel wrote:
> > On Mon, 2 Dec 2024 at 21:27, James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:
> > >
> > > I'm getting this in 6.13-rc1:
> > >
> > > /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:212:29: error: ptext1
> > > causes a section type conflict with aesgcm_tv
> > >  static const u8 __initconst ptext1[16];
> > >                              ^~~~~~
> > > /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:570:9: note:
> > > =E2=80=98aesgcm_tv=E2=80=99 was declared here
> > >  } const aesgcm_tv[] __initconst =3D {
> > >          ^~~~~~~~~
> > > make[5]: *** [/home/jejb/git/linux-tpm/scripts/Makefile.build:194:
> > > lib/crypto/aesgcm.o] Error 1
> > > /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:212:29: error: ptext1
> > > causes a section type conflict with aesgcm_tv
> > >  static const u8 __initconst ptext1[16];
> > >                              ^~~~~~
> > > /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:570:9: note:
> > > =E2=80=98aesgcm_tv=E2=80=99 was declared here
> > >  } const aesgcm_tv[] __initconst =3D {
> > >          ^~~~~~~~~
> > > make[5]: *** [/home/jejb/git/linux-tpm/scripts/Makefile.build:194:
> > > lib/crypto/aesgcm.o] Error 1
> > >
> > > I think it's way older than 6.13-rc1, but the inclusion of the
> > > sevguest
> > > driver in the merge window now means that something actually
> > > selects
> > > it.  I can fix it simply by adding a zero initialization to the
> > > file:
> > >
> > > -static const u8 __initconst ptext1[16];
> > > +static const u8 __initconst ptext1[16] =3D { 0 };
> > >
> > > Which I think means that by default the traditional zero
> > > initialization
> > > of a static variable is in the wrong section (and actually likely
> > > is
> > > wrong for all our __initX variables as well).
> > >
> > > In case it matters, this is with gcc-7
> > >
> >
> > This also works
> >
> > static const u8 __section(".init.rodata,\"a\",@progbits #")
> > ptext1[16];
>
> That also works for me.
>
> > and so this suggests that without the @progbits annotations, the
> > compiler is placing ptext1 into a SHT_NOBITS section, causing a
> > conflict with the SHT_PROGBITS annotation of aesgcm_tv.
>
> I'm not so sure about that:
>
> static const u8 __section(".bss.init,\"a\",@nobits #") ptext1[16];
>
> Also works for me.
>

I'm not sure I get the point you are trying to make. .bss.init does
not exist otherwise, so there is no other section it might conflict
with.

> > Given how unusual it is to have a static const variable without an
> > initializer, I don't think this suggests that there is a wider issue
> > with __initconst/__initdata.
>
> What I meant was that uninitialized static __initX variables point to
> the bss section.  We don't seem to have a discardable init bss section,
> so they remain allocated for the life of the kernel.
>

This is not about the section, but about the type annotation.

__initdata will be emitted into .init.data, and it will be discarded
after boot. Even if there is no initializer, the variable will still
end up in the correct section, and not point to the .bss section as
you claim.

> > We're about to bump the minimum GCC version to 8 for other reasons,
> > and I couldn't reproduce it with GCC 8.5.0. But the fix is
> > straight-forward and actually clarifies this rather odd occurrence,
> > so I think we should apply it nonetheless.
>
> Hm, that's going to cause some problems: I'm on openSUSE Leap.
> Although all gcc's up to gcc-13 can be installed, the default compiler
> is still gcc-7
>

I guess you will have to upgrade your compiler then.

