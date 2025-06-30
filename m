Return-Path: <linux-kbuild+bounces-7775-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB7AED3CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 07:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DA991892DA7
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 05:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265941A23BD;
	Mon, 30 Jun 2025 05:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="d2b8MMIO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4831A0B0E;
	Mon, 30 Jun 2025 05:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751261175; cv=none; b=cODkNFOvBTzeE+Uzvvt7gj+sucXerqlAYZNGx5bx3P2aiWQ96EZMKQEGSMgslXrwDe5cBpAIKKkYJh51v4hEhaugUq6eCweqtM5PiZ9ok3TFvuCpM8Wa/BA+5Edvi02nY36kkndeVfws0Dc4AK0jwqy2Ru0nRjJek5iNTYcffqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751261175; c=relaxed/simple;
	bh=axjjCdLxlT6M6v9a2S4gHA0OWQVjKD5sof1aMTAyvXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CGS51bv/72xTMI3gKGwe5TrBYylxOTC0mhWvV8IylUn464D4AHevJGqIBJxsUeVSCAxsnr54Xk/1YjXOwCLF9qPCoSEnH558rpYQL5FdP6FqXj+yDAVdxBl3eifIxexS6mzTrqvwKA7aV7L/HUlBbrBwo+qP4xLnxBrzY7uFKus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=d2b8MMIO; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ilrNfIpK4gAh0mQtFrXfza5gU3OdZy67IcwEuHSz8As=; b=d2b8MMIOmJZ5e1tCBPP0j9p+BW
	1sfJk4Jeou29qwLBptNAaDYDOqprj7Ps9e2J5vDE3cRBlMbD4YllrEZe7XtOD9+571/C82cb4a+Vr
	Odw6esAg1PB4evJBIhw5A91ZNh8hg9eqryuwMF2WscTdUjAHrzHpZjBigjMYzfxgdtNogFpdijq9y
	V3DNr0UTrTEmYR5kgTmSMNVwZ1DICKXICXUPrxMGBez/0LePf6iAsQpHtcww1QrSN3XvXTde6E3Mo
	dV5547f37gYUWD01shBItQva3aIIhOuOBAbrRiamHTiBnzwTD0VVUWulDjltq6rlVaL7zaNhAAHvK
	aDaM6TBg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW71u-00000006jH9-3CTR;
	Mon, 30 Jun 2025 05:26:11 +0000
Message-ID: <8c64d34e-64ce-46f4-a170-ca440f94590e@infradead.org>
Date: Sun, 29 Jun 2025 22:26:08 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 55/66] kconfig: gconf: replace GTK_STOCK_{OK,NO,CANCEL}
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-56-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-56-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> These are deprecated with GTK 3.10. [1]
> 
> Use "_OK", "_no", "_Cancel".
> 

That's bad (on GTK) IMO. I would much rather see (and try to remember)
a symbolic name than some half-random string.


> [1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/3.10.0/gtk/deprecated/gtkstock.h#L827
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/gconf.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 28953449a1ed..32d1815b425e 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -686,11 +686,11 @@ static gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
>  					     (GtkDialogFlags)
>  					     (GTK_DIALOG_MODAL |
>  					      GTK_DIALOG_DESTROY_WITH_PARENT),
> -					     GTK_STOCK_OK,
> +					     "_OK",
>  					     GTK_RESPONSE_YES,
> -					     GTK_STOCK_NO,
> +					     "_No",
>  					     GTK_RESPONSE_NO,
> -					     GTK_STOCK_CANCEL,
> +					     "_Cancel",
>  					     GTK_RESPONSE_CANCEL, NULL);
>  	gtk_dialog_set_default_response(GTK_DIALOG(dialog),
>  					GTK_RESPONSE_CANCEL);

-- 
~Randy


