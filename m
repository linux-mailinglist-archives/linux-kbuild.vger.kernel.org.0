Return-Path: <linux-kbuild+bounces-3362-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED8F96C797
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 21:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4214E1C23652
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 19:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7D11E4120;
	Wed,  4 Sep 2024 19:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="pZh2AzMR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C1B40C03;
	Wed,  4 Sep 2024 19:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725478359; cv=none; b=A/eBa0BnAo0Y9ReqcI+g9TGh9wRrWA7zVlD8aEN4jVXp/bipxgj3RfnHxoAm3JEqKHJdKhdi651K9VpevAyWxBywlRNWUGGFYWDZN45f5jpcYuS53JjV6VfCo4hlv0ugP5+DOfIvAutiaUr9vqcnzpv/6FB+oIOfGJ09xicfe+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725478359; c=relaxed/simple;
	bh=1BsfqSYBZBusIv1VPB8MyWxdGEMUcVXrmZ9yEtuQZg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRcHgy+Hu6Hx65m1lS81hQ1O7NGAN3ti9tXW/c+rHgrX6l7+rAOlLcE+3LUKuLG3MP+vgf42nltzTK3hhFK/07KCd56yUlLFkM6sFPYru6Dh45DZE8FLmTgmf5BwzizC6PSM2mcidaPfBYXRPPYgOmZcUzzZJ7D41pGrpDHYGqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=pZh2AzMR; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UcHZ5CTv4mKFksQdsvPKwDXzMVb8f/RnarAvgSKCoGI=; b=pZh2AzMRSB1aGFIVzn1u/ZRfmg
	2ClmQClSdEusW4Yt8bAV3os45uPmOw2TVKbxvHRJtCQLRbh7+7rVirnSXkMYtuV0B0ySv6neLetxM
	VaNQSocRoPZpfKewd4Qvsg4e6Qis9QtBk0E9Zo4r9ewJaAPPufwuisrLqCcDibVrWVb0Y+eC6QxAz
	uWiuu9dGTNjhQUstDF2Ck/4CWJ12HxcXFC0kLICFZYLYxv8XlePvK3Lz2VOhHw9m+j43VHP2Iors+
	K4N/US6DXABAkoKkNe1jrSANbH28heN7mn8tpOiPTiJw6psbaeT8JO6hFOBuJ4z99CIa7gNtY2QRF
	GOunnGAQ==;
Received: from [2001:9e8:9c9:f01:3235:adff:fed0:37e6] (port=49090 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1slvjv-004FVt-Ge;
	Wed, 04 Sep 2024 21:32:27 +0200
Date: Wed, 4 Sep 2024 21:32:17 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v2 0/6] `RUSTC_VERSION` and re-config/re-build support on
 compiler change
Message-ID: <20240904-cordial-zircon-grebe-ba4806@lindesnes>
References: <20240902165535.1101978-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240902165535.1101978-1-ojeda@kernel.org>

On Mon, Sep 02, 2024 at 06:55:27PM +0200, Miguel Ojeda wrote:
> This series mainly adds support for `CONFIG_RUSTC_VERSION` (which is needed for
> other upcoming series) as well as support for rebuilding the kernel when the
> Rust compiler version text changes, plus other secondary improvements.
> 
> v1: https://lore.kernel.org/rust-for-linux/20240808221138.873750-1-ojeda@kernel.org/
> v2:
> 
>   - Dropped patch #2 "kbuild: rust: make command for `RUSTC_VERSION_TEXT` closer
>     to the `CC` one" (Masahiro, Björn).
> 
>     In other words, now the `RUSTC_VERSION_TEXT` command is kept as it
>     was, without `LC_ALL=1` nor `| head -n1`.
> 
>   - Replaced `macros` crate dependency with a comment in the code that `fixdep`
>     will find, since we can do it for that one, unlike `core` (Masahiro,
>     Nicolas).
> 
>   - Added patch (here #5) to add a warning when the Rust compiler used to build
>     the kernel differs from the one used to build an out-of-tree module, like
>     the C side does (Nicolas).
> 
>     If the patch is not wanted, then it can be skipped without much loss, since
>     anyway Rust will fail to compile in that case. However, it would be nice to
>     have to prevent potentially unexpected situations and to clarify the errors
>     that `rustc` would emit later. See the commit message for more details.
> 
>   - Rewrapped comment to stay under 80 lines (Nicolas).
> 
>   - Picked up a couple tags that could more or less be reasonably taken given
>     the changes to v2. Re-runs of tests welcome!
> 
> Miguel Ojeda (6):
>   kbuild: rust: add `CONFIG_RUSTC_VERSION`
>   kbuild: rust: re-run Kconfig if the version text changes
>   kbuild: rust: rebuild if the version text changes
>   kbuild: rust: replace proc macros dependency on `core.o` with the
>     version text
>   kbuild: rust: warn if the out-of-tree compiler differs from the kernel
>     one
>   docs: rust: include other expressions in conditional compilation
>     section
> 
>  Documentation/rust/general-information.rst |  8 +++++++
>  Makefile                                   | 18 ++++++++++-----
>  init/Kconfig                               | 11 ++++++++-
>  rust/Makefile                              |  7 +++---
>  rust/macros/lib.rs                         |  4 ++++
>  scripts/rustc-version.sh                   | 26 ++++++++++++++++++++++
>  6 files changed, 64 insertions(+), 10 deletions(-)
>  create mode 100755 scripts/rustc-version.sh
> 
> 
> base-commit: a335e95914046c6bed45c0d17cabcd483682cf5e
> --
> 2.46.0
> 

the whole series looks good to me.  Thanks for the good explanations.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Kind regards,
Nicolas


