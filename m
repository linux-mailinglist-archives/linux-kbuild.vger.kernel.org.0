Return-Path: <linux-kbuild+bounces-5440-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14538A0A054
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2025 03:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97DA57A265F
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2025 02:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD756129A78;
	Sat, 11 Jan 2025 02:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohR/j8x4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A161C3D96A;
	Sat, 11 Jan 2025 02:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736562373; cv=none; b=RxT3RigIQ3qC8FNqdK4MtkvUfqIsfJ+l1tRtIGoeFji27UUX71fxSh/STjcrNRw+RHrtpYM5bKjSnxCh4onlGfuQpDQu9+He8yQunMgT382nOA0MytEfk4Y96mwb2t+jIhW9nlqnYyETK2Dly9Fwz/GnJ8kAin/dt6dosbW73Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736562373; c=relaxed/simple;
	bh=Idfamzh46DJ+twDpww56R9aCJmI4wUd9lTayVqOmz9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIBwTeajNw+wjLMwTACsEX3eXDJc8/n69wY2a7Hbu+//9E/fNWw1LqvGIQ/5ObIYNU44HeKJknivQ75vZAs8tlyCtDNAQc2bddvHe3HJl061CQmHp1UkVlhPocQIUiHRd2/Z1EYVmks0cZUrdsGVxEhAMMoPJOBwWABMVo8jZ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohR/j8x4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223D2C4AF09;
	Sat, 11 Jan 2025 02:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736562373;
	bh=Idfamzh46DJ+twDpww56R9aCJmI4wUd9lTayVqOmz9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ohR/j8x4mduyecIm9IHmeoUkPWOY+eL9haML+1wT95TX7hFydUAGVoeVQu0NjFekQ
	 7100PZd0U0jMw+S9PnOCq51wYRBB5kuqlMx93Ojz3c5CvqCMuf8YcFbWDFhsPdG5Ln
	 xiMZ1grF3yIfJsreZkNdd747u+md/mGMbJUCSfodSNx/XSaydM+XC9LBAV2Qd/5h5S
	 TD5RoESsX13yR7dXyDgsM0ND+4siMR8z3j0bxDSaa6RzDvKxSt8mgb/QvrVHjrHbfE
	 wWh/KZ66qT4ksJbyx+zzmu9BcsdWe6yO2BrGmVtohVUea0qgLaeRSE94P55UFxDre3
	 45sU9DIbXc+qg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-304e4562516so24798271fa.1;
        Fri, 10 Jan 2025 18:26:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4aeOs+TUtWX8+c42O4J/TL+lRQuXU9R1YnRxUQFaEwAyhRUXkvJmKCwMCD81uBPr3A6fJ3y/Kn3Tvdjb8Mw==@vger.kernel.org, AJvYcCUaWrNukA0cUsJcHJLVjky/CHDsEAmWVyAEX9QpErTUezlKADBi0XpnAh2MUiYu8A6rKrsTZxd2vzJIPk4h@vger.kernel.org, AJvYcCVaOFnuBfOZl5Zuycm37HY3Jk+/dNv+26dRRSMvqkMJa9XGd10M+NyQ1pVSZ/r7YECVNXkTjGAW0OTa3hmd@vger.kernel.org, AJvYcCXLYC7IkkU6b0Lkyk+EQZjr1TneteG2eGiqx36SmxtjNQtldIal0DquKvBK6K7Oi6DZWQlre2eCn9RVK/xV2fU=@vger.kernel.org, AJvYcCXgk260ZhHnFLU2Zz6go8YLwoB1ppKhLprJ8tpuaMuBlMo8ALvB1i5YqEcKjWOsaefj1/zeuB4qd34=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9tv+XarKWdAnjRUrLcWzRB3cA273shDq2Zla8vavmjseoctjM
	87jCUsfui1sGWbZR9VukPdTQzJ4ikcD+e6ysv5S8B4GIArPGHi7pCugYBP1tR/zkGkuVjFHrys+
	wuxo7bJd9QPnpH7eGiP+a9fJGxsg=
X-Google-Smtp-Source: AGHT+IFSeUdKlBePUTptLfNo7AV+Ke5p3rh1RAhmgs6127AKDeZ16XwTtR3YDLtLxc44SZaiu8s77F1oCGDkn1B2CUY=
X-Received: by 2002:a2e:bc23:0:b0:302:1fce:393d with SMTP id
 38308e7fff4ca-305fcf85a3fmr26095711fa.2.1736562371733; Fri, 10 Jan 2025
 18:26:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com> <20250103-extended-modversions-v13-5-35d87c65ee04@google.com>
In-Reply-To: <20250103-extended-modversions-v13-5-35d87c65ee04@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 11:25:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
X-Gm-Features: AbW1kvb7GALEjFsi9ilnzzIkVesgxqvRHO2ZeNtTEBScvuq46-k7JP8S_G4h1io
Message-ID: <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] rust: Use gendwarfksyms + extended modversions
 for CONFIG_MODVERSIONS
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 2:37=E2=80=AFAM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> From: Sami Tolvanen <samitolvanen@google.com>
>
> Previously, two things stopped Rust from using MODVERSIONS:
> 1. Rust symbols are occasionally too long to be represented in the
>    original versions table
> 2. Rust types cannot be properly hashed by the existing genksyms
>    approach because:
>         * Looking up type definitions in Rust is more complex than C
>         * Type layout is potentially dependent on the compiler in Rust,
>           not just the source type declaration.
>
> CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
> CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, allow
> it to do so by selecting both features.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  init/Kconfig  |  3 ++-
>  rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
>  2 files changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index c1f9eb3d5f2e892e977ba1425599502dc830f552..b60acfd9431e0ac2bf401ecb6=
523b5104ad31150 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1959,7 +1959,8 @@ config RUST
>         bool "Rust support"
>         depends on HAVE_RUST
>         depends on RUST_IS_AVAILABLE
> -       depends on !MODVERSIONS
> +       select EXTENDED_MODVERSIONS if MODVERSIONS
> +       depends on !MODVERSIONS || GENDWARFKSYMS
>         depends on !GCC_PLUGIN_RANDSTRUCT
>         depends on !RANDSTRUCT
>         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> diff --git a/rust/Makefile b/rust/Makefile
> index a40a3936126d603836e0ec9b42a1285916b60e45..80f970ad81f7989afe5ff2b5f=
633f50feb7f6006 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -329,10 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: priv=
ate bindgen_target_extra =3D ;
>  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c =
FORCE
>         $(call if_changed_dep,bindgen)
>
> +rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && =
$$3!~/__cfi/ { printf $(2),$(3) }'
> +
>  quiet_cmd_exports =3D EXPORTS $@
>        cmd_exports =3D \
> -       $(NM) -p --defined-only $< \
> -               | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_SY=
MBOL_RUST_GPL(%s);\n",$$3}' > $@
> +       $(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $@

I noticed a nit:

Both of the two callsites of rust_exports pass
'$$3' to the last parameter instead of hardcoding it.

Is it a flexibility for future extensions?

I cannot think of any other use except for printing
the third column, i.e. symbol name.





--=20
Best Regards
Masahiro Yamada

