Return-Path: <linux-kbuild+bounces-7779-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9788AED436
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 08:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9689A3AC40D
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 06:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FA4A923;
	Mon, 30 Jun 2025 06:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nVy5uQGW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3BB1FDD;
	Mon, 30 Jun 2025 06:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751263606; cv=none; b=ndmKF5XfKkYrgzH+p1QBS5ZcTo1bpOhTZBGzHVM+D5RIuM/Gn2U+/PgiRn6luGPavI71EMJolCK/VxH6hB31w+5Yq1Hpau1+vd6ijZH68jZyCuLCRfkonCHmG2p9hTFGlJpCA/r8n1zq2EL62YOjJmkDfySKIWgr/4xxRZttFRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751263606; c=relaxed/simple;
	bh=HUhY7PoUs24V3YBoQzZ9KGLJDEedXhxuIMG3qmkkfHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J0QQgp0A9fP05lhwm/Z9Z3hvoAF0c79YjqjyEH2nTFFppVzUHkpX9HJMUbVWDuhnz2+c6di04mb+VQD00JlU/X6a/g+HK5qDQXWqUIPUPQetyC7DSOYrzGvxR2VgWtbJBs3CmqAORqUxQwxSWy2Z0IJZrHkGi48m9keZcnCnxvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nVy5uQGW; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4ut1Lv9D/BPjEG6Q/nzKguo7DsSLefV5+bwvE1C6ltc=; b=nVy5uQGW/TZGKhQIhpIx3Kw0lI
	aeqvsE+nPJ2z9iKxND2YqtnhAXuDCc9vX7bCLYcV6JNkmxq/3ks70DbAk/Tjsr2kNEpfA9PZMfl0t
	z8Hb5H1cQzON0refA+AdLbA1REsFIl/2A45L8yClAkpWAE4kwemCjPcmXUw7PyJnj892t42mgHraH
	bZ5EvK4RdsV0zyACpnEGLpHsF9wEhT2eYFY6f4AQ0UzEjORtE9kDqGByJ829KiPuHvaC9wVHE7IyZ
	Ect3iUcu6DjybNKQkCBTMgKXALzTLgAtq+2OPpAj4HIMINGcQwYUNYyhvWNXcEPHQJe+Cxyq2mJO/
	OrcTNaxw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW7f7-00000006jXI-3uxZ;
	Mon, 30 Jun 2025 06:06:42 +0000
Message-ID: <14122bc8-3e41-426a-ab78-81bf865d122d@infradead.org>
Date: Sun, 29 Jun 2025 23:06:40 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 66/66] kconfig: gconf: show GTK version in About dialog
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-67-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-67-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> Likewise xconfig, it is useful to display the GTK version in the About
> dialog.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
>  scripts/kconfig/gconf.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 5b1b468e782d..7340407e4d6e 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -579,7 +579,11 @@ static void on_about1_activate(GtkMenuItem *menuitem, gpointer user_data)
>  	dialog = gtk_message_dialog_new(GTK_WINDOW(main_wnd),
>  					GTK_DIALOG_DESTROY_WITH_PARENT,
>  					GTK_MESSAGE_INFO,
> -					GTK_BUTTONS_CLOSE, "%s", about_text);
> +					GTK_BUTTONS_CLOSE, "%s\nGTK version: %d.%d.%d",
> +					about_text,
> +					gtk_get_major_version(),
> +					gtk_get_minor_version(),
> +					gtk_get_micro_version());
>  	gtk_dialog_run(GTK_DIALOG(dialog));
>  	gtk_widget_destroy(dialog);
>  }

-- 
~Randy

