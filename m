Return-Path: <linux-kbuild+bounces-2434-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2D992B468
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 11:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91C0B281270
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 09:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8B8155A56;
	Tue,  9 Jul 2024 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yyb5N2ir"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4DC15539D
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jul 2024 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720518705; cv=none; b=SmvvJD2vDupt13NQnBWAiYFuOObNX+lUhDms8V2AHWs0rvEGhljEc/hRq5jaZJ1+4h0o8VY3Eq1/bpJq78mgoQdHu1F3yZRjYxJe5Cu/x+GP5A1C2aRWIRSHUqpK6Bb2BlidU8lHud1WSa0tyAEjUuyzBSqaMWXPKk251DUxQu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720518705; c=relaxed/simple;
	bh=4XuEKNFSFuGP1kN6L/yXHwpYHIvQcGA6Ng+fKkoMgZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drm0WrIZSy/CV8r7Q9VSThCHdoSk/1dPJNnMYiQl2xunDVF6ewXgxYCSTvFpI6LYf9i/pGVYRju78uNTD68ITt3KDz9vbqLl5brfUzwfee9kcM5Ua8AV+cnAhY0F5brdBPc4Mp3eMVfiE7MN2qpbTBEGQayWnDVInirZZW4Mxl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yyb5N2ir; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-367a23462e6so3049905f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jul 2024 02:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720518701; x=1721123501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WX06ye1J6PdkCSj3zoT0ZMNvrT9EtWcEE/YdxpESa/0=;
        b=yyb5N2irZdWL3EoE/fIxaNNT+g4AhZsV/eqyI6APYMd0IowCK/M66I8riz3A8WhD+M
         4UrQuId8DH2+iFO8yDPIVbtMD8HPuL0CsssOgj5xTGDZv622hrZ+s/PmVakOChIK2Akc
         wOf/6KACM1FexWKMRxBZoWgJ6zewOf6IbW8GFuJLAuKtKK/7c2xF7sENofscC8/REOQ7
         uqgNF8OiX5qaTxkqYWIQZDFQVxJFSXQuccBiBtNK2lLnr4nDz25Vhc1tTyXOm/RbwSfL
         /rbphmMJqNuFa01G+LYr2QntPPTB66B8p5SI/hrKFindXOXoxNqIJsouQP4/IInMd0Yl
         7eAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720518701; x=1721123501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WX06ye1J6PdkCSj3zoT0ZMNvrT9EtWcEE/YdxpESa/0=;
        b=C2SKCDbJ9bBJuZVgljB637z/cw76qlNhURw2OVQHHbmo4yengjopLYEuk6pcO9vaeZ
         em8pRK/TYzZ9ztk342BfZFOwzjVIDXRZRbOv3rmnbsooD1Gx2Aca0bPC4NzFr2vLzO6C
         3tUvHHIyd0B/5cpdyLzDIae/y13HWuuVmoj2LUp6UIcQq4/UW2MjWJRiSHONkpb5FnTY
         o0jiGLTUdAc9ipPNu5KD8UGDBxXreVnNm+/QjoUOaTYuzrDUKyvH4chgOtOMjIb12wY2
         kG5oIJhui2XODN48mAeHBTCIENH7cEQmsJKYb2QU+fEtIVx2uSFB8Nm7Y6F5o33HmxMF
         V5hw==
X-Forwarded-Encrypted: i=1; AJvYcCU2tlXjC8HhoQRiNy5eysyfi49twioZ917SoehzM9NmRZP0CSE516I57xIDM8AvwGS3bb/M9hZ0DE1RmTtcU67SbMT51uLuSDSCLqGy
X-Gm-Message-State: AOJu0YyXPqfBUq2Ef8cvQaosj0X/9I2CktN/MhptXvuJ/MHDfBHNOfbO
	mzAX5TZ6gq9fMdWqaWbqiJb2KBAqv0hv4WxmL4eiOTLZPbAVTaeV5TTTIDNFzZWCPgVANGwZDoX
	XAOZNgdrZ1iR2fdwMd1WjwWC6QFGYwSI9WPAE
X-Google-Smtp-Source: AGHT+IEEa+ZOMuIVJB/R8kPUjfwxKMD1OHTTc3Vy0AHpNhSOsKMUU0Dz5ToEd38VyMlsqy8uUowwm6nPboz2Ks1ZR7c=
X-Received: by 2002:a5d:6da9:0:b0:367:88c2:bcfc with SMTP id
 ffacd0b85a97d-367cea46beamr1873409f8f.1.1720518701008; Tue, 09 Jul 2024
 02:51:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com>
 <20240704-shadow-call-stack-v3-2-d11c7a6ebe30@google.com> <20240704-unless-cache-8a971c244348@spud>
In-Reply-To: <20240704-unless-cache-8a971c244348@spud>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 9 Jul 2024 11:51:28 +0200
Message-ID: <CAH5fLgh850oUinnGS=1A47Es11qc9OL+Kw_6d-_Lvx7jcQmj=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: add flags for shadow call stack sanitizer
To: Conor Dooley <conor@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 7:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Thu, Jul 04, 2024 at 03:07:58PM +0000, Alice Ryhl wrote:
> > As of rustc 1.80.0, the Rust compiler supports the -Zfixed-x18 flag, so
> > we can now use Rust with the shadow call stack sanitizer.
> >
> > On older versions of Rust, it is possible to use shadow call stack by
> > passing -Ctarget-feature=3D+reserve-x18 instead of -Zfixed-x18. However=
,
> > this flag emits a warning, so this patch does not add support for that.
> >
> > Currently, the compiler thinks that the aarch64-unknown-none target
> > doesn't support -Zsanitizer=3Dshadow-call-stack, so the build will fail=
 if
> > you enable shadow call stack in non-dynamic mode. See [2] for the
> > feature request to add this. Kconfig is not configured to reject this
> > configuration because that leads to cyclic Kconfig rules.
> >
> > Link: https://github.com/rust-lang/rust/issues/121972 [1]
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  Makefile            | 1 +
> >  arch/Kconfig        | 2 +-
> >  arch/arm64/Makefile | 3 +++
> >  3 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index c11a10c8e710..4ae741601a1c 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -945,6 +945,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
> >  ifndef CONFIG_DYNAMIC_SCS
> >  CC_FLAGS_SCS :=3D -fsanitize=3Dshadow-call-stack
> >  KBUILD_CFLAGS        +=3D $(CC_FLAGS_SCS)
> > +KBUILD_RUSTFLAGS +=3D -Zsanitizer=3Dshadow-call-stack
> >  endif
> >  export CC_FLAGS_SCS
> >  endif
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 238448a9cb71..5a6e296df5e6 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -690,7 +690,7 @@ config SHADOW_CALL_STACK
> >       bool "Shadow Call Stack"
> >       depends on ARCH_SUPPORTS_SHADOW_CALL_STACK
> >       depends on DYNAMIC_FTRACE_WITH_ARGS || DYNAMIC_FTRACE_WITH_REGS |=
| !FUNCTION_GRAPH_TRACER
> > -     depends on !RUST
> > +     depends on !RUST || RUSTC_VERSION >=3D 108000
> >       depends on MMU
> >       help
> >         This option enables the compiler's Shadow Call Stack, which
>
> For these security related options, like CFI_CLANG or RANDSTRUCT, I'm
> inclined to say that RUST is actually what should grow the depends on.
> That way it'll be RUST that gets silently disabled in configs when patch
> 1 gets backported (where it is mostly useless anyway) rather than SCS
> nor will it disable SCS when someone enables RUST in their config,
> instead it'd be a conscious choice.

Okay, I'll make that change. I suspect this will also break the
Kconfig cycle mentioned in the commit message. Thanks for the
suggestion!

Alice

