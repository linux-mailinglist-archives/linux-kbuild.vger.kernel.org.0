Return-Path: <linux-kbuild+bounces-9366-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C87C2B05A
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 11:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4799034233A
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 10:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4422FDC39;
	Mon,  3 Nov 2025 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IgG8yfUI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3950C2FD7A0
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762165374; cv=none; b=XdC6OQZR5JlXaxsB3Y6TbYZvKbk48YdbpoQRPLiQhAaCr/w0zX4NdruCY6mvjWW3XR+FA1WIesZu34FHcA8zHbJvRrl2my9FXKdbcQ10GqviuP9m+IOkLKxM5RV1oRgGhMHHXFNY/PYo60DzHuSwMNC8b3ZYodAPnEPasrFgqmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762165374; c=relaxed/simple;
	bh=ZRv2Bik0mh3ATM87xP1ZEX31SBMDxa+G2+N2PQfmDDY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a7Oo9mxauS4tGciGTxV9FFRNnUL/dylj86EjlGFZdgGIYsqMWfMquxnNYHinYYFB/Hl1ms5fNqOPYr+bKkWQtTVR3fhj59ImcxfPDxN7TB6/PM0H8eOSMeq4sFF/vsN0uUj5E8McQVhQpWSEztvpJZK/6d1ieukaHymx2SNVDSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IgG8yfUI; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b70ae48fb50so66982466b.3
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Nov 2025 02:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762165371; x=1762770171; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=74nlGMCrnYUSq61pxDhzCKYDlRI/c4Z3CWqyM8Nq0u4=;
        b=IgG8yfUInXpn7+jSRUl915/XmW3eRHHS9FuY7Ytbg1vkMY6UqWAwJ7rQ9W/zVPuFtc
         i5DL1X4URQbfeaX4CJKnLeQPbZjv027v+2VZLADQDMWFepB8Jb58qbVDil9v414ns93S
         JUPfXu3b5avbhmT8KhTOYiaLR0glOVHsacKRz2N+K1pTRJbiC/MKIVh+Zoh+ruxFCz7O
         7coPEy1FIUg0zVVa3NoDRpEm15qosYJ5nNdc3QTp9I5zZRaR42JS65053z5mSSetN0j/
         TRnwsTlWuHaKgpodXEfg9JEXHrn5CiN2QrQhClnScAi+xfpfnaUV0joUqFFazlh+9OnE
         3jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762165371; x=1762770171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=74nlGMCrnYUSq61pxDhzCKYDlRI/c4Z3CWqyM8Nq0u4=;
        b=wX5vSvO5wLu5jhMzmsu4h5wpLyDbC1mTehDEMnjDDgaukuK0z1tDScfrfAEkWnimGg
         zhWplQoWHg1tqUfr4MTb9ZpfruGalknZ7/Nm11suCcu+gREJa6079v4galxca5QWRdlq
         OpliP43ZLWN28s/X6G3tS8h4XKBDMm/ZwkF/Zdaprc8Za2ji/jVhSne3qVMlC0gyvkFH
         JpHRYSFjgSw9rU0Rk9h5XOhoeKuoPK0zP5+zi2Cem8uJGKlVLA4LTsGtH3S/JD3/qzIo
         YxjdHC1DdDz/KzejxRVC29sQ+6lpijXvMdRppBxyiro/9tjKJBtXBwzuxg8C+8l7WWCX
         dxNA==
X-Forwarded-Encrypted: i=1; AJvYcCXk1/ayOSo2Doow/qprg4oDok0tYdECRbym+yx2Mx17aEul5QrEN3G9YI2FfIqgZJeexaju51xynCt7Y2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YytjZdolT1kXIVnkAwW2Du9h57BRACorpsQ2iss+zLi1qsXeCER
	//4AMKpSw3a3PG/bE823GDsVU2X4re/X7LVo4P633UnIcL23b1bIB2nhqF6M/nj73Cb6TH9FVFH
	SoDX7HmKLf1Pm1UodUQ==
X-Google-Smtp-Source: AGHT+IHn9x6PSa83XXQosPVx5KOgBWzu3uFfEDGplbMkxxWGLEi0O/THMcQiIWHNoig+hnN4QKP3KjebTPJUtss=
X-Received: from ede26.prod.google.com ([2002:a05:6402:20da:b0:640:b66f:1e57])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5111:b0:63e:2d4d:5a60 with SMTP id 4fb4d7f45d1cf-64076f67066mr10626790a12.8.1762165370729;
 Mon, 03 Nov 2025 02:22:50 -0800 (PST)
Date: Mon, 3 Nov 2025 10:22:49 +0000
In-Reply-To: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
Message-ID: <aQiCeZE7eN_KVdZ5@google.com>
Subject: Re: [PATCH RESEND] rust: enable slice_flatten feature and abstract it
 through an extension trait
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Nov 01, 2025 at 10:31:38PM +0900, Alexandre Courbot wrote:
> In Rust 1.80, the previously unstable `slice::flatten` family of methods
> have been stabilized and renamed to `as_flattened`.
> 
> This creates an issue as we want to use `as_flattened`, but need to
> support the MSRV (which at the moment is Rust 1.78) where it is named
> `flatten`.
> 
> Solve this by enabling the `slice_flatten` feature, and abstracting
> `as_flatten` behind an extension trait that calls the right method
> depending on the Rust version.
> 
> This extension trait can be removed once the MSRV passes 1.80.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> This patch was part of the Nova GSP boot series [1], but since it
> requires attention from the core Rust team (and possibly the build
> maintainers?) and is otherwise buried under Nova patches, I am taking
> the freedom to send it separately for visibility.
> 
> Hopefully it captures Miguel's suggestion [2] accurately, but please let
> me know if I missed something.
> 
> Since the Nova GSP boot series makes use of this, I hope to eventually
> merge it alongside the series, through the DRM tree.
> 
> Thanks!
> 
> [1] https://lore.kernel.org/all/20251029-gsp_boot-v7-0-34227afad347@nvidia.com/
> [2] https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
> ---
>  init/Kconfig           |  3 +++
>  rust/kernel/lib.rs     |  4 ++++
>  rust/kernel/slice.rs   | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  scripts/Makefile.build |  3 ++-
>  4 files changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index cab3ad28ca49..7da93c9cccc3 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -147,6 +147,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
>  	# https://github.com/llvm/llvm-project/pull/130661
>  	def_bool LD_IS_BFD || LLD_VERSION >= 210000
>  
> +config RUSTC_HAS_SLICE_AS_FLATTENED
> +	def_bool RUSTC_VERSION >= 108000
> +
>  config RUSTC_HAS_COERCE_POINTEE
>  	def_bool RUSTC_VERSION >= 108400
>  
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3dd7bebe7888..2581a356d114 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -21,6 +21,9 @@
>  #![feature(inline_const)]
>  #![feature(pointer_is_aligned)]
>  //
> +// Stable since Rust 1.80.0.
> +#![feature(slice_flatten)]
> +//
>  // Stable since Rust 1.81.0.
>  #![feature(lint_reasons)]
>  //
> @@ -128,6 +131,7 @@
>  pub mod security;
>  pub mod seq_file;
>  pub mod sizes;
> +pub mod slice;
>  mod static_assert;
>  #[doc(hidden)]
>  pub mod std_vendor;
> diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
> new file mode 100644
> index 000000000000..7e837bec4bed
> --- /dev/null
> +++ b/rust/kernel/slice.rs
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Additional (and temporary) slice helpers.
> +
> +/// Extension trait providing a portable version of [`as_flattened`] and
> +/// [`as_flattened_mut`].
> +///
> +/// In Rust 1.80, the previously unstable `slice::flatten` family of methods
> +/// have been stabilized and renamed from `flatten` to `as_flattened`.
> +///
> +/// This creates an issue for as long as the MSRV is < 1.80, as the same functionality is provided
> +/// by different methods depending on the compiler version.
> +///
> +/// This extension trait solves this by abstracting `as_flatten` and calling the correct  method
> +/// depending on the Rust version.
> +///
> +/// This trait can be removed once the MSRV passes 1.80.
> +///
> +/// [`as_flattened`]: slice::as_flattened
> +/// [`as_flattened_mut`]: slice::as_flattened_mut
> +pub trait AsFlattened<T> {
> +    /// Takes an `&[[T; N]]` and flattens it to a `&[T]`.
> +    ///
> +    /// This is an portable layer on top of [`as_flattened`]; see its documentation for details.
> +    ///
> +    /// [`as_flattened`]: slice::as_flattened
> +    fn as_flattened_slice(&self) -> &[T];
> +
> +    /// Takes an `&mut [[T; N]]` and flattens it to a `&mut [T]`.
> +    ///
> +    /// This is an portable layer on top of [`as_flattened_mut`]; see its documentation for details.
> +    ///
> +    /// [`as_flattened_mut`]: slice::as_flattened_mut
> +    fn as_flattened_slice_mut(&mut self) -> &mut [T];
> +}
> +
> +impl<T, const N: usize> AsFlattened<T> for [[T; N]] {
> +    #[allow(clippy::incompatible_msrv)]
> +    fn as_flattened_slice(&self) -> &[T] {
> +        #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
> +        {
> +            self.flatten()
> +        }
> +
> +        #[cfg(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED)]
> +        {
> +            self.as_flattened()
> +        }
> +    }
> +
> +    #[allow(clippy::incompatible_msrv)]
> +    fn as_flattened_slice_mut(&mut self) -> &mut [T] {
> +        #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
> +        {
> +            self.flatten_mut()
> +        }
> +
> +        #[cfg(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED)]
> +        {
> +            self.as_flattened_mut()
> +        }

Hmm. Why not have this match the name that this was stabilized under?
That way, when bumping the MSRV, we can just remove this trait without
changing the callers.

Alice

