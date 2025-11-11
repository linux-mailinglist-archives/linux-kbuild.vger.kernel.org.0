Return-Path: <linux-kbuild+bounces-9572-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D978C4EA58
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 16:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 963F142296B
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 14:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFE331077A;
	Tue, 11 Nov 2025 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlTX7SP5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293C830DD04
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762872531; cv=none; b=fbvybQ3QdIUtXgjCBVhZFQcINIs546QQBaPMRB5kCBikFijakO8+0opyDKAyWLiB+KZaFKX2dWTOevK6N2x2BqmjprpPldqEZkzmdYyyCg0DCiLrNogCVwtAltyy0C8jxGNuIP/bAh5LWaj9FvgcuYcDCaK0wQO8i7IGKkylvoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762872531; c=relaxed/simple;
	bh=gcjHx0DzuGwbEc1jKseHRKYmImNdQDC327SXPGnIg+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taWrrKvJIALG+Sqe6srDmmTWkZLjWFhcjwVlzf2+kijGpD+hOlQ1m2RDlM+acC5WUcRyvixV08WUIaGZSuwnbYPd86d+jEpDdsoes4/5BbZue3uFOtWM8QTNMBrdvNKHUWX3YuO595bOSrtE42CL0Ibe+6GF/x44VORkmCS5p2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlTX7SP5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A6AC16AAE;
	Tue, 11 Nov 2025 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762872530;
	bh=gcjHx0DzuGwbEc1jKseHRKYmImNdQDC327SXPGnIg+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlTX7SP5vnVAX1NNLE7gRPdB2Zc7uzG6wAENvJO1KLIU73pWI97EkmPyW1sxne3f+
	 27maN5lUYe29p2BQFrWEXSfKSHHYORPUG4a5/d5djC2ry8slfyREWuO1YtghL/mb5C
	 Gx2gla0ldMl2P1Y6t5a96TT3j9JfW6TIIi7KqPuB/WEb/5+ki9EBeufT5Gl6IE21U3
	 Yqh19CmXsV1DOdP15N0m2JR0WIDBUV3Uk4+RlWwl54zo3ZZN2QneE3IS45WUw6I4Hw
	 9GtvowM9Ci9qrlvCzOdNyWKmuiqubqzxdGufz6NgpTn3egGY/mxyHkPOdsa0ci8nqj
	 M4oNiaUaG0Sqw==
Date: Tue, 11 Nov 2025 15:48:35 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Franco Martelli <martellif67@gmail.com>
Cc: nathan@kernel.org, rdunlap@infradead.org, corbet@lwn.net,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/1] Kconfig: Added compare capabilities for mconf
Message-ID: <aRNMww8YU_7dKwK3@derry.ads.avm.de>
References: <20251030141342.159994-1-martellif67@gmail.com>
 <20251030141342.159994-2-martellif67@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030141342.159994-2-martellif67@gmail.com>

Hi Franco,

thanks for your contribution.  Some notes below:

On Thu, Oct 30, 2025 at 03:13:42PM +0100, Franco Martelli wrote:
> This patch allows to compare the tristate value of two .config files
> inline, symbol by symbol, in mconf (make menuconfig) only. It can be
> really useful when customizing the .config file.
> 
> When a new stable release of a distribution is available, in the Linux
> kernel many things has changed, this patch comes in help in this
> situations, it allows to easily compare the customized .config file
> built for the previous version of the distribution, with the one
> provided by the new software distribution, used as reference.
> Generally it can be helpful when the differences between .config files
> are huge, because you can navigate across them in the menu window.
> 
> The patch has a limitation, it only show the tristate value (Y/N/M) not
> differences for symbol with a value (string), but it also marks with a
> "#" the symbol missing in the loaded .config, meaning therefore the
> symbol as a new feature.

I must confess, that I am not convinced yet, that this will be helpful
for general purposes.  Yes, large changes in .config files are not easy
to parse, but I do not see how your solution is easier to handle than
the use of scripts/diffconfig, other than not showing removed config
options.

> 
> o I've also added support for the more canonical <F1> key to show inline
>   help window, in addition to <?> and <h> keys.

Please split-off logical these independent changes into separate
patches (Add support for 'F1' hot-key).

Using simple letters (here 'h') as hot-keys is not a good idea as those
are already used for jumping through the currently shown menu item
(cp. highlighted letters in menu config screens).

> o By pressing the <F2> or <D> key you will get a view with all the
>   symbol differences listed.
> 
> o By pressing the <F4> or <F> key you'll save to a file the differences.

While the list might be helpful for comparing two config files, a large
list within an ncurses window does not look like a good thing to me.

When I save the list to a file (F4), I'd rather choose the output of
diffconfig for evaluation -- as it is more complete and has a layout
that looks more straight-forward and clear to me.

> o Added help text that it describes the new features.
> 
> This software is under GPL-2.0 license.

Please note that the whole Linux kernel source and its build system is
GPL-2.0 per se, cp. COPYING and the SPDX header line in each file.

> 
> Changelog:
> ----------
> 
> scripts/kconfig/confdata.c:
> ---------------------------
> 
> Silenced a warning emitted when parsing the .config file to compare.
[...]

Please put any patch changelog below the triple-dash line ('---').


I have not looked at the code, yet, as I have doubts regarding the
usefulness (see above).

Iff nobody mentions strong interest in these changes, please re-evaluate
if it makes sense for you to invest into a v5.


Kind regards,
Nicolas

