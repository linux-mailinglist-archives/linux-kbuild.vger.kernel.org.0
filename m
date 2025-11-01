Return-Path: <linux-kbuild+bounces-9351-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A51C2816D
	for <lists+linux-kbuild@lfdr.de>; Sat, 01 Nov 2025 16:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 63AA14E5426
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Nov 2025 15:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD21F60B8A;
	Sat,  1 Nov 2025 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTuw/mL8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35099199939
	for <linux-kbuild@vger.kernel.org>; Sat,  1 Nov 2025 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762011388; cv=none; b=UqmQ1aViUWRNTe2qB6W9KkbRcrjqiC0bU21kxNHb9JZaAxzHDNOEi9B8zLl1X/qpjkmAW0NUtjeNxI4MboDtVxskG9qNeLKueLoTg+xGq+W8WPw+DC+tCbyw/IiRyDaYlW/4P7ePxpxAbY+JDhaegHr/AQIjV6NeazoVcqGB4OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762011388; c=relaxed/simple;
	bh=bdxPdHZEuhQ1dkWTiW1iF9wThJEn+irBUmR5Dc6YpDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvN7yrmz3cq2FDcmA0E/2Of0kWIO+gukxg3trr8WiHaVzJ7jOfbWwP/4GZDMBlO4udrxwATpHioqm5JlJhx7nQ3Siyc7Ff5XwYIBML71/3dAulqTDJxO1M8BVEe0n9ac/+ZPW9UqoBTcaFaunooIPwVviGCNXulKZDTWdQCD4O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTuw/mL8; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b6cf214a3ceso472999a12.3
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Nov 2025 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762011386; x=1762616186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfjJn/f7oQqzZoFQTxcwXAUfHD/4AwfoEc5HZKyEpqA=;
        b=GTuw/mL8H4YRyM8i15Qcv3m8RrOMcwBNytiDg6uIpMqBoR46U72MHQ90reQbtYzOZS
         74gb0RLYzBS6C2miI3ntTvSyOe2016MoEsvDkERZP6ufAms3euZgTUQuxFxJRMQb15kW
         l5a0e8upgxHxF/ngGrLX2iA5d3BNj7tGtj7Ni5pkppyXIvIIhGM1Bi03O4r/sPcCPDPR
         bBLYZWsl+7nY4zaI9bU0ZsOzaBNh6lb0JEJYbZTAqmtHTMqjO33tenacj3eHAnCZ5f9y
         0Qq5PH1QvB/ZZUs8fDFC1jsuxc1C1KE+YqGarp+/ZjijdXazBW0MONUlgUJtxbRRAyVA
         E0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011386; x=1762616186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfjJn/f7oQqzZoFQTxcwXAUfHD/4AwfoEc5HZKyEpqA=;
        b=rGYhys3xkSmhwh+4MUeK8gqmKtCLPwUUzi5aEXXVBISJ7gTV2KLWDYe0FPI6RjZlpM
         yBHMQf6pAE7w+5A0EbuTC1zEc4VceJVdecShSuPcx79BdmN758D5DTRp6FSSauZhn2yc
         HhPWvy4RVUZFiM//SWTxNnA4rVjc7UxzDmkugTiWwSNHBKTeiKyUe/Rel+u9RWY6aKox
         8EhXcP6jz1etemxYI0OMVpnPKk2Aku0jZJ4sZ6vYVbYbRKVjoC/jblm6DY8VkIKw0mkf
         ySZlTOoEHnH2bLPnczSMVaWYW2qiX5gLavqWmaPHUnmsagsM7uiZjjzb16aI4MExJHm8
         idzw==
X-Forwarded-Encrypted: i=1; AJvYcCWFLalYzliBU4ru85f5JSe34E4SSJZx2IIw9aQEOlyqG5mzPkysw/+bdw5TqTiLezVTAaBil8oV4PNmdts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys8BtIYJQNwwg21aKqo4PLB1jbhoN6Ily/VmKAnvqa5Aij/FkF
	lQBprRGY31+wCaAxl6wabJSQVrXBV3NDchcZbOTfyhFYj5Ip9z9f4hno4CR0nvHzo+JbmGQaPmQ
	icA6oQxeWEiZ/sbUzyElYY+0tAPWwW46BL4df
X-Gm-Gg: ASbGncuMLGmJhSBM8dqZSNfS7My6+jzPJz4PmMMaubxnk8RXHaaI3/945X3n4xItYQ+
	S64tTdKhRGjUbiIQ057FKcJsvjeBODeURhataR8faQEteNIaosKhzjR4SU3nz8/lnV4y3g1xzVk
	eZTrNedg4ZE6E5Y3zhtA3oX45xqSqSpwXWz7CXxVAVKUhJF6NzE0makG7DeYtBYSTpBXdBhT0xc
	dVTX1Nbb+teYY+1zzVLIwabe7Au9UwqIt2+tdprhbK5DWCwaB46dze3C1+UmLsi68eJfLqhWz4i
	T9fVTk5LrTNDh+hbgyg+Z0zVDCEb5f8DKErGFkAQNWiu1e3n3vaH3U7XbPdnByL4h9bg7zkw8t8
	iQPC7yU3EVqIczw==
X-Google-Smtp-Source: AGHT+IFPkL9moEs1IDaYMib+cnXVWvLGHDmNr26zj8ffw14If7Hx8/KbyBNWa9R59glcpNMaDzsQ03S+R0Vk6uJtUK8=
X-Received: by 2002:a17:902:dac9:b0:27e:da7d:32d2 with SMTP id
 d9443c01a7336-2951a4d86bcmr59790335ad.7.1762011386406; Sat, 01 Nov 2025
 08:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
In-Reply-To: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 1 Nov 2025 16:36:13 +0100
X-Gm-Features: AWmQ_bmv363FKeQLbteYinlQkLkfy3udKcWiF4asqch5Ak2oOTQbYYj6c7b_nbg
Message-ID: <CANiq72n6KLjA5XQmAhy=SRTnWY8sCCmp9ETnB-dTSVZ84-mjzw@mail.gmail.com>
Subject: Re: [PATCH RESEND] rust: enable slice_flatten feature and abstract it
 through an extension trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 2:32=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Hopefully it captures Miguel's suggestion [2] accurately, but please let
> me know if I missed something.

Yeah, this is what I meant and looks great -- thanks!

If you need to use it this cycle in another branch:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, I will pick it up.

> +config RUSTC_HAS_SLICE_AS_FLATTENED

I guess you used this one since they renamed it and since we don't use
the `alloc` method. It is fine, both options are confusing in
different ways, but sometimes the feature name is the only one that
can be used (since it may enable several methods etc.), so I wonder if
we should try to use that consistently.

> +/// In Rust 1.80, the previously unstable `slice::flatten` family of met=
hods
> +/// have been stabilized and renamed from `flatten` to `as_flattened`.
> +///
> +/// This creates an issue for as long as the MSRV is < 1.80, as the same=
 functionality is provided
> +/// by different methods depending on the compiler version.
> +///
> +/// This extension trait solves this by abstracting `as_flatten` and cal=
ling the correct  method
> +/// depending on the Rust version.
> +///
> +/// This trait can be removed once the MSRV passes 1.80.

These paragraphs sound like implementations details -- I would
probably leave that to the commit message or normal comments instead
(we should notice we need to remove these thanks to the line in
`Kconfig` already).

Nit: two spaces above.

> +    /// Takes an `&[[T; N]]` and flattens it to a `&[T]`.

Nit: I don't know how one is supposed to pronounce these, but I guess
it is "a" in the first one, like the second one (the upstream docs
also do that).

By the way, it crossed my mind that we may want to use `#[doc(alias =3D
"...")` here to guide search, but I guess not many developers are
using local/older versions and this will go away soon anyway.

Cheers,
Miguel

