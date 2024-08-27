Return-Path: <linux-kbuild+bounces-3233-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD37B9608D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 13:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 690021F23CA1
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 11:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABF119FA96;
	Tue, 27 Aug 2024 11:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S0tZRJpa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D081E19DF82
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Aug 2024 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758617; cv=none; b=jnJd9f96RiPwsJdR/64JifUm9qOAlhowYDVZIF0OMbr41pTV1C7UoR5qsnFTNd1428/mQ/ypSfLOzzZzTOPKrVFMvaFpGwhdmJBJI7PCCyxNUWPH7N/U2y+KZfoA4bFP4WGCqvEoiPrT6CGSNXx/UCeE9fk1o5bWu34rBhCulig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758617; c=relaxed/simple;
	bh=IRbk4XlXS9AL1SVPnwuRZB64g4tDHR/DIdnqSuKhoPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mj5wJnppYmrxaKzqHil9CtnmWiw55EYw3/TpWc6qF+YNtWX0aSaj3VomNCOHO4tw2zy12ZUPMcV1EiNGQvf9u+Vu4eJwRbLPwY5AVLk67d0zRFakhey5dFZl9UUwdif7P92Ax0Zr7Dgc5SDSJH/kwK22JZM8kA7p6z4ws+w9fL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S0tZRJpa; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-371aa511609so2706016f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Aug 2024 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724758614; x=1725363414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiKQkX9JXAm55mwNI4zYxY4asKveYVGU+Q+n1G5Ueug=;
        b=S0tZRJpad7dacAWNhk7IbSgkKrz9I4QXzh1O1oAAdI/kj3Kz9hRbuLHPCG7QNa+OL3
         PnXJNxUYcyaVcGw95CrNrDQD6G6LyQtWtlUL6sf1zUqYLGVT5G8MPZSfsPAdnaibigm4
         tR3BaiyvSRxhDPQ+dDpJR4I/pOzOHrUrFRZjKZJWPdGg7A3JI7DsoYXP0IJKTfC5DMp1
         vHzlGcWLcNauHr5GG7OUIH82r5+0vLRLmVM9oKNF/kuq2Ii89KNRBy+4CEKDprLMY4R6
         8NUFgIO1STeIHZ9QAR7NDBBB2o+rIJoDDjk1+kU0C2XY3IQ6o7pMjtnvBaOtS1hTajl8
         RClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724758614; x=1725363414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiKQkX9JXAm55mwNI4zYxY4asKveYVGU+Q+n1G5Ueug=;
        b=sxbFXFq7tyJ2vsrlpT9EFhNnMrBnCrJc6/ALypnwrhEMgGc2VPer4DQf8FGl7doJnB
         CnFgA9lT/liv7UXDkBiyilV5i3UYDWN7yMfDEgayOIawF5k79h2b7amXCl+CZnn87ZD+
         fHF0WvAIAf5qNPWrMgmYrlU9BuGPHtB+nlJ8aGMXmfElx/upS1XbDGGSwqBfj+6XlEgk
         qOVlWSYSBH4GRPsFlOZpQoN8UO+NbyMI4FSrjhly433HpfN8nwiV29StMPnDkk9iFRhl
         ZhGHVDSBzAiWW0zZsyCLzu5z7mhLl006ft53yXCS7VviK0FlZaX+D3VDqe5SkI5Ec9qh
         dqEg==
X-Forwarded-Encrypted: i=1; AJvYcCW0OS1ekfw3pz/vu8AKlHlEu0JBCEcb/t6dBGJQ4rTpTGKoWyvvzTdUeUD2iJoCiHZrKzOs87zJ7Yo3RmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YywPT9Ty8s3eWiiLN4I/AMXFHcTZM0q2+h15XHTfvhf/yzyv4dk
	m7vTvROA50cpCEAXpIZwLfNlBIAJbi8TRbAsm8+mEZP/AJ5VnYC34BOcApJqpcFSW66gY4TYchU
	IH7e2QY9HFgMjXFRA8/52u0gml2WYQ/VZ0N46
X-Google-Smtp-Source: AGHT+IHLB2RvAn3JqickjtZcl5YzVN33cRXUCK4PAl1Gfw449IAMUegRjNOP1+0UnRKyCCQgoiHkiFDo9yZOJt1ijW8=
X-Received: by 2002:adf:fe86:0:b0:371:7c68:32e6 with SMTP id
 ffacd0b85a97d-3748c7c78demr1625380f8f.4.1724758613879; Tue, 27 Aug 2024
 04:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806-shadow-call-stack-v5-1-26dccb829154@google.com>
 <20240820143503.GD28338@willie-the-truck> <CAH5fLggN+A2RawC-cpmSUHxYm=xz=1EDpMUv5C803hj37re1qA@mail.gmail.com>
 <20240823122423.GB32110@willie-the-truck> <CAH5fLgh6ywHeFSwbnaOu-QYrt_Jytv_y3zb1QbJzK-w4kQ617w@mail.gmail.com>
 <20240823125739.GA32156@willie-the-truck> <CAH5fLgiCr3hOEX1yaqy66OMsbPTtEhA4FCmRiw20zY64vYKHPw@mail.gmail.com>
 <20240823132133.GC32156@willie-the-truck>
In-Reply-To: <20240823132133.GC32156@willie-the-truck>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 27 Aug 2024 13:36:41 +0200
Message-ID: <CAH5fLgjjnDZG2BBApmiss43+gOs85xjJM9DP8RLO+y+UXm1cOg@mail.gmail.com>
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

On Fri, Aug 23, 2024 at 3:21=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Fri, Aug 23, 2024 at 03:09:40PM +0200, Alice Ryhl wrote:
> > On Fri, Aug 23, 2024 at 2:57=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Fri, Aug 23, 2024 at 02:38:20PM +0200, Alice Ryhl wrote:
> > > > On Fri, Aug 23, 2024 at 2:24=E2=80=AFPM Will Deacon <will@kernel.or=
g> wrote:
> > > > >
> > > > > On Tue, Aug 20, 2024 at 05:13:58PM +0200, Alice Ryhl wrote:
> > > > > > On Tue, Aug 20, 2024 at 4:35=E2=80=AFPM Will Deacon <will@kerne=
l.org> wrote:
> > > > > > > On Tue, Aug 06, 2024 at 10:01:44AM +0000, Alice Ryhl wrote:
> > > > > > > > diff --git a/init/Kconfig b/init/Kconfig
> > > > > > > > index fe76c5d0a72e..d857f6f90885 100644
> > > > > > > > --- a/init/Kconfig
> > > > > > > > +++ b/init/Kconfig
> > > > > > > > @@ -1909,7 +1909,7 @@ config RUST
> > > > > > > >       depends on !MODVERSIONS
> > > > > > > >       depends on !GCC_PLUGINS
> > > > > > > >       depends on !RANDSTRUCT
> > > > > > > > -     depends on !SHADOW_CALL_STACK
> > > > > > > > +     depends on !SHADOW_CALL_STACK || RUSTC_VERSION >=3D 1=
08000 && UNWIND_PATCH_PAC_INTO_SCS
> > > > > > >
> > > > > > > Sorry, I didn't spot this in v4, but since UNWIND_PATCH_PAC_I=
NTO_SCS is
> > > > > > > specific to arm64 and the only other architecture selecting
> > > > > > > ARCH_SUPPORTS_SHADOW_CALL_STACK is riscv, I can't help but fe=
el it would
> > > > > > > be cleaner to move this logic into the arch code selecting HA=
VE_RUST.
> > > > > > >
> > > > > > > That is, it's up to the architecture to make sure that it has=
 whatever
> > > > > > > it needs for SCS to work with Rust if it claims to support Ru=
st.
> > > > > > >
> > > > > > > What do you think?
> > > > > >
> > > > > > The `select RUST if ...` is going to get really complicated if =
we
> > > > > > apply that rule in general. Having options here allows us to sp=
lit
> > > > > > them across several `depends on` clauses. I'm not sure it will =
even
> > > > > > work, I had issues with cyclic Kconfig errors previously. I als=
o don't
> > > > > > think it's unreasonable for the architecture to say it supports=
 both
> > > > > > options when it really does support both; they are just mutuall=
y
> > > > > > exclusive. I also think there is value in having all of the opt=
ions
> > > > > > that Rust doesn't work with in one place.
> > > > >
> > > > > I'm not sure I follow why this will get really complicated. Isn't=
 it as
> > > > > straightforward as the diff below, or did I miss something?
> > > >
> > > > Hmm. I tried this but I wasn't able to enable Rust with this setup.
> > > > Even though the deps of RUSTC_SUPPORTS_ARM64 are ok, it doesn't see=
m
> > > > to be enabled and I can't find it in menuconfig. I think we need to
> > > > have a `select RUSTC_SUPPORTS_ARM64` somewhere.
> > >
> > > Sorry, yes, my diff was a little half-arsed:
> > >
> > > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > > > index a2f8ff354ca6..2f5702cb9dac 100644
> > > > > --- a/arch/arm64/Kconfig
> > > > > +++ b/arch/arm64/Kconfig
> > > > > @@ -231,7 +231,7 @@ config ARM64
> > > > >         select HAVE_FUNCTION_ARG_ACCESS_API
> > > > >         select MMU_GATHER_RCU_TABLE_FREE
> > > > >         select HAVE_RSEQ
> > > > > -       select HAVE_RUST if CPU_LITTLE_ENDIAN
> > > > > +       select HAVE_RUST if RUSTC_SUPPORTS_ARM64
> > > > >         select HAVE_STACKPROTECTOR
> > > > >         select HAVE_SYSCALL_TRACEPOINTS
> > > > >         select HAVE_KPROBES
> > > > > @@ -265,6 +265,11 @@ config ARM64
> > > > >         help
> > > > >           ARM 64-bit (AArch64) Linux support.
> > > > >
> > > > > +config RUSTC_SUPPORTS_ARM64
> > > > > +       bool
> > >
> > > This line ^^^ should be 'def_bool y'.
> >
> > Ah, I see, I guess I learned something today. It also seems to work if
> > I add `default y`.
> >
> > I can change it if you think this is better. I still think there's
> > some value in having everything in one place, but it's not a big deal.
> > Either way, it should be temporary for a few kernel releases as we'll
> > eventually only support compiler versions where this works.
>
> I do like moving the reference to UNWIND_PATCH_PAC_INTO_SCS into the
> arch code, so if you could respin along these lines then that would be
> great.

Done, see:
https://lore.kernel.org/all/20240826-shadow-call-stack-v6-1-495a7e3eb0ef@go=
ogle.com/

I took the opportunity to incorporate new developments in rustc
changes into the Kconfig rules.

Alice

