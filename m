Return-Path: <linux-kbuild+bounces-10433-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5692ACFDB0C
	for <lists+linux-kbuild@lfdr.de>; Wed, 07 Jan 2026 13:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE73A30BC97B
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jan 2026 12:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572F7329C52;
	Wed,  7 Jan 2026 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YT7lKsIL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27258308F3A;
	Wed,  7 Jan 2026 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788648; cv=none; b=L7+XVm1y70vk4j1YZO0CGrfXHCM42WjdC3du9ljmTjKnYSDCRjPWqbv2aNrTEYQbyDFOXbwhoJ8VfhvSXufpo9L22vSL4Vap/Ua5JjB+Isf6ZeyRWESlU5M/ZO2WRyNRZzj4td8cgVfFO35IvSyOuyhqHO2GJySkttjvKZmjd7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788648; c=relaxed/simple;
	bh=Lq+qb8p/JeZZ24gFARiIHk8jb++YEHQT5hO3qTQR3Dw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ho83fUTK4B+4uJD9c262kOsoJzsDOPzsYk1Bbe08Gc297dSy+A1X4y09jpE8AgAHAlyNix0fecdWPJ5XbrXSSKwLhTC5NMUD+AkjbimMbJgZ97YY3eptI5+x9FnL1nF2MKTMIZbIlHOg+kdzuyv2x4Lo8O98g6VgelQkbVaubdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YT7lKsIL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE2BC4CEF7;
	Wed,  7 Jan 2026 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767788648;
	bh=Lq+qb8p/JeZZ24gFARiIHk8jb++YEHQT5hO3qTQR3Dw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YT7lKsIL4LmNfK9eUGj51kaYJfJfLQzVlgoMitV0b19j0lcJZ8troi/+V49jjtdUJ
	 qhVMSF80VQrUlyyAhJwQc2IzYUIlOLo2VDSrj1XEjU0g8O+ChiZCM3BDVuGsi1BF3Y
	 1PIoqO1gZIdKT5botN3Lx2oAI6RUWiqgz2JMfxfZXgDzXM6MZWVOLrMnva9Ht7gPCE
	 IucAai8tLwT+XJiV3oTKnnWrsVZfIwKkqNMLWTtjnE4rk3t236XwAOj1hIxddYxk9I
	 R1q9plGRjwg8Ov3p/4r52h8vTA3+lBwQ2EEtzawKcAkPycVlW/BGSpYf1dZO5C6NKF
	 OvK3Y9zEcICiw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Nicolas Schier
 <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH 2/4] rust: helpers: #define __rust_helper
In-Reply-To: <20251202-inline-helpers-v1-2-879dae33a66a@google.com>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-2-879dae33a66a@google.com>
Date: Wed, 07 Jan 2026 12:49:32 +0100
Message-ID: <875x9diqwj.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alice Ryhl <aliceryhl@google.com> writes:

> From: Gary Guo <gary@garyguo.net>
>
> Because of LLVM inling checks, it's generally not possible to inline a C
> helper into Rust code, even with LTO:
>
> * LLVM doesn't want to inline functions compiled with
>   `-fno-delete-null-pointer-checks` with code compiled without. The C
>   CGUs all have this enabled and Rust CGUs don't. Inlining is okay since
>   this is one of the hardening features that does not change the ABI,
>   and we shouldn't have null pointer dereferences in these helpers.
>
> * LLVM doesn't want to inline functions with different list of builtins. C
>   side has `-fno-builtin-wcslen`; `wcslen` is not a Rust builtin, so
>   they should be compatible, but LLVM does not perform inlining due to
>   attributes mismatch.
>
> * clang and Rust doesn't have the exact target string. Clang generates
>   `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
>   complain if `-Ctarget-feature=+cmov,+cx8,+fxsr` is used). x86-64
>   always enable these features, so they are in fact the same target
>   string, but LLVM doesn't understand this and so inlining is inhibited.
>   This can be bypassed with `--ignore-tti-inline-compatible`, but this
>   is a hidden option.
>
> To fix this, we can add __always_inline on every helper, which skips
> these LLVM inlining checks. For this purpose, introduce a new
> __rust_helper macro that needs to be added to every helper.
>
> The actual additions of __rust_helper can happen in separate patches. A
> "flag day" change is not required since missing annotations do not lead
> to anything worse than missing inlining.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



