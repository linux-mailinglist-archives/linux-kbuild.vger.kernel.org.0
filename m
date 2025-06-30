Return-Path: <linux-kbuild+bounces-7753-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849A7AED211
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5CC6170BA4
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 00:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8459041760;
	Mon, 30 Jun 2025 00:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Qkk20LGz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DAF286A9;
	Mon, 30 Jun 2025 00:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751245118; cv=none; b=MiPHI2OxWJx7yGvHs5IZdCFsF3YRgZEjJbj4ffN8Xg6OpytqiOsthBTJSLZAwaAkJYEPDMxmEPWroNr1rezsZksXvW8go/u5eaBdMgfBX04MLzronIqPz2TtHCy3X+0Jww4jHiWdMGqQkjwzjlm6BC6I7utHym1A6i48l+0UsUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751245118; c=relaxed/simple;
	bh=DWCuqNlL/nJDJrF1XCLLx4Ug3PwyI2NYe6xUAPJl8zA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qr2zuNysK/wuUPQNeG/Nrapz1zDxBrQj6DM8dri9ogDC6SZ1tayWtlfi6Y84GEkQUhU+aWPd5JIHvodLz7xfoL3krYWqqvc3HXs6V/pbA4nc+FG6UOSAvbBtx+e392PwLKLulD8ozxMkbkiM/KibI1R7Wp2Ke8jLzxnTL/QxBKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Qkk20LGz; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7Ug7UKkM2aUpFSdjWpuIagY1cxUJU5mNnOIW9P4Hx10=; b=Qkk20LGzNHOo2BsFWoVy7ijOTo
	aWOv73t4khbol+V29hNgLVejMVhEbBu1jB95cUJhHJvSDKEr/VMAforrb8+g99vtE6c4A/Gb9xo1n
	KbCWQYrcBoFlty/bDaIhybAXa1aneNSZskEwZoGIv9iCvH/CHOLlvqYNV1OTfy1pqglm+ElmIuX87
	zJYIFhvfaqtSHuLiFCkflsUgwqcwQKB8Wqj8lZSYRSnQwd4866Y0Cwfp3eJbfuYj+Eg9OnqOXJkHD
	NJix91wM9VnubPs6hIeB4MxsDNS7Z+Egovl3Ft9fcFcwpNaXGTvAO5RH2DDjZwR8Pj2CqZbMjMCzs
	luNQzDTw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW2qi-00000006hbc-18WR;
	Mon, 30 Jun 2025 00:58:23 +0000
Message-ID: <e0aeb40c-0c51-42bf-9ec3-7aaf89794ee4@infradead.org>
Date: Sun, 29 Jun 2025 17:58:18 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/66] kconfig: rename menu_get_parent_menu() to
 menu_get_menu_or_parent_menu()
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-5-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-5-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> The current menu_get_parent_menu() does not always return the parent
> menu; if the given argument is itself a menu, it returns that menu.
> 
> Rename this function to better reflect this behavior.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
>  scripts/kconfig/conf.c   | 2 +-
>  scripts/kconfig/lkc.h    | 2 +-
>  scripts/kconfig/menu.c   | 8 +++++++-
>  scripts/kconfig/qconf.cc | 6 +++---
>  4 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 8abe57041955..a7b44cd8ae14 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -594,7 +594,7 @@ static void check_conf(struct menu *menu)
>  		default:
>  			if (!conf_cnt++)
>  				printf("*\n* Restart config...\n*\n");
> -			rootEntry = menu_get_parent_menu(menu);
> +			rootEntry = menu_get_menu_or_parent_menu(menu);
>  			conf(rootEntry);
>  			break;
>  		}
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index fbc907f75eac..5cc85c3d4aaa 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -97,7 +97,7 @@ bool menu_is_empty(struct menu *menu);
>  bool menu_is_visible(struct menu *menu);
>  bool menu_has_prompt(const struct menu *menu);
>  const char *menu_get_prompt(const struct menu *menu);
> -struct menu *menu_get_parent_menu(struct menu *menu);
> +struct menu *menu_get_menu_or_parent_menu(struct menu *menu);
>  int get_jump_key_char(void);
>  struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
>  void menu_get_ext_help(struct menu *menu, struct gstr *help);
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 7d48a692bd27..ccb690bbf05d 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -575,7 +575,13 @@ const char *menu_get_prompt(const struct menu *menu)
>  	return NULL;
>  }
>  
> -struct menu *menu_get_parent_menu(struct menu *menu)
> +/**
> + * menu_get_menu_or_parent_menu - return the parent menu or the menu itself
> + * @menu: pointer to the menu
> + * return: the parent menu. If the given argument is already a menu, return
> + *         itself.
> + */
> +struct menu *menu_get_menu_or_parent_menu(struct menu *menu)
>  {
>  	enum prop_type type;
>  
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 68640e507ec4..dc056b0a8fde 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -577,7 +577,7 @@ void ConfigList::setParentMenu(void)
>  	oldroot = rootEntry;
>  	if (rootEntry == &rootmenu)
>  		return;
> -	setRootMenu(menu_get_parent_menu(rootEntry->parent));
> +	setRootMenu(menu_get_menu_or_parent_menu(rootEntry->parent));
>  
>  	QTreeWidgetItemIterator it(this);
>  	while (*it) {
> @@ -1540,7 +1540,7 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
>  	switch (configList->mode) {
>  	case singleMode:
>  		list = configList;
> -		parent = menu_get_parent_menu(menu);
> +		parent = menu_get_menu_or_parent_menu(menu);
>  		if (!parent)
>  			return;
>  		list->setRootMenu(parent);
> @@ -1551,7 +1551,7 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
>  			configList->clearSelection();
>  			list = configList;
>  		} else {
> -			parent = menu_get_parent_menu(menu->parent);
> +			parent = menu_get_menu_or_parent_menu(menu->parent);
>  			if (!parent)
>  				return;
>  

-- 
~Randy

