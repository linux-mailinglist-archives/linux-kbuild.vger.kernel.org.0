Return-Path: <linux-kbuild+bounces-9986-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D64CA3344
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 11:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 133D030241B5
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 10:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B9331329E;
	Thu,  4 Dec 2025 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p3pvK2rG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0442DE702
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764843803; cv=none; b=oxmWCzo5Ni2lgSY8HER6n6QtKcbDX4yDTYSOCM42/bxSxrOoUDzPspqvenwfB1Dt45bzBgXg3bgY4cYmTUHCiVtB7ec1HCTAgvI2MI25ZeFl9yBKWihtvbmu1n5LyT8bWjyjboJJl6TVXO+jugAM5rC3PBOfXW93a1aLKC7bJDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764843803; c=relaxed/simple;
	bh=DIRoBJqJh2nL4dnaCjqurXyJhedDrunp5jDtmaUt9MM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kHK7lkqXjMeGuIPMeXRJ8kNOR+Kq6haWFH4Nxmu37pL4EYED/OA2YDR5syTEPIhsjatYNeAEMtNDIwhbPif4+ZtrhWDn1f4+avBGo5wHG0aYafMjE2TCmOVqiCsoUrsSRl7p1/ZYlu+rNvKntB9wzO/3G9b2k5ssvwAmhpN671w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p3pvK2rG; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47904cdb9bbso15802345e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Dec 2025 02:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764843798; x=1765448598; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EF1MlHpf4n5Q1St5clq56+r8fU1ZS9gsCdCeRZ6mpDg=;
        b=p3pvK2rG6s2RcD9VkZM5O2J60fzhAAV/eUtBeLCl08DPapzzMTCJfcowHn97fMyP/d
         GkqLPrK0V5KGCV0QdRvJSE3rUUKF9kprrEhoUK65DU5eYmVmlm1+nH84BEUHvbkhPwEC
         yLlPa1jxo19yH3JW9vucg8J/1Fm4nEag8HySYSGDFuNSNYMyB2DepzaIZ19bB3s+S9SC
         GzqzIS6w+j6u3GR9yw2lbCGZF2muHlaDWTi8Vy6HK3JB+AyW6UoMfkr7XJvS2EcGnk+Y
         xZdgU2NAKkY3Uu0uVUw8OEnWQ/4sZeDOQcpTWPUKinHIOOq898XZuuuMeUtpsQLvrnOF
         2wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764843798; x=1765448598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EF1MlHpf4n5Q1St5clq56+r8fU1ZS9gsCdCeRZ6mpDg=;
        b=JpzV5xXI8vBzsmvCCCU+M+pGtatm+NVX18LuwQt9d9XgMrKUYi04PbdYIGs0H3VqTC
         rWLRLaZPLnFP2Ya8PGY11FTIBvlZqtu3gkTyrXirlSUnxj5CX+mfrDDy4xqovT1LsGka
         M0hZouGa7H7LkRoYbnoJrxaGr9RG6nRRMQvPIB2Y+MAFjfJuPoZnCzb3jWuwxqWH8qnX
         fl+jHIdicYLQp9KXxR0HrjLNeQ9a/J5PFqHC3rFZwxd/koM5lYZYOwTTNkRQ6H4xT1IZ
         VnFBBzB10lb5bOle2T+ImmTmeThM9We32Z6foyWnGS7Akd/u+lZOwx4LMzrjCOw4hY59
         Yi5A==
X-Forwarded-Encrypted: i=1; AJvYcCVyUyP6cS/ROlK3bWVtpouZ3vXWxb+713Pe3uuyMd+tmsZFmmguxJLAD6QB3v+h8PMQ86Ymxhy7KjW22u8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpIyfXwzUGs2ZJPLUXZqE7lkA9RTUxtS5HAokn3v02NblwPoYL
	H1uRkupyb4OMWK/sCxPGFnK1O4VTrOCViq781f76ZDlUL1i/o3/OWOcoQcPOVwiPFx/s7zmRin8
	nJSEt6DozZj6Q82GYRg==
X-Google-Smtp-Source: AGHT+IGiPJgDCk6zUebYl8jptLh9N24hkpO6kzd49VGJaKt6mNBrX4BGA0A2hAQXhvOeEcEPmbx50VOSkvAylEw=
X-Received: from wrmg8.prod.google.com ([2002:adf:e408:0:b0:42c:c2d6:28e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2f97:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-4792eb1a02emr19061445e9.8.1764843798611;
 Thu, 04 Dec 2025 02:23:18 -0800 (PST)
Date: Thu, 4 Dec 2025 10:23:17 +0000
In-Reply-To: <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
Message-ID: <aTFhFXCqvy7nmDOp@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Josh Triplett <josh@joshtriplett.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Dec 04, 2025 at 11:07:25AM +0100, Peter Zijlstra wrote:
> On Tue, Dec 02, 2025 at 08:27:59PM +0000, Alice Ryhl wrote:
> > From: Gary Guo <gary@garyguo.net>
> > 
> > A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
> > allow C helpers (which were created to allow Rust to call into
> > inline/macro C functions without having to re-implement the logic in
> > Rust) to be inlined into Rust crates without performing global LTO.
> > 
> > If the option is enabled, the following is performed:
> > * For helpers, instead of compiling them to an object file to be linked
> >   into vmlinux, they're compiled to LLVM IR.
> > * The LLVM IR is compiled to bitcode (This is step is not necessary, but
> >   is a performance optimisation to prevent LLVM from always have to
> >   reparse the same IR).
> > * When a Rust crate is compiled, instead of generating an object file, we
> >   ask LLVM bitcode to be generated.
> > * llvm-link is invoked with --internalize to combine the helper bitcode
> >   with the crate bitcode. This step is similar to LTO, but this is much
> >   faster since it only needs to inline the helpers.
> > * clang is invoked to turn the combined bitcode into a final object file.
> > 
> > The --internalize flag tells llvm-link to treat all symbols in
> > helpers.bc using `internal` linkage. This matches the behavior of
> > `clang` on `static inline` functions, and avoids exporting the symbol
> > from the object file.
> > 
> > To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
> > the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
> > Disallow BTF generation with Rust + LTO") for details.
> > 
> > We have an intended triple mismatch of `aarch64-unknown-none` vs
> > `aarch64-unknown-linux-gnu`, so we suppress the warning.
> 
> So if I understand this correctly, it will consume the helpers twice,
> once for bindgen to generate the rust ffi glue, and then a second time
> to 'compile' to IR.
> 
> Then the IR is 'linked' into the rust translation units allowing the
> actual inlining to take place once 'LTO' runs.
> 
> And while this works, this still has the downside of requiring those
> rust helper files and using bindgen.

That's right.

> The other day [*] I proposed extending Rust such that it would be able
> to consume a clang precompiled header directly, this would allow doing
> away with most of all this. No more helpers and no more bindgen.
> 
> Would that not be a much saner approach to all this?
> 
> [*] https://lkml.kernel.org/r/20251124163315.GL4068168@noisy.programming.kicks-ass.net

I have actually discussed similar ideas in the past with Josh Triplett,
so you are not the only one who thinks it is a good idea. Unfortunately,
the road to get there is long.

Another option to get rid of the helpers is that bindgen is working on a
--wrap-static-fns flag, which would generate the helpers for us.
However, that route would still require this patch for them to be
inlined.

One detail that makes the precompiled clang header really tricky is
that IMO we should not require RUSTC_CLANG_LLVM_COMPATIBLE for the
build. With bindgen, you just need bindgen and clang to match LLVMs.
That's easy since bindgen loads a dylib from your clang install. But if
you build this logic into rustc, then you need to be really careful to
get rustc and clang from the same source, and that same source must use
the same LLVM to build both.

Alice

