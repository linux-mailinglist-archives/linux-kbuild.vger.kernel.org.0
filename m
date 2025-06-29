Return-Path: <linux-kbuild+bounces-7749-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2A3AED04D
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 22:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7912172432
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A8312B71;
	Sun, 29 Jun 2025 20:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AS5BE5OQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAFD2264BB;
	Sun, 29 Jun 2025 20:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228126; cv=none; b=dbgpl0TaPukGigV2gUuF0DSz18TlcLr50S3/EMhAeXqZcONwBojJVpUKvOSqWBXRPvTDvvt7smK2kVrCWpKm6CRe0+FDUjs+mY4TXwO7M28pdCecQbru2OB89uVsGKwC/HuNE8EZ74LqwlifniCCXj9iE0Y8lZfe7CIZnDPBlHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228126; c=relaxed/simple;
	bh=Hlf4CSq29Kol5yJgJRNTkjoHiyztG/31JL7w6N/iNTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTwbFEeEjnI4sGoOPCbz9P0c8bYH2RglsT+dNZoZYYuGE1ppHFjiRPSaJhXE2DKprIK4hdtvt1Z8jVPFYLF7LBdFCI0CtF35QgGipYh2ZkVPCujM5ptWi7gvi1Zyf4L5sOWbaY0gZh+WnxU/Nx9nZA5JF9ZL9lN54Wuh6Ca1Nlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AS5BE5OQ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Wh53MEYY2wlUsLMNDdOnujXeqCUYamQqc1+DvHLI6tI=; b=AS5BE5OQ6M+dhBy/f6XmSpl1B0
	lib8VTYE0IEvkNKBXALS9RRxmJxybmz8WcAn6c5LZGtA56r9MkBCLeihp86y1sEyQquSgI0YaGh3s
	kyvXYjoQaZjUu+kDFFrw9JnC5TQB2NAnxmOS1N6GazOoJQLBVL/A9e5V2pRK9KEter3M6WYgIX11Y
	zdsaRqT9gKsDDtI86UH8HzraZx/D9inSQcHcaE6tdS/uOtZixp/ltXJF1LqbL702IF+C6+fef6xSb
	YtLosBCCy7QORsn9UYhe5AgLicUXaJ0oVtEwWPU2fQgQC9qpp43TtCrmKtFWvKvqbx9FhW8Rkbvq5
	sikhvGlA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVyQr-00000006ej5-2UuJ;
	Sun, 29 Jun 2025 20:15:22 +0000
Message-ID: <85eadc3b-391a-4fd1-a4b7-2e99de1ee6da@infradead.org>
Date: Sun, 29 Jun 2025 13:15:19 -0700
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



On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> When you select "Show All Options" or "Show Prompt Options", choice
> entries display a check box icon, but this has no point because
> choice is always y since commit

                     since commit _____________________.

> 
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

-- 
~Randy


