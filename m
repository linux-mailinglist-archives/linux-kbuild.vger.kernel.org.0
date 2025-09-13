Return-Path: <linux-kbuild+bounces-8816-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CF2B56261
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Sep 2025 19:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D66E11BC1DC7
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Sep 2025 17:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91B11F4C87;
	Sat, 13 Sep 2025 17:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Drf1A9hQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCBDEAF9;
	Sat, 13 Sep 2025 17:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757785603; cv=none; b=m3X06+Qg4ZJHzUA6xy2j+4LEpqbwc+iY4uKNdmvRzgx/K+y2Y1ojut/WxmY+4+UjztBE7fB8YCKwosplaK+dkUGXAixEFdM4FL7nnVIDkldCfO4Zsm9w9ldfJxM7yUdlhfaB9c4eWrDDKFGtgv+1O6Fy4j1p5MQ8/2SlJFF8VoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757785603; c=relaxed/simple;
	bh=qEeDUMM2cPdTS1r7qPnD2EjgT3DkSIwjoi3Bsr9b0Bo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D3fBWfT4Jl+1sxU+aI2sUIDqy9kSX924fIki4y1XAupZHxdd44yVrBNvT/vwcz5bQ1+6U0o9kHGWVW+CFDGlnyxDSqUgOCQnxNOpTJ4B04EJTzE1Us3KwMvXT+FZe/E95C1B8YZ5YjuvQ7R1s5yyN1fYgUkz7tp5o677MVP+WUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Drf1A9hQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD5DC4CEEB;
	Sat, 13 Sep 2025 17:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757785603;
	bh=qEeDUMM2cPdTS1r7qPnD2EjgT3DkSIwjoi3Bsr9b0Bo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Drf1A9hQ43XaKKhLKjVhxDn88Kz6iVuzp/kRiY0nJnlnkdGdLmlZ8KzEzCh+Qa1xq
	 jv7vgYdYL7g9y6Svz68VX/IuittJpFY2UQY08ktTUlRDKbVQoqUz9uLM500As3lmdj
	 Z+rZ0J5Q/IZhYDcHXEmy5jNbKnFuD3jybRhcol84vHA++F62HOoUr/JwCSN7rOG39O
	 fv/djtOgRiuml3GEP5VBXKBX4fRL1zJfKYUn9Gy3A1phxWqBbcOr91CI1cgYnO6sRA
	 +kv01BABMHAnIbV2PCNrSLP3sTKRa7YQqk+YVsRqlVgYy4WRDNfHE/DMCqZeU8jsUR
	 Ub8xXS/P8xOUA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev,
 masahiroy@kernel.org, aliceryhl@google.com,
 thomas.weissschuh@linutronix.de, tamird@gmail.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH] rust: add `rustcheck` make target for check-only builds
In-Reply-To: <20250913100847.9234-1-work@onurozkan.dev>
References: <-ebVaoKp9tTjZGmdSRi8rrH1o7SgmGyyzk-g2ALSCBKPJP44z7dSPCplhwKt-sibwLwqP7IPEml6qCkSpJhd8g==@protonmail.internalid>
 <20250913100847.9234-1-work@onurozkan.dev>
Date: Sat, 13 Sep 2025 19:46:28 +0200
Message-ID: <87bjnei6tn.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Onur =C3=96zkan <work@onurozkan.dev> writes:

> Adds a new `rustcheck` make target to run a check-only build
> similar to `cargo check`. This allows us to verify that the Rust
> sources can build without building/linking final artifacts,
> which speeds up the iteration (a lot) during development.
>
> The target supports the same flags as other Rust build rules, so
> it can also be used with `CLIPPY=3D1` (e.g., `make LLVM=3D1 rustcheck
> CLIPPY=3D1) to run Clippy in a faster way.
>
> Also, unlike `make LLVM=3D1`, it doesn't compile large amounts of C
> code (on a fresh checkout) when the goal is only to check that
> Rust builds are not broken after some changes.
>

I think this is a good idea! However, it looks like this target only
checks rust code that live in rust/. Can we also check code that lives
elsewhere, like drivers?


Best regards,
Andreas Hindborg



