Return-Path: <linux-kbuild+bounces-7928-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15448AFC691
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 11:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 575211BC3E02
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 09:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9973F2BEC31;
	Tue,  8 Jul 2025 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzn7e3yX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C6CAD21;
	Tue,  8 Jul 2025 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965343; cv=none; b=eygvw311KIGO4zQM+INj1uIr5r9EWL2EccCWHrHZCiZbOwf6XA6LeGW0PAopuMoAU1LF+5iU2Fi6OzM5FSSwp6qDk3ovHiy7GU3+5VT2+MKdoRR0tvNRkUeJGeLRjfUjPHKrtShFSwox1JwRaFh7cjpdZeEWLtskDlhvpDzXsUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965343; c=relaxed/simple;
	bh=fxQd2+OWUan7qyi7wSVssPmsqSKltN1CKBdFtlAHRTs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=EUT9qhz3NZqkpw+bb4X1HbYlj/lMtHsaf0aOHNy38aMf54Rn70Rh+wh7NnVZsfoQRPEY2kladeydtCQ7PY/mJWNyYH+EJ1uHXWbkd5P85kkDGhTXDtIux6FbEnXuVzLERZQIeoKAJVZN98erNod9ac9uBvDdsAxAw8uTdV1vZ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzn7e3yX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE750C4CEF1;
	Tue,  8 Jul 2025 09:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751965343;
	bh=fxQd2+OWUan7qyi7wSVssPmsqSKltN1CKBdFtlAHRTs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=lzn7e3yX1ntJVvV2/OEHqBTG5Ao/rTm9/O9KiaQ5MJH/bFBhaOwV7WK4VCuLlU9gO
	 G21NHbTLptGsy8vmBnSlQRAowsnv/K1kIhdaK0/B3xibvXWgQLYWJnbN4Bc0S0+Xi7
	 87dwC3IvK+HQZP6erpMkmHZCmQNKS9PSOKJUv/GkIiXwnznBvh+TjlyOabO+La9cmp
	 HStx2pkQOib2FVHJmm0y7vy3qGVtXl5+LIZq7NxQjg775QrewHjhz2fLpRnHpCf9O3
	 iIVlezGaesCsaEl3sczvvdr7Jzc7UETXoQlA+rS6pu2gGwECPwWlWH3PX5oAIG3ppg
	 IwasUefNPkntw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 11:02:17 +0200
Message-Id: <DB6JVOZLCMBL.3EZQJP50UUB86@kernel.org>
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
 <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
In-Reply-To: <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>

On Mon Jul 7, 2025 at 3:29 PM CEST, Andreas Hindborg wrote:
> Introduce the `SetOnce` type, a container that can only be written once.
> The container uses an internal atomic to synchronize writes to the intern=
al
> value.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

One nit and a safety comment fix below. (feel free to ignore the nit)
With the safety comment fixed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/kernel/sync.rs          |   2 +
>  rust/kernel/sync/set_once.rs | 125 +++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 127 insertions(+)
>
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 81e3a806e57e2..13e6bc7fa87ac 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -18,6 +18,7 @@
>  mod locked_by;
>  pub mod poll;
>  pub mod rcu;
> +mod set_once;

I would have named this `once`.

>  pub use arc::{Arc, ArcBorrow, UniqueArc};
>  pub use completion::Completion;

> +    /// Get a reference to the contained object.
> +    ///
> +    /// Returns [`None`] if this [`SetOnce`] is empty.
> +    pub fn as_ref(&self) -> Option<&T> {
> +        if self.init.load(Acquire) =3D=3D 2 {
> +            // SAFETY: By the type invariants of `Self`, `self.init =3D=
=3D 2` means that `self.value`
> +            // contains a valid value.

And the type invariants also ensure that the value of `self.init`
doesn't change.

So probably

    // SAFETY: By the type invariants of `Self`, `self.init =3D=3D 2` means=
 that `self.value`
    // contains a valid value. They also guarantee that `self.init` doesn't=
 change.

If you come up with something better, feel free to use it.

---
Cheers,
Benno

> +            Some(unsafe { &*self.value.get() })
> +        } else {
> +            None
> +        }
> +    }

