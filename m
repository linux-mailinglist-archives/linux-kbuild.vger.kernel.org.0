Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF361B87E1
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Apr 2020 19:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgDYRBL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 25 Apr 2020 13:01:11 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:55920 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgDYRBK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Apr 2020 13:01:10 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 03PH0uSm007197;
        Sun, 26 Apr 2020 02:00:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 03PH0uSm007197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587834057;
        bh=nw/iS2+TIOSltGesRHpFRaVlbIuzmlOlxni1WfQkguI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YVvUfvNvH+HODwj9iuaIt5c0CHQs253NRCArETRt92dty4AdZ8LXxvaVWlNSdQVh+
         o4MAL8iYq/4se1BTv2JVPhELoPIixQUEFS01tFDWR3+NvnKdHAq1NVvXHX/O1q58MY
         ld8qcgt99ki2RqYQmaryQ403LhbGMbFjH/Id+KFuGN+k5zmTddcYTBm46JidZkx6Hb
         h8ooZHaqhl4LbwnFrHNBIQOvRlmPBW0PiZyBHulZIfFxtAc6LAb8CZw0kd0Vz7YhYF
         srrwKdcUZQSWQ5alMSdfgjGP7nY2uVU/3V77H6ysdGqtfC8hVG/xcBVPaUL+5qNa8H
         vJnUlGJ0bVzYA==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id t8so12774622uap.3;
        Sat, 25 Apr 2020 10:00:57 -0700 (PDT)
X-Gm-Message-State: AGi0Pubklg3ntE0V/+MIjx3N9d81Cnrh1dgd7P077C6TAgDlNFNz4QZV
        sKwdsX3ZeC40hUZsiLl2C0qS0ac3CW8ftKcS4lI=
X-Google-Smtp-Source: APiQypIhSfEd7U10oVrRR/223pFpF6ZMceLIk+BaUGr5U8+/N6XcPQ4f1HjrXRWUQf8hcz/kZGUzVzGdeY5V+NBvJGw=
X-Received: by 2002:ab0:cd:: with SMTP id 71mr10855621uaj.109.1587834056343;
 Sat, 25 Apr 2020 10:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200413153542.94064-1-masahiroy@kernel.org>
In-Reply-To: <20200413153542.94064-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 26 Apr 2020 02:00:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS+wPzf6oAEyKQcE4irbw-5CStMTrZgmi0RGS0_8MQbsA@mail.gmail.com>
Message-ID: <CAK7LNAS+wPzf6oAEyKQcE4irbw-5CStMTrZgmi0RGS0_8MQbsA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: do not assign a variable in the return statement
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 14, 2020 at 12:35 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I am not a big fan of doing assignment in a return statement.
> Split it into two lines.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>



Applied to linux-kbuild.

> ---
>
>  scripts/kconfig/menu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index e436ba44c9c5..a5fbd6ccc006 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -65,7 +65,8 @@ void menu_add_entry(struct symbol *sym)
>  struct menu *menu_add_menu(void)
>  {
>         last_entry_ptr = &current_entry->list;
> -       return current_menu = current_entry;
> +       current_menu = current_entry;
> +       return current_menu;
>  }
>
>  void menu_end_menu(void)
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
