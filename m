Return-Path: <linux-kbuild+bounces-4952-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DF99E1845
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 10:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7005B26421
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 09:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7C71DEFC2;
	Tue,  3 Dec 2024 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qN75zcUC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9522D1DED75;
	Tue,  3 Dec 2024 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733216485; cv=none; b=cQ0uxjQV3Zqb1oj511PlmX7Fed16HAg90aQZGrAUTQEU4HTUKEZEJ9B2aQTnfjrF4dZfKaTJDiPGbXPltTreJT571II2ZYGF7QnKZilUJMNf/ESPVksbbZQFfJqvvrDzQO+KCCeog67ksKOYotBP/cdYJJdhoUakjUsNRYgPTsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733216485; c=relaxed/simple;
	bh=jrbYi65ApxHKC8+pjbJl/N9HlwU4KbfFDpjeUSNyUVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4JI/R+i8r6f78TClicYwvTrwOSTWmbzLz6CZs/wZ+uIn3TfEZ10Q1iMhHJwp6MrywTgbXPWOQvolApBwbmzevN/OVA4E25VJICP6hJCQGMc1xrSqlT+7o+tOewJW3HAvgXh/uFbGr/APTgBlA6dSFOfIwKAAfPcQN/EQ5suSk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qN75zcUC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149F9C4CED6;
	Tue,  3 Dec 2024 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733216485;
	bh=jrbYi65ApxHKC8+pjbJl/N9HlwU4KbfFDpjeUSNyUVI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qN75zcUCwk1oYfRLKujuanjs+VIRNB8VepjbR/LTJ3XzNitIhY/1RHAXmV5VzYKIE
	 7+7cI5HBoZlT7e4kPXQG0YYTOZb5KDOhWt+Wv2aCUojm7csw36RHmi+ilwXBor102L
	 gTyaqie5Gx7QygC8Aez4luXGjotJNkzIRG6yN2wFk+4nMo5jjf+/ermSXGy0bZQfoh
	 zIVtdr9dbczi9szCNRUAnFsOg4HfRi5HkjJagmLgWSrUJmAVeiOXIei2tVsQPUoR7y
	 aXVluK+gPJUMBCbRdke7RkJF6sO62COdifE/Oc0AOecszBIBFX6k3vlfr0yv829Ycd
	 igDVdgZaihCgA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53de8ecb39bso6125387e87.2;
        Tue, 03 Dec 2024 01:01:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWY1vknapBEzJplMVt/B5jLShwS2oK1QwZsZJRFG3NaixaQn9zAQYgqzK/4MAqb7hHryioRYJpdUBJZd+I=@vger.kernel.org, AJvYcCXJi/PcdipeCmihhdpmim1iriB+n0JClVQv5EYiXsAKlkFWRxnbYDeF/ANSoAiAHB1cl/DZtgLY+9hxnzbU@vger.kernel.org
X-Gm-Message-State: AOJu0YzURjo0yewgrtSILTmxn3jM4RhxPNAFLVRJNT/zybia1Eq2ObnW
	njajHAhlf7rO5/hXS0fNeKbofe2DNXiTduJbgPwSOPiCLeoAfIoOfoG9K3svhPvpk8a7scbQqIa
	r5pcD6hSNnntC6Y7YCAF8gvc+ESg=
X-Google-Smtp-Source: AGHT+IE53UOWx86TF5Ktbvamul0qTjoaDWhGc52xK+zs1MsYWDe+raaJrd2aCocOr62XBgjMaSgtsG3g++T7vvKy+vg=
X-Received: by 2002:a05:6512:3c8c:b0:53d:d137:d7a4 with SMTP id
 2adb3069b0e04-53e12a3896bmr828741e87.53.1733216483720; Tue, 03 Dec 2024
 01:01:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <81560af7526138aa5221e5900ee7462f55bb090d.camel@HansenPartnership.com>
 <CAMj1kXFGEeAkxpqsfp0G3VqTRs+Sve-pULDXBKvzSqAc_AVFMA@mail.gmail.com>
In-Reply-To: <CAMj1kXFGEeAkxpqsfp0G3VqTRs+Sve-pULDXBKvzSqAc_AVFMA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Dec 2024 18:00:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT4YibckTwYRCzUv0dZs4qX4BFzh0uc=bvTuaZM12nrvw@mail.gmail.com>
Message-ID: <CAK7LNAT4YibckTwYRCzUv0dZs4qX4BFzh0uc=bvTuaZM12nrvw@mail.gmail.com>
Subject: Re: section mismatch error in aesgcm causing a build failure
To: Ard Biesheuvel <ardb@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, linux-crypto@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 5:35=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> On Mon, 2 Dec 2024 at 21:27, James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> >
> > I'm getting this in 6.13-rc1:
> >
> > /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:212:29: error: ptext1
> > causes a section type conflict with aesgcm_tv
> >  static const u8 __initconst ptext1[16];
> >                              ^~~~~~
> > /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:570:9: note: =E2=80=98aesg=
cm_tv=E2=80=99 was declared here
> >  } const aesgcm_tv[] __initconst =3D {
> >          ^~~~~~~~~
> > make[5]: *** [/home/jejb/git/linux-tpm/scripts/Makefile.build:194: lib/=
crypto/aesgcm.o] Error 1
> > /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:212:29: error: ptext1 caus=
es a section type conflict with aesgcm_tv
> >  static const u8 __initconst ptext1[16];
> >                              ^~~~~~
> > /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:570:9: note: =E2=80=98aesg=
cm_tv=E2=80=99 was declared here
> >  } const aesgcm_tv[] __initconst =3D {
> >          ^~~~~~~~~
> > make[5]: *** [/home/jejb/git/linux-tpm/scripts/Makefile.build:194: lib/=
crypto/aesgcm.o] Error 1
> >
> > I think it's way older than 6.13-rc1, but the inclusion of the sevguest
> > driver in the merge window now means that something actually selects
> > it.  I can fix it simply by adding a zero initialization to the file:
> >
> > -static const u8 __initconst ptext1[16];
> > +static const u8 __initconst ptext1[16] =3D { 0 };
> >
> > Which I think means that by default the traditional zero initialization
> > of a static variable is in the wrong section (and actually likely is
> > wrong for all our __initX variables as well).
> >
> > In case it matters, this is with gcc-7
> >
>
> This also works
>
> static const u8 __section(".init.rodata,\"a\",@progbits #") ptext1[16];
>
> and so this suggests that without the @progbits annotations, the
> compiler is placing ptext1 into a SHT_NOBITS section, causing a
> conflict with the SHT_PROGBITS annotation of aesgcm_tv.
>
> Given how unusual it is to have a static const variable without an
> initializer, I don't think this suggests that there is a wider issue
> with __initconst/__initdata.
>
> We're about to bump the minimum GCC version to 8 for other reasons,
> and I couldn't reproduce it with GCC 8.5.0. But the fix is
> straight-forward and actually clarifies this rather odd occurrence, so
> I think we should apply it nonetheless.
>
> --
> Ard.


So, this 16-byte zero data is stored in the kernel image due to
the __initconst section?

Without the __initconst annotation, it would go to the BSS section,
saving the kernel image size?

Anyway, up to the crypt maintainer.
Personally, I do not have much interest in an old compiler issue.



--=20
Best Regards
Masahiro Yamada

