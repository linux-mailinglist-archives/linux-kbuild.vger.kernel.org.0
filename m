Return-Path: <linux-kbuild+bounces-4033-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2153D99843C
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 12:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D4C6B2436C
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 10:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E501C1723;
	Thu, 10 Oct 2024 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRgFlN67"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1D71BD027;
	Thu, 10 Oct 2024 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557739; cv=none; b=KmSN9kUdedpCTgmOG/mLu6sqNK8yeuUCANidotaKhTx5TlAA/j6poQeaL6z2ONg9FKOb0d9MwDDgGIX9+811L1/w+FKiG1M1eyPqGcRB5C6QtwJMkyeyk1XBGNVhmzJGFGWcgY+nq1pMvpsCfaTxYtd6Hf+LfPSY82wmaCpq/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557739; c=relaxed/simple;
	bh=LxY7kWckS0SuvYaF2yrTWIemSOOZus+yEuXxUicIZnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5em9BvuvTH2RgNDiAYf9MF9ovUHPmvYdtscu+6/bnNQxNXcQQJYmmxfFAc028skfcgCtM6FM8KguE2dd33eRXnmVPuyc2yqIYCFu7OR+4vL9jo8B9Tn9eRh+s9O0+E7PRTueYwGlL8gaIuX6ka6e8DziWCeOSpwLPC4dz+m7Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRgFlN67; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7e9f377a3c9so48995a12.3;
        Thu, 10 Oct 2024 03:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728557737; x=1729162537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7prhNlBf0rjgrPFlAZtBHJ4o24kuE9bb4AC/MN06Po=;
        b=gRgFlN67mY9ZBYNd8WM425wIQR0sgeBkkvhHhFoawaHHn47RnOZrTGTc/LZs0BXVOS
         b5zxoUDZ/fg5ZtLW9ChNEGi4DXokymFxyzCzf2sRNW7NN+BmA06ZOc3/oqKxJuJFFh+D
         6BdPZ85uFMrGhGX/jN827ia/sMMbIPAuFdcRi+19WgMT1DEn296G9zbal5SOmDg1+sjv
         vrhhqYfBQzyMiKnQGoXDt4jEWRhlEuKnj+U0ntkHYR273u8yAWArZjHOs9sxS2qNfY9r
         DnoZRiqHldkxAnVjm22JiuQjykDazPana5s6Ps7VhdhbagDmhmFzSk2ilnkc/tlrzw54
         wtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728557737; x=1729162537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7prhNlBf0rjgrPFlAZtBHJ4o24kuE9bb4AC/MN06Po=;
        b=TwedWWNGNDrQ3CH1+n4YBu63pEzuJFP4y2Tha7JmxFYkT+LEZZf5VO01pfVEf4rE8C
         0z1w4s5JoU3ACPo20n9IIgSqI9q016/FyUSY15eej5wQQL1E8QIBfsDE9Xj7mt2q7zgM
         1N0RALwsqm18j8xkmvyLgQsdpgsArU3wi7e4+E1MnPKu1aAiXKI6bFW3z5Uf7b/bsh5c
         DWdiey+K4z4cEEqeBorn3BXoM1jSvQqt5Ae6o/4z6dcmWwfHIgAJGG3KGYwOuNJN2GOw
         AsnNyO2mZtF5ofdp9gKBXUDCA+CzWTQnHEGkI+9MQGOXpS0Zr8lLzf2f3B5S1yf3HlDc
         Uu+A==
X-Forwarded-Encrypted: i=1; AJvYcCU9COaHpPOyQcdBasbeoqeg7AE3gIIJ8D01MSRfGohdofodHdJtfS37RfI79N08LmXL/HLiQcoGtT4bzoJp@vger.kernel.org, AJvYcCVaZU91N1e44juOXroR3l+OY+qUmCWWNQfifqLpAq7DDNBELVWHNFzaspeguiGouVWlF9VGH/aJ0GH8iuWwgw4=@vger.kernel.org, AJvYcCXpMEuig1iEQy64Kd20JZQg/xaLfHMvm1YLgqgrJZz1+Ai/wpaALUk1YLeUB0+1uHInl3gOuWsx+I9Q0jU=@vger.kernel.org
X-Gm-Message-State: AOJu0YySZvKlGKZlIwNCOQv8uorG6ahj/07+sWLSgVSG+Sqke3kzZWsC
	OyrcS+a4KveHEuwr1OvMmq5GdCQ+FgWb5lg8I6Jrs1xNmzmdOeMqz4eKSiGa5nusQZUWytAsDln
	mgOn07mlCZh3PUEeQKO9+aXIMAeM=
X-Google-Smtp-Source: AGHT+IHAJPvWSarPUcHM5fTP1XOvft1y95dzd2SSxjokwM/tDrb6430mBqh0ufFkL+MZrSQjwaTb5z7red4s3fH34oc=
X-Received: by 2002:a05:6a00:3e28:b0:714:2051:89ea with SMTP id
 d2e1a72fcca58-71e1db6491amr3947192b3a.1.1728557737046; Thu, 10 Oct 2024
 03:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com> <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com>
In-Reply-To: <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Oct 2024 12:55:24 +0200
Message-ID: <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 11:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Each version of Rust supports a range of LLVM versions. There are cases w=
here
> we want to gate a config on the LLVM version instead of the Rust version.
> Normalized cfi integer tags are one example [1].
>
> For consistency with cc-version and ld-version, the new version number is=
 added
> to the existing rustc-version script, rather than being added to a new sc=
ript.
>
> The invocation of rustc-version is being moved from init/Kconfig to
> scripts/Kconfig.include to avoid invoking rustc-version.sh twice and for
> consistency with cc-version.
>
> Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-032898=
5cdf33@google.com/ [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Alice: when I apply this, I will need to add your Signed-off-by here
(i.e. when handling patches from others, you need to add your SoB
too).

> +if output=3D$("$@" --version --verbose 2>/dev/null | grep LLVM); then
> +       set -- $output
> +       rustc_llvm_version=3D$(get_llvm_canonical_version $3)
> +else
> +       echo 0 0
> +       exit 1
> +fi

I guess if we don't find "LLVM" in the output, something weird is
going on, so I guess it is reasonable not printing either here.
Although, in principle, we could preserve information and print at
least the `$rustc` one.

Anyway, we may need to rethink this when we start supporting e.g. the
GCC backend, so I think it is fine as it is.

Thanks!

Cheers,
Miguel

