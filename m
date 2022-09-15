Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C03725B9370
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Sep 2022 06:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbiIOEAy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Sep 2022 00:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiIOEAx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Sep 2022 00:00:53 -0400
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com [210.131.2.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B885816BC
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Sep 2022 21:00:50 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 28F40D2i007787
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Sep 2022 13:00:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 28F40D2i007787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1663214414;
        bh=iUiaBtFrAxRsLj/w3fZABQ2RbE5kqvthDXqBZeyEe5g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QoetNf4I7XdBD0ynEmQ6admH+rvzt0N1yvwGiA9fGsiLjRPpNPkIfNYCWGbrutmrp
         3Unf06TGuwvIf4GEWFpkQtWN1xKtWEe6HejPnMmH/k/Hnh2EZ2fGeTupOzuv/XrYqj
         +FlK80550wj/1wjkAd4tOfjgRBaReyzYOCcqIAn1caF6cIZ8TRs00srE2gqZEntAYX
         E6W+TYF26tmKxjqhHM2GAwVTIZ5TEEHKCIBbPdCAyZaGXwKlv71N9dsgBngbZnc4bn
         Kv5wkQsZCXGTYDlursvS7xAa8fy0BPOH27H9O7Zt3tu9GlY+owwSyQqMHnfzgSmXeJ
         /BeVQXvMjvLNA==
X-Nifty-SrcIP: [209.85.167.171]
Received: by mail-oi1-f171.google.com with SMTP id n124so771292oih.7
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Sep 2022 21:00:14 -0700 (PDT)
X-Gm-Message-State: ACgBeo3v6mFTOlUDJvnuJsbVhEKE+5dQlhXR3JoaUTwdbgsTW5c+4gT0
        ZM+af3C2Rdz4BjsbpZV2rFPXxokyWuObhKjA1pA=
X-Google-Smtp-Source: AA6agR5/QHXZ1RXZ5wDsxa74PjGcEXvf+tmr+ZmnhzAyoBlzQ0CfbzgWMj4gCb+az0v50tJUI1hHkCTFcwGru4UJMVc=
X-Received: by 2002:a05:6808:1b85:b0:34d:8ce1:d5b0 with SMTP id
 cj5-20020a0568081b8500b0034d8ce1d5b0mr3270975oib.194.1663214412998; Wed, 14
 Sep 2022 21:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220914015906.3943200-1-zengheng4@huawei.com>
In-Reply-To: <20220914015906.3943200-1-zengheng4@huawei.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 15 Sep 2022 12:59:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR8m380p6awGQ8J38gaxG5UDG=MQ6rr5A3U2nM9ThyjLw@mail.gmail.com>
Message-ID: <CAK7LNAR8m380p6awGQ8J38gaxG5UDG=MQ6rr5A3U2nM9ThyjLw@mail.gmail.com>
Subject: Re: [PATCH resend v2] Kconfig: remove sym_set_choice_value
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        liwei391@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 14, 2022 at 10:52 AM Zeng Heng <zengheng4@huawei.com> wrote:
>
> Following Masahiro's suggestion,
> sym_set_choice_value could be removed and directly
> call sym_set_tristate_value instead.
>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>



Applied to linux-kbuild.
Thanks.


> ---
>  scripts/kconfig/conf.c | 2 +-
>  scripts/kconfig/lkc.h  | 5 -----
>  2 files changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 4178065ca27f..33d19e419908 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -551,7 +551,7 @@ static int conf_choice(struct menu *menu)
>                         print_help(child);
>                         continue;
>                 }
> -               sym_set_choice_value(sym, child->sym);
> +               sym_set_tristate_value(child->sym, yes);
>                 for (child = child->list; child; child = child->next) {
>                         indent += 2;
>                         conf(child);
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index fa8c010aa683..903738a9233a 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -124,11 +124,6 @@ static inline struct symbol *sym_get_choice_value(struct symbol *sym)
>         return (struct symbol *)sym->curr.val;
>  }
>
> -static inline bool sym_set_choice_value(struct symbol *ch, struct symbol *chval)
> -{
> -       return sym_set_tristate_value(chval, yes);
> -}
> -
>  static inline bool sym_is_choice(struct symbol *sym)
>  {
>         return sym->flags & SYMBOL_CHOICE ? true : false;
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
