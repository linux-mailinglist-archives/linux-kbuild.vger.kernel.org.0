Return-Path: <linux-kbuild+bounces-8931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A6BB94283
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 05:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FCF918A7400
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 03:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D626823AB9C;
	Tue, 23 Sep 2025 03:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="pAvVdaGa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net [178.154.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1308220C47C;
	Tue, 23 Sep 2025 03:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758599589; cv=none; b=Wl/GkMuTvlGjxzEYrIET7PzyIsyNAdJ4Z/6h5iMnJYnlVIK4hS7vQTHUgPIG53vRIlLAoa+IApgVpcLuQOSL1itIZqnPwc6+/+Vaak2WH1hYWRIkFRaWdrFX0XD9U4oCxfjx2n81JdQH64aJwjfFLayVJk0mK1eZZIJNDZA5sCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758599589; c=relaxed/simple;
	bh=1+TJfdADz+eyWxjucM1gnctJYZETTekOsnS1O0xVTmM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U1aka4fBC1x6msa9eAbRsR9VFo5CcZGptzq60UUePUDLOdzYD2/zBgtVffEEJIlw8Vur2ZnAevLTNSznrh4y02ni9INVXiw71sHn54qWOp4oj4S1s0/4qQDZJ6Mzpjeu1TuUQdwwi98g15p4oTntOzk70b4GuPudr6BqHs8J0mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=pAvVdaGa; arc=none smtp.client-ip=178.154.239.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:a982:0:640:e49f:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id 5487880784;
	Tue, 23 Sep 2025 06:47:34 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id OlN5kY2MoGk0-2FrcghgG;
	Tue, 23 Sep 2025 06:47:33 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1758599253;
	bh=J9wh+/3satZdgSBE2bEzXkS8hEmnC4EYriUYMbJYZJE=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=pAvVdaGae1ycGPMu7vAsAsEfAPBPuj3sKQAyaWPxyul1/YXNRA44FAER+GHD640W0
	 g+8+dmXbB1D9cezZ2Nc8Or3GJ7qID+MAkt+TKEXugTT4O8WA49u7IPH7+uiPmeKMx0
	 WlhAMfu3VeLQhkayyYOPOsmyKHf/i6IzElKLQFxc=
Authentication-Results: mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Tue, 23 Sep 2025 06:47:20 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, nathan@kernel.org,
 masahiroy@kernel.org, aliceryhl@google.com,
 thomas.weissschuh@linutronix.de, tamird@gmail.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH v2 1/1] rust: add `rustcheck` make target for check-only
 builds
Message-ID: <20250923064720.0b2ea467@nimda>
In-Reply-To: <20250922-demonic-raccoon-of-will-1adb52@bergen>
References: <20250915115311.3025-1-work@onurozkan.dev>
	<20250915115311.3025-2-work@onurozkan.dev>
	<20250922-demonic-raccoon-of-will-1adb52@bergen>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Sep 2025 08:02:36 +0200
Nicolas Schier <nicolas.schier@linux.dev> wrote:

> On Mon, Sep 15, 2025 at 02:53:11PM +0300, Onur =C3=96zkan wrote:
> > Adds a new `rustcheck` make target to run a check-only build
> > similar to `cargo check`. This allows us to verify that the Rust
> > sources can build without building/linking final artifacts,
> > which speeds up the iteration (a lot) during development.
> >=20
> > The target also supports the CLIPPY flag (e.g., `make LLVM=3D1
> > rustcheck CLIPPY=3D1) to run Clippy in a faster way.
> >=20
> > Also, unlike `make LLVM=3D1`, it doesn't compile large amounts of C
> > code (on a fresh checkout) when the goal is only to check that
> > Rust builds are not broken after some changes.
> >=20
> > Suggested-by: Benno Losin <lossin@kernel.org>
> > Link:
> > https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic/x/nea=
r/539103602
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev> ---
> >  Makefile      |  7 +++++
> >  rust/Makefile | 73
> > +++++++++++++++++++++++++++++++++++++++++++++++++++ 2 files
> > changed, 80 insertions(+)
> >=20
> > diff --git a/Makefile b/Makefile
> > index cf37b9407821..7812cdc72938 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1716,6 +1716,8 @@ help:
> >  	@echo  '		    is formatted, printing a diff
> > otherwise.' @echo  '  rustdoc	  - Generate Rust
> > documentation' @echo  '		    (requires kernel
> > .config)'
> > +	@echo  '  rustcheck       - Check that the Rust code
> > builds'
> > +	@echo  '                    (requires kernel .config)'
> >  	@echo  '  rusttest        - Runs the Rust tests'
> >  	@echo  '                    (requires kernel .config;
> > downloads external repos)' @echo  '  rust-analyzer	  -
> > Generate rust-project.json rust-analyzer support file' @@ -1821,6
> > +1823,11 @@ PHONY +=3D rustdoc rustdoc: prepare
> >  	$(Q)$(MAKE) $(build)=3Drust $@
> > =20
> > +# Checking Rust sources.
> > +PHONY +=3D rustcheck
> > +rustcheck: prepare0
>=20
> Why do you let rustcheck depend on prepare0 instead of prepare?
>=20

Because "prepare" does more job which isn't necessary (therefore waste
of time) for "rustcheck".

> > +	$(Q)$(MAKE) $(build)=3Drust $@
> > +
> >  # Testing target
> >  PHONY +=3D rusttest
> >  rusttest: prepare
> > diff --git a/rust/Makefile b/rust/Makefile
> > index bfa915b0e588..b45878870207 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -265,6 +265,79 @@ rusttest-kernel: $(src)/kernel/lib.rs
> > rusttestlib-ffi rusttestlib-kernel \ rusttestlib-uapi
> > rusttestlib-pin_init FORCE +$(call if_changed,rustc_test)
> > =20
> > +## Check-only compilation (similar to `cargo check`)
> > +quiet_cmd_rustc_check_library =3D $(RUSTC_OR_CLIPPY_QUIET) CHECK $<
> > +      cmd_rustc_check_library =3D \
> > +        OBJTREE=3D$(abspath $(objtree)) \
>=20
> Have you tried this?
>=20
>         OBJTREE=3D$(CURDIR) \
>=20
> or
>=20
>         OBJTREE=3D$(abs_output) \
>=20
> I'd favor using one of these instead.
>=20

I don't have a strong opinion on any of them. I followed the existing
approach from the other use cases used in the same file.

Regards,
Onur

