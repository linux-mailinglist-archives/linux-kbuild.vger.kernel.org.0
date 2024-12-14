Return-Path: <linux-kbuild+bounces-5134-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B439F1B57
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Dec 2024 01:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12CB816B054
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Dec 2024 00:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9A96AA7;
	Sat, 14 Dec 2024 00:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLuFTptL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6115D539A;
	Sat, 14 Dec 2024 00:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734136568; cv=none; b=YmgQSDhNQ8Cc5ItaDQUir8WXSaJ8eAq64lu5r8DepWDFZEJed5KcB5M9yNPf4qNzEGRYqv0zBXf1bXjEAY3SRB5TCZD2xJhy5nJJdjWZntwc97I8Nle1uO7BeZPGix0zWqrLAniHxcfLQ6Knqtfkl0p3mZeGo60ifadEuOnqd2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734136568; c=relaxed/simple;
	bh=Fl0kTfngZ/Qwv3m22qp4EK746DEdtia9PGWWE4vya3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiruEhCxx+EvIotgKeBJlpqSQh+/fl4WRaHOrjHAC1rpk81Me3I/RnOC6NAuJnG7KiUJSXSls3xMhDTtiBTA4NS972LPjmvEZNYR70WmvIN7CSUYqYve2AvulnIbp9iOhy209IUd6ZtesHuVDgpJO8ZT/vBXEpDwhBHZW/0u+QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLuFTptL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0214C4CED0;
	Sat, 14 Dec 2024 00:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734136567;
	bh=Fl0kTfngZ/Qwv3m22qp4EK746DEdtia9PGWWE4vya3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cLuFTptLrVen/ZrLYdWXMT39puYEi+tYgcJJirYLheEwKSaR2Vc1zWhZoTQmyfix6
	 1XvSkcnQ67n/fofSZg+7+3mrRfhfMdkkifnthtchIbzelNoH20iByICCq9S7HzxeGe
	 HZnak1M8FeqKSy5CotK6sjz5ATkqQt7/O//5/hgm1xSplSC++Es+JmgbhTds9pWnXG
	 zWph3vS+2De4OOmi/bdOkj3FsQrM5Y24yfDF6d9CvMJQield/roMs53Jjpa11tCsOK
	 7mjJU6Z/A2PSvMndkvi2+g/mPt1EGkZLv30xbWID6WG6oM5TkhH3zDzpL8QBihm1FU
	 leIpynRTRuXag==
Date: Fri, 13 Dec 2024 16:36:05 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/2] objtool: Add --fail-on-warn
Message-ID: <20241214003605.gwlfukj3tdelx4bq@jpoimboe>
References: <20241213-objtool-strict-v1-0-fd388f9d971f@google.com>
 <20241213-objtool-strict-v1-1-fd388f9d971f@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-objtool-strict-v1-1-fd388f9d971f@google.com>

On Fri, Dec 13, 2024 at 11:31:30AM +0000, Brendan Jackman wrote:
> At present objtool only prints to the terminal when observing "fatal
> warnings". This option lets you have it produce an error instead.
> 
> My use case for this is noinstr validation; so far I've never seen any
> false warnings here, but it quite often detects real bugs. I'd like my
> build to fail when I have those bugs.
> 
> Signed-off-by: Brendan Jackman <jackmanb@google.com>
> ---
>  tools/objtool/builtin-check.c           | 6 ++++++
>  tools/objtool/check.c                   | 7 ++-----
>  tools/objtool/include/objtool/builtin.h | 1 +
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
> index 387d56a7f5fb8da8435d0a3f5c05eeee66932c9b..dd70cbb98929b7f558c27766bda46ad276c0750d 100644
> --- a/tools/objtool/builtin-check.c
> +++ b/tools/objtool/builtin-check.c
> @@ -94,6 +94,12 @@ static const struct option check_options[] = {
>  	OPT_BOOLEAN(0, "sec-address", &opts.sec_address, "print section addresses in warnings"),
>  	OPT_BOOLEAN(0, "stats", &opts.stats, "print statistics"),
>  	OPT_BOOLEAN('v', "verbose", &opts.verbose, "verbose warnings"),
> +	/*
> +	 *  For now, don't fail the kernel build on fatal warnings by default.
> +	 *  These errors are still fairly common due to the growing matrix of
> +	 *  supported toolchains and their recent pace of change.
> +	 */
> +	OPT_BOOLEAN(0, "fail-on-warn", &opts.fail_on_warn, "fail on fatal warnings"),

How about "--Werror" to mirror the compiler -Werror option.

-- 
Josh

