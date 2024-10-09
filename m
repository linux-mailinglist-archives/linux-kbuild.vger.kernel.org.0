Return-Path: <linux-kbuild+bounces-3993-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D90AD9968DE
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 13:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85C5E1F2598F
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 11:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A39191461;
	Wed,  9 Oct 2024 11:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DCJIag5X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA1218FDAF
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Oct 2024 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728473575; cv=none; b=ZkpIYZGCgA/PCcyGQo1n2fACenTXdKhOLCtO+qdQA6OTtHXw+OUgCKa2Xydf/l9M1/lxOtwPhWFqKBSNtReJg9uQ7I/o/LY8IaVpEjRZp8L1+jq2urpyuYWEMyyJ2ZRdHD5ZF8X0W4jxod9ObGU5UmpOmVh+A60afizHU7GHcMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728473575; c=relaxed/simple;
	bh=u2nkpeNDCCtr+RDR1GIBlfqM1CcT4OISAJQIvFmPPH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MR28FoAmYHRgehZvUnc4/u6rMtWQ4c+VhOa+PsLjF+ngbXNtiDaduvboBdJgNrIz3t8LBmcwtDomwIJmAK1t/Gssw+QvMNAzQjog1JfMwNQr8TNiR0ttPty/ufPX/NnOBcS8Hwub3YihNqAbpr2OeMPYoY5a3f4W7cABBIiGvWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DCJIag5X; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d375ddfc0so896657f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Oct 2024 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728473572; x=1729078372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHfdMVCdMqw7XiUFeDg6OwkwsDzXxFWVFFZsqEM0H+A=;
        b=DCJIag5XxPbi9OC37ORGwovatj+Tu99IFvtSNDWS8+2jYlVlg20cTWWxpVbAHhh/os
         MLDUXsmiaIi5aPSJsQQwFoAxj0eg5h7z46eWpVjn5JK+0uOaXwdMo7VhqL4KJJ1h1ibE
         1EdfjOeQb+FKVVrMOPX7ws7n4SPc7FQVEgUbBdbnQm7S5I62ybmNvsw3xY6kfh4Znp78
         la+MeVEfi170wcJAqxbTngwvRcv2XAAsrgTKjhTbj62qHMzIihppGExRYYfwJBfCKDvU
         NdEBiv0zYpQfDPMz5MwNDrGqs+tjEecDPEo2NTS8P8zIF6UTXBoW/fD0TOG814DRCtid
         UjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728473572; x=1729078372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHfdMVCdMqw7XiUFeDg6OwkwsDzXxFWVFFZsqEM0H+A=;
        b=h1ogqe/1LqY2NBKBavA05mpVdpGeztSbc7gVuOo9lbpKnp/z9Vt029o0RJQ8cZ51xD
         QNUuM13RX54i7IVVwYsDDdImhw5w42Ycr34NbqJ+ztcayfR1cy3pEXRiNntJNGjOl2UQ
         I4eXP8//a7ETT8smpO+0QUiL5jTTgfrsNJ9dufkk5Yl7TEfmFQaAujIqhFQSgPnjbdNR
         /Ep/ak7kZG87bCMnh79KA/xdMYwd6DyOt73BkiCPTVAGULg5ufKW58m2sA5l2p1uRrV4
         uXq5okPeuyRZ3B811PYr1CRfWIDiDc7DBDWertx3aIV2XVxKDLGVwrNtL4u2c0sOuBwZ
         SYLA==
X-Forwarded-Encrypted: i=1; AJvYcCVqi/rgTbYmEEOIx0GcOCcSGVA1TpKaUq6AWt6AjlQ1tHKubLHdK2D134zU9YdR7MWRh24QiIbKHiBND+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9FiBjZa4yMiRb/i5ZUyJ9R4pM8iJYhR7Xa4RYeBZWRGF/2QW
	mSCsm/0X688Y/miyaTllqPD0O9BMwiEIal1lJfDWVNSjacEz4iEvBjA/c6yoYojgYjU5t2QO1fm
	w897b+C7Ke2fudO57jcDuiteUtO5PjZ6Bqm8H
X-Google-Smtp-Source: AGHT+IF6zuOiLd59PhgXMw7DIzWOXXJgSyWEMApRca5NNJBgSiWPw2nrOVmoTfB+YfDfuvrwx/fLLRPvbmafo2m8vg4=
X-Received: by 2002:adf:fc88:0:b0:37d:374f:b0a7 with SMTP id
 ffacd0b85a97d-37d3aa4613dmr1323925f8f.34.1728473571568; Wed, 09 Oct 2024
 04:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
 <CAK7LNAQ2EY8Uf1APvhZT9XpZ6=8FhAitqePLiCP1S6mBgnXSKQ@mail.gmail.com>
 <CAH5fLgiZ5awKAm-CHc8qgsQUYtNMWdSEeKC2wuDFh2NUhVmsAA@mail.gmail.com> <CAK7LNAS_22jQzsWDswChAMaE3GhT-1eqE9ngj61NeFz40SNxGw@mail.gmail.com>
In-Reply-To: <CAK7LNAS_22jQzsWDswChAMaE3GhT-1eqE9ngj61NeFz40SNxGw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Oct 2024 13:32:38 +0200
Message-ID: <CAH5fLgh9t7=1sTwWWJHLtDxaaZYZAjLC8h_jVvC809hpqJz07g@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 12:32=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Oct 9, 2024 at 4:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
> >
> > On Tue, Oct 8, 2024 at 9:00=E2=80=AFPM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> > >
> > > On Wed, Oct 9, 2024 at 2:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.c=
om> wrote:
> > > > diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> > > > index 057305eae85c..08d5b7177ea8 100644
> > > > --- a/scripts/Makefile.compiler
> > > > +++ b/scripts/Makefile.compiler
> > > > @@ -21,6 +21,7 @@ TMPOUT =3D $(if $(KBUILD_EXTMOD),$(firstword $(KB=
UILD_EXTMOD))/).tmp_$$$$
> > > >  # automatically cleaned up.
> > > >  try-run =3D $(shell set -e;              \
> > > >         TMP=3D$(TMPOUT)/tmp;              \
> > > > +       export RUSTC_BOOTSTRAP=3D1;       \
> > >
> > >
> > > try-run is not Rust-specific.
> > >
> > > Is there any reason why you did not add it
> > > to __rustc-option?
> > >
> > >
> > > __rustc-option =3D $(call try-run,\
> > >        RUSTC_BOOTSTRAP=3D1 $(1) $(2) $(3) --crate-type=3Drlib
> > > $(srctree)/rust/probe.rs --out-dir=3D$$TMP,$(3),$(4))
> >
> > I had an explanation for this in the commit message, but it looks like
> > it got lost when I rewrote it for v2. Anyway, the reason is that I'd
> > have to modify both __rustc-option and rustc-option-yn to do that, and
> > putting it here seemed more future-proof against making the same
> > mistake in any rustc-* commands added in the future.
>
>
> One solution is to delete rustc-option-yn since there are no users of it.
>
> Another solution is to refactor the code.
>
> Either way, there is no good reason for code duplication.
>
>
> If you keep rustc-option-yn, you can rebased v3 on top of this patch:
> https://lore.kernel.org/lkml/20241009102821.2675718-1-masahiroy@kernel.or=
g/T/#u

I'll rebase on top of that. If we choose to delete rustc-option-yn
then I think we should first merge the refactor and then delete it in
a follow-up. That way, when someone does need it, they will find the
refactored implementation in the git history.

Alice

