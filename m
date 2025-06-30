Return-Path: <linux-kbuild+bounces-7759-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB5AED26B
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0481893894
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1722D634EC;
	Mon, 30 Jun 2025 02:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ClCXTzss"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A175D208CA;
	Mon, 30 Jun 2025 02:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751250366; cv=none; b=ZBC/dItUOVvHwCnQrgMLLXExwxA6tUpegiPw8E9ujoJhEOKmDKM+sP2cmWS/r1VXHNelFG9qZLME6vJO0RCkYV2jhwGSvK+/kFO94nNjFLe5MNK100JlOXQ3s2n6S8TtTwCs++aTGbnzbie/QzwHvgPchHdwHDQ0AzEhUYc5pH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751250366; c=relaxed/simple;
	bh=UUhoyconC0CPYt0aa+wA5BFkj5Iqw8fNJdm4nOoWmVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfoCbNUFhfSvJhIB2Mn5IhbvitUe4M2b2tVM6aWFkjGpiycHh7+4pzacNAnF96VR0Zm0sYBOfVbruk3KXc+JhyX5rpTR4GL7X0B6F9SoOsiMAvJmUw6MyC8vt1PrhhkOzHp7OkELyGJiYU9rKBGh7NINMLLZ1gONzJRpu83BaGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ClCXTzss; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5GkX+rTap612DRlKXQ7MVYWG2OIBPulg8AqEXuRXIZ0=; b=ClCXTzssm8bwDM+mzLp9IkuWSd
	eaWFSIGKgnhjEjAjfGppR6/YGSkWKM4R+OdM9x6SvQTqZQ0QUGxUVGCShK7IQS7/MmNrBxIwJdfKG
	lZ9wCfef219G2ad3sFf2QO9trmrMevJZUS7CGTT4JXQuNCwkH2oj+IMIPGvWETpDccH9vPfX08SrX
	R3HCUeo4S5anAvbNTdoE59OnK9TDYC+kNHiDyyJRwM1dqMGIdB4RZ4bxrI48OFaK1kgsGMOY4WLNs
	8fHXnGy9b2ccSgXn3sR2Hxyl6RIpn5v+2LMQKe+XTsOLss0xZkPfTsvuBYhtqv5r0/PeTaemI+FUu
	dLpDUMrQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW4DZ-00000006iDx-1PSR;
	Mon, 30 Jun 2025 02:26:02 +0000
Message-ID: <f812ecbb-23bd-424e-91e5-ad278dac4f4d@infradead.org>
Date: Sun, 29 Jun 2025 19:25:59 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/66] kconfig: gconf: remove meaningless code in
 init_main_window()
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-12-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-12-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> The 'widget' variable is set, but not used in later code.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
>  scripts/kconfig/gconf.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 7960c456e3b9..4b5befa4f685 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -129,7 +129,6 @@ static void init_main_window(const gchar *glade_file)
>  	conf_set_changed_callback(conf_changed);
>  
>  	style = gtk_widget_get_style(main_wnd);
> -	widget = glade_xml_get_widget(xml, "toolbar1");
>  
>  	replace_button_icon(xml, main_wnd->window, style,
>  			    "button4", (gchar **) xpm_single_view);

-- 
~Randy

