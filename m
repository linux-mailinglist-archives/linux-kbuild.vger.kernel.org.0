Return-Path: <linux-kbuild+bounces-7798-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4937CAEEACE
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 01:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60E9C3E144E
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 23:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7682E54AC;
	Mon, 30 Jun 2025 23:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TmZ+rdjL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782F5202976;
	Mon, 30 Jun 2025 23:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751325081; cv=none; b=fILnNp8f74QAUAiKjDMiv5D880JsKllttp3V5CfH5IPw6MF4X2BBjf5SneXRz5rASKSepb+RLJZsD14XMOZEy7pccbigqijlbISEpDIgZvTTnJzp76w+hMIrtPVrYcQxR+K8091FdhqdbDr46pFknRrfBIssEWtfW8ZUpudlPL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751325081; c=relaxed/simple;
	bh=K08Yf0sDcZOdeL8lYAqH/TBx6fvIpr3WtRtGDZf4r60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQ1Qxcn2nhgRFQh+3jtCIjFuwOMS3Lz2/Ek34G641szl/an6kU1M63N6tGjU13AZAJRAjZ9mEiy5LFWnIspWrTEuc+4fDl+pIRV6fx/A6kAKoMyhFIf6kLA6aRzkK3ReNbVsSMVB/OKctpCzyvHP8WFxQEDM3s7ygQAIT+LV1Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TmZ+rdjL; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vAnN64UD7AxYlLWs2q79E0ixMg7+o6oDouJEXnd54gw=; b=TmZ+rdjLPgfGqZTD9O7KZgLRJm
	L61uhyYaRC56PLAIcmdXxvZbkaxgd82o8dO3nz+tYpLqBXu+a3ht53+JiHmnomYc7+GADhRTJ8DD0
	pHfwHchmfFSO54BVMPhUVYU1T3zZJq243h4mOjxbolb3Lf+NcKTy26LBpBzkctkyNacEsSv2J+SyC
	tNwSprzZy+T+wBgC/rL4OsSrPq/krK/rCW9VDdFm5WgXxq4UyO/vPrlTL2lkqkMDKDQEolYLx00kq
	4PcUpc1d9q9sAV9n6nWBk2tsLvuuaLG6tEQT8TYfSa6Do7FqhiaYZ3jTQ5GQcHnS5N+RCJ68uIEoL
	2qt5G98g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNef-00000006u3M-08s5;
	Mon, 30 Jun 2025 23:11:17 +0000
Message-ID: <eddc5de9-5007-45eb-9d61-668d1225e211@infradead.org>
Date: Mon, 30 Jun 2025 16:11:14 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] kconfig: gconf: use configure-event handler to
 adjust pane separator
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250629184554.407497-1-masahiroy@kernel.org>
 <20250629184554.407497-3-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250629184554.407497-3-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/29/25 11:43 AM, Masahiro Yamada wrote:
> The size_request event handler is currently used to adjust the position
> of the horizontal separator in the right pane.
> 
> However, the size_request signal is not available in GTK 3. Use the
> configure-event signal instead.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
> Changes in v2:
>   - Use the "configure-event" instead of "size-allocate" signal.
>     This fixes the problem where we cannot move the horizontal
>     separator in the right pane.
> 
>  scripts/kconfig/gconf.c | 25 +++++++------------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 22badd2f710e..8b19298eef61 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -604,23 +604,12 @@ static void on_window1_destroy(GtkObject *object, gpointer user_data)
>  	gtk_main_quit();
>  }
>  
> -static void on_window1_size_request(GtkWidget *widget,
> -				    GtkRequisition *requisition,
> -				    gpointer user_data)
> +static gboolean on_window1_configure(GtkWidget *self,
> +				     GdkEventConfigure *event,
> +				     gpointer user_data)
>  {
> -	static gint old_h;
> -	gint w, h;
> -
> -	if (widget->window == NULL)
> -		gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h);
> -	else
> -		gdk_window_get_size(widget->window, &w, &h);
> -
> -	if (h == old_h)
> -		return;
> -	old_h = h;
> -
> -	gtk_paned_set_position(GTK_PANED(vpaned), 2 * h / 3);
> +	gtk_paned_set_position(GTK_PANED(vpaned), 2 * event->height / 3);
> +	return FALSE;
>  }
>  
>  static gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
> @@ -1021,8 +1010,8 @@ static void init_main_window(const gchar *glade_file)
>  	main_wnd = glade_xml_get_widget(xml, "window1");
>  	g_signal_connect(main_wnd, "destroy",
>  			 G_CALLBACK(on_window1_destroy), NULL);
> -	g_signal_connect(main_wnd, "size_request",
> -			 G_CALLBACK(on_window1_size_request), NULL);
> +	g_signal_connect(main_wnd, "configure-event",
> +			 G_CALLBACK(on_window1_configure), NULL);
>  	g_signal_connect(main_wnd, "delete_event",
>  			 G_CALLBACK(on_window1_delete_event), NULL);
>  

-- 
~Randy

