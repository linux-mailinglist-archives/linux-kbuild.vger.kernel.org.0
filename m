Return-Path: <linux-kbuild+bounces-7750-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10433AED204
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4100C1892EB8
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 00:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149CB208CA;
	Mon, 30 Jun 2025 00:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LRKiA8L9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CA52F3E;
	Mon, 30 Jun 2025 00:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751244714; cv=none; b=TYng0RA3kYxb7y0cVTC2h0HRrLphX450gkueRgCEobjZjuEaDtVr/6RsqvBLqbA2JlH2RBjW8DtCwsjUry2gFfetSDBirwwqVq35j9MPKonLty7qTJAfFywpZMAO3T7jzRSRD09ufQbm+fwWTxoTaDPT70eTsAQj75MOKqZeCFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751244714; c=relaxed/simple;
	bh=oxw/JlBc1Lhk39xlovPh7tPJun0UnFUJdaqR21PwjLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTiPZbL19l+S06xe/LQCd0Cu6j63TA6elVSuRSvp4iK0NyJdKc7I1gvBWNCgrfPvYIut1sMz0HFIfSQbr0adaEzFNZR34sfrzRFyUMWnvFyheVpu9UV798Ga7eGKTAhG8QDvAD2OwyFw3iuklR3zmeCMNCan/q1QGKQyhLq6kL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LRKiA8L9; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uWDEbeNZ4GtmQWDV5pGJXGmKDGDABleqTEezryJdk1U=; b=LRKiA8L9V+y8ZCUzH0nD8q8NHi
	fOndwifePEx8YAirrPVHzmZQ4SnnJVeBILdH9yw6jAFELfjrM4ljkUKGXypDxqclfRVqMd+rUAgbX
	brvhHb5YemYg5hobTWZKqMG2BKwcqeeQjOkDhmSafdk+KMacfsY4O1KA0WLBydFBPX8cHFuebM9oU
	LA84KaT+vfrAk7lvHx9e3KXKhNYD4ySveZVVKM+gcrVLeSCcL8QYWOIS3zIvdi3/d6fd4y6slt2Ra
	2NuYRMFHk5Km3X7wKPElwJEWSYxCI2l2wfzt7DiKPsTHaSUdQa7/Pp5P57v8f+lDQ12dy4/1R8Fi5
	F5jz0j3g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW2kE-00000006hZg-2X8u;
	Mon, 30 Jun 2025 00:51:42 +0000
Message-ID: <8f13413a-0a4f-46c2-8d3a-7e43126d70dc@infradead.org>
Date: Sun, 29 Jun 2025 17:51:36 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/66] kconfig: qconf: do not show checkbox icon for
 choice
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-3-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-3-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> When you select "Show All Options" or "Show Prompt Options", choice
> entries display a check box icon, but this has no point because
> choice is always y since commit
> 

I don't see a check box icon beside the choice entries either before
or after this change. Or do you mean a Radio Button?

(setup: make defconfig for x86_64 in 2 subdirs, one pre-patches
named X64, one post-patches named xx64.)

Enable Show Prompt Options for both testing windows.

E.g., under "Processor types and features", scroll down on the right side
to "TSX enable mode". Under it in each in pre-patches and post-patches,
I see buttons to choose which TSX enable mode to select. They look the
same both pre-patch and post-patch.

What am I missing?


> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/qconf.cc | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index eaa465b0ccf9..546738a5c3b1 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -92,7 +92,6 @@ void ConfigItem::updateMenu(void)
>  {
>  	ConfigList* list;
>  	struct symbol* sym;
> -	struct property *prop;
>  	QString prompt;
>  	int type;
>  	tristate expr;
> @@ -105,11 +104,10 @@ void ConfigItem::updateMenu(void)
>  	}
>  
>  	sym = menu->sym;
> -	prop = menu->prompt;
>  	prompt = menu_get_prompt(menu);
>  
> -	if (prop) switch (prop->type) {
> -	case P_MENU:
> +	switch (menu->type) {
> +	case M_MENU:
>  		if (list->mode == singleMode) {
>  			/* a menuconfig entry is displayed differently
>  			 * depending whether it's at the view root or a child.
> @@ -123,10 +121,13 @@ void ConfigItem::updateMenu(void)
>  			setIcon(promptColIdx, QIcon());
>  		}
>  		goto set_prompt;
> -	case P_COMMENT:
> +	case M_COMMENT:
>  		setIcon(promptColIdx, QIcon());
>  		prompt = "*** " + prompt + " ***";
>  		goto set_prompt;
> +	case M_CHOICE:
> +		setIcon(promptColIdx, QIcon());
> +		goto set_prompt;
>  	default:
>  		;
>  	}

Thanks.
-- 
~Randy


