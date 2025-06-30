Return-Path: <linux-kbuild+bounces-7756-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E3EAED261
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F4023AEEAE
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B059C208CA;
	Mon, 30 Jun 2025 02:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oUQ7zxMD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1672F1FE2;
	Mon, 30 Jun 2025 02:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751250124; cv=none; b=FL+ihSdcNbvbjCkB4KZkm4xYv5b1dnFcCxpoy37xq5CcD7+/KYEIINzvPVdYhmu1hxMqkXeVa27ugVS9+hFeGxSjKGdBQdSF7htLlkyLPQ73f7aWcAGp2NqYkl22fGKRyq8R/6QNt+q0Esu7rF6nu0rpSdjypDPcS6svJ05ktyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751250124; c=relaxed/simple;
	bh=lzVUsWv9jSOxsCEsmdkMQhFECHsLa5HYfvCd/1ol7L8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYW7or5xGXMAvHk90IRJd98934380bKX44Q8WzbloGN9mSyL5+m5CB/6oRrtIIlhEIIuC9BuBxtZahspWKg/rCm2FwUrX7Uw0rFwq9oK/+S2L2nNnZXkFBjc91fwjHuLbdOlonpSBiUR1OTn+UfQew2IPqd/OMI6+Wg/ipkzFZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oUQ7zxMD; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h52ZPAYzdQGpYE7S8i1BA2pfPxxgX9XYzXGU9vnhHpQ=; b=oUQ7zxMDJviEdh70TA3SnRHb6z
	xxr65MSOidNfPXtLEbaYJblgvhe+teIEnFXvm03kAKaLSRc6hZAjzouiSFcXn3+ouLNlWMpBEe+ou
	NDfV0l7itzkA4+QX5Z+xmp2/OKM5KoOMWyc5iAt4rbZFBwNkkMiwxoEdUXcT+SDp1SZTVDenyzCqv
	Zsf9dSu8CQwJRGnacjdGfLhtuRAHHl+LQdb22BBqPOI2Tc13W5MAnHyqipU/on8zIoN8FSqpAAt3z
	AOA7F2HK/OXlqK5EEDEJ/5bVPO2EoP3e/DKy6gAt+3kt3KTc7hM11imzhBSDGJHY7rnFmTguoi6zv
	BH+VsnXw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW49c-00000006iBQ-07p1;
	Mon, 30 Jun 2025 02:21:58 +0000
Message-ID: <419e1ef1-4814-4a56-b92a-8d3b48017855@infradead.org>
Date: Sun, 29 Jun 2025 19:21:54 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/66] kconfig: gconf: fix potential memory leak in
 renderer_edited()
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-8-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-8-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> If gtk_tree_model_get_iter() fails, gtk_tree_path_free() is not called.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
>  scripts/kconfig/gconf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index a3978d3420d1..769f38307f34 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -745,7 +745,7 @@ static void renderer_edited(GtkCellRendererText * cell,
>  	struct symbol *sym;
>  
>  	if (!gtk_tree_model_get_iter(model2, &iter, path))
> -		return;
> +		goto free;
>  
>  	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
>  	sym = menu->sym;
> @@ -757,6 +757,7 @@ static void renderer_edited(GtkCellRendererText * cell,
>  
>  	update_tree(&rootmenu, NULL);
>  
> +free:
>  	gtk_tree_path_free(path);
>  }
>  

-- 
~Randy

