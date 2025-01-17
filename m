Return-Path: <linux-kbuild+bounces-5500-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D061FA15A30
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Jan 2025 00:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21BCE188B75F
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2025 23:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F841DC9B8;
	Fri, 17 Jan 2025 23:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVsY3WJ/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AC9197A92;
	Fri, 17 Jan 2025 23:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737158046; cv=none; b=JhqeHCnKIvhICgTB+Bo2MomfLo5sHmboxg9aj8G12W0ozlaXJpZp6W9PRNMfKHzOiHxElMTjiOjMOqy1uGe2fIiKhkOJl4K2PB445fJVsMU3mTUvZlEXExSjSApObZD26f1NyGpwpC//P9WTxPWZYZqhYj6NdK3IXr9EVYRQdpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737158046; c=relaxed/simple;
	bh=m8ZfCoz+QGoeKH7gpzr+DtbpzkszLlope3/7aqelGNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBGhjDbb0d4MndQeiBR2gWy4ulh179Qm/SebJdWFtg3+s+bftI1xcmHqQ+mj1L57LHKgcQ689Mvbr7N34OBrxiasBG7D6MKR1pGT9TsahvYdKxdEQwJnBqlj/CjJEE9teDwAsybKevLkqlWvsG3Y2XKy3HX+wDFlkmLwoiuANOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVsY3WJ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6959DC4CEEA;
	Fri, 17 Jan 2025 23:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737158045;
	bh=m8ZfCoz+QGoeKH7gpzr+DtbpzkszLlope3/7aqelGNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gVsY3WJ/q+t/rFDdtrcaqnSSa1hVY4YQAAXAgcBMkqbh3QmONSC0De4NhSYmQTVPu
	 GjuY0zxIGQkjxerzBHXZ8sYt/CzeOUCwQGpuSkKrngnJHcajmqk2wXp4jQzY2aeZkr
	 J8La2wsP2j5hzCBtEZM7W8hRhUjrokxi9Xdsat0O+7T3zkg/ZJULWKNrbXo+1aH+bX
	 Ke7D/vXir/EBBx2Y9wZMN/aMRAae9NzdVI16VZk4z9Y2YL6kk6lSR2PRqpa2yHEDVN
	 X+HI+zv4S1RNhMVO7V3z5RT8NajxXqZ+6BKe5KuxMYiX0xFv9afO1D1butRJHz9YZk
	 mEIOoeXZsb9ww==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54024ecc33dso2513087e87.0;
        Fri, 17 Jan 2025 15:54:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIJlWwcwzYJM8aIgCdqbjkpgXR2wljADBYZ8aE0Q9BJvxiT3PvSqeaa5uEkTncnw3o3SY76D5ElHhd/ZMwFg==@vger.kernel.org, AJvYcCVREfN9MoG5NupQekeYSIJl7dMNfaqIR9sz446/GL1JRYDFjJfpIOH7gp3H0714jmVYjrc3Rn1sja7IW/ve@vger.kernel.org, AJvYcCVhxksNVyNgiAClyIOLppBtMiNO3pYaVEH0nRKiVttNpznbsB9BbTL+NxfqKVkqNS8YK0z4n/MY9cSu9Kkosog=@vger.kernel.org, AJvYcCVoXGnvrbCFoIevcGWK/ecyi1okpTLmtsvyaibZ8Ujw6gsZvCE1GnMgpv11AIN3VJmygBB4lzIkx9g=@vger.kernel.org, AJvYcCVw7KVz6AwUaFvmb+WnOP3j4uyGJ5IukCNq5wAJAR8kAtTtJZT7HLHgIV7W8wjLxlhiK24/JAtRWLVgQHJp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhz9DDhSKmPQsAQ1h8wLMZz9iJLncV+ctbn6sezbd5xzF/yo0x
	9tXsX52bvRuiOa/xs3jgLMqJm9v8gS5RMtc4KOXuCs8DnnhoXerOiqGs2fHJTpCApUrLo2NYpUK
	cxoL3bbls1B92+C2G7tUWMetUFwo=
X-Google-Smtp-Source: AGHT+IExF/k3Se+h2APx/UW58ua4xWf/ZRu8ZQvl0deaJxQpL77zmMnsyOKqNs5x4WdzpyLPqC1//WGF4Am0tjc/OHU=
X-Received: by 2002:a05:6512:3b9d:b0:540:1be6:f15f with SMTP id
 2adb3069b0e04-5439c1bfd49mr1612216e87.0.1737158043976; Fri, 17 Jan 2025
 15:54:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
 <20250103-extended-modversions-v13-5-35d87c65ee04@google.com>
 <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
 <CABCJKuf-w1puUsypU-cr5BH8uvCdPPQmhZZ1qVKDDg3Y-iQhSg@mail.gmail.com>
 <CAK7LNASh4xMN8nN5vwR6R1OCNW9u4MJz=CSwW4_4hvFOhczmWA@mail.gmail.com> <20250114185819.GA2222429@google.com>
In-Reply-To: <20250114185819.GA2222429@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 18 Jan 2025 08:53:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARD5GV6rxMQc0Hu97LmsUDoREstNAgHGkVUmNk8dcAj+g@mail.gmail.com>
X-Gm-Features: AbW1kvZvVs_nJfbEUH3iAOiRf4pxKgGnbT-H8Stwhl79ZTob5w_6kEzM6PlRNxI
Message-ID: <CAK7LNARD5GV6rxMQc0Hu97LmsUDoREstNAgHGkVUmNk8dcAj+g@mail.gmail.com>
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

On Wed, Jan 15, 2025 at 3:58=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Tue, Jan 14, 2025 at 10:22:15AM +0900, Masahiro Yamada wrote:
> > On Tue, Jan 14, 2025 at 5:04=E2=80=AFAM Sami Tolvanen <samitolvanen@goo=
gle.com> wrote:
> > >
> > > Hi Masahiro,
> > >
> > > On Fri, Jan 10, 2025 at 6:26=E2=80=AFPM Masahiro Yamada <masahiroy@ke=
rnel.org> wrote:
> > > >
> > > > On Sat, Jan 4, 2025 at 2:37=E2=80=AFAM Matthew Maurer <mmaurer@goog=
le.com> wrote:
> > > > >
> > > > > From: Sami Tolvanen <samitolvanen@google.com>
> > > > >
> > > > > Previously, two things stopped Rust from using MODVERSIONS:
> > > > > 1. Rust symbols are occasionally too long to be represented in th=
e
> > > > >    original versions table
> > > > > 2. Rust types cannot be properly hashed by the existing genksyms
> > > > >    approach because:
> > > > >         * Looking up type definitions in Rust is more complex tha=
n C
> > > > >         * Type layout is potentially dependent on the compiler in=
 Rust,
> > > > >           not just the source type declaration.
> > > > >
> > > > > CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
> > > > > CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS=
, allow
> > > > > it to do so by selecting both features.
> > > > >
> > > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > > Co-developed-by: Matthew Maurer <mmaurer@google.com>
> > > > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > > > ---
> > > > >  init/Kconfig  |  3 ++-
> > > > >  rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
> > > > >  2 files changed, 34 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/init/Kconfig b/init/Kconfig
> > > > > index c1f9eb3d5f2e892e977ba1425599502dc830f552..b60acfd9431e0ac2b=
f401ecb6523b5104ad31150 100644
> > > > > --- a/init/Kconfig
> > > > > +++ b/init/Kconfig
> > > > > @@ -1959,7 +1959,8 @@ config RUST
> > > > >         bool "Rust support"
> > > > >         depends on HAVE_RUST
> > > > >         depends on RUST_IS_AVAILABLE
> > > > > -       depends on !MODVERSIONS
> > > > > +       select EXTENDED_MODVERSIONS if MODVERSIONS
> > > > > +       depends on !MODVERSIONS || GENDWARFKSYMS
> > > > >         depends on !GCC_PLUGIN_RANDSTRUCT
> > > > >         depends on !RANDSTRUCT
> > > > >         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> > > > > diff --git a/rust/Makefile b/rust/Makefile
> > > > > index a40a3936126d603836e0ec9b42a1285916b60e45..80f970ad81f7989af=
e5ff2b5f633f50feb7f6006 100644
> > > > > --- a/rust/Makefile
> > > > > +++ b/rust/Makefile
> > > > > @@ -329,10 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.=
rs: private bindgen_target_extra =3D ;
> > > > >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/he=
lpers.c FORCE
> > > > >         $(call if_changed_dep,bindgen)
> > > > >
> > > > > +rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D=
|B)/ && $$3!~/__cfi/ { printf $(2),$(3) }'
> > > > > +
> > > > >  quiet_cmd_exports =3D EXPORTS $@
> > > > >        cmd_exports =3D \
> > > > > -       $(NM) -p --defined-only $< \
> > > > > -               | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "E=
XPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
> > > > > +       $(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$=
3) > $@
> > > >
> > > > I noticed a nit:
> > > >
> > > > Both of the two callsites of rust_exports pass
> > > > '$$3' to the last parameter instead of hardcoding it.
> > > >
> > > > Is it a flexibility for future extensions?
> > > >
> > > > I cannot think of any other use except for printing
> > > > the third column, i.e. symbol name.
> > >
> > > Good catch, the last parameter isn't necessary anymore. It was used i=
n
> > > early versions of the series to also pass symbol addresses to
> > > gendwarfksyms, but that's not needed since we read the symbol table
> > > directly now.
> >
> > If you submit a diff, I will squash it to 5/5.
> > (You do not need to input commit description body)
>
> Thanks, here's a diff that drops the last parameter.

Squashed.
Thanks!




--=20
Best Regards
Masahiro Yamada

