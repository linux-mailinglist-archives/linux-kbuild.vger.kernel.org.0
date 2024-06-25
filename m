Return-Path: <linux-kbuild+bounces-2250-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BAD9170DE
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2024 21:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2B881F22F5C
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2024 19:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21FF17C23D;
	Tue, 25 Jun 2024 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="Osh/WSZb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CA317A932;
	Tue, 25 Jun 2024 19:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719342426; cv=none; b=Ndog4Ddc/dBCN2uMAatnNkgePP7qzyAZCxilQ0LaoguJVyRDI19awVkp1WqeTjQVXLIySKz3SLOAsX1qx4e+LYJvLzsQZza6Vw9E444BdwdxUeFVyYBwDEw7E0DlS5sI+W2TGckEOVc3hHvheGkeRSwznRQYy41UCHzJeIb5g3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719342426; c=relaxed/simple;
	bh=Asjm/C5+CmQ+TnjuNygMYUQqEXInZseKiWCxfOweU7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LuyQIl/cbevcvPt5ZxCrx1090UdJztR+gQUZ5/PXGP6e9HWIHvnf2QNwzWwp6naeHOLVhad5J69zfVlqIfWBP8JxJibCjdFTXW5MmzhzWoWQw9gfscNd0T+u21vnChh+wue6ER2K3qpRvbED6tOCZ8Nhw1rk/lV52TmKppauz8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=Osh/WSZb; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Finn Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1719341978; bh=DfZVYn4i4/VpKnmIgEflQ+7+YiZX3LFU35HAKDKVHMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Osh/WSZbq02S3onY9bnOiJQkl8+OjTXDw9ow2ZrTTXTJPUoDI6E7tqHiivLvwXeyi
	 UZ/P1xRuyUMXL61qJRnNpip8U6HXidiKeMg4AjUt01D7B0RL3/m78g9WRs51KMNQqz
	 EacaLvpI2RJ7g4adb0YEgyJkMYgzCG+VhzeKKH7M=
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] Makefile: rust-analyzer target: better error
 handling
Date: Tue, 25 Jun 2024 20:59:36 +0200
Message-ID: <3E731AD5-428C-427C-AFBD-7E65504169FA@kloenk.dev>
In-Reply-To: <20240620205453.81799-2-jhubbard@nvidia.com>
References: <20240620205453.81799-1-jhubbard@nvidia.com>
 <20240620205453.81799-2-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain



On 20 Jun 2024, at 22:54, John Hubbard wrote:

> 1) Provide a better error message for the "Rust not available" case.
> Without this patch, one gets various misleading messages, such as:
>
>     "No rule to make target 'rust-analyzer'"
>
> Instead, run scripts/rust_is_available.sh directly, as a prerequisite,
> and let that script report the cause of any problems, as well as
> providing a link to the documentation. Thanks to Miguel Ojeda for the
> idea of just letting rust_is_available.sh report its results directly.
>
> The new output in the failure case looks like this:
>
> $ make rust-analyzer
> ***
> *** Rust compiler 'rustc' could not be found.
> ***
> ***
> *** Please see Documentation/rust/quick-start.rst for details
> *** on how to set up the Rust support.
> ***
> make[1]: *** [/kernel_work/linux-github/Makefile:1975: rust-analyzer] Error 1
> make: *** [Makefile:240: __sub-make] Error 2
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 14427547dc1e..07308277a6f5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1970,6 +1970,7 @@ tags TAGS cscope gtags: FORCE
>  # IDE support targets
>  PHONY += rust-analyzer
>  rust-analyzer:
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
>  	$(Q)$(MAKE) $(build)=rust $@
>
>  # Script to generate missing namespace dependencies
> -- 
> 2.45.2

Reviewed-by: Finn Behrens <me@kloenk.dev>

