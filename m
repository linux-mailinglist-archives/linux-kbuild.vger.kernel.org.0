Return-Path: <linux-kbuild+bounces-5257-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE259FD0A4
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 07:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F0103A0594
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 06:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2223E1F5F6;
	Fri, 27 Dec 2024 06:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pk4tX6D2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB15D7082D;
	Fri, 27 Dec 2024 06:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735282199; cv=none; b=lrlNUTLABUGOLSlo+Af7P9VhLYrFXHD8sO8cPfx89c6FZAv7uukQUuDcUZvc/nOTrd6QMaz9uHGokkD9LQoxk+S2aPz6707v162fFQbB3z8o1zrtUfadKdSj7jAMrZ+f+vLf2+sN11Vkma7h6um5fvad9wPCqdy6tFBqvDO4zbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735282199; c=relaxed/simple;
	bh=hoLcZ+iT2dPn/slVVxv5fcZZF+pgka9JveM30viNiMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcK7p1c4XiWw9Zy58H5pNlEP7rb8OfFOSWzE5HCFWibFQEbRYR2iJKloYNPal0nQ6Hg7OitbloUK7tiFUCiau7qafhL4lMeqCMZEf8llJk6IEMNoN0p6nV/fzX2jTUvAGwpBjAjx3E2I20R++SrBPGBus1E+NrLWWpY1yab0QCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pk4tX6D2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9F1C4CEDF;
	Fri, 27 Dec 2024 06:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735282198;
	bh=hoLcZ+iT2dPn/slVVxv5fcZZF+pgka9JveM30viNiMg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pk4tX6D29jsCMtwnAvNvxrSrih/vzfBSdcvD8vkIgdKLeLk9sATjFybus2OU9E9Sh
	 T/aNUr8TXUhInanpcfKjUANfyOS2V2WAxtgMiqPfuF/CH4qsiNwuUfYJzPVUuYSoIH
	 s9jkBwrUWn8yIzTVjvVZGY6TMZ4++SU6hWdQu/bpHcrxAeej4bsi2qZZyq318DSZjm
	 1yMiS2ZcrjBiCjIgK/FJNZV+tBNzQYXZYLRU+vscFJJub8e0ZVeVJ4XQRJOWwuJMl0
	 HOvLddb4jAJ3iZWn2VppuRz8yUxkbou4BRoGNUxpoCTGulKsack2zq1gJJrczEsbDp
	 7EWiYQtqb1KnA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401c52000dso8057190e87.3;
        Thu, 26 Dec 2024 22:49:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQwoR6cc3qcjbB97WN500DQsvEMwTiE5VfltZwePHQyoNCKihGd2XQraURt+68MnGYEggG1736srd9LMTK@vger.kernel.org, AJvYcCVu2vYZtwPnMY1lHyMqc1WkDARXLFAvNeYqoc0WkyalKiXIKNxJOoHwEODShXmyKOpbuxWVKfffL2k=@vger.kernel.org, AJvYcCXES1E8IhETp5Q9gG81edEpxtgzWcfuWCmUEneziPnXKdxZ3uEiTxWEYVI9y0+ONrFGMCiQwR0tiT7ZMoUs@vger.kernel.org, AJvYcCXJTWu4QIX8vnetPd8AtDfRI646A3wc/K3RcK6fe/h1SPrMz7Y64yHa6oDcxn6RdLSQJWxeqkNk3+4SOeJp4Nc=@vger.kernel.org, AJvYcCXrixZUEGfNo6aJuTj23yrGPOlMVgpn/hQNPof/7Wmm/akE69Ho9Bnz2ULnxhN5m79sBa6hYMidMlH4Go02fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI7XQElrfRPr64Kz8/9Ry+RaM7XEEJoNTXlPJduFJKwF0vb19a
	gzzdXSZ7ZhbYzWBk4ZTPZGBCI3kBiYiESRpfRK5wLANga4AGrp/4Bx/J05Hjp6+y5Sz2pxwVRaj
	NkjoY261A/xKEfkEblFkgPZY6HSg=
X-Google-Smtp-Source: AGHT+IEfRIbAUfDGKqjk6EcYuB0PBijqceiyA7AyuHs+mi/poGZ6JbhNivinK0tX7pp0w8VpBEdhwiU4O5CAAZ1FhBA=
X-Received: by 2002:a05:6512:e98:b0:541:21d7:7056 with SMTP id
 2adb3069b0e04-542295301b4mr8226939e87.17.1735282196979; Thu, 26 Dec 2024
 22:49:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com> <20241223-extended-modversions-v11-3-221d184ee9a7@google.com>
In-Reply-To: <20241223-extended-modversions-v11-3-221d184ee9a7@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Dec 2024 15:49:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNARGJ8UMaiGC71f_wfk5ZqwhV2WD_Zf3NsQuS-+u_uT-iA@mail.gmail.com>
Message-ID: <CAK7LNARGJ8UMaiGC71f_wfk5ZqwhV2WD_Zf3NsQuS-+u_uT-iA@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] modules: Allow extended modversions without basic MODVERSIONS
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

On Tue, Dec 24, 2024 at 5:13=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> If you know that your kernel modules will only ever be loaded by a newer
> kernel, you can disable BASIC_MODVERSIONS to save space. This also
> allows easy creation of test modules to seee how tooling will respond to


seee -> see


> modules that only have the new format.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  kernel/module/Kconfig    | 15 +++++++++++++++
>  scripts/Makefile.modpost |  1 +
>  scripts/mod/modpost.c    | 19 +++++++++++--------
>  3 files changed, 27 insertions(+), 8 deletions(-)
>
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 9568b629a03ce8289d3f3597eefc66fc96445720..5f701391ab12c7d1b3ca496c9=
b3443c5a76a8745 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -217,6 +217,21 @@ config EXTENDED_MODVERSIONS
>           The most likely reason you would enable this is to enable Rust
>           support. If unsure, say N.
>
> +config BASIC_MODVERSIONS
> +       bool "Basic Module Versioning Support"
> +       depends on MODVERSIONS
> +       default MODVERSIONS

Nit:

            default y

is simpler.


--
Best Regards

Masahiro Yamada

