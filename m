Return-Path: <linux-kbuild+bounces-62-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A7E7F011F
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 17:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFCCF280ED0
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 16:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3E37F4;
	Sat, 18 Nov 2023 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TtVlAvvk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FC1C5;
	Sat, 18 Nov 2023 08:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=5SU1XXgi7WRBOVAn6Aiqulu56Tn+Irc2m07dBe4hANo=; b=TtVlAvvk5AMDszBIFke/t/u1Ov
	BnDW1LxiyKgpeD3KPGILr+ZccSZeFwieAZulYYeIQfrWFNEmxqNt6zhDGkOKwQIK0NM3FOCKIflKo
	fYTw5zV/FRiyqoHRI8iAIfaAZjmQGqxV/kt3GviiMz6+jhRJ4ljJqzy9GolngEmh8bQ4enSuO8IDC
	BHeaSfGCIY89dP6oWmWmF3r8evqPwOBddqnfQ7M42bcJRTpACeoF6jlRL7ZgQm+EAxwuLLvix2ZxM
	VhYOEbw54Kk8++zp16lGo8LuIy2XdVc7mjykVLfDS3tM2IXcFuDgVNYb9WySqkkDqPYhqXj3RNb4A
	VOjvgRKw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r4OCq-008plr-12;
	Sat, 18 Nov 2023 16:30:04 +0000
Message-ID: <3e879452-bda7-46d9-93fa-0cf01e484798@infradead.org>
Date: Sat, 18 Nov 2023 08:30:02 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] kconfig: require an exact match for "is not set" to
 disable CONFIG option
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20231118075912.1303509-1-masahiroy@kernel.org>
 <20231118075912.1303509-5-masahiroy@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231118075912.1303509-5-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/17/23 23:59, Masahiro Yamada wrote:
> Currently, any string starting "is not set" disables a CONFIG option.
> 
> For example, "# CONFIG_FOO is not settled down" is accepted as valid
> input, functioning the same as "# CONFIG_FOO is not set". It is a
> long-standing oddity.
> 
> Check the line against the exact pattern "is not set".
> 

Just to confirm (I hope), using:
CONFIG_FOO=n

will also still work to disable that config option?

Thanks.

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/confdata.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 795ac6c9378f..958be12cd621 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -454,7 +454,7 @@ int conf_read_simple(const char *name, int def)
>  			if (!p)
>  				continue;
>  			*p++ = 0;
> -			if (strncmp(p, "is not set", 10))
> +			if (strcmp(p, "is not set"))
>  				continue;
>  
>  			val = "n";

-- 
~Randy

