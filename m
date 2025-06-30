Return-Path: <linux-kbuild+bounces-7754-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B28CAED213
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 03:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE634171727
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 01:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B289C131E49;
	Mon, 30 Jun 2025 01:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UJzeUh6u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C01F74059;
	Mon, 30 Jun 2025 01:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751245206; cv=none; b=kKetwT6sJhVmFm/RtJjHDG8KAomSZZgZJNgdFMPTI3kQFK8a8Kt1Q79N+Wxi1Wk8NhJORcMN1auf3TgsCn2rRydHRcijg4YuMDBGZuhD5w4dG8PxSdHFQa3ngIBQ5SNIxjUR2JziLbS7IxLFh3+UJiQGFDBRMb1nGBXAkjiCoqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751245206; c=relaxed/simple;
	bh=GFjFJMAVSs9KyLtLxETnKkrUXWGo3lN/pPbmcW2U/NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gnF5YrYf+1BBV9gmiGU4CjFXfobdOEOvwv+HZ0NsYvNNhvvuuWNnxLcwmNeTOl4gesavIWORBnZLwGBfab2hKM2JSj+MbRGv6Mv3Quf3GV8xXfV3YKv0iIgf9qUREIxd9t2NiUmRBJbV8GM2cHiW5npfJHKqf81z0BGmJG0+E10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UJzeUh6u; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=865HJSo130qT7e8Va8U13uOH+cd/QDvz9ar5tellCy0=; b=UJzeUh6uCRQxTLa22sBpa3brnT
	FkchkiZi5IiT/CM9TbfW0qRqbOgRiU/QICx8Axqh+SU4EeEcv9PSdv/JlSCf6IkZyF24jXTnFQHvw
	BGGo8QgeVAIXt3irLW6HTbthttR4SwqCan4oTLjXTeYFPr81FW5Iy96aRJ74WwfSbmPTITdRBk0qv
	+Qqx1Mo7x8KnPCVDttnvLehWUnMu5k6P8mleUokosQwYAJ5jKJRbDPgymTS74WIbqQbm20jkn7Mza
	L8BkHsMEzdaFxt/w7AusVnRi58Vu4p/CH8AIchiEUMMuLZAhZtLzVX1LtXKGtCvmD34D3C87VA7zy
	4i3JwsuA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW2sH-00000006hbt-2zvb;
	Mon, 30 Jun 2025 01:00:01 +0000
Message-ID: <ae75ae31-a73b-4d15-9e67-5dc38b751c70@infradead.org>
Date: Sun, 29 Jun 2025 17:59:55 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/66] kconfig: re-add menu_get_parent_menu() that returns
 parent menu
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-6-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-6-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> This helper returns the parent menu, or NULL if there is no parent.
> The main difference from the previous version is that it always returns
> the parent menu even when the given argument is itself a menu.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> 
>  scripts/kconfig/lkc.h  |  1 +
>  scripts/kconfig/menu.c | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index 5cc85c3d4aaa..37b606c74bff 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -97,6 +97,7 @@ bool menu_is_empty(struct menu *menu);
>  bool menu_is_visible(struct menu *menu);
>  bool menu_has_prompt(const struct menu *menu);
>  const char *menu_get_prompt(const struct menu *menu);
> +struct menu *menu_get_parent_menu(struct menu *menu);
>  struct menu *menu_get_menu_or_parent_menu(struct menu *menu);
>  int get_jump_key_char(void);
>  struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index ccb690bbf05d..a5e5b4fdcd93 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -575,6 +575,20 @@ const char *menu_get_prompt(const struct menu *menu)
>  	return NULL;
>  }
>  
> +/**
> + * menu_get_parent_menu - return the parent menu or NULL
> + * @menu: pointer to the menu
> + * return: the parent menu, or NULL if there is no parent.
> + */
> +struct menu *menu_get_parent_menu(struct menu *menu)
> +{
> +	for (menu = menu->parent; menu; menu = menu->parent)
> +		if (menu->type == M_MENU)
> +			return menu;
> +
> +	return NULL;
> +}
> +
>  /**
>   * menu_get_menu_or_parent_menu - return the parent menu or the menu itself
>   * @menu: pointer to the menu

-- 
~Randy

