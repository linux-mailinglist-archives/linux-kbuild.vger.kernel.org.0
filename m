Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045A8407A14
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Sep 2021 20:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbhIKSTm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 Sep 2021 14:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbhIKSTm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Sep 2021 14:19:42 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26662C061574;
        Sat, 11 Sep 2021 11:18:29 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id s25so7569909edw.0;
        Sat, 11 Sep 2021 11:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=biZwT3hn3/RYg4ortIl/xR2WxRFQ7yYnaWh4LxGXuO8=;
        b=fI6MKZL5LLD5EfDY6WcedhRWDZM1YATpqeSyN+2W71Ocu0M4cGvZ+ekTQv1mSiSV8L
         ja08T3F/rEYV/h8OYyCLKzhIZ+r3Arm7h8GserJlqby5rGVrC3c1c9D6wDQd3u9DusFN
         YJ9pagz2jft/hLrS0KegFDQpdGFkOwAaV6Ob5/gpa5AajxQFx3xta4nfXqNofUmc9MjK
         QnrjcoNMur/29JifbLOm84pmwoqBq8c1igYJTspN/uziTrEGFEzbyKWfbE5zK2QzqndY
         kaBd54BsQ3LRq9HPNYCddWJyKq+nAwlf0kdwyIfqlHmQ2X+6RLdyvvj3Njq1i7fLtqwC
         RFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=biZwT3hn3/RYg4ortIl/xR2WxRFQ7yYnaWh4LxGXuO8=;
        b=xKH4ZQq+46gjnEAzXtVbuP+hwuw8/VVjrwCOKtOkthHOeAwDqZ5dD+VIs6/x5/GTei
         wl0k1rT8VllvP+E5LptdUtgxGX0VffT1656+EHh+kXEFWVBDavDF5BGfg9tRn+hx0c8d
         8TaXXdBEJfmFFl7CRnRfPuzA0yy/6SQmUIGmFIMybsjEmvDOxTiAi9VarTsWfJn2Coh6
         i4DTqXsTz8SCCDCY4ToonSxsW/eXH+Yb4RDc0KFeaIUtkG909PIvKE1R3LopbYXGKIyc
         9m1gkUCOpjWzj0qr6KJWyCCEijjtv3UtuBscXOcSUTbOo3YnsuNNxKuiGGVAeXLBXEMx
         Fg+Q==
X-Gm-Message-State: AOAM5321/JclbWIg/akgM5LOQ4D2+cQ94hjthbQEW17H/cR6IU4dhVZn
        RW35AgLlPPxKAs4xDaDNH893+RjP1+l6RQ==
X-Google-Smtp-Source: ABdhPJy4i6RFGInm0EZ4S8GDn/LxeSbJelpjeVm7kOqyJuP6cmGWBi4SpW1NFu/obvsPakVIzBfSOg==
X-Received: by 2002:a05:6402:5108:: with SMTP id m8mr4353148edd.367.1631384307425;
        Sat, 11 Sep 2021 11:18:27 -0700 (PDT)
Received: from [192.168.1.43] ([147.235.73.50])
        by smtp.gmail.com with ESMTPSA id z8sm1060236ejd.94.2021.09.11.11.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Sep 2021 11:18:27 -0700 (PDT)
Subject: Re: [PATCH] kconfig: Create links to main menu items in search
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <20210901175326.568535-1-arielmarcovitch@gmail.com>
 <CAK7LNAS2AA=0UxJudhuxmRJkWfXb2=fELc9cA6eH+cvSkOc=7Q@mail.gmail.com>
From:   Ariel Marcovitch <arielmarcovitch@gmail.com>
Message-ID: <e4c0d198-0ae6-e415-51b5-0a33ff4fb82e@gmail.com>
Date:   Sat, 11 Sep 2021 21:18:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS2AA=0UxJudhuxmRJkWfXb2=fELc9cA6eH+cvSkOc=7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/09/2021 5:14, Masahiro Yamada wrote:
>On Thu, Sep 2, 2021 at 2:53 AM Ariel Marcovitch
><arielmarcovitch@gmail.com> wrote:
>>
>>When one searches for a main menu item, links aren't created for it like
>>with the rest of the symbols.
>>
>>This happens because we trace the item until we get to the rootmenu, but
>>we don't include it in the path of the item. The rationale was probably
>>that we don't want to show the main menu in the path of all items,
>>because it is redundant.
>>
>>However, when an item has only the rootmenu in its path it should be
>>included, because this way the user can jump to its location.
>>
>>In case the item is a direct child of the rootmenu, show it in the
>>'Location:' section as 'Main Menu'.
>>
>>This makes the 'if (i > 0)' superfluous because each item with prompt
>>will have at least one menu in its path.
>>
>>Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
>>---
>>scripts/kconfig/menu.c | 40 ++++++++++++++++++++++++++--------------
>>1 file changed, 26 insertions(+), 14 deletions(-)
>>
>>diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
>>index 606ba8a63c24..8d7e3b07bf93 100644
>>--- a/scripts/kconfig/menu.c
>>+++ b/scripts/kconfig/menu.c
>>@@ -712,6 +712,7 @@ static void get_prompt_str(struct gstr *r, struct 
property *prop,
>>int i, j;
>>struct menu *submenu[8], *menu, *location = NULL;
>>struct jump_key *jump = NULL;
>>+const char *prompt = NULL;
>
>
>Can you move this to the for-loop ?
>
>The initializer is unneeded.
>
>
>>
>>str_printf(r, " Prompt: %s\n", prop->text);
>>
>>@@ -735,6 +736,13 @@ static void get_prompt_str(struct gstr *r, struct 
property *prop,
>>if (location == NULL && accessible)
>>location = menu;
>>}
>>+
>>+/* If we have only the root menu, show it */
>>+if (i == 0) {
>>+location = &rootmenu;
>>+submenu[i++] = location;
>>+}
>
>
>Instead of handling this as a special case,
>can we include the rootmenu all the time?
>
>We can change the for-loop condition to:
>
>for (i = 0; menu && i < 8; menu = menu->parent) {
Of course.
However, it means search entries will get a bit larger. I guess it is
worth it?
>
>
>
>
>
>
>
>>if (head && location) {
>>jump = xmalloc(sizeof(struct jump_key));
>>
>>@@ -758,21 +766,25 @@ static void get_prompt_str(struct gstr *r, struct 
property *prop,
>>list_add_tail(&jump->entries, head);
>>}
>>
>>-if (i > 0) {
>>-str_printf(r, " Location:\n");
>>-for (j = 4; --i >= 0; j += 2) {
>>-menu = submenu[i];
>>-if (jump && menu == location)
>>-jump->offset = strlen(r->s);
>>-str_printf(r, "%*c-> %s", j, ' ',
>>-menu_get_prompt(menu));
>>-if (menu->sym) {
>>-str_printf(r, " (%s [=%s])", menu->sym->name ?
>>-menu->sym->name : "<choice>",
>>-sym_get_string_value(menu->sym));
>>-}
>>-str_append(r, "\n");
>>+str_printf(r, " Location:\n");
>>+for (j = 4; --i >= 0; j += 2) {
>>+menu = submenu[i];
>>+if (jump && menu == location)
>>+jump->offset = strlen(r->s);
>>+
>>+/* The real rootmenu prompt is ugly */
>>+if (menu == &rootmenu)
>>+prompt = "Main Menu";
>
>Can you use "Main menu" for the consistency
>with scripts/kconfig/parser.y line 501?
>
Seems reasonable. Just to clarify, the prompt there is not relevant
for linux's Kconfig right?
>
>>+else
>>+prompt = menu_get_prompt(menu);
>
>
>I think it is better to omit '->' for the rootmenu.
>
>
>if (menu == &rootmenu) {
>prompt = "Main menu";
>marker = "";
>} else {
>prompt = menu_get_prompt(menu);
>marker = "->";
>}
>
>str_printf(r, "%*c%s %s", j, ' ', marker, prompt);
>
Perhaps it will be better to split to separate printfs? I think it
will be cleaner. It will make the extra vars unneeded as well.
Also, the results look a bit weird... maybe we should use a different
marker for rootmenu, like '--' or something?
>
>
>Maybe, this will make the help look cleaner.
>
>
>
>
>
>>+str_printf(r, "%*c-> %s", j, ' ', prompt);
>>+if (menu->sym) {
>>+str_printf(r, " (%s [=%s])", menu->sym->name ?
>>+menu->sym->name : "<choice>",
>>+sym_get_string_value(menu->sym));
>>}
>>+str_append(r, "\n");
>>}
>>}
>>
>>
>>base-commit: 087e856cfb76e9eef9a3a6e000854794f3c36e24
>>--
>>2.25.1
>>
>
>
>--
>Best Regards
>
>Masahiro Yamada
Thanks for the comments :)
Ariel Marcovitch
