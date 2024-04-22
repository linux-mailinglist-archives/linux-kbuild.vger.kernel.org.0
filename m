Return-Path: <linux-kbuild+bounces-1634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A398AC89D
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Apr 2024 11:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1383BB2323E
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Apr 2024 09:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A70537F5;
	Mon, 22 Apr 2024 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YEMCdOJq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7584C602
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Apr 2024 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713777195; cv=none; b=rBat7zpJd72LrOBhMd7vTBCCORhcH9sim7LJ4ZtFU839aKUTQi9WzLL/dGatXInxlViAXYh7mtdpnbTnhsbjoK8eUSqStZynqCxXE1GlnAwWKtbiZIOwhdjLn0Yr5ooqdozXFFUBpAaLVOhN8XJkFwnVCvAw3XUExcOScjvEtmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713777195; c=relaxed/simple;
	bh=7avuffUOa/Q3Pcy1DWsnTSzRKVAI1nDHdyVzBoGiFPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrzAfoY7cXNstsP91Y8Qjia1+pYywW+qc5gDoVyYgJFDPqapkmC6/rm3pMwdvzf8BcRM+rQhhuSBsz1K7awG3nEuMq4viz/bhHidczE1Ik7jE8UXKVRifT0gnyp5YyLZ3uU4+sI9NVsHyduXuGq6TEh6I+qsxgX2ofX5zs8leMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YEMCdOJq; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-617f8a59a24so34575837b3.1
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Apr 2024 02:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713777192; x=1714381992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QebkKGtK/XqpHpUc2nwxSwucxpv5AvI/DnU2unuULxo=;
        b=YEMCdOJqFCVsngC4v07lnoToCemqG7BSt5Y14OgqXeDCdjaXbQnlxZw4Rk6KO8J9du
         uyQn8Wt4I/5yNA1O74N+impKRlyjEH8qOfV6lceVpJtNACOls7Vh2JElChMkuJOVqrWO
         Q6r1yFGg3uh76GCXOEXMHJ7bfz1K+q23v4B7SLxHq03XgncbWY9Tvicoauau531ATH6c
         BpjgfziiGNyr0u3fdKoNX5mhFeN5AcGd/IJ3nOPhqVfimyqW+kuj+gE/He26t3KqD5vZ
         7p/G3M0PZ2WzjMGv4beBfz1Exi/z0y6HsoNo4iKF3yYti/H6lcGHBQXCeI6qGZTKTUXS
         nhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713777192; x=1714381992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QebkKGtK/XqpHpUc2nwxSwucxpv5AvI/DnU2unuULxo=;
        b=rg6f5M+9YgVmafUgnHVg9E4Ii0YGDWuI+GyqTKA+RG3SiuKUGNrRT6xY0RJzmSOsRT
         MygEKxmbEkkdeaNWQnsSnnEI1cq/RApLyyFE0hD9ZfCjKu3oPXl6IQOXtu8F8VTZAq0N
         7XroR/O6wcxKe4RGyJgb/2bZRo3ilsDS4Z8ek6KZuu4gPOG1n3basRWdXZAM4bDZl3kv
         MPRqjFIUcJGAIVCU/GDNObdrEH37nXECfMfLYELWhX/QQzMBWPt6JaOs7B1gmjWmzWXj
         zHSxa177XI8pskOCRsyrBua/qLSjS1G2e9xwdKQBTqyXdrf68W9bJTUN0x9MUw7uVeve
         Qp2g==
X-Forwarded-Encrypted: i=1; AJvYcCUO55Qq+mDvEQdgDfku+g5kGjtvKDjdrdJ2jhsI1mDoIgEBw3Fxha7hQWB4kZmlv4Km+qIXu5rIwQSENgAaxR385+I48P0OsCxgPRgM
X-Gm-Message-State: AOJu0YyBPCmx0zTFpF2SgYhWL63mCIq27vW6Qkm82r+h9/qE5HcZu/JL
	ulhUrd5zYToMTIQy/TjxhIKeJd+bdpOIEorBPp9ADMfxXum441j15s3IlBITtWotWlopRdlL5QH
	5hAVrUA1wIfbxaWE1ZdM4VNRgXIX4FTOaOoDzzSS0wKxJCydwNvma
X-Google-Smtp-Source: AGHT+IGPV1n6INq1IZnWcH4jwUQjF+85AP6wkfO43I5XKvgDoerlYI3OZEKXn8hqPjJOSlBElMOsvK2X5IZbqu1bWaI=
X-Received: by 2002:a05:690c:b15:b0:618:8a27:f26 with SMTP id
 cj21-20020a05690c0b1500b006188a270f26mr8241721ywb.48.1713777191944; Mon, 22
 Apr 2024 02:13:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422090644.525520-1-ojeda@kernel.org>
In-Reply-To: <20240422090644.525520-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 22 Apr 2024 11:13:00 +0200
Message-ID: <CAH5fLgjoD+EVYCt-E_MVx2SA1RYRstEgFGXSQZe8aBbwVbLt+w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: force `alloc` extern to allow "empty" Rust files
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 11:08=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> If one attempts to build an essentially empty file somewhere in the
> kernel tree, it leads to a build error because the compiler does not
> recognize the `new_uninit` unstable feature:
>
>     error[E0635]: unknown feature `new_uninit`
>      --> <crate attribute>:1:9
>       |
>     1 | feature(new_uninit)
>       |         ^^^^^^^^^^
>
> The reason is that we pass `-Zcrate-attr=3D'feature(new_uninit)'` (togeth=
er
> with `-Zallow-features=3Dnew_uninit`) to let non-`rust/` code use that
> unstable feature.
>
> However, the compiler only recognizes the feature if the `alloc` crate
> is resolved (the feature is an `alloc` one). `--extern alloc`, which we
> pass, is not enough to resolve the crate.
>
> Introducing a reference like `use alloc;` or `extern crate alloc;`
> solves the issue, thus this is not seen in normal files. For instance,
> `use`ing the `kernel` prelude introduces such a reference, since `alloc`
> is used inside.
>
> While normal use of the build system is not impacted by this, it can stil=
l
> be fairly confusing for kernel developers [1], thus use the unstable
> `force` option of `--extern` [2] (added in Rust 1.71 [3]) to force the
> compiler to resolve `alloc`.
>
> This new unstable feature is only needed meanwhile we use the other
> unstable feature, since then we will not need `-Zcrate-attr`.
>
> Cc: stable@vger.kernel.org # v6.6+
> Reported-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reported-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-Genera=
l/topic/x/near/424096982 [1]
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> Link: https://github.com/rust-lang/rust/issues/111302 [2]
> Link: https://github.com/rust-lang/rust/pull/109421 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

