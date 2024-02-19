Return-Path: <linux-kbuild+bounces-993-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6177859F4E
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Feb 2024 10:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7CF21C21AF2
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Feb 2024 09:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A762261B;
	Mon, 19 Feb 2024 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BybPD/h+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B5D224F5
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Feb 2024 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708333763; cv=none; b=BQNnpOb+Fuo9Ux87FeWa/zFyYIi/64XxGmEfVtJo5Qvm+RhSSWo144qTNilbfD3i/Pqcd8Kj55k/gu59MeT/eJD6UmIusImymdGi2wvDwo/c5xXYP3vcX8+81UVrshvRpAd4jZAvSQXVzue6192xO7xcfgC9jY+QoyqOAvSxwz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708333763; c=relaxed/simple;
	bh=DJul3TWyiyFiIYG37u7BiMg+il0uv1aR4uQbAGcWQQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gD12qt4q6cBf+kD5RDH9H02Oz3oxcgh1C7jcvY17RH3q5Cwq1oEKe8p/3Y4a3UYESeTxRIsc8a0me5WPCRhz0jjzUuRtywhubh5DKOoV57HeaN4S5wDuSqrVVeekazexSDzYZaZarnjdp6Wsw4yH3znvHLFfa8eAo5PFQuOMaHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BybPD/h+; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7d6a772e08dso1302573241.2
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Feb 2024 01:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708333760; x=1708938560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pITza/p79puTXkzLF57AKL2ujyb3FxitC2KLqmYBBWs=;
        b=BybPD/h+28wYwaWtfH7FE2hIOxseZz8JgPQu3Q8rec9SmD5gsV3m3AxX5YJ7m4+zwO
         eBg1V0yziJ1jgbijM/6D6NbPVZEcPByjeYp+qyrpKunRK9aia8qv+INEvZsbP6gO/mNu
         /MCg8Ku4uBefcLcvOARySenfMQwkI5A8PbjyJOZgi0Q5ah4+P/RtCEG+79anzTK8y8z/
         T6zqYB1Q/rLvkJ3fQMIYXrbjYSSM/g4ikYGnaz/jTKR6BbZjlgKHawQQhJxiG8XxnTe6
         2NEQb8k1RC5dfvd0w48L7/i15xPCjJhFOK1SlqRRABgFkM7hAELH6uDFlMEcRLifVuwl
         Mn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708333760; x=1708938560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pITza/p79puTXkzLF57AKL2ujyb3FxitC2KLqmYBBWs=;
        b=wAPE6pmuue89qlWlZTu+VKv1l+TQnjddp/pF/k2BaIwibs02L6fkjO6+tZGq4N9Njx
         PShav82nsWRwp939mTtkxqzYkuUrNHcXBg/pJ8vT/enU2PM1nIQq/8eIYGVV12JdLx2D
         Y1reO+OmbmkIFdz+8e1ilbbT3aTAujEGggVDBA8+WeL6WzWZyNSj5iQdz2BqGd7YXc+1
         tLIKwvNJN13OYOQ9sFkHLDULiqxm+IZJRz/U30J9MqFte0P8PPLHLe4nWzfBfSp9DUvz
         SQS7GEYMy8IcvbsIMui1cBpde9VzR7mmnDPDEj6gxffYBy4qjq4pv5hbQgLR6MSX77nJ
         FFtw==
X-Forwarded-Encrypted: i=1; AJvYcCWw4hO3q76lShaS6FBnPSyyuksvgs+8zJFwA8/TLRr6EP8eAk/3vT4nqxLF+l4OIbWNebSUIiFUW+kAGNc/hiK7cOlJU+VOT999cYvb
X-Gm-Message-State: AOJu0YzgYtePMBAavobXHgkkCwx2W0ljQAe1dwS8psaq/Hk4U8PpgP2/
	V+ZkDOoz+jh0RywvlATnnRAcyn3S4qDBDkCzsJK6RCnZrnRs6Dhu8kPHn5LgTD+7gbzKkUA6657
	2S+NPPAwW6dvSka6qKkOoG7NKg3mG/nPgWJ5k
X-Google-Smtp-Source: AGHT+IHzGqRc5VnbP00Jo3Xc0zRJ6YpmB8/ccl+F//H9hD5P0VDV2TgQ4Y+PEIWCp01pNe7fCDf3Nd+l617M5tt21mY=
X-Received: by 2002:a05:6102:6c6:b0:46e:c3db:aab6 with SMTP id
 m6-20020a05610206c600b0046ec3dbaab6mr8365013vsg.24.1708333760384; Mon, 19 Feb
 2024 01:09:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217002638.57373-1-ojeda@kernel.org> <20240217002638.57373-2-ojeda@kernel.org>
In-Reply-To: <20240217002638.57373-2-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 Feb 2024 10:09:09 +0100
Message-ID: <CAH5fLghAC7yJLzH1K4Jv10QggnG5eHacGTJ8mxgO5neH7YR+EA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: upgrade to Rust 1.76.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 1:27=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> This is the next upgrade to the Rust toolchain, from 1.75.0 to 1.76.0
> (i.e. the latest) [1].
>
> See the upgrade policy [2] and the comments on the first upgrade in
> commit 3ed03f4da06e ("rust: upgrade to Rust 1.68.2").
>
> # Unstable features
>
> No unstable features that we use were stabilized in Rust 1.76.0.
>
> The only unstable features allowed to be used outside the `kernel` crate
> are still `new_uninit,offset_of`, though other code to be upstreamed
> may increase the list.
>
> Please see [3] for details.
>
> # Required changes
>
> `rustc` (and others) now warns when it cannot connect to the Make
> jobserver, thus mark those invocations as recursive as needed. Please
> see the previous commit for details.
>
> # Other changes
>
> Rust 1.76.0 does not emit the `.debug_pub{names,types}` sections anymore
> for DWARFv4 [4][5]. For instance, in the uncompressed debug info case,
> this debug information took:
>
>     samples/rust/rust_minimal.o   ~64 KiB (~18% of total object size)
>     rust/kernel.o                 ~92 KiB (~15%)
>     rust/core.o                  ~114 KiB ( ~5%)
>
> In the compressed debug info (zlib) case:
>
>     samples/rust/rust_minimal.o   ~11 KiB (~6%)
>     rust/kernel.o                 ~17 KiB (~5%)
>     rust/core.o                   ~21 KiB (~1.5%)
>
> In addition, the `rustc_codegen_gcc` backend now does not emit the
> `.eh_frame` section when compiling under `-Cpanic=3Dabort` [6], thus
> removing the need for the patch in the CI to compile the kernel [7].
> Moreover, it also now emits the `.comment` section too [6].
>
> # `alloc` upgrade and reviewing

[...]

> Link: https://github.com/rust-lang/rust/blob/stable/RELEASES.md#version-1=
760-2024-02-08 [1]
> Link: https://rust-for-linux.com/rust-version-policy [2]
> Link: https://github.com/Rust-for-Linux/linux/issues/2 [3]
> Link: https://github.com/rust-lang/compiler-team/issues/688 [4]
> Link: https://github.com/rust-lang/rust/pull/117962 [5]
> Link: https://github.com/rust-lang/rust/pull/118068 [6]
> Link: https://github.com/Rust-for-Linux/ci-rustc_codegen_gcc [7]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

