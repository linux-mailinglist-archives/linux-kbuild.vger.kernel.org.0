Return-Path: <linux-kbuild+bounces-5431-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2D7A098A9
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 18:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1646188F1AE
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 17:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0612135A5;
	Fri, 10 Jan 2025 17:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4W/cGED"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED6F212B1C;
	Fri, 10 Jan 2025 17:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736530649; cv=none; b=TYWP1/6PN8QuqFgVoKFBkvMI7dcn3qapUQaXjiS5SKp+5fCRPyFJTbDN7g7c5JP1FuIo3Ke5wfJuZhqmHXaitLYp8OEIZe/oRxeetHyctyr7t23W1VhXcGjze+hGB5WWyTiAJeHDs0eUIdusw4UzGzHw4u5/tT8FOBfvNpDaMEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736530649; c=relaxed/simple;
	bh=IRPwSRHuH81YJdNFzl1Pg7yOjJzF2yJEzlfjaQpesVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YXOB0eMORB0/JGToMlDyPy7jS2OiKP2VJ6rGXjidcoVqNKMp5RUxZwrAo/whH1L4ps26lfRQmhao4svy/77DKI8OxqtScvwwqmyEGDz7u15GcfQXZ01BHm6WTbGT8UAHZretBZHj41N2Dble9i82zHxdJ1bAhG2SMVvzvEOgKmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4W/cGED; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1142EC4CEEB;
	Fri, 10 Jan 2025 17:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736530649;
	bh=IRPwSRHuH81YJdNFzl1Pg7yOjJzF2yJEzlfjaQpesVU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l4W/cGEDZ8qNdGBkeWPFTDlr9S6krniSBjsnOCrZPGztuLVU/Aa1S3GOv5KcNs8Bn
	 QCcFTXrcSaZ4erJ51Lvn18fz7s32nElxlggKsgSzh0BUD3Ulb8pxzdudhMgcuHg99c
	 ymnVm7U5ofXviTQO9CRf+3JqDETbqyQxJYY26J+bi/OcyxNNbKicWbxccDnSB3rI5p
	 GMbKOcOGleeAM3gO4amKHJu66ojJZ88IdFnP6LG102BJaVuCzckzrvEtp6ZEpR8B2c
	 e5hlPuvpV0ovHe5MfY35t4rcZhq6hOWgFvSdieBgmLjK1lx5NwY3W2nEycfXT7yY/Q
	 /22RAgaqG5KzA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54025432becso2194760e87.1;
        Fri, 10 Jan 2025 09:37:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUT91SXvZmP+Cb+IPNh76Lw9hKT6fELYW00XErAYz4g7iDD0VvMkYA1LzPyHdWGWIewv+9j4S12aQUFthwo@vger.kernel.org, AJvYcCW695x+YV3fNFWN0+f4dFR5YGzfkZrx5rAq4aGmYvAOqgKKhL4BHKvfliW0/ahmQp+1Le4Av+EECtBoGGA=@vger.kernel.org, AJvYcCXH4B+e7dYDZBwpnRAHoEsvWfr+f2heYqVWHMI1AxwSSkV/7Us13FY7/QETVQ3O+GwQ1ZLng9noZmZE2Z0xHEg=@vger.kernel.org, AJvYcCXszOU2jRZAK0eIL8N7dif8oc7u0HhBhDwFtzaOJQJOYiLqSSJqeJp5U/DaE64SskgGHGufcayZHsUsIgUE4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVPSSEzQEQ3EXQx5jXbnCcwPmaQdrAQJRIOLs5KGknOr6zujQ1
	8joN40Qbiwbw1n2PZBJ6/ZBU6nmdIrgfmM301x9LEC0j6uhkWwx4m+gbLuEMmtxo//w8ua9Wrrc
	XPt3GkT0gV3Vstr2Au0YXT+1dMmU=
X-Google-Smtp-Source: AGHT+IEDuwtPJTKi5T6rab8LMrZJbFdXj2hrj2sIJdU825SeM4490F0nx/OYIkDpXtKefTMH4AV0P+dPqO6Oj9m2YkM=
X-Received: by 2002:a05:6512:3c82:b0:542:622f:124 with SMTP id
 2adb3069b0e04-5428444d202mr4033935e87.0.1736530647497; Fri, 10 Jan 2025
 09:37:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103204521.1885406-20-samitolvanen@google.com>
In-Reply-To: <20250103204521.1885406-20-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 02:36:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT6QcJokDPS2gcuFJwTRRpTeUrr4Px9Pex=JaG0E3AGzg@mail.gmail.com>
X-Gm-Features: AbW1kvbi-2LAf1o1DzIktor0yXiu1NnaMx78ysuyBZ-qV1TNRUfpTR_JzEcve54
Message-ID: <CAK7LNAT6QcJokDPS2gcuFJwTRRpTeUrr4Px9Pex=JaG0E3AGzg@mail.gmail.com>
Subject: Re: [PATCH v8 00/18] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 5:45=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> Hi,
>
> Here's v8 of the DWARF modversions series. The main motivation is
> modversions support for Rust, which is important for distributions
> like Android that are about to ship Rust kernel modules. Per Luis'
> request [1], v2 dropped the Rust specific bits from the series and
> instead added the feature as an option for the entire kernel to
> make it easier to evaluate the benefits of this approach, and to
> get better test coverage. Matt is addressing Rust modversion_info
> compatibility issues in a separate patch set [2] that depends on
> this series, and actually allows modversions to be enabled with
> Rust.
>
> Short background: Unlike C, Rust source code doesn't have sufficient
> information about the final ABI, as the compiler has considerable
> freedom in adjusting structure layout, for example, which makes
> using a source code parser like genksyms a non-starter. Based on
> earlier feedback, this series uses DWARF debugging information for
> computing versions. DWARF is an established and a relatively stable
> format, which includes all the necessary ABI details, and adding a
> CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
> reasonable trade-off as most distributions already enable it.
>
> The first 15 patches add gendwarfksyms, a tool for computing symbol
> versions from DWARF. When passed a list of exported symbols and
> object files, the tool generates an expanded type string for each
> symbol and computes symbol versions. gendwarfksyms is written in C,
> uses libdw to process DWARF, and zlib for CRC32. Patch 16 ensures
> that debugging information is present where we need it, patch 17
> adds gendwarfksyms as an alternative to genksyms, and the last patch
> adds documentation.
>
> v8 is based on 6.13-rc5, and for your convenience, the series is
> also available here:
>
> https://github.com/samitolvanen/linux/commits/gendwarfksyms-v8
>
> If you also want to test the series with actual Rust modules, this
> branch adds v13 of Matt's modversion_info series:
>
> https://github.com/samitolvanen/linux/commits/rustmodversions-v8
>
> Sami
>
>
> [1] https://lore.kernel.org/lkml/ZnIZEtkkQWEIGf9n@bombadil.infradead.org/
> [2] https://lore.kernel.org/lkml/20250103-extended-modversions-v13-0-35d8=
7c65ee04@google.com/
>

Applied to linux-kbuild.
Thanks.


--=20
Best Regards
Masahiro Yamada

