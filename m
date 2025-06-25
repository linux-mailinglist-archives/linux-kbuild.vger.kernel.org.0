Return-Path: <linux-kbuild+bounces-7702-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 470B3AE8B53
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Jun 2025 19:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D17771C27CD2
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Jun 2025 17:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AC03074AC;
	Wed, 25 Jun 2025 17:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bHq12Igw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3861D63F8;
	Wed, 25 Jun 2025 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750871253; cv=none; b=b8Xisqfmct336G9qirH33L/lKHaLgFvOPoC09Pq0AOakYpA+gvneqwg2OeqKvbwKaeGOv/PGl25vRZojIlJDiIxHYWOmr+NdNQ9EIdVXdr9b0xG60yyYQC5tP1+fPoHi7Gr139xwGGrGdBugUwdGdO5LqvbxQT0xd/lPenMNHgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750871253; c=relaxed/simple;
	bh=Mxqg4kXqnNQg5s9JUM/6GtYVGscoPomDaISw/HKfdbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fvomcxe4XFs970A3LE6aaP2d5J2le/1MnZ+rWsEdcQBAwOgxwEt786JmomZQ6Jyz7c3nA3wqUPJLq7zwj9QDLEbZyGDuGVR8QTlktolDpzlLd1tOyXCzvgcVwtJiwTETr63nLSOGL+LMN0enisn+ud5MxnMsZk60G2G5hwY+/eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bHq12Igw; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Fcpks4qnS1BCFQD1OcDIlxe5MsQGaGaghviwmhLptrQ=; b=bHq12Igw2xKD8hmdjH0DyAYFAv
	V+JnrldyXqgZGfX+irZdncWxda2NLLuw9UtXvrmlZr+p4f2DkTaoKUocBQYj0wEp5za4XEz2uX0RZ
	k4tXgKa77Ale41osjmFSPRgnyV7P0Z3gTvBL9n2rffzoZX6m100wAIVbbIar4J5KYJwD1zTNP9yMP
	5MgcVzoh35KGAtIOR4JTPLVyAX1f12gu7oz/GgByJYKSTdkBRHFPKDW8a+58/+hbo9sfIJdejLPzJ
	mS76GmzvgTtQkRFTlbK4+Iak1TOQzuxRcaIgXCmAfUxnU+IiwO+g6xdoXYjndk0OLWx6oqLV/NtQO
	deaSy4Bw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTao-00000005tmx-0MXP;
	Wed, 25 Jun 2025 17:07:26 +0000
Message-ID: <0f006fbf-c930-40aa-b08a-8e1b7275ea43@infradead.org>
Date: Wed, 25 Jun 2025 10:07:21 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: kbuild: note CONFIG_DEBUG_EFI in
 reproducible builds
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625125809.2504963-1-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250625125809.2504963-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/25/25 5:57 AM, Masahiro Yamada wrote:
> CONFIG_EFI_DEBUG embeds absolute file paths into object files, which
> makes the resulting vmlinux specific to the build environment.
> 
> Add a note about this in reproducible-builds.rst
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/kbuild/reproducible-builds.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
> index f2dcc39044e6..7a16dbc275ca 100644
> --- a/Documentation/kbuild/reproducible-builds.rst
> +++ b/Documentation/kbuild/reproducible-builds.rst
> @@ -61,6 +61,9 @@ supported.
>  The Reproducible Builds web site has more information about these
>  `prefix-map options`_.
>  
> +Some CONFIG options such as `CONFIG_DEBUG_EFI` embeds absolute paths in

               options                            embed

> +object files. Such options should be disabled.
> +
>  Generated files in source packages
>  ----------------------------------
>  

-- 
~Randy


