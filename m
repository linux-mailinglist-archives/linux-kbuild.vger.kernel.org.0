Return-Path: <linux-kbuild+bounces-3551-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380BA978F35
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Sep 2024 10:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A7B41C213FB
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Sep 2024 08:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3941E433D8;
	Sat, 14 Sep 2024 08:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="Gj3GRfXU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EE329415;
	Sat, 14 Sep 2024 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726303591; cv=none; b=pKWE4Aj1ZbHx48wwh17YRs4XinVa6XjOkf6AmaK+xrDY4y0S6A1dOSCc1aLpHwUriwFadE6YgqhmqcfVh/2Y3TRGPTBWRZenzo1x9oIjXTxAEkmocNBRzIq64s7N9ExJgTX//E+DA54GvXB1fM4BMyxp/GXLugV2cSUNyxGEJn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726303591; c=relaxed/simple;
	bh=dGVVExZAgsJf/0B5o56CGEutiaBBg4kvMiJLmXnSWA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MtPfjA2gMYjslXRi3O3HVwx3X6GgFERYPLsm+AWExtfNXkVG0J3WB4o8J4pLEp6pmlzojfiHY4Kdt7UYLhMsfUYqcuIZLMY6nLRzP8Xf7VPHDvGeO3YhOM7M3NWY/pN7Ka4dV29CZogEZepiudinvTPcaZH/DENwQjNJqjL+6dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=Gj3GRfXU; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VetaU/oOL3Zc7EWr4oazjj3TUguWh7N8AwR7snHhCag=; b=Gj3GRfXU7WsIWx3zEwxG2TfWOx
	IQwLZYGqVfCs8B5g4O0C8Ink5VBcYqoU2nUadWBunF1cVuFRBLMWVUly/e6VFHgwRPWaprvJA6Rjy
	kDcomPf0dYucBF6PNU6OK/sC+Id7u5o9TqFyU+UeHLZEEpIVKBAlAnwdugpWe4gLMhQt/yt7I7PAT
	dU01ZRm+8ReCd2Bmhi/M/UVqCGku6ju+v8wFlMApVXavSjjJY1noMTxB5pNTtg/T4kCFzznOh5s5P
	kxnUQw+U7+xRvvcz6DriIGwjc/wqTZI5owZ4iJsMTXeAPCM1+K5eI9NTVwYHAzY41Kp2b1AJsXcjT
	1yOZBfGA==;
Received: from [2001:9e8:9c6:1501:3235:adff:fed0:37e6] (port=59544 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1spMzo-0087cE-Ai;
	Sat, 14 Sep 2024 09:15:04 +0200
Date: Sat, 14 Sep 2024 09:14:58 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	rust-for-linux@vger.kernel.org, Finn Behrens <me@kloenk.de>,
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] kbuild: remove unnecessary export of RUST_LIB_SRC
Message-ID: <20240914-wonderful-orthodox-wrasse-3ab134@lindesnes>
References: <20240913180622.1327656-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913180622.1327656-1-masahiroy@kernel.org>

On Sat, Sep 14, 2024 at 03:06:20AM +0900, Masahiro Yamada wrote:
> If RUST_LIB_SRC is defined in the top-level Makefile (via an environment
> variable or command line), it is already exported.
> 
> The only situation where it is defined but not exported is when the
> top-level Makefile is wrapped by another Makefile (e.g., GNUmakefile).
> I cannot think of any other use cases.
> 
> I know some people use this tip to define custom variables. However,
> even in that case, you can export it directly in the wrapper Makefile.
> 
> Example GNUmakefile:
> 
>     export RUST_LIB_SRC = /path/to/your/sysroot/lib/rustlib/src/rust/library
>     include Makefile
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> This code was added by this commit:
> 
>   https://github.com/Rust-for-Linux/linux/commit/3f46885dc03ed2d750085b2237078a1628323964
> 
> Please me know if I am missing something.

Looks good to me.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

