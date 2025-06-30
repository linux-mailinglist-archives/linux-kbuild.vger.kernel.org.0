Return-Path: <linux-kbuild+bounces-7762-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A68AED2BA
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B1233B50E1
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F7D1940A2;
	Mon, 30 Jun 2025 02:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hotTsy9t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E0A199BC;
	Mon, 30 Jun 2025 02:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751252009; cv=none; b=J+nT1wYrK4jYzFmrmntYmeggLW2iEZf2lG/j8Tpms9aWoebl/1ruB0pxvBVBdoKwzfFTvAIg6nTek23WVHiEsVALCt0gnAFPD0LZT040KeqLv5+atZwc4uhOemXracwr26Nhz2piAJZuAfjiFYzN0lzfgRwdojC+GShZ5MnicH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751252009; c=relaxed/simple;
	bh=DO15hI8+eM5jZkFmmRvDVIIxPx1MlkMqZZa4cwAfi3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bKexpOkHyILQZDFjTThsXDRPNs0VyxNNOgzj590Qq3VRovID3KbTQfn0u51laMB3sEraEw8RaaqQFoiGpjS09ZE0uPMlITOqUjcpQGe3ORqbn8axMYJtrPjJtvbeIVmKioeiLKoZVLH4W+TITJwQw/h5oy4x0vxcW1IZQYPBkKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hotTsy9t; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Hf6dvuplykHEhiNdgT3F2f1+xBt3G7VOUhV8J9MLouE=; b=hotTsy9t93paWrEnt+fm13NTjB
	CeDFEuQzAqBT3WD3Z5/f6yZwc87aHjTYf3HIsoB1PhZ9I6I1o4OcQrA9/Egu7xfs0k1Hl9Paj7/AH
	KTz4W/VkQqec8s7mh0cvONAIaC/Kq4wT88w4Nq+HxXGSqo50C+ZmPUPDaRhoMpgUGcgrubG9nI0DL
	d05mWlMdikbnljM4MdSwlDgSgri/g1DmtILPJvb4oWxQGDvfQk0IzP3OWSc52Q4mSkSxz2MMeCof+
	l7QUtEZeBSubYv70KT/T0BALrjLSd8BDOCBi8XvemtGoNULWMGjMC7DGWh/tPIlsNFX0IunlMSU4C
	Y2JPDzvg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW4e2-00000006iNQ-0mI5;
	Mon, 30 Jun 2025 02:53:23 +0000
Message-ID: <5cc3a3f9-4ca5-49f6-a35a-1cca44dc8bc4@infradead.org>
Date: Sun, 29 Jun 2025 19:53:20 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/66] kconfig: gconf: grey out button for current view
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-27-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-27-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> This clarifies which view is currently selected.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Looks good.


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
>  scripts/kconfig/gconf.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index b67ebff3f288..67c5c965aaf8 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -38,8 +38,7 @@ static GtkWidget *tree2_w;	// right frame
>  static GtkWidget *text_w;
>  static GtkWidget *hpaned;
>  static GtkWidget *vpaned;
> -static GtkWidget *back_btn;
> -static GtkWidget *save_btn;
> +static GtkWidget *back_btn, *save_btn, *single_btn, *split_btn, *full_btn;
>  static GtkWidget *save_menu_item;
>  
>  static GtkTextTag *tag1, *tag2;
> @@ -85,18 +84,25 @@ static void set_view_mode(enum view_mode mode)
>  		gtk_paned_set_position(GTK_PANED(hpaned), 0);
>  	}
>  
> +	gtk_widget_set_sensitive(single_btn, TRUE);
> +	gtk_widget_set_sensitive(split_btn, TRUE);
> +	gtk_widget_set_sensitive(full_btn, TRUE);
> +
>  	switch (mode) {
>  	case SINGLE_VIEW:
>  		current = &rootmenu;
>  		display_tree_part();
> +		gtk_widget_set_sensitive(single_btn, FALSE);
>  		break;
>  	case SPLIT_VIEW:
>  		gtk_tree_store_clear(tree2);
>  		display_list();
> +		gtk_widget_set_sensitive(split_btn, FALSE);
>  		break;
>  	case FULL_VIEW:
>  		gtk_tree_store_clear(tree2);
>  		display_tree(&rootmenu);
> +		gtk_widget_set_sensitive(full_btn, FALSE);
>  		break;
>  	}
>  
> @@ -1167,10 +1173,15 @@ static void init_main_window(const gchar *glade_file)
>  
>  	style = gtk_widget_get_style(main_wnd);
>  
> +	single_btn = glade_xml_get_widget(xml, "button4");
>  	replace_button_icon(xml, main_wnd->window, style,
>  			    "button4", (gchar **) xpm_single_view);
> +
> +	split_btn = glade_xml_get_widget(xml, "button5");
>  	replace_button_icon(xml, main_wnd->window, style,
>  			    "button5", (gchar **) xpm_split_view);
> +
> +	full_btn = glade_xml_get_widget(xml, "button6");
>  	replace_button_icon(xml, main_wnd->window, style,
>  			    "button6", (gchar **) xpm_tree_view);
>  

-- 
~Randy

