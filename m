Return-Path: <linux-kbuild+bounces-7766-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA231AED2DF
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 05:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C31F53B34F4
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 03:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BD81DA55;
	Mon, 30 Jun 2025 03:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b2o8DoPl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C7E4C6C;
	Mon, 30 Jun 2025 03:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751253667; cv=none; b=p9dJFPqAcGB+XpLVEs+IcsLRdeNAVBYZtCQIPpGEkHLgO0pyCy0hdqhv1QW109dDirD/08fNvyPYVVk+OBWMTZvwv6SKTqfGFLqWHLysSlOQAg8av1YY4DQeZfhoSKBLO5dDC8FGvGH19vnSkM8vH/JhjHXsrKEgt96dSv2hP2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751253667; c=relaxed/simple;
	bh=V6mII1O5U1NOnOu3wx07q4tyfusravzO5rb8bdyvvMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0INgaCeWsvDo0Sm9CmbKsZkwiWCNhlNG7pfQdjns27XTN1OPSXTLPvoablEDoNRykzyj45OdSCcF2UKk05fpp335r2LjhhID7LwUJiPzw/Y7Ndx3GVvQ46gbN5wpT1YjvPPh2lYRtjwT7jqnzTzH+w9onzXSwZ/6xzY8tQFNDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b2o8DoPl; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h9VCl1vFa5kMUPqcOo628ZE9FCQuczciRfdsxio9sAo=; b=b2o8DoPlKqE8hOlSOdBuZgM9jp
	o+8kKUxzkzFnKwwNp0n3jzKgE0LJAA9EAZGaQwpsZmRegE83ADmCo3mXVu8D3BQ+7J5jj8jXCmEmv
	agHlz+yo4XA+42Xu7lWmWRaXqyOejFFSGpguMOZrZ6hEeetU0ywbO2CfcSj0I8Fa9mkStX3nBEW+7
	2LV2HCPFvNtn0rX+jr0jAb07mV0wpO0o/RJ2jHPRxJ8xZWFFbFhvEHs3rB+3dk4O1La2PKM/wCcWa
	mBXsGM0ap+3dGwf6AdD67mfPNX96DP+imRdZ/q25u+0zmfYw6bwkC00WCMDPlUCec17BIAp0kaxlc
	ZAyovQSA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW54l-00000006iZ0-1bvi;
	Mon, 30 Jun 2025 03:21:03 +0000
Message-ID: <524e8ee4-52cd-47aa-80ea-7d09ebca05ea@infradead.org>
Date: Sun, 29 Jun 2025 20:20:57 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/66] kconfig: gconf: use GtkFileChooser in
 on_save_as1_activate()
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-38-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-38-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> gtk_file_selection_new() is deprecated, and gtk_file_chooser_dialog_new()
> should be used instead. [1]
> 
> [1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/docs/reference/gtk/tmpl/gtkfilesel.sgml?ref_type=tags#L156
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>



> ---
> 
>  scripts/kconfig/gconf.c | 56 ++++++++++++++++++++---------------------
>  1 file changed, 27 insertions(+), 29 deletions(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index f33f39d50f3d..b019711142c3 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -198,38 +198,36 @@ static void on_save_activate(GtkMenuItem *menuitem, gpointer user_data)
>  	conf_write_autoconf(0);
>  }
>  
> -
> -static void
> -store_filename(GtkFileSelection * file_selector, gpointer user_data)
> -{
> -	const gchar *fn;
> -
> -	fn = gtk_file_selection_get_filename(GTK_FILE_SELECTION
> -					     (user_data));
> -
> -	if (conf_write(fn))
> -		text_insert_msg("Error", "Unable to save configuration !");
> -
> -	gtk_widget_destroy(GTK_WIDGET(user_data));
> -}
> -
>  static void on_save_as1_activate(GtkMenuItem *menuitem, gpointer user_data)
>  {
> -	GtkWidget *fs;
> +	GtkWidget *dialog;
> +	GtkFileChooser *chooser;
> +	gint res;
>  
> -	fs = gtk_file_selection_new("Save file as...");
> -	g_signal_connect(GTK_OBJECT(GTK_FILE_SELECTION(fs)->ok_button),
> -			 "clicked",
> -			 G_CALLBACK(store_filename), (gpointer) fs);
> -	g_signal_connect_swapped(GTK_OBJECT
> -				 (GTK_FILE_SELECTION(fs)->ok_button),
> -				 "clicked", G_CALLBACK(gtk_widget_destroy),
> -				 (gpointer) fs);
> -	g_signal_connect_swapped(GTK_OBJECT
> -				 (GTK_FILE_SELECTION(fs)->cancel_button),
> -				 "clicked", G_CALLBACK(gtk_widget_destroy),
> -				 (gpointer) fs);
> -	gtk_widget_show(fs);
> +	dialog = gtk_file_chooser_dialog_new("Save file as...",
> +					     GTK_WINDOW(user_data),
> +					     GTK_FILE_CHOOSER_ACTION_SAVE,
> +					     "_Cancel", GTK_RESPONSE_CANCEL,
> +					     "_Save", GTK_RESPONSE_ACCEPT,
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
> +		if (conf_write(filename))
> +			text_insert_msg("Error",
> +					"Unable to save configuration !");
> +
> +		g_free(filename);
> +	}
> +
> +	gtk_widget_destroy(dialog);
>  }
>  
>  static void on_show_name1_activate(GtkMenuItem *menuitem, gpointer user_data)

-- 
~Randy

