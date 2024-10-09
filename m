Return-Path: <linux-kbuild+bounces-3991-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF9C996759
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 12:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFEDC1F2499F
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 10:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A658418E34D;
	Wed,  9 Oct 2024 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ou7NPQvy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FF933CD2;
	Wed,  9 Oct 2024 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469975; cv=none; b=gxf9ejbB+6VRdGXVPRyoTNNzKrn3MsQv+mW7jo+z6a9m+OYH7V5NJjz25o1x2NmPHBGvni8ah7DQ7jZ1IxqwvVUFMBSTZQMktUbwDxRII+PWiRDVw7HYy/QDNVEQzKWMYhCAF1xYMT7erAr1E3HC4I6hoeWyr7brGryZvPjLxWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469975; c=relaxed/simple;
	bh=OIrN8Kx87vTz4GuQLWnjR7F4ybWENMB1KU2VVq0/hn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9W5dC/Fk7WxOraNLjcrBkrSTQyBRpdrRvs+4ZDyfb8sQYcChqwSSfR1plp9/tsMHcog+tXDad+pXSF45KpOkoQcpsV1JDy5wGE4n20m0o1r7qZo9xuqY3EVe/skTpWODpelGSLSamVleyoEsGCz5R6YwMl1xfvZ4n0pZUQLRHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ou7NPQvy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500F4C4AF09;
	Wed,  9 Oct 2024 10:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728469975;
	bh=OIrN8Kx87vTz4GuQLWnjR7F4ybWENMB1KU2VVq0/hn4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ou7NPQvy/7/EvmwvsqepI72a4jL/vwRPcJHafJiruENF7ClxN0v8ZQMrzhMZcjmyZ
	 Iyvlxe9oqSYQGMgK3PjH0FEZ30Td1jyAGwVtvI44hUu2+H8Fc3xrsaAhWqaZtx0Ept
	 tCgpZhjhMeV1jInuo3pSU691RuathukC2XzHCAIPcsW4bftCL7bFuBdkEgfZ6flZeS
	 fukGVumfg6e1IBhU6n4dfyA4erEO6qcA8R0wB1gZddSaxFPM20mylIiRkosSqqvjcI
	 UxPr0JguG0LVDfINyC6/SBJnJtqOHcmWfwqk6fpxZa7HUh+kxtGabW3wbCPrEG8ZQs
	 lLmsny+hpgJSA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso93482501fa.1;
        Wed, 09 Oct 2024 03:32:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqh/k5PNLi6Qvq+zZ0O6ubay7EcDPy80Vt7hGpZoz9keLVWQSH7lpy/k/qUHqn1XnJEhE8iMP4Wfdi94P+xfs=@vger.kernel.org, AJvYcCWhVkoMu/XFdwKTEOQ4FYNwoevCAPgUkbTgVNNhF6EJXMz9nTyTRN5eXsdQrdc3wVzDPlbUj+VmXzRtmkw=@vger.kernel.org, AJvYcCWoXXSX0uwkpdP+Me06OHCn8JatxXe9LEL92ljp1jzBmnNQ1r/jHLD9Cs9KuzmYRvnIs3NI/rifR4abY3GN@vger.kernel.org
X-Gm-Message-State: AOJu0YyCLoO4tMw0ZMQClIFQr3nV4z2GDfB3kExe314T5M4XZ+H4eIAK
	SwQyyLT5duCiiZHJznpQ5nGec5P8RwDzU2iStT2+ZFsj9iH80KLPHThhm+vQN7Fl1j0FGCfnl6/
	/DsEPdaMDEaioC4oBaLs0JXchKF4=
X-Google-Smtp-Source: AGHT+IFfzTwZej1mi4Oc9Clazlv/HLVQdAr/ychfDkUy9UXuU7dztsfhmxAgkmwTeU3MZxUBJ4z77rRSwBjOYhkQqp8=
X-Received: by 2002:a2e:be88:0:b0:2f3:eca4:7c32 with SMTP id
 38308e7fff4ca-2fb187f36a0mr18940681fa.38.1728469973942; Wed, 09 Oct 2024
 03:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
 <CAK7LNAQ2EY8Uf1APvhZT9XpZ6=8FhAitqePLiCP1S6mBgnXSKQ@mail.gmail.com> <CAH5fLgiZ5awKAm-CHc8qgsQUYtNMWdSEeKC2wuDFh2NUhVmsAA@mail.gmail.com>
In-Reply-To: <CAH5fLgiZ5awKAm-CHc8qgsQUYtNMWdSEeKC2wuDFh2NUhVmsAA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 9 Oct 2024 19:32:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_22jQzsWDswChAMaE3GhT-1eqE9ngj61NeFz40SNxGw@mail.gmail.com>
Message-ID: <CAK7LNAS_22jQzsWDswChAMaE3GhT-1eqE9ngj61NeFz40SNxGw@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 4:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Tue, Oct 8, 2024 at 9:00=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > On Wed, Oct 9, 2024 at 2:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> > > diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> > > index 057305eae85c..08d5b7177ea8 100644
> > > --- a/scripts/Makefile.compiler
> > > +++ b/scripts/Makefile.compiler
> > > @@ -21,6 +21,7 @@ TMPOUT =3D $(if $(KBUILD_EXTMOD),$(firstword $(KBUI=
LD_EXTMOD))/).tmp_$$$$
> > >  # automatically cleaned up.
> > >  try-run =3D $(shell set -e;              \
> > >         TMP=3D$(TMPOUT)/tmp;              \
> > > +       export RUSTC_BOOTSTRAP=3D1;       \
> >
> >
> > try-run is not Rust-specific.
> >
> > Is there any reason why you did not add it
> > to __rustc-option?
> >
> >
> > __rustc-option =3D $(call try-run,\
> >        RUSTC_BOOTSTRAP=3D1 $(1) $(2) $(3) --crate-type=3Drlib
> > $(srctree)/rust/probe.rs --out-dir=3D$$TMP,$(3),$(4))
>
> I had an explanation for this in the commit message, but it looks like
> it got lost when I rewrote it for v2. Anyway, the reason is that I'd
> have to modify both __rustc-option and rustc-option-yn to do that, and
> putting it here seemed more future-proof against making the same
> mistake in any rustc-* commands added in the future.


One solution is to delete rustc-option-yn since there are no users of it.

Another solution is to refactor the code.

Either way, there is no good reason for code duplication.


If you keep rustc-option-yn, you can rebased v3 on top of this patch:
https://lore.kernel.org/lkml/20241009102821.2675718-1-masahiroy@kernel.org/=
T/#u




>
> But I realize that it's not clear-cut. I'm happy to move it if you prefer=
,
> or perhaps add a try-run-rust. Let me know what you think.
>
> > I guess it is still suspicious because the top-level Makefile
> > exports RUCTC_BOOTSTRAP.
>
> Moving the declaration of RUSTC_BOOTSTRAP to the top of the Makefile
> seems to fix it. I guess moving it is probably a better solution than
> adding it in scripts/Makefile.compiler.



I prefer to keep RUSTC_BOOTSTRAP close to other compiler flags.


>
> Not that I really understand why that is. The existing invocations are
> in scripts/Makefile.kasan which is invoked after RUSTC_BOOTSTRAP is
> declared.


Miguel gave perfect explanation.
https://lore.kernel.org/linux-kbuild/CAK7LNARDkS6uAHcdyZatc2SB7A66TWGfKZWNk=
YOoa7i3jo3QqA@mail.gmail.com/T/#m899bc321ae80d9c4a904680709c9a53f09e51b9e


>
>
> Alice
>
--
Best Regards
Masahiro Yamada

