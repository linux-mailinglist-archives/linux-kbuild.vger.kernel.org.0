Return-Path: <linux-kbuild+bounces-2925-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C1C94D5A9
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 19:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 921B1B2158D
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 17:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D111013775E;
	Fri,  9 Aug 2024 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8uwXq1L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A471A17557;
	Fri,  9 Aug 2024 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723225979; cv=none; b=TUkZCPW+JksNEjum3/r0EfWiL3C9/cWSHWrHIPIiMPj+Uzx8kNT9hsVdpSwOp1MyTfOILv8hLWS4hlvC4RS9h6corm+C7Uv5weqnK3yevE37/WaQhzi8U/sEV0S6Rvhk6J2+jEsF/JUV95wQKK2ZO3qWlduu3gUM/FdN3ozZ5HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723225979; c=relaxed/simple;
	bh=jMtYac4dR4k02uKgg4lNHbC4zSlTklq0SjeWT18JDGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMC1SeKuJYJnRu7M3+8og6F7U21BNJRlqkm9Xtovi+TySijcqzLdDXtZhKatOCS736l4GnofykBqFtz9n4ZvdIjQMWaUMBNRTXI1Rdyf6CGjUMALPH8Hi/1ggXMfMhtQLG8KgxZR4v2aT7UhTGLd9H5/S0F1c9t3pFdZAtPjO8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8uwXq1L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C87C4AF12;
	Fri,  9 Aug 2024 17:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723225979;
	bh=jMtYac4dR4k02uKgg4lNHbC4zSlTklq0SjeWT18JDGk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L8uwXq1LzkQ9Y57mvFzqMSJOIOzmiWH+2QIN9sEWe1YSa84/+ysj+f4yjhjMRbGJ8
	 hTcZ3TJi5V9fIn7FMHm2arff5tOQBlb6pEeaypaWaBBatwO6xTpSrn/vo6I7lXW4mm
	 hq8gWpzVm8vWoKMsUn4w22a+q6iULzLkAJCEKyucRyxELiMm//fSKYjd5dN77iD0Kl
	 z4C+3C5bSWP0aa4ENIv0grZvWkAnWZhtY+8pkUBit1SO0qJ4do4wmfF+kppDD87Aqc
	 JcQfg50oknQxZL+ahAHGYChBdTkpccwFdRztR67KF206dTFFfP25iK7YWx7lTxptXV
	 z3VZr3/dfoHVg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f136e23229so24936471fa.1;
        Fri, 09 Aug 2024 10:52:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNRWDUkfaUsjIV8EzFNhL8RLTzJ1PUpXz+Mzdem8cgJLvTCpFFyr2Kt2vu8DhPW/tIgb+nBuFvqaCSz+t74TtMxb5ezNmrcH4ygGMkQFLNGHB52UYHTuXr2PFUao7m8Gy5VKJZuvtZI/ZMfZg0Fd5vw9jMITfd5xjvOllW8zX+tfHqKw8j1j9JeJ8=
X-Gm-Message-State: AOJu0YyN6JjbcUnMHpIBDGG2U3MYY2MkpW/DkczS7uDmaUVjB9JJB0X7
	Rm0PDKcPsFRw2wYQ7oWDH19ovy7MuCQHZbgjtRrUCdsSex0DHtTfkojZI2wUX2Qq502wbMA7JpI
	5dGobmr/0GfMTX4KCvVks6EWmwYk=
X-Google-Smtp-Source: AGHT+IEwqpdYXSlEStF72lANKTDLjDv5MA/iYkZnY4xuBv/c6PJZjf87WsWBp9PxVh1d7TfGsKUhhiiuDQREpXANbzQ=
X-Received: by 2002:a2e:978b:0:b0:2f1:a337:958d with SMTP id
 38308e7fff4ca-2f1a6d1bca3mr18432351fa.24.1723225977981; Fri, 09 Aug 2024
 10:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org> <20240808221138.873750-3-ojeda@kernel.org>
In-Reply-To: <20240808221138.873750-3-ojeda@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 10 Aug 2024 02:52:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNATDZaGrqvugf7JBOvYvJTH=ZUacSvFZtiJW=9k24-wWHw@mail.gmail.com>
Message-ID: <CAK7LNATDZaGrqvugf7JBOvYvJTH=ZUacSvFZtiJW=9k24-wWHw@mail.gmail.com>
Subject: Re: [PATCH 2/6] kbuild: rust: make command for `RUSTC_VERSION_TEXT`
 closer to the `CC` one
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 7:12=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> `CC_VERSION_TEXT` is defined as:
>
>     CC_VERSION_TEXT =3D $(subst $(pound),,$(shell LC_ALL=3DC $(CC) --vers=
ion 2>/dev/null | head -n 1))
>
> Make `RUSTC_VERSION_TEXT` closer to that, i.e. add `LC_ALL=3DC` and `|
> head -n 1` in case it matters in the future, and for consistency.



Even if "rustc --version" starts to print multiple lines,
it will not cause an immediate problem.

$(shell ... ) (both Makefile and Kconfig) replaces a new line
with a space.

CONFIG_RUSTC_VERSION_TEXT is not broken in any way.
It would be just longer than we would expect.











>
> This reduces the difference in the next commit.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  init/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 47e2c3227b99..2f974f412374 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1926,7 +1926,7 @@ config RUST
>  config RUSTC_VERSION_TEXT
>         string
>         depends on RUST
> -       default "$(shell,$(RUSTC) --version 2>/dev/null)"
> +       default "$(shell,LC_ALL=3DC $(RUSTC) --version 2>/dev/null | head=
 -n 1)"
>
>  config BINDGEN_VERSION_TEXT
>         string
> --
> 2.46.0
>


--=20
Best Regards
Masahiro Yamada

