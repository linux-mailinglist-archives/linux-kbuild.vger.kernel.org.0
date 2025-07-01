Return-Path: <linux-kbuild+bounces-7820-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5AAF025E
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 19:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1C0D4A819E
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 17:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698CA27E05F;
	Tue,  1 Jul 2025 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MIAwO+2E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE19D246BC5
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Jul 2025 17:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392733; cv=none; b=tH5oog2k4wNk4OpR8qFm6FMTCywBYc6RPzSynK/0fSYRWFjL/NOnvZSj+qX7AvKCsPSzOPd5Uy30jGwwV3jJnZj7gD91LEqXlgAFdETsu/skgOIW7RgnvsrtBa0tbpdwAEryJ+P3c/2TPnIhNu0Gok1kznEcKKe0sTseMTU4a9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392733; c=relaxed/simple;
	bh=REYYdk/kMwA0Vt5QHVqgbNGgyaTnuzozQoqAElyJ4uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=T/+QtuekyURNUx+UHQctjyd86CJZdWyZ9s1D3rAP3oMxfUkEoeg8ZedU3U5Mdjxpups7rgOsQL5p52embiZFCakgOhO2uAsCKKNFB//kzOGX1hZffZX7tenCQgkQEcSJ17/Y1Ch7313Rcz6F2Qlufq7kmXbTVwN2RSgadSrmDcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MIAwO+2E; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=EtQpMKvBlOO8BjUyitLESL9Bo2jMhR0FWHXG/iO8SLA=; b=MIAwO+2E0IPoXVHThIfZMmqtvb
	lcptITvwSC2nLpsxWYXs3G0Vn+c4qH15gsZFk9owdO6YQ4wiVm2b5zZvhUFPKL7RWsXKhTAE+DjxT
	7aBuDokt5tJgVQCIZTXMhv6cGBlRBO1iwisoeaSxT8iuaiF157e+uZ580B9mNUjyrCBAXZw/0MBZ4
	cSIHMXxIxIl7v4GeuxoL0Qv1DS2degAVdgzH/Cmzaf5pa5fMTEj7TxmdbVzmbBxonxavZZhvL90CX
	sDVxAsRdXXHd2pEZgK4ARVp2TMTUXh6qGG4WQzEAum+hN8h3N8lqnbhjBdzf7HIz0KZ9XdNP/96WL
	q5AzEP1g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfFp-000000078KX-2Ees;
	Tue, 01 Jul 2025 17:58:50 +0000
Message-ID: <a40c36ff-7f1b-4873-9aa2-b6864710c262@infradead.org>
Date: Tue, 1 Jul 2025 10:58:47 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/1] kconfig: improve gconfig
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
References: <20250701121444.950640-1-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250701121444.950640-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/1/25 5:14 AM, Masahiro Yamada wrote:
> This replaces just one patch in the previous submission.
> 
>  "kconfig: gconf: preserve menu selection when switching view mode"
> 
> There was a corner case where the menu selection was not preserved
> when switching to Split view.
> 
> [Test Case]
> 
> [1] Choose Full view  (default)
> [2] Select "64-bit kernel"
> [3] Choose Split view
> 
> In v2, the selection of "64-bit kernel" was not preserved.
> 
> This has been fixed in v3. The remaining parts are the same.
> 
> In case you are interested, I pushed the entire patchset to:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git gconfig-v3
> 
> The code diff between v2 and v3 is very small, just as follows:
> 

I applied this patch to the gconfig-v2 patches.
It works for me.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

But I do have one question/annoyance: why does the help/message panel
always switch back to:
  Kernel hacking

  There is no help available for this option.

Is Kernel hacking the last entry in some (menu) list?


> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index e43d83dcdfb8..6edead20c3c9 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -281,13 +281,9 @@ static void set_view_mode(enum view_mode mode)
>                 gtk_widget_set_sensitive(single_btn, FALSE);
>                 break;
>         case SPLIT_VIEW:
> -               browsed = NULL;
> -               if (selected) {
> -                       if (selected->type == M_MENU)
> -                               browsed = selected;
> -                       else
> -                               browsed = menu_get_parent_menu(selected);
> -               }
> +               browsed = selected;
> +               while (browsed && !(browsed->flags & MENU_ROOT))
> +                       browsed = browsed->parent;
>                 gtk_tree_store_clear(tree1);
>                 display_tree(tree1, &rootmenu);
>                 gtk_tree_view_expand_all(GTK_TREE_VIEW(tree1_w));
> 
> 
> 
> Masahiro Yamada (1):
>   kconfig: gconf: preserve menu selection when switching view mode
> 
>  scripts/kconfig/gconf.c | 82 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 74 insertions(+), 8 deletions(-)
> 

-- 
~Randy

