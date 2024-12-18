Return-Path: <linux-kbuild+bounces-5168-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 891C09F627E
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 11:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C4931893D44
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 10:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4233519938D;
	Wed, 18 Dec 2024 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pD1z7ZbY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1458615EFA0;
	Wed, 18 Dec 2024 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734516894; cv=none; b=AqLinsGcuGBOn+yCI1kFb/8YzAlhIF69LXcX4NSAZmJvsYL6Nk+3AoXMIYmfJ7Ij7pdoxivbP14DBUJ4W/G6XMocsMhcE+mrYScQK2448eRAnl0befTfrhVFjCHzf13GMO7V18nR9lH3ij7aXdIe1AOxIW4GdY+uJ348Azrw3SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734516894; c=relaxed/simple;
	bh=88IHiNuEUcucQLDA2SgjdoWkHjCoEvfbUkEobHv1np8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eY4+4DiI2hoCChHtX+SqBLkfO4ZhmNFZfiGWc/Kpf2SnVxkuhFmznF77sVhj6J0CeMUsxGHIHRPKb3D0zix70+pq+iSfkH9irAgopQJiIQTEncpGadAd0jYuEJcrRHyAq/vmw8i776UKo/wzG2jgI/9+6Z/ZbqHQPxeloMLGkZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pD1z7ZbY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F286C4CED4;
	Wed, 18 Dec 2024 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734516893;
	bh=88IHiNuEUcucQLDA2SgjdoWkHjCoEvfbUkEobHv1np8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pD1z7ZbYOXfvP3LlS3BapH3QlpHAKsPyPezx91DRelAtuZBnZ0gQOIuRr2DSdJQq5
	 wY2r4jV4c9za1GbXw9inGfXa1Am/tkKEFuQeX0tSvcmu7EYCTriu7SsM34XvqZN3Ud
	 9608LPT5nC4iD3Q4om++zXq6n2+hu2dEbIxIQs0pKuslMH++/w66lS+94Yb8VaL09D
	 7fzp8qXA2vONYxP7A38wD9Ct/UfInetvI2eT7EUyVqpNHtmXZUvYZhbi1GnIWsr4FY
	 FmYvNMRhY+bTxlCoM6wxYrtWvXrbHIIkgLeV0ZeUYRhJFuQpScTuocGCuq3y+yBG9u
	 r4ZIFX8+Mg/Vw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
Cc: "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Miguel
 Ojeda" <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun
 Feng" <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>,  "Benno Lossin"
 <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor
 Gross" <tmgross@umich.edu>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  <rust-for-linux@vger.kernel.org>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Fiona Behrens" <me@kloenk.dev>
Subject: Re: [PATCH v7] rust: use host dylib naming convention
In-Reply-To: <20241216-b4-dylib-host-macos-v7-1-cfc507681447@gmail.com> (Tamir
	Duberstein's message of "Mon, 16 Dec 2024 10:54:22 -0500")
References: <ciScx8-kPC1bGN5Rh_zxAiRHyy-LU5MQJ4PSWVPQRofAW54rOMcLwR6afHhTJ6dpBO6Z9wdEhrzFC2ColiyrwA==@protonmail.internalid>
	<20241216-b4-dylib-host-macos-v7-1-cfc507681447@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 18 Dec 2024 11:14:40 +0100
Message-ID: <87wmfxl2lr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Tamir Duberstein" <tamird@gmail.com> writes:

> Because the `macros` crate exposes procedural macros, it must be
> compiled as a dynamic library (so it can be loaded by the compiler at
> compile-time).
>
> Before this change the resulting artifact was always named
> `libmacros.so`, which works on hosts where this matches the naming
> convention for dynamic libraries. However the proper name on macOS would
> be `libmacros.dylib`.
>
> This turns out to matter even when the dependency is passed with a path
> (`--extern macros=path/to/libmacros.so` rather than `--extern macros`)
> because rustc uses the file name to infer the type of the library (see
> link). This is because there's no way to specify both the path to and
> the type of the external library via CLI flags. The compiler could
> speculatively parse the file to determine its type, but it does not do
> so today.
>
> This means that libraries that match neither rustc's naming convention
> for static libraries nor the platform's naming convention for dynamic
> libraries are *rejected*.
>
> The only solution I've found is to follow the host platform's naming
> convention. This patch does that by querying the compiler to determine
> the appropriate name for the artifact. This allows the kernel to build
> with CONFIG_RUST=y on macOS.
>
> Link: https://github.com/rust-lang/rust/blob/d829780/compiler/rustc_metadata/src/locator.rs#L728-L752
> Tested-by: Daniel Gomez <da.gomez@samsung.com>
> Co-developed-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

I don't have a mac to test on, but this does not break anything for me
when building with rust enabled on linux.


Tested-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



