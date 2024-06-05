Return-Path: <linux-kbuild+bounces-2008-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA7F8FD498
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 19:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C69791F2141A
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 17:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FBE195380;
	Wed,  5 Jun 2024 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0dwlGsg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DAA1A291;
	Wed,  5 Jun 2024 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610390; cv=none; b=C/TPo5kxFN7lBow6b0vjJcrSP6A407oQJoFLTg3b5wjU/zXHr9OK9+wu2LvVHklPkKu3hjtXvmoKmCTiEVPgyi+kM0pd6VOYiRZaHRdLJmF1nVdsV+y3eKQwJGlGjh1Ke5vQ90Kb7SL4Ms1IF7O/Md9SUaEF2yMFPdCUOK9cqEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610390; c=relaxed/simple;
	bh=yw1xSaxn6SgH1smEJJVuV2PYZu8dfMQrURfJ9oM9Uw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMcLg/Gn3sqN3s3CjTH+Xt7ayTifJ0CPz73cVx7FdPS/oRTVqjyP68Tfr/p7m1ZioQUbbkdx51UxUcUywlTlGo0OrNpx4qXsyf4RoPKwDIW+8RtkFTtbl7B/qOT3H96CZs7nGaV6FbQAKJrxwFcwBYssvRQd4yDq1jRPxbhQvlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0dwlGsg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384DEC4AF14;
	Wed,  5 Jun 2024 17:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717610390;
	bh=yw1xSaxn6SgH1smEJJVuV2PYZu8dfMQrURfJ9oM9Uw4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g0dwlGsgP0RR33Xs1FRfDlQdXQ80HHsGV9fi89xOToyKjifhEB2XNqE2zJ0PKnq1o
	 TTfrY8IGrAinvQzVHqYIh9OC4XrlHB394ar51+IydvSV6VcAUtRfaL1KYkMgWQA+Zi
	 77AlIof90PBZqrHU1JO4UYdiBhC4+AhjhhqWWGWBJysWp++wXIjMiHwvQw/DQSxIc6
	 iotfxeKJBJniLVdy8Mri15mfZ5k9+O+ADb7eHqzy5AgdSsXB5pI2+0CAX2lbhpEiEs
	 RyBCS4EgD24lGQUBNMBpttirmeQw14rrRReRedjyfj7YxhsbPQX/3+ycxEb65sB5y3
	 3VFaGxRpylD6g==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eaa80cb550so1463651fa.0;
        Wed, 05 Jun 2024 10:59:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHlKNuQOh9be2duawM1mj5wgnOEYNY300o7DpTfTCi+IQDzjkK8Sv5jMfWA+/hBVb5OedqK+exHA2U5oh5d+lhckPXJ38pJAzbNnJc12Fk0BhuOwgFzThH4gL308ewtzVYaGSBU/jojrJRD2zfOfeY56HA6dOzMSxvxYMlSLtxwjSlMPw7rRjRlqv7S5xGIg4UCjg7mrgfGDZVXU7NuG+emWeAN1Q=
X-Gm-Message-State: AOJu0Yz8vXPQSYYBdcEIgvuM+QNvGknztpeXxtNm+4xx3gciYR8K1mky
	rb1FrS35Fm1NDX0C3z4ZcDpE13l5xIrF7Fwd3wDuUZrPdBm9AKfb/lxyAjhaIbo2DozWSthS+48
	6s0TjMCyktb7RGIzPrjn3QAuKQUE=
X-Google-Smtp-Source: AGHT+IFwBnLbnAG8I3smJgMOrt7te2f6atLyRhMLLdUqm6LmCqUyYx2JWPcNd6bDR47zihsBK0o3CdEIxKpfBWUbCug=
X-Received: by 2002:a2e:3509:0:b0:2ea:8d54:4530 with SMTP id
 38308e7fff4ca-2eac7a22291mr18413131fa.28.1717610388337; Wed, 05 Jun 2024
 10:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604224052.3138504-1-davidgow@google.com> <20240605062234.GE279426@thelio-3990X>
In-Reply-To: <20240605062234.GE279426@thelio-3990X>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 5 Jun 2024 19:59:37 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHa58Zcq3extXw4VXGnpVHbd5urzCGnh_oCo-BLMxMrJQ@mail.gmail.com>
Message-ID: <CAMj1kXHa58Zcq3extXw4VXGnpVHbd5urzCGnh_oCo-BLMxMrJQ@mail.gmail.com>
Subject: Re: [PATCH] arch: um: rust: Add i386 support for Rust
To: Nathan Chancellor <nathan@kernel.org>
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <rmoar@google.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, x86@kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Jun 2024 at 08:22, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi David,
>
> Just a fly by comment on style, I don't have much to say content :)
>
> On Wed, Jun 05, 2024 at 06:40:50AM +0800, David Gow wrote:
> > At present, Rust in the kernel only supports 64-bit x86, so UML has
> > followed suit. However, it's significantly easier to support 32-bit i386
> > on UML than on bare metal, as UML does not use the -mregparm option
> > (which alters the ABI), which is not yet supported by rustc[1].
> >
> > Add support for CONFIG_RUST on um/i386, by adding a new target config to
> > generate_rust_target, and replacing various checks on CONFIG_X86_64 to
> > also probably like  support CONFIG_X86_32.
> >
> > We still use generate_rust_target, rather than a built-in rustc target,
> > in oPrder to match x86_64, provide a future place for -mregparm, and more
> > easily disable floating point instructions.
> >
> > With these changes, the KUnit tests pass with:
> > kunit.py run --make_options LLVM=1 --kconfig_add CONFIG_RUST=y
> > --kconfig_add CONFIG_64BIT=n --kconfig_add CONFIG_FORTIFY_SOURCE=n
> >
> > An earlier version of these changes was proposed on the Rust-for-Linux
> > github[2].
> >
> > [1]: https://github.com/rust-lang/rust/issues/116972
> > [2]: https://github.com/Rust-for-Linux/linux/pull/966
> >
> > Signed-off-by: David Gow <davidgow@google.com>
> ...
> > -ifdef CONFIG_X86_64
> > +ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
>
> These configurations are mutually exclusive, so would it look more
> readable to have it be:
>
>
> ifeq ($(CONFIG_X86_32)$(CONFIG_X86_64),y)
>

Or simply

ifdef CONFIG_X86

