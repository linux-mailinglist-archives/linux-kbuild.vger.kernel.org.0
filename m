Return-Path: <linux-kbuild+bounces-1982-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D0B8DDC9E
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 23:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B80D9284F32
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 21:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE6C13BAE5;
	Mon,  3 Jun 2024 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eilW4qOd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC381364A1;
	Mon,  3 Jun 2024 21:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717450078; cv=none; b=JISL+FyfcrC6r7nhl8fhDUIDalo+QLQu5/Jlx+K+93eKc9xCgBuIbsPK2GY0kP8P6uW3ERXPXUaFSQY+vCuYWI51en6CvMUmmVsfme9ARAq1DhfAj7P/7cQ9OaMcyUafZrwgsPhayGroO5tV3R6bqXxyi9XcEHXh01OGHDVomJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717450078; c=relaxed/simple;
	bh=FUsL5X9V17Z2s69+YcjAFrRVbWIgcA3bDRVc1rw94bQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+nz3bms7yhAOK8CbcsZqs7w14cxJTtMiMaVX3uTEitJG6Z01pJSQUV6DpnE+8Si570zIF38xOXtIHe1HQkwbCwnBC21qCrijYwb2Lci58na655HrFP3HDDZYYUoSdreFIkYUhkECKltkvqx+MZ8P64YkFTsgg1uizHeP+9Wjso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eilW4qOd; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=LSDGQzdToprClbFM9VSOn3HPVixsGLyQ+MmVlrKB1kI=; b=eilW4qOdRA4jyzIj6Y6OsGnHEt
	NIDjNj/p6WTMv/ZSSIcFk8ZtQpW5ISSG3hSJigB6rnKNwyRjBJeFmHVgR8eLlmEGj+Dd+N+kRncqR
	8nIZDIZTF+zbAdNd/ISt1/DA9+wD3N22k1RW0gT01piTnjVgNx+cCJU8UCOFe60vUhkHCJOtB4B0y
	Xb5VUHtePrZqICDNJ6phu6zY6L7nWzN7RmmwZbuHca85pbg38VsxLZCPElpCCc+Lxbyuzt36zxIUe
	6FbEXRHrKytYVdI5M58dmVP92hEix1OV+Knj0dZceHVp3OKvMK+28Y8jgefFuzexuGIgDKuq3HmPy
	3CS+CMsA==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEFDg-00000000Ob9-0r2e;
	Mon, 03 Jun 2024 21:27:56 +0000
Message-ID: <ec2e447e-ca96-49fc-b41b-ee3c48f6a914@infradead.org>
Date: Mon, 3 Jun 2024 14:27:53 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kconfig: doc: fix a typo in the note about 'imply'
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20240603161904.1663388-1-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240603161904.1663388-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/3/24 9:19 AM, Masahiro Yamada wrote:
> This sentence does not make sense due to a typo. Fix it.
> 
> Fixes: def2fbffe62c ("kconfig: allow symbols implied by y to become m")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
>  Documentation/kbuild/kconfig-language.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 555c2f839969..86be5b857cc4 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -184,7 +184,7 @@ applicable everywhere (see syntax).
>    ability to hook into a secondary subsystem while allowing the user to
>    configure that subsystem out without also having to unset these drivers.
>  
> -  Note: If the combination of FOO=y and BAR=m causes a link error,
> +  Note: If the combination of FOO=y and BAZ=m causes a link error,
>    you can guard the function call with IS_REACHABLE()::
>  
>  	foo_init()

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

