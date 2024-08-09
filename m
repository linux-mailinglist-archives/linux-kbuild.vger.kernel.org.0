Return-Path: <linux-kbuild+bounces-2926-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7830E94D8A4
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 00:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21FA51F22E5F
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 22:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138CF146D68;
	Fri,  9 Aug 2024 22:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrPznMDp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DAD1BDCF;
	Fri,  9 Aug 2024 22:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723241461; cv=none; b=d0tJn1B4403ngkHUeIM9izuCxLtDT/KxfMdNcI5HgIY2K9I1gCvNSYj0QFFHgepbTHK2o9J8w7L0LpnenmwKt9GmgVntHiUuBs7XNxEmrWz2PG5l5MgK8uhH/3E/whpK8YnyjJfTaoARsr74nOrBntGu6X0BSw9C7Mn3VmhFSQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723241461; c=relaxed/simple;
	bh=oV3BloVbKuXLOtjJvcR1LOLMc57zeGyQ8iA4HgVEU+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzkJh6Z0kdOni9gENv8E7yZarL1e47/2Zn3IJEy0lRxP9yCq9qiPYGdoXYeHb/o1Q8PUv+QSxPheBJYas5rCIUm5YYBQOXJEy7fJ8o2rTCldA0Rskd+h2lfVMq/gkzmuujrR3grhg/bnHwCEMtRneZHxLQ++KfSOXaIYDPhfP2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrPznMDp; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70eb0ae23e4so2064768b3a.0;
        Fri, 09 Aug 2024 15:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723241458; x=1723846258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZtRC13ZBchav+u1uxCwOczYv6vnhbRu71MKK9b/fwA=;
        b=TrPznMDpzyRAEGziFhsmuL2gJJXKEzz8jp4NdfwJb32ApxcNCPIcUe+aljk6odXq4n
         u4k3+0WroWCTNMyMFSn1OoCIlRRakR1cRPDvD6mosWriirQMMcB9bq2rntN9eRPIyrc0
         WVDPXXp7mDi8R6a9mu9kJMRjN+3nvM6BevKar57BiidaUVKM1PgV90dmZwz7ilmU7hcE
         3880CDuF9a3kGGYebnezogyikZG3sVN+wUVdFZNiX28MPaCu2gIjRJWGkDiiUq+dm74B
         A1oH48DjHoP3JcCXSWO2VgUfwcl2NWqKvzDrXwua86Lx9Xu7YXSHnp+dSX+jrA4GIpo2
         IeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723241458; x=1723846258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZtRC13ZBchav+u1uxCwOczYv6vnhbRu71MKK9b/fwA=;
        b=gegD+HLJKFTqV9R/kTBOH1s9jaxnfdunZC1BzsS3LwmG3laLzlU7AO7TFMSbHhJRZO
         h4IHXrGzbrdOyJCqFymK9ZdLFftCag20Yx0cNRm6DjQr27uq5vC0wYzYYRb/BvMeoJm9
         qZa1Ot9nq4q0yE0FzWwNW/hEGKT7Fbbftbfnf4Q067hmI3M5/XzY2UhN/YCIa8puAyU2
         sc2x/SIaVVFOTqL+c+oZgOin3VIpngqrLo16Bz4F88RPDht4bVXhdZszond5/eZj5j8u
         P0iGTsljdUqICC118JjUsUtBOdi7R/WVMtbVEw0H+X1TRKNub0det38WMYLQ31ZBjPdQ
         M/1g==
X-Forwarded-Encrypted: i=1; AJvYcCW/K5ptJM+MoS4xckGJSB2bXjbeC1GqvCDReVag/mduPhpHjYIne3ds7EV8EqVdGrM17uV2JekUG3H4btwKrxZD1+EmvJVPj380BQ4+SXMAU6niXY3JaEOmcAtD5StAQtXo+ZQ5MbYfc8+CSaiNy8e4nIorY/br2beXl5ZwvIuyCvCTAtABcsjwgLM=
X-Gm-Message-State: AOJu0YxCspnLVI04qxR8QYjBWLS9IKUfRTEjFNGnDnj5F34LMMCgwcYF
	L9toTAX0e4DvkdL2Zv1OyRjA1TcCRaAxb7Vlz4fLYZuuy35zIPdFDlNeXefGjx2DxqCUlkDL+FK
	5Q6oMfCRtgfk+9mN3llUnSIncMl4=
X-Google-Smtp-Source: AGHT+IFYHFP4kSBzrnb7VzFHvO7PwEgU9Soz/rqlw3dbZs+l0O11QKxqnszd0Cfg4OCUtiqIzF4xXch/WAOOvLf6T+w=
X-Received: by 2002:a05:6a21:3414:b0:1c4:23f1:114 with SMTP id
 adf61e73a8af0-1c89feb0bc6mr3293218637.20.1723241457989; Fri, 09 Aug 2024
 15:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806233559.246705-1-ojeda@kernel.org>
In-Reply-To: <20240806233559.246705-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 10 Aug 2024 00:10:45 +0200
Message-ID: <CANiq72=JrDceFpoAd6gr1fm-j9B_xszyo8a4xJATtQ6U1t3HfA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust-analyzer: mark `rust_is_available.sh`
 invocation as recursive
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 1:36=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> When calling the `rust_is_available.sh` script, we need to make the
> jobserver available to it, as commit ecab4115c44c ("kbuild: mark `rustc`
> (and others) invocations as recursive") explains and did for the others.
>
> Otherwise, we get a warning from `rustc`. Thus fix it.
>
> Fixes: 6dc9d9ca9a72 ("kbuild: rust-analyzer: better error handling")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

    [ Reworded to add a couple more details mentioned in the list. - Miguel=
 ]

Cheers,
Miguel

