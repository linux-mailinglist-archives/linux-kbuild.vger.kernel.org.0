Return-Path: <linux-kbuild+bounces-1983-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E96388DF72E
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 23:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 287C71C24472
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 21:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E58313C901;
	Mon,  3 Jun 2024 21:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gd/xhC1D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09833364A1;
	Mon,  3 Jun 2024 21:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717450084; cv=none; b=nunCVTe8WHr4UIPMx5nM20snifzanZoL3pszVQQR3TWSZRfz+Sqtx7QP9PW1O3nya3e3Kwo7qoWi8mooe+tuXGanCvso4OWkaaOxH9toYfcb3ZO6gkkrRjfZ0FCwLWu6mecV/xYk82PpEIKZJYCk4pihSCzXEdwiX84WVLppfFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717450084; c=relaxed/simple;
	bh=cv6ZbRbem/A0Q4LcT+ihBqa1lFOVgAJP+RHCblOCx1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcJ8CqOgm+TxAQIz23/H1TnNHsnHmLUejYgZ6wD1dtHfDLcXJNXTeEUkAfaJA2cPWS0fi0DT8FEvxBi5YRrotqlogD6h49Izs8klIPnl4o2drhTkh5lsn/VA6/W8m01cGhDRdQTZRe+NsCy8bWmsf0C08RySopq4QoizCYXSLNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gd/xhC1D; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=tGZ5NufCTQK64Zydh3z9idXYCfpCFAxQr2C6/+USRcQ=; b=gd/xhC1DER/WClNdLW5asW05F3
	H7JqKrLUCq8TA7HKTEO7EPY56nCmuMrEHNelMQ1QvkEx8RtMHvM/WYaK5tQZI+O718xpYqOv/Snd2
	YIJAJgIzehMOJ0re8yfWOOcpZFowVHepzYsKcbDSma2Nalw4qnF0Iu9JRjXXsHcaYeox6dCQfVFfH
	5cLGkei6IxZU1vBtPt/gjoVjRxs7v1zxHX5AP61Hl2WDblGdmju5eBZ3dNTV9IwHslqT6syOQac61
	sSOmkZahx08D8KeyGPZP5EWx0ZZ4Ll7ktlc4GUWcIY4X7lIMcbDAdtbyqz27hkaTg1ShHaqtQ+Iik
	TQTVNiIg==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEFDm-00000000OcV-1Yph;
	Mon, 03 Jun 2024 21:28:02 +0000
Message-ID: <e57d46ba-dc3f-4060-b770-ab01d909d2e3@infradead.org>
Date: Mon, 3 Jun 2024 14:28:01 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] kconfig: doc: document behavior of 'select' and
 'imply' followed by 'if'
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20240603161904.1663388-1-masahiroy@kernel.org>
 <20240603161904.1663388-2-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240603161904.1663388-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/3/24 9:19 AM, Masahiro Yamada wrote:
> Documentation/kbuild/kconfig-language.rst explains the behavior of
> 'select' as follows:
> 
>   reverse dependencies can be used to force a lower limit of
>   another symbol. The value of the current menu symbol is used as the
>   minimal value <symbol> can be set to.
> 
> This is not true when the 'select' property is followed by 'if'.
> 
> [Test Code]
> 
>     config MODULES
>             def_bool y
>             modules
> 
>     config A
>             def_tristate y
>             select C if B
> 
>     config B
>             def_tristate m
> 
>     config C
>             tristate
> 
> [Result]
> 
>     CONFIG_MODULES=y
>     CONFIG_A=y
>     CONFIG_B=m
>     CONFIG_C=m
> 
> If "the value of A is used as the minimal value C can be set to",
> C must be 'y'.
> 
> The actual behavior is "C is selected by (A && B)". The lower limit of
> C is downgraded due to B being 'm'.
> 
> I have always thought this behavior was odd, and this ha arisen several

                                                        has

> times in the mailing list.
> 
> I do not know whether it is a bug or intended behavior. Anyway, it is
> not feasible to change it now because many Kconfig files rely on this
> behavior. The same applies to 'imply'.
> 
> Document this (but reserve the possibility for a future change).
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
>  Documentation/kbuild/kconfig-language.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 86be5b857cc4..1fb3f5e6193c 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -150,6 +150,12 @@ applicable everywhere (see syntax).
>  	That will limit the usefulness but on the other hand avoid
>  	the illegal configurations all over.
>  
> +	If "select" <symbol> is followed by "if" <expr>, <symbol> will be
> +	selected by the logical AND of the value of the current menu symbol
> +	and <expr>. This means, the lower limit can be downgraded due to the
> +	presence of "if" <expr>. This behavior may seem weird, but we rely on
> +	it. (The future of this behavior is undecided.)
> +
>  - weak reverse dependencies: "imply" <symbol> ["if" <expr>]
>  
>    This is similar to "select" as it enforces a lower limit on another
> @@ -202,6 +208,10 @@ applicable everywhere (see syntax).
>  	imply BAR
>  	imply BAZ
>  
> +  Note: If "imply" <symbol> is followed by "if" <expr>, the default of <symbol>
> +  will be the logical AND of the value of the current menu symbol and <expr>.
> +  (The future of this behavior is undecided.)
> +
>  - limiting menu display: "visible if" <expr>
>  
>    This attribute is only applicable to menu blocks, if the condition is

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

