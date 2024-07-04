Return-Path: <linux-kbuild+bounces-2359-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED49278CB
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 16:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E59D8B24C4E
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 14:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187451B1504;
	Thu,  4 Jul 2024 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="uGrrBWtl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5931B11EA;
	Thu,  4 Jul 2024 14:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720103878; cv=none; b=smnkeRBIxJMVe5QUSVmi4vJGvQK1A+k7PFVy+9LlRerRIRzq17W1gg/e3lWxXxRWSULrpYYyDgzxSj1vFLGRAOu6EUPRIMZmNOE6pJTeTTbubK65b/kcbXiRMOoc/uEniZ/VIzwKAaKsrl6ydCbG7cnfbWKdz7xXbBdLzIg0JyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720103878; c=relaxed/simple;
	bh=mwY74dlsFIApnrHHqBwsv2B4h7illEPJGKGZSxPxFuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mxXsz+bWHajUhlbCB63u8GjIBDpwHSAzlUrar3RamTQnKxnzScyU9VHmxiEtSkCeBSGCFHKE8Bkr8ENTdAUyUtHVSVFizUMSVL0GCx++CWoa4hrd1Hs4bnTfd452u16VPkr/cfy2zceoD2jHe8Ot0169k8iFP6M3Dsnn/e6zHNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=uGrrBWtl; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Finn Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1720103873; bh=WPSdo/ewPDjgPiO+SNz36I1gMm3BiQP0YeSOxWsKwIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uGrrBWtl5nFYJqqMrONerQrimbsV/0R1j3bsFiM/IEOqKRALFIjjD+Lmyp0CbIr9W
	 O4TwwId9C3Obakg8WiCU5ysU2DlSHaZBgf2vo5si7gQu720JqH6IqZ4klFzb0bJKAS
	 lomivDMq6EAt9uYC7nTUqJwU56yrmLsiGoW7x+zI=
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 05/13] rust: simplify Clippy warning flags set
Date: Thu, 04 Jul 2024 16:37:51 +0200
Message-ID: <E8E07774-372B-4C28-B6CF-6B792BBB09D1@kloenk.dev>
In-Reply-To: <20240701183625.665574-6-ojeda@kernel.org>
References: <20240701183625.665574-1-ojeda@kernel.org>
 <20240701183625.665574-6-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain



On 1 Jul 2024, at 20:36, Miguel Ojeda wrote:

> All Clippy lint groups that we enable, except `correctness`, have a
> default `warn` level, thus they may be removed now that we relaxed all
> lints to `warn`.
>
> Moreover, Clippy provides an `all` lint group that covers the groups
> we enable by default. Thus just use `all` instead -- the only change is
> that, if Clippy introduces a new lint group or splits an existing one,
> we will cover that one automatically.
>
> In addition, `let_unit_value` is in `style` since Rust 1.62.0, thus it
> does not need to be enabled manually.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Finn Behrens <me@kloenk.dev>

> ---
>  Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 056176a55d63..3f43f03f855e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -465,10 +465,8 @@ export rust_common_flags := --edition=2021 \
>  			    -Wunreachable_pub -Wnon_ascii_idents \
>  			    -Wmissing_docs \
>  			    -Wrustdoc::missing_crate_level_docs \
> -			    -Wclippy::correctness -Wclippy::style \
> -			    -Wclippy::suspicious -Wclippy::complexity \
> -			    -Wclippy::perf \
> -			    -Wclippy::let_unit_value -Wclippy::mut_mut \
> +			    -Wclippy::all \
> +			    -Wclippy::mut_mut \
>  			    -Wclippy::needless_bitwise_bool \
>  			    -Wclippy::needless_continue \
>  			    -Wclippy::no_mangle_with_rust_abi \
> -- 
> 2.45.2

