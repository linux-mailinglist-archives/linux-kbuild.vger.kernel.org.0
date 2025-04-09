Return-Path: <linux-kbuild+bounces-6558-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B0CA831C8
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 22:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D9513A9791
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 20:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE854211476;
	Wed,  9 Apr 2025 20:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mo86K5Mz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41AE1E0B66
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Apr 2025 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229880; cv=none; b=pU75SHbTmTu3bQbkqSkPw93EKkvcSv7ec5r97vWASHKE02jsfqjZS8Yi1v9G8sygOOIWRoGU0Eh6/n8np9CtoBAWPFlUEdubT22cJE8x7uyByL3p0V9s0d7ZqQQmlURxHYvuam5hWKDRUBQtV6DsYSarJwwqDsspGZkSKCPvNyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229880; c=relaxed/simple;
	bh=DN0wpjoBwbm62a2PojPzy9eL4TkNTyJB5bl5qwh5q5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eX/dF8ARTZR12i3jTgVoEawym1oEkNAI7mYTPVwaS34SXBX0UwzgBH5KjnKmkiQMWL7kynwhsNf08L4RLeeMelSTAIKBesLvEXvziiGT1f6zFCUAha/nPDkClq+e6HpGkuXotj3BWRavPrXw3Loh8207yrc7GH2kHqA8OTxomX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mo86K5Mz; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so8514f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Apr 2025 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744229877; x=1744834677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bgWloY6Z/GPjOoVRp8gFI5U+gR/p1lk09lOlKvqmyk=;
        b=Mo86K5Mz2C2YZ/lCbp8AwSgUcxlfYpgkrNeQvpmRPm7PCzZSR8QwLZlDG4LSEEhF3A
         Uh1qivzIEGo561f7DoPKplRlk3DG/m3mkS8NzE9BU1QJmSuZ47fajbkFN/Bn7TW+QRwS
         scibgQoDNch7cgDHFS12ZdDsg3WHX6d0Jm94mdm7R8lZMHKnnp0QzzBZzApaG5C96CRf
         tX/QaXNAbz4xO68+gGCIVlafgyy+qAZ3gU/qoSmFtzutrwYCgSgNKXBdvP39H1Jk/c0c
         R8OF1+ROs2OCstR1WjgBL7NWUOyAxHTzt94/XLfb0FDOOUdSrT1gn0p+cE6aa9sUoV4h
         z11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744229877; x=1744834677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bgWloY6Z/GPjOoVRp8gFI5U+gR/p1lk09lOlKvqmyk=;
        b=pfgcdUT5bH4mOyD9nhhPDGD/5EBnd7S0YIZSOqJ9kxb7vGJJqkerBfAVm/95HKpsUl
         KucHTESEIqRMoJ/V9Fi99GoKc13nSmXaw6Jbt2B5QREvc9FjIqV6T2zOrtGGHqe+DZ24
         ujHCvDAAZgaAAnX/kFYTQziI0MSkSZx/bRHiJt+u+Tbcr7/g3TrT4wVPyCAldMMUvVVu
         jiq1R0PLHMrN9G91FP19q8TsClG0r/iWpx8axY7xS+EAmSFeqdRkOwe6XWFfQJEViiHw
         ZzNGR5c6S6/7l9Lk7APMgNzZBUCSj6p38YmO2qjlueqjkzz4BzoCTQv7x73gqOUXvZsN
         Jl/A==
X-Forwarded-Encrypted: i=1; AJvYcCXLR7Ie67qUvXzXZMR8iGzH1pOiMZduHT56yYqGz5grinnhwaq+4y3cR7fK+eKSzCmtstGJiYAAuodCjaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB9bDa+2jBBzZ6LHUaG2BP8w1fOiGkRnvzfUgoQuKwGEKlglV4
	9gmAaFsm2oXAumVTxbS85PhN8nThVOTE3hPfJ2AFAXeBII94LAw7/5IxG6SIYVwelB+unj3mysq
	RYO540nsECJm2VTIPzvXVu/XxhnyR1FA9eE87
X-Gm-Gg: ASbGnctMj9F9ai3ZoNdIeZch3an6FNzGpgQQ+G+XZwEW+az3j+yDAWsqm+W/UCdPMee
	1GubQ15zb0V1Wh+NKuAUvPI5WXIFJN8wA4xtCVCE6OvKT5xCG6sH1+aqJCk9IwSF70DrnGAy+02
	Ezq3svEAXpqqx4qWsOiErOXps=
X-Google-Smtp-Source: AGHT+IHF65zLg7feilUYDheUibZgFpivGomhAMQ9nvtXy1QRwJ0EXV2IXKYLDmuiA2LwoPriA5ZqZstTr5vam02ZaAA=
X-Received: by 2002:a05:6000:2411:b0:391:2dea:c984 with SMTP id
 ffacd0b85a97d-39d8f463cd4mr86810f8f.11.1744229877002; Wed, 09 Apr 2025
 13:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319205141.3528424-1-gary@garyguo.net> <20250319205141.3528424-3-gary@garyguo.net>
In-Reply-To: <20250319205141.3528424-3-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Apr 2025 22:17:44 +0200
X-Gm-Features: ATxdqUGIImZWdIXFXkMtgq_6FpLUl4WUHaHz6zPbTJ9JLlSwvxfpfqMMQQdWOGU
Message-ID: <CAH5fLgifMPxer5TcWUBUYKtGsPFryqPVwXT8-5qmmY6F3=nuBw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Tamir Duberstein <tamird@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Daniel Xu <dxu@dxuuu.xyz>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Matt Gilbride <mattgilbride@google.com>, 
	Paul Moore <paul@paul-moore.com>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 9:53=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> A new Kconfig option, `RUST_INLINE_HELPERS` is added to allow C helpers
> (which were created to allow Rust to call into inline/macro C functions
> without having to re-implement the logic in Rust) to be inlined into
> Rust crates without performing global LTO.
>
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to an object file to be linked
>   into vmlinux, they're compiled to LLVM IR.
> * The LLVM IR is patched to add `linkonce_odr` linkage. This linkage
>   means that functions are inlineable (effect of `_odr`), and the
>   symbols generated will have weak linkage if emitted into object file
>   (important since as later described, we might have multiple copies of
>   the same symbol) and it will may be discarded if it is not invoked or
>   all invocations are inlined.
> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>   is a performance optimisation to prevent LLVM from always have to
>   reparse the same IR).
> * When a Rust crate is compiled, instead of generating an object file, we
>   ask LLVM bitcode to be generated.
> * llvm-link is invoked to combine the helper bitcode with the crate
>   bitcode. This step is similar to LTO, but this is much faster since it
>   only needs to inline the helpers.
> * clang is invoked to turn the combined bitcode into a final object file.
>
> Some caveats with the option:
> * clang and Rust doesn't have the exact target string. Clang generates
>   `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
>   complain if `-Ctarget-feature=3D+cmov,+cx8,+fxsr` is used). x86-64 alwa=
ys
>   enable these features, so they are in fact the same target string, but
>   LLVM doesn't understand this and so inlining is inhibited. This is bypa=
ssed
>   with `--ignore-tti-inline-compatible`.
> * LLVM doesn't want to inline functions compiled with
>   `-fno-delete-null-pointer-checks` with code compiled without. So we
>   remove this flag when compiling helpers. This is okay since this is one=
 of
>   the hardening features that does not change the ABI, and we shouldn't h=
ave
>   null pointer dereferences in these helpers.
>
> The checks can also be bypassed with force inlining (`__always_inline`),
> but doing so would also bypass inlining cost analysis.
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Is this compatible with DEBUG_INFO_BTF? I'm concerned that we have the
same issue as in commit 5daa0c35a1f0 ("rust: Disallow BTF generation
with Rust + LTO").

The commit message should either explain why we don't have the same
issue, or this patch should prevent configurations from enabling both.

Alice

