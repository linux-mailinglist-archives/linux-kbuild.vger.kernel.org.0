Return-Path: <linux-kbuild+bounces-2831-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF7D948B90
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 10:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEFA2B228DF
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 08:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18746679E5;
	Tue,  6 Aug 2024 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A8tlEsTx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87516BE17
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722934023; cv=none; b=HKH6VDt1i8Sn+MuexngNE3vcfrLWbNsfMQEGSUjUrk1o2hUox+LjI1id346E/YW22vomwS90tLE1DRxgGCOSrrbgBs3JucU4OsEjCac8KwZohmwDQctdlg7SMMPeNDvatd4q1ck1JQoejIzAUWuq+GgIk4E+CYN1Ei+TVhgetME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722934023; c=relaxed/simple;
	bh=sn8s/hhGM9RCw6roGgyj8qDb3fdbkX/VO1/nAR5WzA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+tFu1kb/nGu8M3avnajc9N5pAsKTyZWCn6vxe50LzVXx8gp8eV1+FX96Q7poYdHLKe8YP97fSjrGnNc1aBp9szFm1K+gFJg6GPEDE5q4z927C6ixB2Co2fjIwMc0+tM+9IWC0mxjzC9QUcytE18D2KwpjJU6h81xOAtjKNFGhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A8tlEsTx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3684e8220f9so295968f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2024 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722934019; x=1723538819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUsCFOHNeQ648HXfhA+4dUNRAwaFI7wtB1jixg+a1Es=;
        b=A8tlEsTxnHmcNcwPxMjgD7DD33wjMLgDZMQ57v4YJqyEhJX1N2WzLrXse3iV7EOJbH
         yDvMj4Xt38YghOYYKk+EJSf4HsTfm2wKjyOnbmeksfuMq4TW/X97EY8xw3im5SsYpBy3
         P+EGyveUZnxwEqwXlyhBUvchEzfA21jBU0ntvnS9GRgYsXHb5sCOO8nSlwtJsY50rTV7
         LUh4RcNSU/6c6cGfbR0n540odt21mhUlueKeSoRTS4ZYFv86Pi8gz9J5WtEvu1OMGAuA
         7BuA7VW+cdNHmIKRIyjTZwPItq/Lov5Hxmb6a9+zL/Cg4P427EU745iCHJlghSmTKbbA
         5zzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722934019; x=1723538819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUsCFOHNeQ648HXfhA+4dUNRAwaFI7wtB1jixg+a1Es=;
        b=Ld49lLhZ6x2jfYC31+tlM4VewlQho5WnGCTEY9TwI3Vxp4QqSiDMUlqrXlsjqBqKLV
         5+KdjmFrMeeZ9y1cef+bC4MBHljYZWduPqmFGXxvYRFAUxsYHXySveU2Wg1dbc/3BjJj
         xm/ScszI+yciXsDzQCt6p8NZOS+kIGmcEQNFxBsmh08IgDucoRwyR2XQlZ5PdW4T18z/
         PaPPH3PBEHuFiLV0897ME/sIS2BE00KtNVowHh2RCPLSTHCFlGePar7ZwfLbd/cW8DFP
         9sTtBe1BzInhXwEenMOWfOLuNUpXEbiPuKrQNg8r7nCJRCeKR3xCHE7m56Vo5MqA1K6F
         t1hw==
X-Forwarded-Encrypted: i=1; AJvYcCVAZcNmbGiB/nPe95c93hBvGOFB8RQtL+CSHXBcrMRc5gRUmVP0erJTxUmoddUkz+yWUjXVqDLYFBvrMOO29Qifd9mP6mcmfVsGzLGB
X-Gm-Message-State: AOJu0YzQ7bCdxy/iPNMdWlnkAlAfOQ+bjP5V/iJqyUUlqBT9HlbHx0q1
	UT0ONyQaZrjL6KVLRLlhWTMCgdK3nbfQav8IDV9tV5LALXnG9tIfMskJ9plp5aos0AmbcXOs6Du
	wZeZa3GMYEsVAawyWw4uj8QKp1ycXWfVj1gvZ
X-Google-Smtp-Source: AGHT+IEDGBOyTK8qZKnG9L1LD2Vk6xGInwP+MSUtNv88v/GVDYe2o7PhNnFmHzOPtz6NvSausD4c5Xy9d/8U5nThMEY=
X-Received: by 2002:a5d:63c6:0:b0:367:8fee:4434 with SMTP id
 ffacd0b85a97d-36bbbe58c9amr9941155f8f.16.1722934018478; Tue, 06 Aug 2024
 01:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729-shadow-call-stack-v4-0-2a664b082ea4@google.com>
 <20240729-shadow-call-stack-v4-2-2a664b082ea4@google.com> <20240805171340.GC10196@willie-the-truck>
In-Reply-To: <20240805171340.GC10196@willie-the-truck>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 6 Aug 2024 10:46:46 +0200
Message-ID: <CAH5fLgiudJsmBvdZ0SLESncmVeh+j1WtCaxFGk8ZKneJpznRiA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] rust: support for shadow call stack sanitizer
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

On Mon, Aug 5, 2024 at 7:13=E2=80=AFPM Will Deacon <will@kernel.org> wrote:
>
> Hi Alice,
>
> Just some minor comments on this:
>
> On Mon, Jul 29, 2024 at 02:22:50PM +0000, Alice Ryhl wrote:
> > To use the shadow call stack sanitizer, you must pass special flags:
> >
> > * On arm64, you must pass -ffixed-x18 to your compiler.
> > * On riscv, you must pass --no-relax-gp to your linker.
>
> Since this patch doesn't touch riscv, I think you can just talk about
> arm64 in the commit message.

On the previous version, I was asked whether the patch should be
modified to only allow the configuration on arm64, since there were no
changes in the patch to support riscv. This part was added to justify
why the patch doesn't need to be arm64-specific. I will reword to make
it more clear why I am mentioning riscv.

> > These requirements also apply to Rust code. When using Rust on arm64,
> > you must pass the -Zfixed-x18 flag to rustc, which has the same effect
> > as the -ffixed-x18 flag does for C code. The -Zfixed-x18 flag requires
> > rustc version 1.80.0 or greater.
> >
> > There is no need to pass any flags to rustc on riscv as only the linker
> > requires additional flags on this platform.
> >
> > On older versions of Rust, it is still possible to use shadow call stac=
k
> > by passing -Ctarget-feature=3D+reserve-x18 instead of -Zfixed-x18.
> > However, this flag emits a warning during the build, so this patch does
> > not add support for using it.
> >
> > Currently, the compiler thinks that the aarch64-unknown-none target
>
> "Currently" will probably age badly -- can you talk about a compiler
> version instead (e.g. "prior to version nnn, the compiler thinks...").

I will reword, but unfortunately I don't have a version number I can
put as it's still unfixed. (But we are actively working on it!)

> > doesn't support -Zsanitizer=3Dshadow-call-stack, so the build will fail=
 if
> > you enable shadow call stack in non-dynamic mode. See [1] for the
> > relevant feature request. To avoid this compilation failure, Kconfig is
> > set up to reject such configurations.
> >
> > The `depends on` clause is placed on `config RUST` to avoid a situation
> > where enabling Rust silently turns off the sanitizer. Instead, turning
> > on the sanitizer results in Rust being disabled. We generally do not
> > want changes to CONFIG_RUST to result in any mitigations being changed
> > or turned off.
> >
> > Link: https://github.com/rust-lang/rust/issues/121972 [1]
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  Makefile            | 1 +
> >  arch/arm64/Makefile | 3 +++
> >  init/Kconfig        | 2 +-
> >  3 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 2b5f9f098b6f..66daca7a9b57 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -928,6 +928,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
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
>
> These unwind entries aren't mentioned at all in the commit message.
> Please can you explain what you're doing here? I guess it's something to
> do with the PAC patching? Maybe this hunk would be better as a separate
> patch?

It's because the PAC patching uses the unwind tables to find the
relevant places to patch. I will explain why in the commit message. If
you still think it needs to be separate after I add an explanation,
please let me know on the next version, which I will submit shortly.

Alice

