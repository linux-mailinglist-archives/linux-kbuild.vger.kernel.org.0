Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8628417A57
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Sep 2021 20:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345499AbhIXSCD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Sep 2021 14:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344663AbhIXSBz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Sep 2021 14:01:55 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC67EC061571;
        Fri, 24 Sep 2021 11:00:21 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id y12so2995534edo.9;
        Fri, 24 Sep 2021 11:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QJ7e9nuJLnIMNj0wcEbeYYc98wFrfVbCv9B0BoHfkj4=;
        b=ahZgJgZ5bhBmQ3I6bw9edXWdA8rJco//L2jgEjh7QRz6xfZxd5RgeRG5OnA612xpkc
         TQtYjHoyIXBxCDD+6ZkHjx7GLyU5ag9vLtMO/ipC41B+GP16uHkJQbX9Ubww8r65e266
         MiAi3f3lO0kDA06MtlAnmCR3oyHifMGM/cThvM4mTcnX1JevGQLmTdR4jhJGn1Z+ViR7
         IpRfAK91K1yHR7xmWwXmzuWjH5E3e9wOr7ZnxtIfa8kmiAeghv/dZkQWH0B3XDZbdwDE
         8M8KF73x4TEyxaP08Lf63wRQfZZJZXCUtm1Le5YgAVVb3dEPon5d2VAz1aLELsOojSOl
         CUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QJ7e9nuJLnIMNj0wcEbeYYc98wFrfVbCv9B0BoHfkj4=;
        b=aY15EJv2DpjCZ3rhRz4T9GTDJgPfs+x/deMgZiI/M4RztqsK9RZw5uXqVQMH1TTvkd
         hRSKVbhGBnf0PRJ899+9UjVQ4mAYEXqfpXA+zhRh2yZwS4PKZGjVxbaU4y0Ls/+BQr0D
         jiYRERzw06UF4StX4JrQgMwxgvVXC40zF48RDfphLG63CLfHHZxY60QAx3rgtnMnEbFR
         W5Yu2vkjDgzzT/L8qFVplfUqKJ9QcUtFcRjyOEhJCkGtlBmH+nB4hQnUD0iq1AMEJ8mE
         dt3bN2R73WKSM1az+0mF0yoT125NR7iyGDZ+y4HFukpH5D/4czhJL0Z4vCyfIYx1ERyE
         yTvQ==
X-Gm-Message-State: AOAM533YZbCic3mr+rHCGu1ffif60o+lVcoKhNp7zFOau6BNL471tUy8
        ZuYbqaoWlpt3JbWJVmf5U95UUpUl1Ic4BQ==
X-Google-Smtp-Source: ABdhPJzX4kmWqD12aDXuBBCNm7LwiByNB8lSaLMx8CHvW93R+j/enX/2t2YvfA+J4iQ2klZ71xFGBg==
X-Received: by 2002:a50:d0d1:: with SMTP id g17mr6744184edf.96.1632506420179;
        Fri, 24 Sep 2021 11:00:20 -0700 (PDT)
Received: from [192.168.1.42] ([147.235.73.50])
        by smtp.gmail.com with ESMTPSA id u19sm6373456edv.40.2021.09.24.11.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 11:00:19 -0700 (PDT)
Subject: Re: [PATCH v2] kconfig: Create links to main menu items in search
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210913164514.437972-1-arielmarcovitch@gmail.com>
From:   Ariel Marcovitch <arielmarcovitch@gmail.com>
Message-ID: <be481cb5-cfe0-6e23-2c27-c2e0aed69c6c@gmail.com>
Date:   Fri, 24 Sep 2021 21:00:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913164514.437972-1-arielmarcovitch@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 13/09/2021 19:45, Ariel Marcovitch wrote:
> When one searches for a main menu item, links aren't created for it like
> with the rest of the symbols.
>
> This happens because we trace the item until we get to the rootmenu, but
> we don't include it in the path of the item. The rationale was probably
> that we don't want to show the main menu in the path of all items,
> because it is redundant.
>
> However, when an item has only the rootmenu in its path it should be
> included, because this way the user can jump to its location.
>
> Add a 'Main menu' entry in the 'Location:' section for the kconfig
> items.
>
> This makes the 'if (i > 0)' superfluous because each item with prompt
> will have at least one menu in its path.
>
> Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
> ---
>   scripts/kconfig/menu.c | 33 ++++++++++++++++++---------------
>   1 file changed, 18 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 606ba8a63c24..3d6f7cba8846 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -728,7 +728,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
>   		get_dep_str(r, prop->visible.expr, "  Visible if: ");
>   
>   	menu = prop->menu->parent;
> -	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
> +	for (i = 0; menu && i < 8; menu = menu->parent) {
>   		bool accessible = menu_is_visible(menu);
>   
>   		submenu[i++] = menu;
> @@ -758,21 +758,24 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
>   		list_add_tail(&jump->entries, head);
>   	}
>   
> -	if (i > 0) {
> -		str_printf(r, "  Location:\n");
> -		for (j = 4; --i >= 0; j += 2) {
> -			menu = submenu[i];
> -			if (jump && menu == location)
> -				jump->offset = strlen(r->s);
> -			str_printf(r, "%*c-> %s", j, ' ',
> -				   menu_get_prompt(menu));
> -			if (menu->sym) {
> -				str_printf(r, " (%s [=%s])", menu->sym->name ?
> -					menu->sym->name : "<choice>",
> -					sym_get_string_value(menu->sym));
> -			}
> -			str_append(r, "\n");
> +	str_printf(r, "  Location:\n");
> +	for (j = 4; --i >= 0; j += 2) {
> +		menu = submenu[i];
> +		if (jump && menu == location)
> +			jump->offset = strlen(r->s);
> +
> +		if (menu == &rootmenu)
> +			/* The real rootmenu prompt is ugly */
> +			str_printf(r, "%*cMain menu", j, ' ');
> +		else
> +			str_printf(r, "%*c-> %s", j, ' ', menu_get_prompt(menu));
> +
> +		if (menu->sym) {
> +			str_printf(r, " (%s [=%s])", menu->sym->name ?
> +				menu->sym->name : "<choice>",
> +				sym_get_string_value(menu->sym));
>   		}
> +		str_append(r, "\n");
>   	}
>   }
>   
>
> base-commit: a9086b878b7fd65894eb8cb1fa395dd469970566
A friendly ping :)
