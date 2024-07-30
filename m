Return-Path: <linux-kbuild+bounces-2755-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9659418F0
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 18:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 552D3280FBE
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 16:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085E91A616E;
	Tue, 30 Jul 2024 16:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zF0k4au6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904211A6160
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 16:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722356821; cv=none; b=IAZgZ9oePjwL1J7oCe3TAbd9379CahHKwSpL5nPY897+2f1hbn4NbE4C8OSxsY1XULJec7PJmTXmVuT7R2EPvLQhgeFGmzZLvsRZzHDwJ6cGIsVpFaxFWO4ZWpis8r1rEtM9RNGlohqPWNi0YpP7tTi1QIxao2FlCZARGczYhj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722356821; c=relaxed/simple;
	bh=kQNK+5LQKlx1ppqQPGwujEovNpGVoQIlPYkQzQaO+Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnt6PvCoGZUzmmhI/C20tIadqE5QtH7borf92tC53TR66Ea2CO5eL4JT43t1dUnnQzJbQRFLz/vE+Pb1FAeRUVHzsF28eWZAVSoCpxooQ9h/vg2QjEicsDAY56A6cBmt7IxYNEPpVBsZOjFJ61q9Dh0Y1FODZ5Q3wyLDJIaSu+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zF0k4au6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2cd48ad7f0dso3663068a91.0
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 09:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722356820; x=1722961620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQNK+5LQKlx1ppqQPGwujEovNpGVoQIlPYkQzQaO+Kw=;
        b=zF0k4au6kLMTg4oAZefG0HNgbbRFzy6bY7c5TTCAJG2uxF+UEUx2Cis2x7EAbdKVA9
         UhyD3t35hOcHd6wmNf9VNxhSdvM0YZ6kHvDDut3aEqEVGkq4Tx/ZJwWCM5Uk0B/xhCrj
         tYGMAdDPMhxOE8P/kTjHaiOwX1VXp2JJhQ41Ih9qpcl+pWY+/9qOrUH6E5kM3ELJ5FiN
         0J/1Q0EDXMzeaBxghfL9H57/8KELw1mvqUK6Qqlc6COlujrpFn2E/tggDA+S9lMTgTa8
         zxZpz1pXe/Q7YRRldzXCUiWSsaPo5/5w7assOtYG+GJdSprzf64z6JVkKCsX3zN/YRX9
         hjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722356820; x=1722961620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQNK+5LQKlx1ppqQPGwujEovNpGVoQIlPYkQzQaO+Kw=;
        b=EvIgZ034spHiPkYIOhO27SsaerHY3jhKUsDzIWUVmp5Tg6A3KS8LhpirOATbfYsW08
         2i99VadaFzUlaHw5kegZ+cGgvXZeC3QK3RgmmOPEotIa9Qj+2iqefqREa7lRKzCmKtHI
         CRNOtGKk6b/jNVbrA3Lr2YQV4wbhhgQ6ESOirW2ts8c+HGNTH9q10s5aWDPNtkLC3qWx
         xmlxKJdGeCp+mMJFxGj3NeEFTCUcF7N/kIQi8yhvzFCQAuqnK3TAMI5luxjZDIGlWrUP
         62NEu0bUag0XZ5HzPXFgS9Y1UYDZFmkuEswngsotGoK2F+bV/JrRoanDxhKfcEzfU5EB
         YVzA==
X-Forwarded-Encrypted: i=1; AJvYcCXJtROhfhvdw6daK27ynGYCBbrRJ15deFgZknvhCyr/Ehy1pa8kkCai/ColjUy/o8D7sXKw6iaLOIE0zOuKB3yEMS8hCVc+IDpguPUc
X-Gm-Message-State: AOJu0YxXXTL7nkl1oXBd3kRdwIFXQQwxgQovX+XLXC00FVTJXMg7Jnz0
	sOsV5AZp545rdOFgKpTjfNqNC30nxcROVHJTvXr0yxerVvwZSfE6WHmwXGQevvQ2aSVCKEk1sfe
	n/24IuSPihr1qg0vY81ITU8enOZGgp8O69XtC
X-Google-Smtp-Source: AGHT+IH2bhdE3J33J4DuPGXSsf9pf6XtvNOPsEFMcSI5oGjgQnyJup7odZDVU7oJdzlUXiuC4RRVxkbmC6UonWag5XE=
X-Received: by 2002:a17:90a:ea11:b0:2c1:c648:1c50 with SMTP id
 98e67ed59e1d1-2cf7e1cb3a3mr13024532a91.17.1722356819562; Tue, 30 Jul 2024
 09:26:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-2-bbb948752a30@google.com>
 <20240730103236.GK33588@noisy.programming.kicks-ass.net> <CABCJKuf+=bxrZphtFZ+N_t2whCS0gx2GVHybTzcNmY6TX6c7cw@mail.gmail.com>
 <20240730160314.GP33588@noisy.programming.kicks-ass.net>
In-Reply-To: <20240730160314.GP33588@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 30 Jul 2024 18:26:45 +0200
Message-ID: <CAH5fLgjU87JsdwFv9umd0U3vLv=-UPiE6sf=F7B-RTujchcjYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: cfi: add support for CFI_CLANG with Rust
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 6:03=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Tue, Jul 30, 2024 at 08:24:15AM -0700, Sami Tolvanen wrote:
> > On Tue, Jul 30, 2024 at 3:32=E2=80=AFAM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > On Tue, Jul 30, 2024 at 09:40:12AM +0000, Alice Ryhl wrote:
> > > > From: Matthew Maurer <mmaurer@google.com>
> > > >
> > > > Make it possible to use the Control Flow Integrity (CFI) sanitizer =
when
> > > > Rust is enabled. Enabling CFI with Rust requires that CFI is config=
ured
> > > > to normalize integer types so that all integer types of the same si=
ze
> > > > and signedness are compatible under CFI.
> > >
> > > I am assuming -- because I have to, because you're not actually sayin=
g
> > > anyting -- that this is fully compatible with the C version and all t=
he
> > > fun and games we play with rewriting the function prologue for FineIB=
T
> > > and the like also work?
> >
> > Rust uses the same LLVM backend for the actual code generation, so it
> > should be fully compatible.
>
> Yes, but we also combine that with -fpatchable-function-entry=3D for a
> very specific effect, and I don't think I see the Rust thingy do that.

Oh, you're right. I missed this because we're not using FineIBT, and
when this patch was originally written we had not yet implemented a
Rust equivalent to -fpatchable-function-entry=3D. However, that flag is
now available as of rustc version 1.80.0, so it shouldn't be an issue.
I'll fix this for v2 of this series.

Thanks for catching this!

As for whether it works other than that, I've been using this on my
personal phone together with Rust Binder for several months, so it's
well tested on arm64.

Alice

