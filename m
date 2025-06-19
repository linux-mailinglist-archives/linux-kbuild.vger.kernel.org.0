Return-Path: <linux-kbuild+bounces-7572-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD67DAE06BA
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 15:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C5BB1BC5312
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 13:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E602472A4;
	Thu, 19 Jun 2025 13:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HN89VgSY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42DD188CB1;
	Thu, 19 Jun 2025 13:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750338907; cv=none; b=kp28w68vaDr+pqQXmDhJz7toyOZEkMNnvJb4d963W7cfIy/u7430jbJ3TthtGteulM+t7XFSX7YOQmpiW8AjV5j+fo1OUFAPYpbOD84HZI4GDhSHEQJrLRmTpQ76TSvLxV8FOXWdlHpk6tjh2CZsWRRI9Tzex0nF+USFbpk11VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750338907; c=relaxed/simple;
	bh=XmA/rDaxVSJIKxYDrc79WLUOEQA0G2rxhfSxcF0bi0w=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=V6rhNcajfAv2HUPXWMCdTSUfKRHITB6xfz5cbUvBHkuAekpuWhlQx4732ogAWb79s1/nnykyvoy/1PKfeRL6Jb37TaU5UiK0fijgZV/b+OfGpv4U+IsR7a46AhZuCvM5lkHWoWA6VjVZDuGSKWCWisK0OzS/8P7dykwoB9AU+gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HN89VgSY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6ABCC4CEEA;
	Thu, 19 Jun 2025 13:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750338907;
	bh=XmA/rDaxVSJIKxYDrc79WLUOEQA0G2rxhfSxcF0bi0w=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=HN89VgSYMF+Q0+qxAHhMd+/MiXoZSysZyeTDqWfJKVQJET4+UsnMZqbsxtRQf/+HH
	 46G3I5+J9OVvl61r/Bg5Ii+6EPOuhHS4dQku/J+1hgG2X6ajxmpQZENAPTMoJ9BLtd
	 RWybwEPXjtkwQVoMrAi43WExx8OcRbHqxGvbjZalxzjzGERH+FiminnpsTrEjEdjAg
	 D/pQIRBJAtaARHnL9Nc379AsQWnXNMdhc9/BevFVJtlRGq5Xr0FHqmTGjED6Fyi4nQ
	 MxdBlX9dNLFNtUCI5tckB4dLFmX+m5doQ5u9bEryuKaiuci8CIigmNvksH6cPWg9B0
	 FyI5enUD1ezzQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 15:15:00 +0200
Message-Id: <DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org>
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
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
In-Reply-To: <20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>

On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
> +/// A wrapper for kernel parameters.
> +///
> +/// This type is instantiated by the [`module!`] macro when module param=
eters are
> +/// defined. You should never need to instantiate this type directly.
> +///
> +/// Note: This type is `pub` because it is used by module crates to acce=
ss
> +/// parameter values.
> +#[repr(transparent)]
> +pub struct ModuleParamAccess<T> {
> +    data: core::cell::UnsafeCell<T>,
> +}
> +
> +// SAFETY: We only create shared references to the contents of this cont=
ainer,
> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
> +
> +impl<T> ModuleParamAccess<T> {
> +    #[doc(hidden)]
> +    pub const fn new(value: T) -> Self {
> +        Self {
> +            data: core::cell::UnsafeCell::new(value),
> +        }
> +    }
> +
> +    /// Get a shared reference to the parameter value.
> +    // Note: When sysfs access to parameters are enabled, we have to pas=
s in a
> +    // held lock guard here.
> +    pub fn get(&self) -> &T {
> +        // SAFETY: As we only support read only parameters with no sysfs
> +        // exposure, the kernel will not touch the parameter data after =
module
> +        // initialization.

This should be a type invariant. But I'm having difficulty defining one
that's actually correct: after parsing the parameter, this is written
to, but when is that actually? Would we eventually execute other Rust
code during that time? (for example when we allow custom parameter
parsing)

This function also must never be `const` because of the following:

    module! {
        // ...
        params: {
            my_param: i64 {
                default: 0,
                description: "",
            },
        },
    }

    static BAD: &'static i64 =3D module_parameters::my_param.get();

AFAIK, this static will be executed before loading module parameters and
thus it makes writing to the parameter UB.

So maybe we should just use some sort of synchronization tool here...

---
Cheers,
Benno

> +        unsafe { &*self.data.get() }
> +    }
> +
> +    /// Get a mutable pointer to the parameter value.
> +    pub const fn as_mut_ptr(&self) -> *mut T {
> +        self.data.get()
> +    }
> +}

