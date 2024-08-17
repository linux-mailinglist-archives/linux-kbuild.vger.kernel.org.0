Return-Path: <linux-kbuild+bounces-3061-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D25D49557E0
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 14:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 511481F224D8
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 12:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB89914AD19;
	Sat, 17 Aug 2024 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="UlSXQqN9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073CB14F115;
	Sat, 17 Aug 2024 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723898577; cv=none; b=N47WLWuah8aJf5GBQ/UzOOvPuCWPipijbd5dKXnxawKHlXtq6p8F4TurQd7FbLSPnkhjrK9919aU+FXx3/OIsq1ghI9KqIM9ZN9bbHj1retONqayRczjGUW9z9jkg0RwccAPXNB9e89T2UzUZzO9P/onTxZ78YhtqCmClhlljWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723898577; c=relaxed/simple;
	bh=Wj/DVctpez763JGpLUR53k3SJ0olWEe1ObuTxbhcrfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahYgYx8vNdHQKSQRd9skfvxf44lgfQ3OuZiUCxuzKOkgn9gr2tZ8+PsAF9p1HoIVJzB7KBeoFlnU+MBaf0Ai24oQajkjTwgOp6EkdiGq465D6Mp3he46kSUIqlb93l6a388XesLkcrMjm3MAy7RnfFpZgwV54amTwbjDvIEE6n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=UlSXQqN9; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=popLMSY8TBdy2nNJXIcgiSCPMgpZb7oW9Kq6UPjty04=; b=UlSXQqN9HMhG4c8QbCmvwdBIHh
	Q7NSF+ZyxXJgN5fKZmJZS/2YbfcjFOZqhzjZIL+777FSZWoXX/Av3X8QJ/+++pH7XuoJOu4Wq6RY3
	QbiN69cYaKhFTo2oWjeVVMSZC6uGsI66cbyERSDe0KcYTefJHuPqmu/mOrj/bOcM8xy3pmEOL+oNd
	nh3TjKiKXmoiAZWDVrp8O9yUi13v6ilGc6DIx5FYBJvCHoD4X0SLSBg6kMnVOiPhc2BBXq5aF7G6k
	a5Q9tbwDb4NJXtDN4xkEhOQl7kdx0Ki4oozx7gDZcShwl2nxtSlKEg8ne+bO9mLVVrRNjPpFQ3bq/
	iTu0RJ8A==;
Received: from [2001:9e8:9db:8201:3235:adff:fed0:37e6] (port=45834 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sfIlP-00DS5k-0s;
	Sat, 17 Aug 2024 14:42:35 +0200
Date: Sat, 17 Aug 2024 14:42:29 +0200
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
Subject: Re: [PATCH 1/6] kbuild: rust: add `CONFIG_RUSTC_VERSION`
Message-ID: <20240817-shaggy-adamant-warthog-be1167@lindesnes>
References: <20240808221138.873750-1-ojeda@kernel.org>
 <20240808221138.873750-2-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808221138.873750-2-ojeda@kernel.org>

On Fri, Aug 09, 2024 at 12:11:33AM +0200, Miguel Ojeda wrote:
> Now that we support several Rust versions, introduce
> `CONFIG_RUSTC_VERSION` so that it can be used in Kconfig to enable and
> disable configuration options based on the `rustc` version.
> 
> The approach taken resembles `pahole`'s -- see commit 613fe1692377
> ("kbuild: Add CONFIG_PAHOLE_VERSION"), i.e. a simple version parsing
> without trying to identify several kinds of compilers, since so far
> there is only one (`rustc`).
> 
> However, unlike `pahole`'s, we also print a zero if executing failed for
> any reason, rather than checking if the command is found and executable
> (which still leaves things like a file that exists and is executable,
> but e.g. is built for another platform [1]). An equivalent approach to
> the one here has also been submitted for `pahole` [2].
> 
> Link: https://lore.kernel.org/rust-for-linux/CANiq72=4vX_tJMJLE6e+bg7ZECHkS-AQpm8GBzuK75G1EB7+Nw@mail.gmail.com/ [1]
> Link: https://lore.kernel.org/linux-kbuild/20240728125527.690726-1-ojeda@kernel.org/ [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  init/Kconfig             |  7 +++++++
>  scripts/rustc-version.sh | 26 ++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100755 scripts/rustc-version.sh
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 3ada33b1d681..47e2c3227b99 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -60,6 +60,13 @@ config LLD_VERSION
>  	default $(ld-version) if LD_IS_LLD
>  	default 0
>  
> +config RUSTC_VERSION
> +	int
> +	default $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
> +	help
> +	  It does not depend on `RUST` since that one may need to use the version
> +	  in a `depends on`.
> +
>  config RUST_IS_AVAILABLE
>  	def_bool $(success,$(srctree)/scripts/rust_is_available.sh)
>  	help
> diff --git a/scripts/rustc-version.sh b/scripts/rustc-version.sh
> new file mode 100755
> index 000000000000..62ea510be71b
> --- /dev/null
> +++ b/scripts/rustc-version.sh
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Usage: $ ./rustc-version.sh rustc
> +#
> +# Print the Rust compiler name and its version in a 6 or 7-digit form.
> +
> +# Convert the version string x.y.z to a canonical up-to-7-digits form.
> +#
> +# Note that this function uses one more digit (compared to other
> +# instances in other version scripts) to give a bit more space to
> +# `rustc` since it will reach 1.100.0 in late 2026.
> +get_canonical_version()
> +{
> +	IFS=.
> +	set -- $1
> +	echo $((100000 * $1 + 100 * $2 + $3))
> +}
> +
> +if output=$("$@" --version 2>/dev/null); then
> +	set -- $output
> +	get_canonical_version $2
> +else
> +	echo 0
> +	exit 1
> +fi
> -- 
> 2.46.0
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

