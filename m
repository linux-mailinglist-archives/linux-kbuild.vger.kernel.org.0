Return-Path: <linux-kbuild+bounces-5267-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F8F9FDBAC
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Dec 2024 17:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 236FC1883127
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Dec 2024 16:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8009B18E02D;
	Sat, 28 Dec 2024 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYKfeVE5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467642111;
	Sat, 28 Dec 2024 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735403343; cv=none; b=KLdXQJwdLL2pDsISlYrqjRd3qFDQ+2OWzWKBFbazpdZVK8arqUitheNYyxDVFAWhnfgstk0SLNvIXUMJssKP7B5wXDWtoA6PBzZCy7KkTgWmGbabfuQCdl3DOeKuAuLfR2PUyevkwLGDIxIYiUIixYu7Ey2o/j0J9dgzSyE4MYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735403343; c=relaxed/simple;
	bh=fELjdXfci/f3oqFrTANTWQpQItWmCHjVaGRvt5XorsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agYKu+yTz4Zkq8BicQbZtnaqxylBumnj52KhfvCky6XvBP67J0cIgeR2G+ijzpuwcWEcgl16r/dZ3X80gJZbhrrToitvxkn8XPndSkcRS6+jrpvA68nzdRwJo+PEv/TXirxwGxHnLT4o1yTUl3Ry/i+poQjWjDM6hNMAzm/TnhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYKfeVE5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20946C4CEE1;
	Sat, 28 Dec 2024 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735403343;
	bh=fELjdXfci/f3oqFrTANTWQpQItWmCHjVaGRvt5XorsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FYKfeVE5x7tNYxnPhaxlTGE36Um9i9E1v6TLyncVlcHWkBHUXAJD1B+uOsOCcJmi0
	 cigBLqOuvcDVFAoTSqas2sQ26jD/zTdOs7xtrLMzEdhCNDjut4Os70NrHlPtx+E4tC
	 BCaF8ru+0of7NjX7IJYMhEHhsz4rpCfuSlCJ/nHEdLJIyuzjkT940QZecyD5q3ngho
	 p/CukpXyfWidJdm324Ud0jViTcqiI5yccPDxaGINVMnEelXDJxS8AOGAj1AtMVQCcS
	 +EmjcfflKwGNSSqgceCWMPqMCP6Dr6sn/aIUUsqcNMMixrULqB/CQ+jxAc2eCMGCS3
	 qgixf9rNxtjnQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so12862321fa.3;
        Sat, 28 Dec 2024 08:29:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+JHPFCD64K3FVBPUce9ZzTT+b0sNaR1PPNt3iVgqYlRTy2ulRjK9sgEE0ja9E234ZGg2iOnoX+UhbmScbcw==@vger.kernel.org, AJvYcCW8M0kkctFuEVJCJPX+gLOjQPMF+non/JB24MHq/RnhxUR8mMr9L0N7pLNejKC1q7n4UEaXnSrEOLAhXxtV@vger.kernel.org, AJvYcCWz66y9u3W6M6IuZZNKhIhlF3twl8xFmIg2590LdkDupUGBSlohNbVePsj226cZllOgNQ9xG3GN08VpAsk=@vger.kernel.org, AJvYcCXen8Kqd+WQJftxbxikXdrZZWnhryBeWpOTCJWglsDzyJXqxz42u9J4yvlfDEiYupUszbhR48oaRKulyS1oSgM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7z158HceTESJxuZa7xvHRZpCfhIiFp3j0XKLj077YAi0vNgof
	+p9ZSgB/Qg1l06JTM9H2Lz5BUTtvjys/XqeYTaoDwc1ahJcpYEPVxN3yUDGxcNDzVHZdrmL+IOH
	4z/si+a6WxFHv5b74X8dGkTSNlZs=
X-Google-Smtp-Source: AGHT+IHRQ1+8BgTqaH4EqEuyozTsZbSR8wnAt/ZYNGhZ0LwS0KidYtqAFAaBQ66v0Y70jKqULyfNGocHlh3tOhXVsJw=
X-Received: by 2002:a05:6512:ba9:b0:542:232c:d3eb with SMTP id
 2adb3069b0e04-54229530111mr7302108e87.19.1735403341601; Sat, 28 Dec 2024
 08:29:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com> <20241219210736.2990838-22-samitolvanen@google.com>
In-Reply-To: <20241219210736.2990838-22-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 29 Dec 2024 01:28:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=kBi_LN7UkO_qzUQh8fMd1BMf=ZZMQMPph5smZRzSSQ@mail.gmail.com>
Message-ID: <CAK7LNAR=kBi_LN7UkO_qzUQh8fMd1BMf=ZZMQMPph5smZRzSSQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/18] gendwarfksyms: Add address matching
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

On Fri, Dec 20, 2024 at 6:07=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symb=
ols.c
> index 7adf2ed9b89b..98febb524dd5 100644
> --- a/scripts/gendwarfksyms/symbols.c
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -6,8 +6,39 @@
>  #include "gendwarfksyms.h"
>
>  #define SYMBOL_HASH_BITS 12
> +
> +/* struct symbol_addr -> struct symbol */
> +static HASHTABLE_DEFINE(symbol_addrs, 1 << SYMBOL_HASH_BITS);
> +/* name -> struct symbol */

I think this comment addition should belong to 01/18 instead of 02/18.


>  static HASHTABLE_DEFINE(symbol_names, 1 << SYMBOL_HASH_BITS);





--=20
Best Regards
Masahiro Yamada

