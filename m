Return-Path: <linux-kbuild+bounces-1904-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E4F8CA744
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 May 2024 06:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B957F281E9A
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 May 2024 04:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6E023777;
	Tue, 21 May 2024 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAvFdIIa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F299C210E4;
	Tue, 21 May 2024 04:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716264920; cv=none; b=uoqiJEsZpvRdF6JZ7noRr8AsI3BsT55TtESX3bzSEw7jUGCAynOxOEn/DTJ0pqOw5CJyWgDDZUWSAyTv09seeYoBqTAQNOAsNbpW5WkmHqjwWzpN8AlbxPvaW0hj+N5xLUm0OhPjSY7ejrf6mTe7hni88lzgJFYRbG/rmdZ3OIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716264920; c=relaxed/simple;
	bh=ZLMQim0b27vvKLlAakfM9liuAkhebuAx7GW5o3VAU5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZgA/rJITsz0n1YC7SI/D9WToMlzv8dVP985elIKxdFQNJkTT7LObQ7/XSBT5t4l60eMtL+w15c7CZebb8rrZc5UD4ChNYZyVAmeqV3+spSy5UlMv+2rhxhezTH6yG8PBEF+JnBI2DqyvNZ/KoCH7Lb23q1TXAcwiTRiLpD7GU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAvFdIIa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97258C4AF0A;
	Tue, 21 May 2024 04:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716264919;
	bh=ZLMQim0b27vvKLlAakfM9liuAkhebuAx7GW5o3VAU5E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AAvFdIIa62aHZqk2WwB1k2rH7MSFFeheUO4UGa31iZgjxzWhnfzfbdXvWBSBaR/0k
	 Wmxg7aUUOq2gBLZpar58Z1SqyIvbBIQpwGVWkehmuit1lmyJv3R68YfmzXu+kpuikJ
	 2Ama4H4WnbU4knUSEKgX1bz6qRZ1l1LMZ5q9l3SNPaRxyxn3L+9fLJw171NSUsZZE4
	 sbzaGjsN1CT8hARONz22tV1iCOrBpvAIUliy/CYiTtXdUDrrN2rcd6INRzGgzFgs+D
	 60Xb4O0OXpCrQkuWQ/VkPlNyiK7mR1yeQaMHutZwyTEeW+S2IzuSs/HEdpzYb+An/V
	 QDLrDR2qdgqhw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51f72a29f13so4817248e87.3;
        Mon, 20 May 2024 21:15:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3vMowg2KmdYoy8UIro5/i+csXvasGcLITEiP/pJHcVJ6VpnSzM4nP6XvZ9UNusiGSOi9btNzA/abPKS0lOy6ovRhqXs4//cqHe6eVzKbOQzCoQX5jvsbRknncP2WNVDbdUjRpBh8Afz/fDuka9Ip+mNecKObCNV9ACW57VzrDT/JUzvAAMC9E3eY=
X-Gm-Message-State: AOJu0YxI6xwMbU7Kjz2UxC/9R+8fI2+g21IePcQzl3FW9UEStBSFf00w
	rkpjL3+jXhglsFqsFxx62d4kaQEIoISFiHiIbD8fEg0EOrL5AQDlMZ0/vgRT+WVoSmGL2FWcSAs
	1Nvv03yRc7Wk0rDJPkKTA2jtDh/o=
X-Google-Smtp-Source: AGHT+IFERR+XMF96W4SPi3XHkk3UQctvgLTXKkG1ygvj6FlJ+ABpgu+t9Zh29tpfT+a9yTz5hr7oL9PgCDtM3MhVShU=
X-Received: by 2002:ac2:4209:0:b0:51f:567b:c398 with SMTP id
 2adb3069b0e04-5221006fe6fmr18145163e87.28.1716264918252; Mon, 20 May 2024
 21:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519211235.589325-1-ojeda@kernel.org> <20240519211235.589325-2-ojeda@kernel.org>
In-Reply-To: <20240519211235.589325-2-ojeda@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 21 May 2024 13:14:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNATPx2wTEM=KDmGtcH8vVTB4suOhh-CUQKP54F8wtPWDiw@mail.gmail.com>
Message-ID: <CAK7LNATPx2wTEM=KDmGtcH8vVTB4suOhh-CUQKP54F8wtPWDiw@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: rust: apply `CONFIG_WERROR` to all Rust targets
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2024 at 6:12=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Make all Rust code (i.e. not just kernel code) respect `CONFIG_WERROR`,
> so that we keep everything warning clean.


Rust started to do something different from C.


KBUILD_HOSTCFLAGS is not affected by any CONFIG option.

The reason is because HOSTCC is needed for building Kconfig.
If the flags for HOSTCC is changed by a CONFIG option,
it would be a chicken-egg problem.
Also, some host programs might be compiled even
without .config at all. (e.g. scripts/unifdef)


I know Rust will not become a part of the core infrastructure
of the build system, but IMHO, host programs should not be
affected by any CONFIG option.

I do not like this patch.






>
> In particular, this affects targets in `rust/` (`RUSTDOC H`, `RUSTC TL`,
> `RUSTDOC T`, `RUSTC T` and `RUSTC P`), plus host programs and any others
> we may add later.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> This one requires the `rusttest` warning cleanup at
> https://lore.kernel.org/rust-for-linux/20240519210735.587323-1-ojeda@kern=
el.org/
>
>  Makefile                   | 4 ++--
>  scripts/Makefile.extrawarn | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index fba567a55607..2d0ea441cb9c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -469,7 +469,7 @@ export rust_common_flags :=3D --edition=3D2021 \
>
>  KBUILD_HOSTCFLAGS   :=3D $(KBUILD_USERHOSTCFLAGS) $(HOST_LFS_CFLAGS) $(H=
OSTCFLAGS)
>  KBUILD_HOSTCXXFLAGS :=3D -Wall -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
> -KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo \
> +KBUILD_HOSTRUSTFLAGS =3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo \
>                         -Zallow-features=3D $(HOSTRUSTFLAGS)
>  KBUILD_HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
>  KBUILD_HOSTLDLIBS   :=3D $(HOST_LFS_LIBS) $(HOSTLDLIBS)
> @@ -560,7 +560,7 @@ KBUILD_CFLAGS +=3D -fno-PIE
>  KBUILD_CFLAGS +=3D -fno-strict-aliasing
>
>  KBUILD_CPPFLAGS :=3D -D__KERNEL__
> -KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
> +KBUILD_RUSTFLAGS =3D $(rust_common_flags) \
>                     -Cpanic=3Dabort -Cembed-bitcode=3Dn -Clto=3Dn \
>                     -Cforce-unwind-tables=3Dn -Ccodegen-units=3D1 \
>                     -Csymbol-mangling-version=3Dv0 \
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 48114e91c386..990890821889 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -26,8 +26,8 @@ endif
>
>  KBUILD_CPPFLAGS-$(CONFIG_WERROR) +=3D -Werror
>  KBUILD_CPPFLAGS +=3D $(KBUILD_CPPFLAGS-y)
> -KBUILD_RUSTFLAGS-$(CONFIG_WERROR) +=3D -Dwarnings
> -KBUILD_RUSTFLAGS +=3D $(KBUILD_RUSTFLAGS-y)
> +rust_common_flags-$(CONFIG_WERROR) +=3D -Dwarnings
> +rust_common_flags +=3D $(rust_common_flags-y)
>
>  KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) +=3D -Wno-array-bounds
>
> --
> 2.45.1



--
Best Regards

Masahiro Yamada

