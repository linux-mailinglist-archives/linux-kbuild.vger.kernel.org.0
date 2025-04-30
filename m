Return-Path: <linux-kbuild+bounces-6805-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6FAA50D9
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 17:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5291C1BC2A27
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 15:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF39118CBFB;
	Wed, 30 Apr 2025 15:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nXjhybv+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AF225DAFB
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028345; cv=none; b=hzqGoWIBaHk9RGMVHICM2OPmSop6wGQK/8eQMokN8Lj40VeHuC7Ca5Q7iJ3f5gvAEt81eK6t3zIUfbAC1j5uMyG+NvrloUlKsMmUsTtIwLyWT/11+idqcsCrk/S97q0BjejzupXlR+HTj9EyACCITxnk9gIbz9BSpTxjywvCHIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028345; c=relaxed/simple;
	bh=WWEGPFSEXsgTebWgjNA2jFYbHRJpo1gsdgBtlCbVGQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txos3ILQVWLxyDhSDB/nxDPLNKi5nLbOP70ds1KQLoNjtOoImbwg0DgnI0X8rmucP6JltzcmWCeONZaInILS8A7lrqHDND3ks8EJa8qeE/XEFy4ytZqMH+Q5mFTPEffmArMOPkRAkf1aBBT5bQz4iUbEoWUuyx7bObJHsEkcM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nXjhybv+; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso16143a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 08:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746028341; x=1746633141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUgz0lHIM9AvqVgwegmtWsNz7YXlDr9Kk1u0gwL4TQ8=;
        b=nXjhybv+E2A1cSVU5MLLC6b37URo5kPRWF5lSAKwp2b5iC/y5pGhF81OIeGVF+gz5R
         zENz+2GIpnYO66vlB2tkKagqxn8fG9haAJPnQOMtJMK+CIevSP42Ll46nHfl9jNk8ih+
         WCLGc3+nEl/ZxvFgmMkC6tZQYRN/3YJE8tM1NzHn9o3YXdEbzkSHNu0sasKx1p1mcSIJ
         oFrR75LWKqHk9cW+P4U+hngdALeN1EhBf7jVRYgot7Oz+17FThKp5AcazMy+PQ0/4EeL
         TKdNH640lH1bO7J6m40AdKhWmVJAq/ssRbHgz88H6H2ZgVzK0L1TqK0mQZCHI9XDbO7Z
         sJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028341; x=1746633141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUgz0lHIM9AvqVgwegmtWsNz7YXlDr9Kk1u0gwL4TQ8=;
        b=oXT8HZWVwsfTCPiGSVjjb+uWe4vy+fQa7QWRMPgdiBbIyvbyiyhYD9Av+1jKpggNUK
         W+OMXsq/26MXjCVCLQK+tY6xqCjhvG5RGmV1RdB9GHArsrsXt1B/iDI5Q2ehm67LdAL3
         FQNWX8otBlIp5dBWBKClZhPBxVugpWaZpiirtliSPyeCiH2MZXz39ON/CEfR2uY/ZCBK
         P8ypHr4oAh9/6MDS2zxQZxOPg3FFN2SPLmHdJlSQXoI1J59qbLp2AkkF+8A/tCcLGMXv
         xNU22wRPmRegoT66I4Rsysik7r5ZKMdHBlPKSpDpLiSItXMyJ5WziQn0gIdgROS9dXBi
         b+KA==
X-Forwarded-Encrypted: i=1; AJvYcCVLSAcUuI7j+AsZyraNobvYlEpq3ta2w5jLflJ+QVxYjs7EMRpEIgcJC7IE0eQ4wvaQX5HOXU3EigFddp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwldSzkbTnnGAahw5+bfiL7o3fzwNgQwHZH6uVaql6f93gAld+c
	jwkVMLni/CtXl2GLvt8Oy7X9uLsrkOFbst/7jRCLn2A3cdluDdMa2jaAwg5rXjnmm2xYQpJOr3R
	r0pWwH7xYOedPhS1iJwrCq/gL5V1Fh/JjvhTH
X-Gm-Gg: ASbGnctrDWtic4tBjrIFyaFe8h23vAsYoGu2ex7jPOVxWAhORhSlxdD1IG4lUdG3t7g
	WBPaQjffH3CWUKrFjIJH8/xESYgeW5pWiz9VNVz766u0nojIqlYsSkxiJhILIz1NWh8F6w2+96m
	q9xRcGwNIGJA4kolwugaywteQ5x64WsB4EPEeKdkn1Yspwlc30Z0xoFP1ggF+msg==
X-Google-Smtp-Source: AGHT+IFdqOHywsMBaHqXkTcGmB67EXqbMC7FqDHfbXZkAyjokug6b3F9yQT+IzlELuucqJyVURMXtid879Fh+aycpm8=
X-Received: by 2002:a05:6402:30b1:b0:5ed:f521:e06c with SMTP id
 4fb4d7f45d1cf-5f8aac01ebdmr113976a12.7.1746028341167; Wed, 30 Apr 2025
 08:52:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-rust-kcov-v1-1-b9ae94148175@google.com> <CANp29Y4o8o6gz6GbM6NhP9sJUi94q29=aa+tLc1aCk0UVpgj0w@mail.gmail.com>
In-Reply-To: <CANp29Y4o8o6gz6GbM6NhP9sJUi94q29=aa+tLc1aCk0UVpgj0w@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:52:09 -0700
X-Gm-Features: ATxdqUFfWkFt2krZSEThZVrbRM32DbyGd7csCuhOc9hU0LccEz016XDL5xHWJ3s
Message-ID: <CAGSQo01gLXKWLWcrxSytmCB4YmRnGDX++ZizTws0bEjJ1amWtA@mail.gmail.com>
Subject: Re: [PATCH] kcov: rust: add flags for KCOV with Rust
To: Aleksandr Nogikh <nogikh@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 4:55=E2=80=AFAM Aleksandr Nogikh <nogikh@google.com=
> wrote:
>
> On Wed, Apr 30, 2025 at 10:04=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Rust code is currently not instrumented properly when KCOV is enabled.
> > Thus, add the relevant flags to perform instrumentation correctly. This
> > is necessary for efficient fuzzing of Rust code.
> >
> > The sanitizer-coverage features of LLVM have existed for long enough
> > that they are available on any LLVM version supported by rustc, so we d=
o
> > not need any Kconfig feature detection.
> >
> > The coverage level is set to 3, as that is the level needed by trace-pc=
.
> >
> > Co-developed-by: Matthew Maurer <mmaurer@google.com>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Thanks!
>
> I've run syzkaller against a kernel built with the patch applied and
> the tool was able to successfully obtain coverage feedback from the
> Rust code, so
> Tested-by: Aleksandr Nogikh <nogikh@google.com>
>
> As a side note, in the resulting code coverage I also see a lot of PCs
> from rustlib, which isn't the primary target when fuzzing the kernel.
> Do you find it reasonable not to instrument rustlib with coverage
> callbacks? For C code, there do exist some exceptions for KCOV, see
> e.g. lib/Makefile.

I think filtering out `core.o` and `compiler_builtins.o` would make
sense, as those are not kernel-originals. Filtering `pin_init.o`
probably makes sense too.

`kernel.o` I think we should probably keep at least for now, because
it's kernel-created source that we'd still like proved out. In a
theoretical world where Rust has become more normalized in a decade,
we could filter it out to refocus fuzzers on driver code rather than
bindings, but right now the bindings themselves are worth fuzzing IMO.

>
> > ---
> >  scripts/Makefile.kcov | 6 ++++++
> >  scripts/Makefile.lib  | 3 +++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> > index 67e8cfe3474b7dcf7552e675cffe356788e6c3a2..ddcc3c6dc513e1988aeaf07=
b8efa106e8dffa640 100644
> > --- a/scripts/Makefile.kcov
> > +++ b/scripts/Makefile.kcov
> > @@ -3,4 +3,10 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)    +=3D -f=
sanitize-coverage=3Dtrace-pc
> >  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   +=3D -fsanitize-coverag=
e=3Dtrace-cmp
> >  kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)         +=3D -fplugin=3D$(objtr=
ee)/scripts/gcc-plugins/sancov_plugin.so
> >
> > +kcov-rflags-y                                  +=3D -Cpasses=3Dsancov-=
module
> > +kcov-rflags-y                                  +=3D -Cllvm-args=3D-san=
itizer-coverage-level=3D3
> > +kcov-rflags-y                                  +=3D -Cllvm-args=3D-san=
itizer-coverage-trace-pc
> > +kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)  +=3D -Cllvm-args=3D-san=
itizer-coverage-trace-compares
> > +
> >  export CFLAGS_KCOV :=3D $(kcov-flags-y)
> > +export RUSTFLAGS_KCOV :=3D $(kcov-rflags-y)
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 2fe73cda0bddb9dcf709d0a9ae541318d54754d2..520905f19a9b19631394cfb=
5e129effb8846d5b8 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -169,6 +169,9 @@ ifeq ($(CONFIG_KCOV),y)
> >  _c_flags +=3D $(if $(patsubst n%,, \
> >         $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-=
kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
> >         $(CFLAGS_KCOV))
> > +_rust_flags +=3D $(if $(patsubst n%,, \
> > +       $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-=
kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
> > +       $(RUSTFLAGS_KCOV))
> >  endif
> >
> >  #
> >
> > ---
> > base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> > change-id: 20250430-rust-kcov-6c74fd0f1f06
> >
> > Best regards,
> > --
> > Alice Ryhl <aliceryhl@google.com>
> >

