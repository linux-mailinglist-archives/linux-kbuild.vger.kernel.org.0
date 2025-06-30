Return-Path: <linux-kbuild+bounces-7755-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1022AED25E
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A383A5A22
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A39C8BE8;
	Mon, 30 Jun 2025 02:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cNHHxhxB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC0B182;
	Mon, 30 Jun 2025 02:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751249930; cv=none; b=LfCzY6yMs5tTpwP2mmJkDdcrhs7fDSMhfmajhBiADLC2gIWkcN0SHlnAMAR8/bHhBqPZm+mzhbng/DjPJQYCxR4hXxkazFtYy5AOE9u3SGws1ZYY780cEkhVxjpbsqPin+Rs1xMPnZqa6xVpQOZk40NXqPdvsoOuoohjJaIUosk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751249930; c=relaxed/simple;
	bh=4XExAnn4k7b6/PtDOuxFD7Ed884Q1c590UXUEmFWfKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tL55RuyVnaxK/kkH3XUD61hID7UUKXCfvYry9WNGtgR3bYwmC6NPC/KezylHqC4aWqMYn9r6tLPQjGNde1BWppcAVR2SC1tLaxJ3a8c+VfxaBStznHDCUvC8B/XlkCOPoibHxHRodLl0JwY1He8GbvJKixftvjJMvwlEwmn+VVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cNHHxhxB; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g8v3g+ngk7g2mSJIjC6uHATXk8X7Q6PvisJrwqG3tro=; b=cNHHxhxBf9ATL3PmzZxIgbsV8T
	9x9Ysw14N8iV+GqqWiDnAaQRv9vY2tHdwHI2dKJZXUQ/spS2rMAQvxH0Dm4o9f7OwM2mdJMJd4tcN
	OBkG8dlqHjo2sZTP4jRNwZLUMhIKzcAVXMwCFUxiGOkYhPKS34OjVpAh4/ycSPbEOJ1Wtkn4ebybm
	xj0dhsGJd1m/1son8rBpSTTZMxn835yfTZMJJli5z/g3TgwNE/9kQ/tRquc7+zlJmVegpZHYkB7ct
	IqXg7WPqdXYnjxZ3UfXH5jCbGuSPvnBTQmLdkh+yB0lkmz534g94A/Ws/g+fUZZYXRKkiEHJa98u4
	oryEgQJA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW46S-00000006iAE-1x2e;
	Mon, 30 Jun 2025 02:18:44 +0000
Message-ID: <74185b0d-85a1-4450-9b7a-c63610579b29@infradead.org>
Date: Sun, 29 Jun 2025 19:18:38 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/66] kconfig: gconf: make columns resizable
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-7-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-7-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> The variable "resizeable" is a typo and always set to FALSE, resulting
> in dead code in init_right_tree(). It is unclear column resizing should
> be disabled. Enable it.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Looks good.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
>  scripts/kconfig/gconf.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index c0f46f189060..a3978d3420d1 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -30,7 +30,6 @@ static gint view_mode = FULL_VIEW;
>  static gboolean show_name = TRUE;
>  static gboolean show_range = TRUE;
>  static gboolean show_value = TRUE;
> -static gboolean resizeable = FALSE;
>  static int opt_mode = OPT_NORMAL;
>  
>  GtkWidget *main_wnd = NULL;
> @@ -312,11 +311,9 @@ static void init_right_tree(void)
>  	column = gtk_tree_view_get_column(view, COL_VALUE);
>  	gtk_tree_view_column_set_visible(column, show_value);
>  
> -	if (resizeable) {
> -		for (i = 0; i < COL_VALUE; i++) {
> -			column = gtk_tree_view_get_column(view, i);
> -			gtk_tree_view_column_set_resizable(column, TRUE);
> -		}
> +	for (i = 0; i < COL_VALUE; i++) {
> +		column = gtk_tree_view_get_column(view, i);
> +		gtk_tree_view_column_set_resizable(column, TRUE);
>  	}
>  
>  	sel = gtk_tree_view_get_selection(view);

-- 
~Randy

