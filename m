Return-Path: <linux-kbuild+bounces-7757-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A17AED263
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28B741894C83
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921D3634EC;
	Mon, 30 Jun 2025 02:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Afw2EeAS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21711208CA;
	Mon, 30 Jun 2025 02:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751250197; cv=none; b=uZvJsKwio7ejx4tj3sfYQzoofbY9v7g/yOG3GkTcxlhEMwmvgV2wCLIrEaaHYA1Yy4v+APlyUnXQi6l+4cSykFnXJlvO62qQS7Lf4YJDSXZJo17ABFdGdaTjNTrjQxzY9s3/SQew6T11Gev3qYbuTwNjqYVyz04rHxo9NRUvkqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751250197; c=relaxed/simple;
	bh=oLPjFwo+sjAW/99IC0SS82brD/DCm0TT8eRTLMhCBdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibpbPbACd0g5T3/kRMDnH2dcRs2SbCF5/rkXf3LwySTzFuQByp/kVIpWI+AyAiVvBEj/KfmO0rwu7euEGdt9CNrHxjA3mED5u5gDO0wkh3ah3WeRiUQqDVO4ot46awbbuOSxxnM4DPISgpeT6XaiBO40w5lOvqjFLlyBvF9jbtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Afw2EeAS; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IxLLJmG9i7B9+nQ+eV3U9zbE3B45SP/XA8oFi1PAGpY=; b=Afw2EeAS2D9KReQ5fJGaIa+AIu
	aY8O8/qp84JFk9LH6MFzXq+wbHhRMAl/rMh2JbkO5Mj7apPg4q1txWrBTilEQMuzq7eUaonkpt2Gd
	+w0JMzZwPVDoItjw6zBfKIvnTOpYm3Kkyup2fsgjIhrCQuJId9MWhKxiYTkQxyD7LulLid2mZcUm0
	G4pkDPSC6PRSpP65zYjy9BoSZ+R5aKJaALlTOZJzUZwblZQCjI/ircDAy44Np/eagHiIHU6/h3IRw
	jLECYi2ssukNuxFO10/FNQcAtp3KXc5RSy7Zb1t+/ubDcZ8lvVj/NX4CRj8tOJtWGamzldnHg0jMb
	ulpg1Nhg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW4Aq-00000006iCE-39ft;
	Mon, 30 Jun 2025 02:23:14 +0000
Message-ID: <7eb566a6-3cf2-4e7d-ab5f-18c7aef697bb@infradead.org>
Date: Sun, 29 Jun 2025 19:23:10 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/66] kconfig: gconf: always destroy dialog in
 on_window1_delete_event()
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-9-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-9-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> When gtk_dialog_run() returns GTK_RESPONSE_YES or GTK_RESPONSE_NO,
> gtk_widget_destroy() is not called, resulting is a memory leak.
> 
> It is better to always destroy the dialog, even if the application
> is about to exit.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
>  scripts/kconfig/gconf.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 769f38307f34..52d439a5119b 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -378,6 +378,7 @@ gboolean on_window1_delete_event(GtkWidget * widget, GdkEvent * event,
>  {
>  	GtkWidget *dialog, *label;
>  	gint result;
> +	gint ret = FALSE;
>  
>  	if (!conf_get_changed())
>  		return FALSE;
> @@ -404,17 +405,19 @@ gboolean on_window1_delete_event(GtkWidget * widget, GdkEvent * event,
>  	switch (result) {
>  	case GTK_RESPONSE_YES:
>  		on_save_activate(NULL, NULL);
> -		return FALSE;
> +		break;
>  	case GTK_RESPONSE_NO:
> -		return FALSE;
> +		break;
>  	case GTK_RESPONSE_CANCEL:
>  	case GTK_RESPONSE_DELETE_EVENT:
>  	default:
> -		gtk_widget_destroy(dialog);
> -		return TRUE;
> +		ret = TRUE;
> +		break;
>  	}
>  
> -	return FALSE;
> +	gtk_widget_destroy(dialog);
> +
> +	return ret;
>  }
>  
>  

-- 
~Randy

