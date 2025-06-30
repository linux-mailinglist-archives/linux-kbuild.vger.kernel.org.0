Return-Path: <linux-kbuild+bounces-7765-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53820AED2D4
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 05:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96023171DFF
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 03:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870A2145B3F;
	Mon, 30 Jun 2025 03:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HAndES1Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A38115A8;
	Mon, 30 Jun 2025 03:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751253285; cv=none; b=t6prie937D/jeBt91RnGsFypNxOo2ht3lFZjBBIX32Nn7EvyLc5FQ1CBVMfNpr8jp3TZgRxHfLe+Euqlaroaz+TGZtz12FUGoRGnLX93ca94Ex0T+/ma2kdUULmGREJpXDH3tWCRFmFrfXP2lW4/QXpiCEccg1fc60C9VPiTBa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751253285; c=relaxed/simple;
	bh=PbaxJkyeiCz+sizr8MKpoaIq/pAEfKNIOLeXxjnuLgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIPhR2fQte3QYHvGQFJjQXgtxkRzGJOt7y3I9UFV5+o6nBlckav3zNQAuomSwEQV9jx+jjkqc0QD1A+NtYsQA4/bG0llJfVZmQdXQcOOr8nRKBPulpVwc/noepE67vWgyWNNGlD7JFm+RVoQf25zGwv7Cu91g0SvHD2XA2xMaq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HAndES1Y; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kkt6udg2+8P5CWhjbdOo6o2wW9s01U09OgNeEtDy2Sw=; b=HAndES1Y2A4KgFMri9v7aEV4+d
	lgY+gCsqDKDPitIF4fizmJ75TcpDjTjgp11u/m7x6Q1Og3X7NjI76NCp7pKoOnuxx52vsYKNFGtxO
	0CCuyof48H2JhoKyQl54RWaIONcThsut4jmI9MY4tTmFdnbVo4mi3zu0DBNTZZuWYdNYqPui+yjRW
	RdwYYe946tgJl3WkI4kq8h+9ugXssEM8IsKgzNfTay310+bH1B8lgS//pF/PIKUAD6n1yYiPAze3I
	VDFUk7+ZEeILE6nLPR2yBSPx4KK5YfjAssp9jaDN1b+Dx+44zt+0fPwshG3XwAWTGCyQgpCVDIJ56
	7CCfPTiA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW4ye-00000006iV6-2ng8;
	Mon, 30 Jun 2025 03:14:42 +0000
Message-ID: <7a663788-f67f-452a-93df-74654e9712bc@infradead.org>
Date: Sun, 29 Jun 2025 20:14:38 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/66] kconfig: gconf: use GtkFileChooser in
 on_load1_activate()
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-37-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-37-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> gtk_file_selection_new() is deprecated, and gtk_file_chooser_dialog_new()
> should be used instead. [1]
> 
> [1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/docs/reference/gtk/tmpl/gtkfilesel.sgml?ref_type=tags#L156
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Old gconfig (pre-patches) did not even clear the error message on a good Load.
I still see (on OLD)
  Unable to load configuration !
after a successful Load (determined by Save and diff).
This is no longer a problem.


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> 
>  scripts/kconfig/gconf.c | 58 ++++++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 8c60b9f25eaa..f33f39d50f3d 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -157,38 +157,38 @@ static void text_insert_msg(const char *title, const char *message)
>  
>  /* Menu & Toolbar Callbacks */
>  
> -
> -static void
> -load_filename(GtkFileSelection * file_selector, gpointer user_data)
> -{
> -	const gchar *fn;
> -
> -	fn = gtk_file_selection_get_filename(GTK_FILE_SELECTION
> -					     (user_data));
> -
> -	if (conf_read(fn))
> -		text_insert_msg("Error", "Unable to load configuration !");
> -	else
> -		display_tree_part();
> -}
> -
>  static void on_load1_activate(GtkMenuItem *menuitem, gpointer user_data)
>  {
> -	GtkWidget *fs;
> +	GtkWidget *dialog;
> +	GtkFileChooser *chooser;
> +	gint res;
>  
> -	fs = gtk_file_selection_new("Load file...");
> -	g_signal_connect(GTK_OBJECT(GTK_FILE_SELECTION(fs)->ok_button),
> -			 "clicked",
> -			 G_CALLBACK(load_filename), (gpointer) fs);
> -	g_signal_connect_swapped(GTK_OBJECT
> -				 (GTK_FILE_SELECTION(fs)->ok_button),
> -				 "clicked", G_CALLBACK(gtk_widget_destroy),
> -				 (gpointer) fs);
> -	g_signal_connect_swapped(GTK_OBJECT
> -				 (GTK_FILE_SELECTION(fs)->cancel_button),
> -				 "clicked", G_CALLBACK(gtk_widget_destroy),
> -				 (gpointer) fs);
> -	gtk_widget_show(fs);
> +	dialog = gtk_file_chooser_dialog_new("Load file...",
> +					     GTK_WINDOW(user_data),
> +					     GTK_FILE_CHOOSER_ACTION_OPEN,
> +					     "_Cancel", GTK_RESPONSE_CANCEL,
> +					     "_Open", GTK_RESPONSE_ACCEPT,
> +					     NULL);
> +
> +	chooser = GTK_FILE_CHOOSER(dialog);
> +	gtk_file_chooser_set_filename(chooser, conf_get_configname());
> +
> +	res = gtk_dialog_run(GTK_DIALOG(dialog));
> +	if (res == GTK_RESPONSE_ACCEPT) {
> +		char *filename;
> +
> +		filename = gtk_file_chooser_get_filename(chooser);
> +
> +		if (conf_read(filename))
> +			text_insert_msg("Error",
> +					"Unable to load configuration!");
> +		else
> +			display_tree_part();
> +
> +		g_free(filename);
> +	}
> +
> +	gtk_widget_destroy(GTK_WIDGET(dialog));
>  }
>  
>  static void on_save_activate(GtkMenuItem *menuitem, gpointer user_data)

-- 
~Randy

