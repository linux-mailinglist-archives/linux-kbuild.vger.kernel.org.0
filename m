Return-Path: <linux-kbuild+bounces-3063-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AB79557F7
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 15:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D0E5282AE9
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 13:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012BE14430A;
	Sat, 17 Aug 2024 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="o7bH7Vwh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA7511187;
	Sat, 17 Aug 2024 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723899895; cv=none; b=VIt+zLTCYl/LVLb7hPO6gtsymsQ+YO0/oBiHBCD+QsWD9gMci/pY0MLLLd6HRePLm9H8Vtxk0HrPrzv4Vnw/cNt3LOuOYg34O98d4dj32lkg6syvqLUH37nCyyCnU/Smhr1MnNfZNZuZGQEE8dCOWBU9sglJ+yVhcVh+NYOwEZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723899895; c=relaxed/simple;
	bh=JZM8n8x+g7qMtmOd0SazR3cDaPmkuaJQzeNaeIE0dq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twQjXTaSDbsFsuGEjyiw7qSqU+yKJeW4/zK4wQJviO+m/iAclgEksvwu/n7xELw3v1ZzOjOJFu9nq4jHsP+AzAzd0FOkBFUcVLDMAYe6DVK2IlG6t7+r30VEVZ4zo8POmuEfXln0Ad46fdu7m0eT+NRzjtBfNQcRloXOSWYhwXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=o7bH7Vwh; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/Dt+vJQWOKJTjuhMKbvYgOKGXnEc+DToKh1gi8tXf1U=; b=o7bH7Vwh5q/EcfqpCJwKbpjXIk
	7fUra0YsHU5cLrF2PCDtdo7rwnboFRQ1PHxUxZ9DxJcR5nFW4K2q8wGyrdDL2K/g1VfYzK7CvUrjz
	6qGx/aaER4duegBZr9KYzTYam1AS2l5OKzC5vQ4nErpWAV6t3sCMcNzHODyPpS80j6kuheQKJ65em
	jo6BVpz5+dENNmxBJ8ulptaM+zftmhcSJb73SQeGrbg4iwXeQ4tk+OkUX8KlQPV2xy9As3RlZ9XPk
	l5LIjgQ/h4uSCX+ahueSXjNsIm+PWoJJeiwU2a2kc/ZQi18fJLgZjN5Rwp405y36Wq76OvGyFRaJz
	Td3QW+xA==;
Received: from [2001:9e8:9db:8201:3235:adff:fed0:37e6] (port=53842 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sfJ6p-00DWQe-Oa;
	Sat, 17 Aug 2024 15:04:43 +0200
Date: Sat, 17 Aug 2024 15:04:39 +0200
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
Subject: Re: [PATCH 4/6] kbuild: rust: rebuild if the version text changes
Message-ID: <20240817-cute-doberman-from-shambhala-6f42db@lindesnes>
References: <20240808221138.873750-1-ojeda@kernel.org>
 <20240808221138.873750-5-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808221138.873750-5-ojeda@kernel.org>

On Fri, Aug 09, 2024 at 12:11:36AM +0200, Miguel Ojeda wrote:
> Now that `RUSTC_VERSION_TEXT` exists, use it to rebuild `core` when the
> version text changes (which in turn will trigger a rebuild of all the
> kernel Rust code).
> 
> This also applies to proc macros (which only work with the `rustc` that
> compiled them), via the already existing dependency on `core.o`. That
> is cleaned up in the next commit.
> 
> However, this does not cover host programs written in Rust, which is
> the same case in the C side.
> 
> This is accomplished by referencing directly the generated file, instead
> of using the `fixdep` header trick, since we cannot change the Rust
> standard library sources. This is not too much of a burden, since it
> only needs to be done for `core`.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> Masahiro: I used `$(objtree)` here since we still use it in the rest of
> this `Makefile`, but please let me know if you prefer otherwise. Thanks!
> 
>  rust/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index 6c0644b6090c..966743a9ee25 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -370,7 +370,8 @@ $(obj)/core.o: private skip_clippy = 1
>  $(obj)/core.o: private skip_flags = -Wunreachable_pub
>  $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
>  $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
> -$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
> +$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
> +    $(wildcard $(objtree)/include/config/RUSTC_VERSION_TEXT) FORCE
>  	+$(call if_changed_dep,rustc_library)
>  ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
>  $(obj)/core.o: scripts/target.json
> --
> 2.46.0

Looks good to me, but I'd prefer something like the suggestion from
Masahiro:
https://lore.kernel.org/linux-kbuild/CAK7LNAQBG0nDupXSgAAk-6nOqeqGVkr3H1RjYaqRJ1OxmLm6xA@mail.gmail.com/

