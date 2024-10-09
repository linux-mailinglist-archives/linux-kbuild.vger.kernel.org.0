Return-Path: <linux-kbuild+bounces-3992-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655BB996785
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 12:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21BA828AAF4
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 10:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A2D18FDD0;
	Wed,  9 Oct 2024 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIa2VsCw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C518D650;
	Wed,  9 Oct 2024 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728470677; cv=none; b=dg6RNtgD3jSdw2h2q4gSydIIqya7V+71ssyRN2n84n+Br5eNp0ha+V5cHvljCufsy7EOi8Ac3ipgNvsiuQ5aoUAFtCutEmhx8soBaP5MvJMOTfVI1xItc8Q4LKZqfYy88JrnW3Efqwyq++GOsvmPQu7fjVe2cNP7QHTciyHQ8jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728470677; c=relaxed/simple;
	bh=6DNRjjiuWItLVAtUEXcRNRDfNTzu6cnxXjDZm10mdws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSz4XEEW8krb+0+ZLlTvRw2Jibh//vwUuXdMC+jk7zgXuSVYVKOpiLD+/v5OuGM/gO4G7N9YJe2K5oQJG4R4YQBv8BmHlMuX3U9AjwxpWHQ8UiJORmFAXBqyVrFR3wjnSuzs1ekiGhSt/bO8QOyIzV6hb/9GLolt0F1o5c8FsNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIa2VsCw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74403C4CED1;
	Wed,  9 Oct 2024 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728470676;
	bh=6DNRjjiuWItLVAtUEXcRNRDfNTzu6cnxXjDZm10mdws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mIa2VsCwMk/ZPTg52m+LixbpyNIDU/zaPSHNNgukePKq0XNAIrh4IbILAFvXskJJr
	 miEP+fMIA1j3WRJMNWicbOTo+23nFZGlRX7DOqUQodxV92hdPy9CUh1V5su7L9pnt7
	 xUE+j2hDyDUgweJp8D3rvHKp6oqwIHahpfI/8GYeykuMk2bP2D0YkBHpI6MOzdVcyQ
	 XSGvLHUNNdIJLpHDQEPiAFIvy5t8t1jNNwfC4kQZJBCXpauUdxHp4RWxo3jeAXNDyQ
	 zYxDweuCUebDhKfs2vTtfgvGRx7zwrMCA3/W6q8TEoELrPeotThtcU9+Ls0VnK48Nm
	 kTDK8gwE3kllQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fad15b3eeeso71207161fa.2;
        Wed, 09 Oct 2024 03:44:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWhOcvI3x6/QugxOKiECpqdIXvynmM5otHThxEmJqUWEfnzqV/xVmW4p9ttbYahqLdpZoHpjEfeace1Kc=@vger.kernel.org, AJvYcCWrApLqKRV+ndlX/E36hIGGJ0izPqPZlMLfrnKKJC26QR91imIEQ/Gq4QfTF90ga7QP4JYY1FZwbWXUfL4oVjY=@vger.kernel.org, AJvYcCXT2gVn02EfhZY9Tz5BIZDvCDeS+kL6dghaSz+WPZQs+XIoPKwCg5t8JjVnvyCF5ALMMskgyv7Alcbv2t3A@vger.kernel.org
X-Gm-Message-State: AOJu0YxlK2mL795JxURLc69rgh9Zmim1vUbx2g1jaIZMHHN8t5RLpYoL
	ZPp7Abx5pNr8Rx1KVwoENmYgHoB5ZhUTjmegRzb6pqsCRQTPm1vetkpj8Bynfft8bJqnkP5Kb2M
	bAxFvrnmixmZUm9dCY7Ld6eLHHRw=
X-Google-Smtp-Source: AGHT+IH/hrzfj0Chh2hMDxqZ81duB4ZEsCvd4cEHFP4AxdzLcr9yIgPpCxuoCNa/FNaG199fV7Tc/ylu70rNF8Ezhts=
X-Received: by 2002:a2e:bc19:0:b0:2fa:cf73:a2fb with SMTP id
 38308e7fff4ca-2fb1873f1d8mr12321241fa.2.1728470675124; Wed, 09 Oct 2024
 03:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
 <CAGSQo02oVWxazut2nyh-9K9gK+937zKCfYMBkT4EQE2CddvZtg@mail.gmail.com>
 <CAGSQo01FErmGbeu-+_kRfpQrO4xkaGuSo_zAXTmGHZuFVYXpNw@mail.gmail.com>
 <CANiq72=40bsTubsXMqn_Jjx8TdfuuE9Z+eQNFvYrVXnX9S1-zg@mail.gmail.com>
 <CAGSQo03_GZCJrnp9WPxo2T3GJz8TCtucHNx6_rAr7xfJ6ybukA@mail.gmail.com>
 <CANiq72kN-LiTcCjGXp6Gg=51SP+mp12CjAunt2qk4J2ngdussg@mail.gmail.com>
 <CAH5fLgjwuGUpKogOVUL4+fUW0-xWM+3ZQ+WmSQ+J00G6+uR9bQ@mail.gmail.com> <CANiq72k4XcxHQitFzogyeJmX83qFbXo2hwcwPvFjWMDUYhCi4g@mail.gmail.com>
In-Reply-To: <CANiq72k4XcxHQitFzogyeJmX83qFbXo2hwcwPvFjWMDUYhCi4g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 9 Oct 2024 19:43:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNATxzHKNm+z9_BkJZf0=tA_iSQWowB6j3ef6GVP8M+mvyQ@mail.gmail.com>
Message-ID: <CAK7LNATxzHKNm+z9_BkJZf0=tA_iSQWowB6j3ef6GVP8M+mvyQ@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Matthew Maurer <mmaurer@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 7:01=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Oct 9, 2024 at 11:23=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Miguel, can you link this issue? I don't think I saw it.
>
> https://github.com/Rust-for-Linux/linux/pull/1087#issuecomment-2218445303
>
> (It was in the Lore message I linked yesterday, sorry, I should have
> been more explicit)
>
> > Masahiro, are you able to clarify how to pass TMPOUT to rustc?
> >
> > __rustc-option =3D $(call try-run2,\
> >        $(1) $(2) $(3) --crate-type=3Drlib $(srctree)/rust/probe.rs
> > --out-dir=3D$(TMPOUT),$(3),$(4))
> >
> > Should I use $(TMPOUT) or $$TMPOUT for this case? Right now, only TMP
> > is defined inside try-run. I am assuming that there is a reason for
> > having TMP be defined in try-run, rather than just using $(TMP)
> > everywhere. Does the same reason apply to TMPOUT? Should I add a
> > TMPOUT=3D$(TMPOUT) inside try-run?
>
> `TMPOUT` is defined already in that `Makefile`, thus you can directly
> expand it. However, `TMP` is defined inside the `shell` function, and
> thus `$$TMP` is used so that that script (inside the `shell`) expands
> it instead.
>
> This is why Masahiro was saying that the `TMPOUT=3D$(TMPOUT)` was
> unnecessary, i.e. it would work, but we can just expand it directly.
>
> Something like this, combining everything [1] seems to work for me.
>
> i.e. passing the file inline, `RUSTC_BOOTSTRAP=3D1`, avoiding an output
> file, keeping `--out-dir` for intermediates files. I added using a
> null sysroot too (and skipping if already given, since that is an
> error).
>
> I will test it a bit more with KASAN etc.
>
> Cheers,
> Miguel
>
> [1]
>
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 057305eae85c..3ce6a808764a 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -76,7 +76,9 @@ ld-option =3D $(call try-run, $(LD) $(KBUILD_LDFLAGS)
> $(1) -v,$(1),$(2),$(3))
>  # __rustc-option
>  # Usage: MY_RUSTFLAGS +=3D $(call
> __rustc-option,$(RUSTC),$(MY_RUSTFLAGS),-Cinstrument-coverage,-Zinstrumen=
t-coverage)
>  __rustc-option =3D $(call try-run,\
> -       $(1) $(2) $(3) --crate-type=3Drlib /dev/null --out-dir=3D$$TMPOUT
> -o "$$TMP",$(3),$(4))
> +       echo '//!\n#![feature(no_core)]#![no_core]' | RUSTC_BOOTSTRAP=3D1=
\
> +               $(1) --sysroot=3D/dev/null $(filter-out
> --sysroot=3D/dev/null,$(2)) $(3)\
> +               --crate-type=3Drlib --out-dir=3D$(TMPOUT) --emit=3Dobj=3D=
- -
> >/dev/null,$(3),$(4))
>
>  # rustc-option
>  # Usage: rustflags-y +=3D $(call
> rustc-option,-Cinstrument-coverage,-Zinstrument-coverage)
>


Could you please add a comment line to remember the future clean-up?

e.g.

# TODO: remove RUSTC_BOOTSTRAP=3D1 when we raise the minimum GNU Make
version to 4.4



I also like the commit description to record that
RUSTC_BOOTSTRAP=3D1 is needed for GNU Make prier to commit 98da874c4303
("[SV 10593] Export variables to $(shell ...) commands"), i.e.,
GNU Make 4.3 or older.




--
Best Regards
Masahiro Yamada

