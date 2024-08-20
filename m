Return-Path: <linux-kbuild+bounces-3113-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 138E6958ADC
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 17:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 480DAB23681
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 15:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872D3191F7E;
	Tue, 20 Aug 2024 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cRAQVplP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047AD191F6C
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724166860; cv=none; b=ubkdsH7WcFlKSWwi1UwTwe++R19yXAGL1xXXzzOuUM7SPv+auF7w89LMNICsb2ylV3jrFmuJ5LJJ6KJbe+5btCPh1bQbjohUYcD4j1Ig4Wi7fM8kXGsrcVu4suaIe5XqfspLC1UUaz3xlATXqTCQUjudOF4QOdBoJ3t05vV5wYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724166860; c=relaxed/simple;
	bh=832L9RAL1FMXwX98A3L0bhT3XoHmndT7GcmEs0XolO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8VSop3zKsb34YD2g2Zl4VlQ5WKScLse1K3A4iAKVIoZslS+TYTEgFomnCYdsczGA/GtwiXoqPHKvoFswIZxVNDjR7nKs01Embsv/ANYcP9HZZUhAvNA9KyvK0T2Hdw+9J5q8QeQzFKDRzrwkb/SQmdQsuskAGsRh6wSigqOtSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cRAQVplP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7141b04e7b5so262401b3a.2
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 08:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724166858; x=1724771658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpstZLxLvvCxhJ98XGrC+vpfpfqpgjo/Q8CsUGqUwLs=;
        b=cRAQVplPzEWe7ZNgHXSaudI43YJgUXGdjacV1nXDaUtrUMuP6zIi96TqyumH2g1kRc
         EeM3lCGG7XkYFisqClTR27imFxIBonmvhUexuGiR5PFqMlYnm55aTOmqh/rMcIo1lOqS
         ehK8xMJfJwaWlHk166GMj+a4a/SK/g22Lvxigz3RtaQR3+G5rDCy8v4ks9SNBwpYXQl/
         enbpTQzGxZqOfApCJMg4IZulm1lpOxt0ajLww1e76SOkV92VEFHFaZopjbZKT+3qwSF1
         6TZ6bkPnmtTekUqoylL1vzm9J4ADysbV6UvXYxKpt85hdT6QhMY+Z/Id58XrouRU2EyU
         2R6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724166858; x=1724771658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpstZLxLvvCxhJ98XGrC+vpfpfqpgjo/Q8CsUGqUwLs=;
        b=UAi7dCvTW30TDABgq0W8eex+oTwy/eDEJgYC4tTdDrxcpWyTaEa4uP0WP4dcQqQeHu
         g5eCeunt7mFAUMtHtDWpeb9boYQXRZF7/Zj3qR1usW9WpoUNQDKHSB16Uvvdt0KpDaxL
         7iQYv0EHG3OCGgXCrNJg2BtKa/2S4pWe/VkuWogDOSJusq20IpGk3eROfLDUC3d7u3Xj
         RqyPxr2fRmM4B+PQ9RuonN75IX1xyQ97+dM9+emNF4NR0llH/Q1GEyy2PPcU7VZG9p6N
         gjiIDDzkRX0h4AXgkbnWMXZWrgftn6mMl8+K1/ttT8GQkGvFTl9X54LSXoVIl6tvyGzt
         3AgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb/NsXDIyBKHI5ta/z2ZovDKh6TuYg6rQgybYcP2D+UBzETGaegPKeyw+mkn1NS8uTHCmwwZOlTgWtndA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBB80/WpnRo97S81y1/8ylKd9001C6MgW0dqXpCPOyzUqzot2q
	SCLePs0KvmrKtNvU/R8S5O2onT0oCuLi9B6bmi0bBAfQUJOIFpvkVK5oMdjn6CyuOekVzuoxl2d
	LMWzA4xVgXN5qrpFSKlSRBIYK3SBzUooysv/b
X-Google-Smtp-Source: AGHT+IHIbq54w/gJ26ek/JkmDP2J2YfGIU9c5HYcM5Rn3TkyC0U4tJbcw3J6LNUFOQjWKYDux11Qj3/qzxtUKBF/NN4=
X-Received: by 2002:a05:6a00:cd1:b0:714:1ac3:3f49 with SMTP id
 d2e1a72fcca58-7141ac357d2mr1100989b3a.3.1724166857750; Tue, 20 Aug 2024
 08:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806-shadow-call-stack-v5-1-26dccb829154@google.com> <20240820143503.GD28338@willie-the-truck>
In-Reply-To: <20240820143503.GD28338@willie-the-truck>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 20 Aug 2024 17:13:58 +0200
Message-ID: <CAH5fLggN+A2RawC-cpmSUHxYm=xz=1EDpMUv5C803hj37re1qA@mail.gmail.com>
Subject: Re: [PATCH v5] rust: support for shadow call stack sanitizer
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 4:35=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Aug 06, 2024 at 10:01:44AM +0000, Alice Ryhl wrote:
> > This patch adds all of the flags that are needed to support the shadow
> > call stack (SCS) sanitizer with Rust, and updates Kconfig to allow
> > configurations that work.
>
> Minor nit, but some folks have allergic reactions to "This patch".
> See:
>
> https://docs.kernel.org/process/submitting-patches.html#describe-your-cha=
nges
>
> I think the commit message is much better now, though, so thank you for
> adding so much more detail for v5. If you end up respinning anyway, you
> could move this all to the imperative.

Ah, yeah, I keep forgetting about this. I'll change it to imperative
if I send another version.

> >  Makefile            | 1 +
> >  arch/arm64/Makefile | 3 +++
> >  init/Kconfig        | 2 +-
> >  3 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 44c02a6f60a1..eb01a26d8354 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -927,6 +927,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
> >  ifndef CONFIG_DYNAMIC_SCS
> >  CC_FLAGS_SCS :=3D -fsanitize=3Dshadow-call-stack
> >  KBUILD_CFLAGS        +=3D $(CC_FLAGS_SCS)
> > +KBUILD_RUSTFLAGS +=3D -Zsanitizer=3Dshadow-call-stack
> >  endif
> >  export CC_FLAGS_SCS
> >  endif
> > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > index f6bc3da1ef11..b058c4803efb 100644
> > --- a/arch/arm64/Makefile
> > +++ b/arch/arm64/Makefile
> > @@ -57,9 +57,11 @@ KBUILD_AFLAGS      +=3D $(call cc-option,-mabi=3Dlp6=
4)
> >  ifneq ($(CONFIG_UNWIND_TABLES),y)
> >  KBUILD_CFLAGS        +=3D -fno-asynchronous-unwind-tables -fno-unwind-=
tables
> >  KBUILD_AFLAGS        +=3D -fno-asynchronous-unwind-tables -fno-unwind-=
tables
> > +KBUILD_RUSTFLAGS +=3D -Cforce-unwind-tables=3Dn
> >  else
> >  KBUILD_CFLAGS        +=3D -fasynchronous-unwind-tables
> >  KBUILD_AFLAGS        +=3D -fasynchronous-unwind-tables
> > +KBUILD_RUSTFLAGS +=3D -Cforce-unwind-tables=3Dy -Zuse-sync-unwind=3Dn
> >  endif
> >
> >  ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
> > @@ -114,6 +116,7 @@ endif
> >
> >  ifeq ($(CONFIG_SHADOW_CALL_STACK), y)
> >  KBUILD_CFLAGS        +=3D -ffixed-x18
> > +KBUILD_RUSTFLAGS +=3D -Zfixed-x18
> >  endif
> >
> >  ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
> > diff --git a/init/Kconfig b/init/Kconfig
> > index fe76c5d0a72e..d857f6f90885 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1909,7 +1909,7 @@ config RUST
> >       depends on !MODVERSIONS
> >       depends on !GCC_PLUGINS
> >       depends on !RANDSTRUCT
> > -     depends on !SHADOW_CALL_STACK
> > +     depends on !SHADOW_CALL_STACK || RUSTC_VERSION >=3D 108000 && UNW=
IND_PATCH_PAC_INTO_SCS
>
> Sorry, I didn't spot this in v4, but since UNWIND_PATCH_PAC_INTO_SCS is
> specific to arm64 and the only other architecture selecting
> ARCH_SUPPORTS_SHADOW_CALL_STACK is riscv, I can't help but feel it would
> be cleaner to move this logic into the arch code selecting HAVE_RUST.
>
> That is, it's up to the architecture to make sure that it has whatever
> it needs for SCS to work with Rust if it claims to support Rust.
>
> What do you think?

The `select RUST if ...` is going to get really complicated if we
apply that rule in general. Having options here allows us to split
them across several `depends on` clauses. I'm not sure it will even
work, I had issues with cyclic Kconfig errors previously. I also don't
think it's unreasonable for the architecture to say it supports both
options when it really does support both; they are just mutually
exclusive. I also think there is value in having all of the options
that Rust doesn't work with in one place.

So I'd like to keep it as-is.

Alice

