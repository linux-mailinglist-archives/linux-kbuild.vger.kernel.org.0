Return-Path: <linux-kbuild+bounces-5475-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F03C5A0FE00
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 02:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9CB63A6737
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 01:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDA7224B11;
	Tue, 14 Jan 2025 01:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8yhNI73"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82FC224B10;
	Tue, 14 Jan 2025 01:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736817775; cv=none; b=Juty4H7ym3I4Ce0vtXsfoOF7FCYZGxqhzzhgyAa1FkWihFhpdCafH/Orc8HKPKUxbNpgOMsNcM/+MUzYbdo90uWLntO91g0fMuddS85WgqwtkDDdptXPJ9ZC2DdilQCTU9IjFUuKevkOY4WhawISoxu63bNFFSIHQBwdUH1vYzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736817775; c=relaxed/simple;
	bh=WWAWhrPDVE4hZLjlIHHtG5mo67QW053tLTfug92Cmg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJOUmR+p9uOg1Pi74LP47uNxpaugc0zvpUKAGPTg/4WYW0afAdU9NGtmHVKRN6QJetNSZnPDWBrt/fw3RvnmggMmkkaoLFi78hojUFYUgCw8GkmIQBnyGcRgiT/5N/5Z9SsAfXZ7saZGUJ2RY7WXJyxXGR9ElxmcyCaeZttQBig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8yhNI73; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F07C4CEE7;
	Tue, 14 Jan 2025 01:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736817774;
	bh=WWAWhrPDVE4hZLjlIHHtG5mo67QW053tLTfug92Cmg0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q8yhNI73qWjJaT8OH+GgCaS0wKO61ripZky5L63DMuH/gwDmFtPtlg6RSHsIeGRhu
	 QrAp3w4FHYFA6BZpsJAhm8wkcdiIz9TZKRwhQYsJuAXuN3YoALsXYDHHvJnVs8zNrk
	 FZqhVUroeEGRPgqx90majKMGFrKVUK13ytatOZrtpVpWRDN0Gl6d+HBri5c9tOnMjJ
	 p4XmhP91mTYDMZyBrCLBYA9ZzJZhz22Zl/h8YFsp0v3sfaI5IEpgzcvOGeBgD/QC1K
	 R/Tm7tMwoSUMoq0Wt/gEEQ1VYriFszEm+yGgmgQdaqrXLt0/VV7WsAY6iA0CyN16SA
	 61DRdFhGl5HAA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54024aa9febso4275192e87.1;
        Mon, 13 Jan 2025 17:22:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVR3wmuPQ/E69jyxL6DMOOr9/PRFYTBCbMXuFa4tT2UDF3jhy9r1lV3xazzVSkzQyIP5lU6tDDklwNYRK1u@vger.kernel.org, AJvYcCVTbFNXLtMzCJYZnoSp0/0skZlX+p5bW2e51F+tN4rS4Z/inLuLamWGhGcav7A3oWE2+IYQAA9WB0nf0O/v6hU=@vger.kernel.org, AJvYcCVxUl8dgmi/Y1RjKgYZv+em/qt7g3RtO+uasQ8pl6jaxjXV5Iz8CSxwKRX81dlGE76tOEI9588TBaFwDcl81w==@vger.kernel.org, AJvYcCXlmTVYg+OpszBxSnEvq+YHLODSgwQoMZa4UCGkTn19OGfNVdrFHhLZN+/JhAIADb9f8PFHajD0w2o=@vger.kernel.org, AJvYcCXtadWIvSQFIpBmoifiwokg8uTQkypBvyWV3sjbEIpcJpGYlOLBHuR4NlXQ7Cu0DW1YMB7qax5Z67vPG1io@vger.kernel.org
X-Gm-Message-State: AOJu0YzyUpSA9d0rWOCWeVl2peTAveuf80Yjgd4H8ahn88wjtcR+5owe
	YmLw0t4FUVRkiAjq0g3X2jPTjGBcuHspIPa0LUmyjjnexuV8O0DlxelUJmFS9Kz9X7AnR0x7FjH
	mXijI5Ia3o8wcxjWc/z9cq87g0gw=
X-Google-Smtp-Source: AGHT+IESxyAm24XzrUgZGUb3R8oQ76pDssd8o0arSr9yWSbiBxQ8obkHFuQd2lZ3xWB3P/UgR+hVajnNX4k9qFATBCk=
X-Received: by 2002:ac2:4e0c:0:b0:542:2e04:e9b8 with SMTP id
 2adb3069b0e04-542845af12emr6189443e87.8.1736817772856; Mon, 13 Jan 2025
 17:22:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
 <20250103-extended-modversions-v13-5-35d87c65ee04@google.com>
 <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com> <CABCJKuf-w1puUsypU-cr5BH8uvCdPPQmhZZ1qVKDDg3Y-iQhSg@mail.gmail.com>
In-Reply-To: <CABCJKuf-w1puUsypU-cr5BH8uvCdPPQmhZZ1qVKDDg3Y-iQhSg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 14 Jan 2025 10:22:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNASh4xMN8nN5vwR6R1OCNW9u4MJz=CSwW4_4hvFOhczmWA@mail.gmail.com>
X-Gm-Features: AbW1kva0Jrhvekt3XU_K0jJaW4gEA0CCxv9uoIHGVV-XYlKHjUpGlKLny-Lkcbo
Message-ID: <CAK7LNASh4xMN8nN5vwR6R1OCNW9u4MJz=CSwW4_4hvFOhczmWA@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] rust: Use gendwarfksyms + extended modversions
 for CONFIG_MODVERSIONS
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
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

On Tue, Jan 14, 2025 at 5:04=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi Masahiro,
>
> On Fri, Jan 10, 2025 at 6:26=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Sat, Jan 4, 2025 at 2:37=E2=80=AFAM Matthew Maurer <mmaurer@google.c=
om> wrote:
> > >
> > > From: Sami Tolvanen <samitolvanen@google.com>
> > >
> > > Previously, two things stopped Rust from using MODVERSIONS:
> > > 1. Rust symbols are occasionally too long to be represented in the
> > >    original versions table
> > > 2. Rust types cannot be properly hashed by the existing genksyms
> > >    approach because:
> > >         * Looking up type definitions in Rust is more complex than C
> > >         * Type layout is potentially dependent on the compiler in Rus=
t,
> > >           not just the source type declaration.
> > >
> > > CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
> > > CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, al=
low
> > > it to do so by selecting both features.
> > >
> > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > Co-developed-by: Matthew Maurer <mmaurer@google.com>
> > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > ---
> > >  init/Kconfig  |  3 ++-
> > >  rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
> > >  2 files changed, 34 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index c1f9eb3d5f2e892e977ba1425599502dc830f552..b60acfd9431e0ac2bf401=
ecb6523b5104ad31150 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -1959,7 +1959,8 @@ config RUST
> > >         bool "Rust support"
> > >         depends on HAVE_RUST
> > >         depends on RUST_IS_AVAILABLE
> > > -       depends on !MODVERSIONS
> > > +       select EXTENDED_MODVERSIONS if MODVERSIONS
> > > +       depends on !MODVERSIONS || GENDWARFKSYMS
> > >         depends on !GCC_PLUGIN_RANDSTRUCT
> > >         depends on !RANDSTRUCT
> > >         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> > > diff --git a/rust/Makefile b/rust/Makefile
> > > index a40a3936126d603836e0ec9b42a1285916b60e45..80f970ad81f7989afe5ff=
2b5f633f50feb7f6006 100644
> > > --- a/rust/Makefile
> > > +++ b/rust/Makefile
> > > @@ -329,10 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: =
private bindgen_target_extra =3D ;
> > >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helper=
s.c FORCE
> > >         $(call if_changed_dep,bindgen)
> > >
> > > +rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/=
 && $$3!~/__cfi/ { printf $(2),$(3) }'
> > > +
> > >  quiet_cmd_exports =3D EXPORTS $@
> > >        cmd_exports =3D \
> > > -       $(NM) -p --defined-only $< \
> > > -               | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPOR=
T_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
> > > +       $(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) >=
 $@
> >
> > I noticed a nit:
> >
> > Both of the two callsites of rust_exports pass
> > '$$3' to the last parameter instead of hardcoding it.
> >
> > Is it a flexibility for future extensions?
> >
> > I cannot think of any other use except for printing
> > the third column, i.e. symbol name.
>
> Good catch, the last parameter isn't necessary anymore. It was used in
> early versions of the series to also pass symbol addresses to
> gendwarfksyms, but that's not needed since we read the symbol table
> directly now.

If you submit a diff, I will squash it to 5/5.
(You do not need to input commit description body)


--=20
Best Regards
Masahiro Yamada

