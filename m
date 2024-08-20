Return-Path: <linux-kbuild+bounces-3109-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC059588EC
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 16:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1387B22DC1
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 14:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621B117BB7;
	Tue, 20 Aug 2024 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chKKq00Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DBE29D19;
	Tue, 20 Aug 2024 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724163627; cv=none; b=nRCJCau4rk9vEUZ4ZOxpHInHP/bQvd/lr92nSoUtti2VOLgzfBbfPdi+zzAQHmyYvaCJk2/ylkE5JB+ve9KgPmrox9y3gy4gnOqJNDjOM9wk9XEwsgxCC6whEZUDA9tGdpwEJaQiMwfZjdIxsfYouvSryzK7sT6lkm0PvayG9F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724163627; c=relaxed/simple;
	bh=GBVk/hGzblmCoSDe2TbxWbPRIZfoDYNoIyTDzuwIC6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujVGUQWVQbYQU0eNPXEW6J+LaktE9wr+h66tM41UDSjPLYSnrPvEdi04V7zLUmkfd1SFwOniF2m9MPnMC+3ZWHNJofVPWDYfD96baQYCh82IqFn+0O+Y9tjZV/xFDwZWcuy+T6KZc4tsrd7MBZ12VhMOyT4lmSsl5JTd3xSgJOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chKKq00Z; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d3e6fd744fso758383a91.3;
        Tue, 20 Aug 2024 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724163624; x=1724768424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wswv5PurLM6P5IjETHMLu6CnN+eBPmZTsMYIqJvimvQ=;
        b=chKKq00ZNgB6P5Fetd2GtWUD8zh+Rs+qxWuMecapLcM80nAItp/BuDM1EP06woHdda
         D3sc455GwALi6JsrpcLPIhS5+Od2tFaWSCyIDte5l9gunaH/9230clfEmEczkgwO/4FN
         +ycm/cgWhsuAqaCJuu4TJ7gYcIJQWuTEyB8iWSySwqdqzr1xH2vVPm/1e7p2ChA7ADfe
         qesjI4+wwX6JjLi/bkzCGl2ex+rIf4Skcqmls2MWXLJl4YDJUqh3BwoLX/GBpwCgNw/Q
         SiD0MU9iBYhq5YWNtdHoAYRMzQWGPi9SlSwFBZA//fWf5ukHNyLH/rddd7hDpIyscA+K
         syHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724163624; x=1724768424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wswv5PurLM6P5IjETHMLu6CnN+eBPmZTsMYIqJvimvQ=;
        b=oz0gHdwHPeyKndchvJKP1i3drc9YGtK2B2ATTrN6MRyu/RaJAV/a/tLY4H2a1q9mNs
         jhQ01grk1jQ5Xbe68ZmV9fv0fpHYfn3GsM2Xdh+XIw6cOkyl+8iTWx1o54d3c0qvPgjI
         TjCHrUWYaDH5c6W0AMHjbat7d7djXSHEcx4+tghjjVkzk1Wx/WkPB6QHW2YeKeIVHOx7
         3lY1m9jOC1k2p4G9yyLqPo1DlHpFWSoUXHXw2+Jav7covMbX89vHe18ORlMsrV4mm++D
         9eg0VZn4LMxE8xBp2PY9KF8QPb0EZZxopYaHPOoCAxILOAsz+vkzm9ta5EcjCM1KLLwz
         LYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM/zPBVVHUq6GNHGN82gtzCA8EpFqAM5FueSIWhGCqveuFFNHY1R5eKLT1NqZEXRpaK/X37UwxliZfNz30jnQ9vloolcNVRElBts+Oq9X5JHzuPlDXw9sK52U+noIhMExf/QQ605cla+WZnmHgP0fwlyCo8do/n4sFe2slgqVh7i/NZDjQog2o/Jc=
X-Gm-Message-State: AOJu0YwHcPK0KYkKicyenHQPu3zEpaWgo+DGk3IsZ6r2WMYMzwXZvOJW
	8pYmI5wcQcKRpkR/Y4ihRg3r7I8IZHFFjqEw2jnJNjQ5YO2LnBuXnVRBk9VsETRMa2kBpLcSYm1
	4FuK+MjdoIFFDPQQrDAS9JxsxNXw=
X-Google-Smtp-Source: AGHT+IF5iZvjFecygopv3tUhYCm+cRSOvD49UmMopVX0LjUh6PHHcP2By59cm37l0E634tMo+WI4IO/ZFx3Zyl/v7RE=
X-Received: by 2002:a17:90b:3d7:b0:2d3:c2a3:2383 with SMTP id
 98e67ed59e1d1-2d3e1733fe9mr9282006a91.0.1724163624163; Tue, 20 Aug 2024
 07:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com> <20240819213534.4080408-2-mmaurer@google.com>
In-Reply-To: <20240819213534.4080408-2-mmaurer@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Aug 2024 16:20:11 +0200
Message-ID: <CANiq72k8UVa5py5Cg=1+NuVjV6DRqvN7Y-TNRkkzohAA=AdxmA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] kbuild: rust: Define probing macros for rustc
To: Matthew Maurer <mmaurer@google.com>
Cc: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, 
	samitolvanen@google.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	glider@google.com, ryabinin.a.a@gmail.com, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

On Mon, Aug 19, 2024 at 11:35=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> Creates flag probe macro variants for `rustc`. These are helpful
> because:
>
> 1. `rustc` support will soon be a minimum rather than a pinned version.
> 2. We already support multiple LLVMs linked into `rustc`, and these are
>    needed to probe what LLVM parameters `rustc` will accept.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

I had some feedback on v2 -- was it missed?

    https://lore.kernel.org/rust-for-linux/CANiq72khUrha-a+59KYZgc63w-3P9=
=3DDp_fs=3D+sgmV_A17q+PTA@mail.gmail.com/

Thanks!

Cheers,
Miguel

