Return-Path: <linux-kbuild+bounces-10326-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3CDCD736E
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 22:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C472C300DA6F
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 21:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB95230DEC4;
	Mon, 22 Dec 2025 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FWg7pQNq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CF82DEA67;
	Mon, 22 Dec 2025 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766439622; cv=none; b=jVnkgE4HKvJ5nLKjeDIIrvnI7RYot0/7+Z4vDN9bscu/LE9SWkCLhRs/97w3b9kRlrrI9O0JkwiuMVJMJVCF5V0t1FmdFC4U6xs7nX+EYR0Nv36S/JZDfg+7bjqg8NvwJOwyCSOgjSgr3dckhipbeodHy3Rg01ARkquTW3nffe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766439622; c=relaxed/simple;
	bh=CkVyHDCNUmtYyyEJtsapd91cEpcJQjgRl/97Nrtahx0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jW6rp+G3b2jhJMrYF+vV8exY64eTAz4stO10U4eIqybTen1w5sMysNB+FJblxygzeEem2Zzu0guM9LLw6TjJKhr0iRnGd2K22OJuUFeKu33LkTybv27AXMsVheGHi9u666Snbf1sy6QASrb/KZmfeSgNh/MQKrH6FXouEJIMtJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FWg7pQNq; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BE8F14040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766439613; bh=TMbDm/NtBcLFz8Y3uB8XRsFo4EW5b/piEv40a2PpBH0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FWg7pQNqCZ4BWw2o42GvAkhj++fls8LPyi8J1M+Z7Hg9TL5ZZbOZP2v2khrfC0KI4
	 +N7QxMm3QLGW0xPFyDcR592+R22mKwzYjaSzcUt4ILwfafeh5AN1PGQRerFJOKs3hF
	 zcO7bul8SYvf/egvVQIks4un/RzsJNvlVIFC20ZfRXjQS6euXQ+M6nXFBi+9W7n58E
	 9aF/doSxthxcfof4GvZ6MopijgSh5PglFujenoMKwM6Kys2vmz6pbZQ6V99M7w+kcf
	 8G8nERg+GX6l6VVNz8vfaXryLPyO7O2NQxZ6bG+EJgyhcRFicbSgOvdglaQ+CMA4Oq
	 DcvpvdQc1IuuQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BE8F14040B;
	Mon, 22 Dec 2025 21:40:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: cp0613@linux.alibaba.com, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chen Pei <cp0613@linux.alibaba.com>
Subject: Re: [PATCH] docs: kbuild: Fix typos in makefiles.rst
In-Reply-To: <20251220125434.2430-1-cp0613@linux.alibaba.com>
References: <20251220125434.2430-1-cp0613@linux.alibaba.com>
Date: Mon, 22 Dec 2025 14:40:12 -0700
Message-ID: <875x9y2o1v.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

cp0613@linux.alibaba.com writes:

> From: Chen Pei <cp0613@linux.alibaba.com>
>
> The correct command to generate header files is
> make headers_install.
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  Documentation/kbuild/makefiles.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 8aef3650c1f3..24a4708d26e8 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -1264,7 +1264,7 @@ Add prerequisites to archheaders
>  --------------------------------
>  
>  The archheaders: rule is used to generate header files that
> -may be installed into user space by ``make header_install``.
> +may be installed into user space by ``make headers_install``.

Applied, thanks.

jon

