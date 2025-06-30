Return-Path: <linux-kbuild+bounces-7752-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D8AAED20D
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EDCB7A2E39
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 00:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80E31EB39;
	Mon, 30 Jun 2025 00:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DMrL7He+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEF42F3E;
	Mon, 30 Jun 2025 00:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751245024; cv=none; b=YEM5ti06a3lgpwVHH3sTaVaCX5+MGAApahBos/IARLKPpPWFk0BXUda0ArsQPhyulZ7X6K0+Q0LkjZZdXcfGqYniFpIEFhhGhTaqlKSDS0bwJuIVUJCy4zx0CPlFx0h4IxBY5UxKC4fhr8mNsAFZ5AsnkBB8ISeQgGNfBuFY2JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751245024; c=relaxed/simple;
	bh=BBZgu+DZlKIok5OQHf9Am2D4MpjqFBtak9lJqy9Sc/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KCJaCNVRjTUY1G2qaAPWRRjOIQx3kvSUg3lDq/FzP68uNpcyajtZg0R0CD+QtbGuuCOVYdg3jVX/TDrCLEadhfF7gFowJec5116qjizx/gU3pwvrY6CpE8+DEVqk/7OL4XbKyG2ws/l+B6PuAQ+FeSAtudy9K7hmkGe+XfDyvQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DMrL7He+; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Lw7n2AxmCEQrsNdm/8VCeVeIc/sX3Qjyz1uVOChL+Oc=; b=DMrL7He+9Pyc1jOJLlB+l2eIrF
	I1JGY9ikP/A56WYHk/zt0JP0mo+oXcIZCHSN0UJGtRJPYexXZDVMa5oQ9lZsfhpIW7xzpRZioNTwg
	UblIJA9WGL44qJJ0dzE2r0Qq3j2KQ0Pj3uO/tZgdy8Yphxshrf0ni9yEFbZ+C2/xxckaHccHJgWbz
	prk7UbIEdtWMqZLeNqfJIlM3RiMLUEpLwF04MzNB02jyID+B5ZHH4Utvv+yhuVMaDX00Gycf8pe4y
	EJF/7l+FPrrJyXupHr1kCCKaKVazXqgAIoNY5igrKZjaQ+dDDp4MYtSI7LsKSPaUY8xeyhHjoR3+G
	s/dNfS8A==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW2pQ-00000006hbH-1qSW;
	Mon, 30 Jun 2025 00:57:01 +0000
Message-ID: <3bf620bf-8c8a-4aa2-af10-51476bc62dba@infradead.org>
Date: Sun, 29 Jun 2025 17:56:58 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/66] kconfig: qconf: show selected choice in the Value
 column
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-4-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-4-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> It is useful to display the selected choice's value in the Value column.

(instead of 'N', useless)


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Nice, thanks.

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/qconf.cc | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 546738a5c3b1..68640e507ec4 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -127,6 +127,9 @@ void ConfigItem::updateMenu(void)
>  		goto set_prompt;
>  	case M_CHOICE:
>  		setIcon(promptColIdx, QIcon());
> +		sym = sym_calc_choice(menu);
> +		if (sym)
> +			setText(dataColIdx, sym->name);
>  		goto set_prompt;
>  	default:
>  		;
> @@ -189,7 +192,11 @@ void ConfigItem::testUpdateMenu(void)
>  	if (!menu)
>  		return;
>  
> -	sym_calc_value(menu->sym);
> +	if (menu->type == M_CHOICE)
> +		sym_calc_choice(menu);
> +	else
> +		sym_calc_value(menu->sym);
> +
>  	if (menu->flags & MENU_CHANGED) {
>  		/* the menu entry changed, so update all list items */
>  		menu->flags &= ~MENU_CHANGED;

-- 
~Randy

