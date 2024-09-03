Return-Path: <linux-kbuild+bounces-3352-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6F196A7C4
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 21:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 434A2281C4D
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 19:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570A21DC729;
	Tue,  3 Sep 2024 19:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="eBd/C53f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4184E1DC720;
	Tue,  3 Sep 2024 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725392964; cv=none; b=CHghaBCgXn4LjxtQG5PmxD/xntcOBnaEykqVfyWg5Y4aRucGdegAodxRP3dayZPYMoPGM89hs3IAJnHy0XdiN43lqmJnnw7797110j3l4fPmwxn3pTx2UgAQZt2TSiVAdJjffKryWi1zVQm/A+8/HWhjsmP3QvrsPugRe7yFiQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725392964; c=relaxed/simple;
	bh=ROj9kqpOSFemG0GEO1bYY09F9alqNxe4Bb0al29yNEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+Td+HAijFwv4PgFNrpI28+smhaGoa20Y4OenTp7zidanCjD/l3KvB1vFCV4/xLDFiLXOfso/tG7sXnDkrCEydPFuqGcnFyB8x0x7IV+116NuKVK1eUjVlS3laZx/3OPmhgl0nvL02yeI0Pd0YQZLpIQHwYmT5huATr3nOkTy2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=eBd/C53f; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IRivim3ffLLDf7rcgH+ESDzV4H+sYZRxkj85fKwazmU=; b=eBd/C53fK7FCkwxaCWq9uJJI1q
	HqJM8DtZmZ6JRwjLK/KUdnu/LxOInAz3o3jPrTv1YFt3rDziz27OwS4hUK7qskpTxquuAEnthUMll
	CsBWGhaF6OUPupKLhWxqHvbg10UFA2a3XdddvXOtZUXMwg0bAOgqXDwBgeckEfQFF8mfiMgDvkhUJ
	0sB7DOl6p53V9N2ro/wmmk9E0z86FIn7r3LkmVwuWhKYL4tGTSotFlPHQH/LFbzeW/N09gXmJC74A
	pQGfPgPTzlPUtLnsQATbgrQXB3wrENhyBNBXpGtdz8i6ox1Vm5U8PasbCCS9NsyZE/NkLvPjxBmMm
	/rkimeOg==;
Received: from [2001:9e8:9e4:e501:3235:adff:fed0:37e6] (port=32920 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1slZWS-00EkYB-St;
	Tue, 03 Sep 2024 21:49:05 +0200
Date: Tue, 3 Sep 2024 21:48:59 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v2] kbuild: pahole-version: improve overall checking and
 error messages
Message-ID: <20240903-super-elk-of-bliss-eaed2c@lindesnes>
References: <20240902160828.1092891-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902160828.1092891-1-ojeda@kernel.org>

On Mon, Sep 02, 2024 at 06:08:28PM +0200, Miguel Ojeda wrote:
> Like patch "rust: suppress error messages from
> CONFIG_{RUSTC,BINDGEN}_VERSION_TEXT" [1], do not assume the file existing
> and being executable implies executing it will succeed.
> 
> Instead, bail out if executing it fails for any reason, as well as if
> the program does not print to standard output what we are expecting from
> `pahole --version`. The script needs to ensure that it always returns
> an integer, since its output will go into a Kconfig `int`-type symbol.
> 
> In addition, check whether the program exists first, and provide
> error messages for each error condition, similar to how it is done in
> e.g. `scripts/rust_is_available.sh`.
> 
> For instance, currently `pahole` may be built for another architecture
> or may be a program we do not expect that fails:
> 
>     $ echo 'bad' > bad-pahole
>     $ chmod u+x bad-pahole
>     $ make PAHOLE=./bad-pahole defconfig
>     ...
>     ./bad-pahole: 1: bad: not found
>     init/Kconfig:112: syntax error
>     init/Kconfig:112: invalid statement
> 
> With this applied, we get instead:
> 
>     ***
>     *** Running './bad-pahole' to check the pahole version failed with
>     *** code 127. pahole will not be used.
>     ***
>     ...
>     $ grep CONFIG_PAHOLE_VERSION .config
>     CONFIG_PAHOLE_VERSION=0
> 
> Similarly, `pahole` currently may be a program that returns successfully,
> but that does not print the version that we would expect:
> 
>     $ echo 'echo' > bad-pahole
>     $ chmod u+x bad-pahole
>     $ make PAHOLE=./bad-pahole defconfig
>     ...
>     init/Kconfig:114: syntax error
>     init/Kconfig:114: invalid statement
> 
> With this applied, we get instead:
> 
>     ***
>     *** pahole './bad-pahole' returned an unexpected version output.
>     *** pahole will not be used.
>     ***
>     ...
>     $ grep CONFIG_PAHOLE_VERSION .config
>     CONFIG_PAHOLE_VERSION=0
> 
> Finally, with this applied, if the program does not exist, we get:
> 
>     $ make PAHOLE=./bad-pahole defconfig
>     ...
>     ***
>     *** pahole './bad-pahole' could not be found. pahole will not be used.
>     ***
>     ...
>     $ grep CONFIG_PAHOLE_VERSION .config
>     CONFIG_PAHOLE_VERSION=0
> 
> Link: https://lore.kernel.org/rust-for-linux/20240727140302.1806011-1-masahiroy@kernel.org/ [1]
> Co-developed-by: Nicolas Schier <nicolas@fjasle.eu>
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> v1: https://lore.kernel.org/all/20240728125527.690726-1-ojeda@kernel.org/
> v2:
> 
> Reworked to catch successful programs that may not output what we expect from
> pahole as well as to do the checking step-by-step (for better error messages).
> 
> I didn't change the regular expression to reduce the changes (except adding
> `p`) -- it can be improved separately.
> 
> Also, please note that I added Nicolas as co-author since he proposed part of
> the solution, but he has not formally signed off yet.

thanks, no objections.

>  scripts/pahole-version.sh | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/pahole-version.sh b/scripts/pahole-version.sh
> index f8a32ab93ad1..cdb80a3d6e4f 100755
> --- a/scripts/pahole-version.sh
> +++ b/scripts/pahole-version.sh
> @@ -5,9 +5,33 @@
>  #
>  # Prints pahole's version in a 3-digit form, such as 119 for v1.19.
> 
> -if [ ! -x "$(command -v "$@")" ]; then
> -	echo 0
> +set -e
> +trap "echo 0; exit 1" EXIT
> +
> +if ! command -v "$@" >/dev/null; then
> +	echo >&2 "***"
> +	echo >&2 "*** pahole '$@' could not be found. pahole will not be used."

shellcheck likes to have '$*' instead of '$@', but I can't think of a
set of arguments which might cause problems.

> +	echo >&2 "***"
> +	exit 1
> +fi
> +
> +output=$("$@" --version 2>/dev/null) || code=$?
> +if [ -n "$code" ]; then
> +	echo >&2 "***"
> +	echo >&2 "*** Running '$@' to check the pahole version failed with"
> +	echo >&2 "*** code $code. pahole will not be used."
> +	echo >&2 "***"
> +	exit 1
> +fi
> +
> +output=$(echo "$output" | sed -nE 's/v([0-9]+)\.([0-9]+)/\1\2/p')

I'd rather like to have

    output=$(echo "$output" | sed -nE 's/v([0-9]+)\.([0-9][0-9])/\1\2/p')

here (thus, explicitly check against a two number subversion), so that
we can detect also versions like 1.100 or 2.1 and bail out.

Kind regards,
Nicolas

