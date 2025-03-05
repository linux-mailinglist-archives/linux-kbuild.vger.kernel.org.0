Return-Path: <linux-kbuild+bounces-5963-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B92FA4FE1D
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 13:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6262C3AE848
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 11:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D804242903;
	Wed,  5 Mar 2025 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tq8prO7G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3015A20DD7F;
	Wed,  5 Mar 2025 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741175999; cv=none; b=bJomzGPsyMj1woHzfO77cHAfJVQ/PC0EZkCmV7JQqDRJpAHge0dEg3EXMAWBOECP+fEqga91OnXmlqUtcvBp8NodGoQYOTHU3VB3iKmekf+C89fj+AwbXdLnv+VZ/qimhGPBFXogA3yF29BPxhcJGvLEhlIDuIUM7ExQPANqqJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741175999; c=relaxed/simple;
	bh=1itfz5Dn/ifmwpBxuvw4a+A/Z8sq2airca0/Wm8mM/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kLzjt4tD/SRHMgnLp9eZIXdxF7fM4D7WYVgYA1w+4X8S/SNzVkL/GEG68HYlk0HXN8KEaChDPRMkzrdmuDsdcfOyRgY4FdGNlT+XXmk9hiuRGS/L0JO51UgqwepaW3JxsMRILo/7SecpCdGqAQckn82bIsIByg/hkRbHj/7IgLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tq8prO7G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15241C4CEE2;
	Wed,  5 Mar 2025 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741175998;
	bh=1itfz5Dn/ifmwpBxuvw4a+A/Z8sq2airca0/Wm8mM/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tq8prO7GuKGKr0n+6VxzhdZcbv6UyEHnV1+2FJLmOkhTzVD+kxJqs4BOa4UTzuHo9
	 kKUwi/oZJOqJErJMFmzorjEbyW3/GVgXYqHmdUi3g3F5uEJTOUYzXqJeIMgDEzry1J
	 o7BKjOYLkXMDVQU0/FkHa0m0M3Idkja1NHIBMlrOSsq3X91Oz7VCxHGqiHAV2qywsp
	 F/Wb1tiEE6awH0XXn7blfbdNp2Vsr+9LR2fWfeq4dh0VrsJmWp6pDbmn2bLvHwv0aF
	 Tevk4DQ6JkXFGj1ErpKOpMSl9+A15+osehcXGm+GVzpfvGSQS8gTKR/Gm2Gd9DUtI7
	 2NJhK+KKY8FxQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <benno.lossin@proton.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Danilo Krummrich" <dakr@kernel.org>,  "Masahiro Yamada"
 <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,
  "Nicolas Schier" <nicolas@fjasle.eu>,  <linux-kernel@vger.kernel.org>,
  <rust-for-linux@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 14/22] rust: add pin-init crate build infrastructure
In-Reply-To: <20250304225245.2033120-15-benno.lossin@proton.me> (Benno
	Lossin's message of "Tue, 04 Mar 2025 22:55:09 +0000")
References: <20250304225245.2033120-1-benno.lossin@proton.me>
	<jpQp16UCJ00pInqOI-QFULU6-FKl2bBtAlmnxtXWLgXPVb7gy6d727nr7THeyks3ERF5Yqu3R6bikD0OK4mqXA==@protonmail.internalid>
	<20250304225245.2033120-15-benno.lossin@proton.me>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 05 Mar 2025 12:59:39 +0100
Message-ID: <87h647d6xg.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <benno.lossin@proton.me> writes:

> From: Miguel Ojeda <ojeda@kernel.org>
>
> Add infrastructure for moving the initialization API to its own crate.
> Covers all make targets such as `rust-analyzer` and `rustdoc`. The tests
> of pin-init are not added to `rusttest`, as they are already tested in
> the user-space repository [1].

If it's not too much hassle, why not add them in the kernel as well? I
would rather not have to go fetch the user space repo from github, in
the event that I ever need to patch pin-init.


>
> Link: https://github.com/Rust-for-Linux/pin-init [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Co-developed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
>  rust/Makefile                      | 75 +++++++++++++++++++++++-------
>  rust/pin-init/internal/src/_lib.rs |  3 ++
>  rust/pin-init/internal/src/lib.rs  |  4 ++
>  rust/pin-init/src/_lib.rs          |  5 ++
>  scripts/Makefile.build             |  2 +-
>  scripts/generate_rust_analyzer.py  | 17 ++++++-
>  6 files changed, 86 insertions(+), 20 deletions(-)
>  create mode 100644 rust/pin-init/internal/src/_lib.rs
>  create mode 100644 rust/pin-init/src/_lib.rs
>
> diff --git a/rust/Makefile b/rust/Makefile
> index ea3849eb78f6..90310f0620eb 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile

[...]

> @@ -110,11 +113,24 @@ rustdoc-compiler_builtins: $(src)/compiler_builtins.rs rustdoc-core FORCE
>  rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
>  	+$(call if_changed,rustdoc)
>
> -rustdoc-kernel: private rustc_target_flags = --extern ffi \
> +rustdoc-pin_init_internal: private rustdoc_host = yes
> +rustdoc-pin_init_internal: private rustc_target_flags = --cfg kernel \
> +    --extern proc_macro --crate-type proc-macro
> +rustdoc-pin_init_internal: $(src)/pin-init/internal/src/_lib.rs FORCE
> +	+$(call if_changed,rustdoc)
> +
> +rustdoc-pin_init: private rustdoc_host = yes
> +rustdoc-pin_init: private rustc_target_flags = --extern pin_init_internal \
> +    --extern macros --extern alloc --cfg kernel --cfg feature=\"alloc\"
> +rustdoc-pin_init: $(src)/pin-init/src/_lib.rs rustdoc-pin_init_internal \
> +    rustdoc-macros FORCE
> +	+$(call if_changed,rustdoc)

Is it possible to do some code sharing here, such that when we add a
crate, it's just a matter of putting the path/name on a list somewhere?


Best regards,
Andreas Hindborg



