Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 679F85104FB
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Apr 2022 19:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345286AbiDZRPO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Apr 2022 13:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353891AbiDZRMH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Apr 2022 13:12:07 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386923299F
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 10:08:43 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x33so33092386lfu.1
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 10:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mj5YNIpqKili4njrI75f0/IFkDmlnuz7/vAcRFXF5qo=;
        b=io1nLFMc9+ErVeKm4EDDchVdVYXWmUQ8SmiWSUDjaMpSsm6oWXpCfZj4wr5zNa+Qqv
         OMlIIEMk6xiz9WnGxyRzQRmb0+VqnuRlAVBJnP+j1MDdagAmzm6iDrPvMufpbyIFcoxk
         v7x09EqIb7DCKz+eQmrKau4OihA3TSQGvVoZM794wf+uvE75uZVZQ9S9+h5Ax3gsvDqp
         TfR+sM4zKjIsIQazg+gsigCLkHC8E9Y3PG54FqBIFQBfEXzNkwtLYlGIkUEIRPOKz30e
         6IfpDWoXlE1BAgwdlCLu1nA1P/tJh27jDlXuB04EGVzlsNYIIaQBZ3HVG6+j+XeKXIj0
         qnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mj5YNIpqKili4njrI75f0/IFkDmlnuz7/vAcRFXF5qo=;
        b=J4ubCVWJraKIPoqTTSFJXsjoCMaVxC6YPpFNhlf1pfuY8MBcUSfOUJLuSSAVpIDb0B
         JH+9dkSxnFOEJnkCSIXHvMVKYJvw5wzuKJta+SiwlNVVVGdhXZcJYYuMb+ozuXLnW/AR
         XvIxyp+wcGxzfd6GyRdXK/EATqnoc1M5Qh/ihqfffyCsRBie7CYH5ga9+N2EAvNLfmjs
         6EBj5KbqKBbIJxWrgJMfqotncjoISbVf83bWCgwB8ErvLd7T9yAR5VkR1Ln1zD0vYYxt
         Z8ltAX1u/gzyNIXxbCq+oQSgeRP0mpPvel/dXDDe9hdx4N+giN+Ph1zbFIBxcIr9STDj
         q+Wg==
X-Gm-Message-State: AOAM533CeFn/Qn+gvg0jrIgU3ea/4tI9MYr5rOkUxSLhpV5sNDH7p782
        zR0xy7Bjs6YMBBJ3txIgjxonIFi9ZzlZcPivuwLjxQ==
X-Google-Smtp-Source: ABdhPJya8Phm79PF7Y31/YZmxkplUDt9LDWp86dvQxAFGd8ZFGIj4Jv0kqJTc68ZS1a4NQqtlQM/NuM719rjq4AgJVo=
X-Received: by 2002:a05:6512:1d1:b0:471:f63a:b182 with SMTP id
 f17-20020a05651201d100b00471f63ab182mr13215378lfp.392.1650992917897; Tue, 26
 Apr 2022 10:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220424190811.1678416-1-masahiroy@kernel.org> <20220424190811.1678416-11-masahiroy@kernel.org>
In-Reply-To: <20220424190811.1678416-11-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 26 Apr 2022 10:08:25 -0700
Message-ID: <CAKwvOdnysRX_qp1KYSd331G7K863iH-Xiw3UOwKRSQm65u9i-Q@mail.gmail.com>
Subject: Re: [PATCH 10/27] modpost: traverse unresolved symbols in order
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 24, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Currently, modpost manages unresolved in a singly liked list; it adds

s/liked/linked/

> a new node to the head, and traverses the list from new to old.
>
> Use a doubly linked list to keep the order in the symbol table in the
> ELF file.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 20 ++++++++++++++------
>  scripts/mod/modpost.h |  2 +-
>  2 files changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 1c7d2831e89d..e1eb188d6282 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -185,6 +185,8 @@ static struct module *new_module(const char *modname)
>         mod = NOFAIL(malloc(sizeof(*mod) + strlen(modname) + 1));
>         memset(mod, 0, sizeof(*mod));
>
> +       INIT_LIST_HEAD(&mod->unresolved_symbols);
> +
>         strcpy(mod->name, modname);
>         mod->is_vmlinux = (strcmp(modname, "vmlinux") == 0);
>         mod->gpl_compatible = true;
> @@ -201,6 +203,7 @@ static struct module *new_module(const char *modname)
>
>  struct symbol {
>         struct symbol *next;
> +       struct list_head list;

Isn't `list` meant to replace `next`?

>         struct module *module;
>         unsigned int crc;
>         bool crc_valid;
> @@ -255,8 +258,12 @@ static struct symbol *new_symbol(const char *name, struct module *module,
>
>  static void sym_add_unresolved(const char *name, struct module *mod, bool weak)
>  {
> -       mod->unres = alloc_symbol(name, mod->unres);
> -       mod->unres->weak = weak;
> +       struct symbol *sym;
> +
> +       sym = alloc_symbol(name, NULL);
> +       sym->weak = weak;
> +
> +       list_add_tail(&sym->list, &mod->unresolved_symbols);

Because I was curious here why NULL was passed, rather than remove the
assignment to struct symbol's next member in alloc_symbol.

I get why you replace the `unres` member of struct module. I guess I'm
curious then why yet another list is added to struct symbol, rather
than replace the next member.

Also, does adding a struct list_head member really not specify the
_type_ of the next element?  I guess when I look at the definition of
struct module, at the member unresolved symbols, I don't know whether
it's a list of struct module* or a list of struct symbol*.

<snip>

> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index c3b5d2f0e2bb..6a90bfc08458 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -117,7 +117,7 @@ struct namespace_list {
>  struct module {
>         struct list_head list;
>         int gpl_compatible;
> -       struct symbol *unres;
> +       struct list_head unresolved_symbols;
>         bool from_dump;         /* true if module was loaded from *.symvers */
>         bool is_vmlinux;
>         bool seen;
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
