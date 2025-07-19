Return-Path: <linux-kbuild+bounces-8072-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E462B0B149
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jul 2025 20:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05383AA1E46
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jul 2025 18:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3DE2236F2;
	Sat, 19 Jul 2025 18:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BZhzHpW7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C522AE7F;
	Sat, 19 Jul 2025 18:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752949217; cv=none; b=bVa1lzmMGzyNUkOE06lOcySdDRqDBEBR/HJBGfjfEBe/BmkPkYXm7kx9YzrGYdm1Q++YUtGAFgxsLdWQD1M2E0smvuD4OIuXwWCqMpu3KThwyKpsI3IX7Q8XQm59LmSkZEFXP9+ckW29RDc+gR0safLAcQGWqrPKxbyy48UIXJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752949217; c=relaxed/simple;
	bh=2qrd4AuZfF++YH28VWBzdRrV4Phbpu4n5FCAD3qFClw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJwdSzgWzdMmXHuWcXJcwJGvdNiB/5zh4qovlJADbcr6k01iCorAoZj07h5lK6SfX+mPFesyzv9/ukLoJ6wwBJLlVe28xIvjlAQun79Qdp0miRrWZl1uiR7HXuNxa6xaduAyIQeydDO83NVXcJ6R6M61s5tsL5JHBaE2m1e9mhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BZhzHpW7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=29J/BJfUT9hSC305mOHIitGfVwe88AdD1WZ/e5elfSg=; b=BZhzHpW7b7pdJ2bfSqHA9PGLek
	31f/gPRYeIlM1chyTp+PpfdnRPlawohv1EJVJJNBg7q3FGNdNgO0gAE/a5q1j0Olb8W2cJh7jXBZw
	ESIajIVDd1570Ypgk1phSXyzqhiRN7NJPQQETIfbYcrHnlaUexWlVqESoDApkuqx01iV63A9c/WEw
	6Nf4UKKMyXwG7QghMtaFalZjmezNPW0cdbK4Tkyvt5aTavGiQyKzDmXypVnlN0FqYjAQdy0hyrhuk
	87HeP96PYwqAZKPfHNc9WM9Vn3ikoCFrw94xtUG73nDv8nZ9P/xZ3pdpBW9oMqNt1pcGlqCDdaJBR
	qfG4K79g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udCAO-0000000EVxF-3cgc;
	Sat, 19 Jul 2025 18:20:12 +0000
Message-ID: <934992e6-9a2d-426d-8bd7-895062966214@infradead.org>
Date: Sat, 19 Jul 2025 11:20:12 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: nconf: Fix uncleared lines on help screens
To: Shankari Anand <shankari.ak0208@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>
References: <20250719143207.215020-1-shankari.ak0208@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250719143207.215020-1-shankari.ak0208@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/19/25 7:32 AM, Shankari Anand wrote:
> commit 1b92b18ec419 ("kconfig: nconf: Ensure null termination where
> strncpy is used")
> introduced a regression where help screens (F1, F2, F3) no longer properly 
> clear short lines of text,
> resulting in duplicated or trailing content when lines are overwritten.
> 
> Revert the null-termination change to match
> the actual length of the copied string.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: 1b92b18ec419 ("kconfig: nconf: Ensure null termination where strncpy is used")
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.


> ---
> I apologise for the overlook from my side. This should set it right.
> Link of the report : 
> https://lore.kernel.org/lkml/CAK7LNAT54nvwYmTy20Ep8U2kr4thn68yYWXi9R-d3Yx3iXs=Bg@mail.gmail.com/T/#

This link should be used after Reported-by: like so:

Closes: https://lore.kernel.org/lkml/CAK7LNAT54nvwYmTy20Ep8U2kr4thn68yYWXi9R-d3Yx3iXs=Bg@mail.gmail.com/T/#


> ---
>  scripts/kconfig/nconf.gui.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index 475a403ab8ba..7206437e784a 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -177,7 +177,7 @@ void fill_window(WINDOW *win, const char *text)
>  		const char *line = get_line(text, i);
>  		int len = get_line_length(line);
>  		strncpy(tmp, line, min(len, x));
> -		tmp[sizeof(tmp) - 1] = '\0';
> +		tmp[len] = '\0';
>  		mvwprintw(win, i, 0, "%s", tmp);
>  	}
>  }
> 
> base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9

-- 
~Randy

