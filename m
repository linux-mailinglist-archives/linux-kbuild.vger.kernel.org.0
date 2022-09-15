Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8D75B9371
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Sep 2022 06:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiIOEA7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Sep 2022 00:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiIOEA4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Sep 2022 00:00:56 -0400
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com [210.131.2.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3541B93525
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Sep 2022 21:00:55 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 28F40WvS018624
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Sep 2022 13:00:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 28F40WvS018624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1663214433;
        bh=DlOvoDLTEagUGjIcATOZSYp+fYSk0xu0MG2/HRiSFpM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C4j7yU+v8Cn62V9YvwkQbTan90Z739IiLNVddLGeHf3lyK0pbaPGyHoh5mc9RM5qW
         sn6j/kuyO4pFVpLS9KReiRNnkyX5Kv3/CPHWPwu1A9frPtdCvewcZU6kwIxJ1PZE2y
         S6m5t/n/L8LOzc1iLDC2Plt/jW+z1RiVrqAdad7WpEvhbN2WrwPtmir6TR5LLSC2+L
         6RzVfqlbrpRbj7IrjwkMvtlQba7C5k/3gq0pRF4X3aBHaYodzO8p+p6IR5TlFsa9OV
         DgBMggTgrEiYTOQf7SOvzXe5XInEZyVBdjgIpT/7kiQZ5Sc1ISwDNokOOEMuIih2NC
         im44rLYHBS2fw==
X-Nifty-SrcIP: [209.85.210.49]
Received: by mail-ot1-f49.google.com with SMTP id w22-20020a056830061600b006546deda3f9so11719265oti.4
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Sep 2022 21:00:33 -0700 (PDT)
X-Gm-Message-State: ACgBeo2mQDNJH02qHUT9BUAzXC8Z+iun5gxUqP7XSmmDQDHq2dxRuxxb
        VviRt+xRaPH0/xtmygkcrn9UJf9+K6mS+w48yG0=
X-Google-Smtp-Source: AA6agR6oftBkeb74wn8haJSiRg4yhz56lu92X/kPrlh8bLmBPcSAux6JdlLfLSeE4HezVjQg0x1u6vNBNZxnaf+BnI8=
X-Received: by 2002:a05:6830:3115:b0:658:ea61:249c with SMTP id
 b21-20020a056830311500b00658ea61249cmr437394ots.225.1663214432357; Wed, 14
 Sep 2022 21:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220914120921.3739309-1-zengheng4@huawei.com>
In-Reply-To: <20220914120921.3739309-1-zengheng4@huawei.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 15 Sep 2022 12:59:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS1dVNjwBk+Gnw3j7sGYYx4s8h+T63w-JDv=+nDUaKHqg@mail.gmail.com>
Message-ID: <CAK7LNAS1dVNjwBk+Gnw3j7sGYYx4s8h+T63w-JDv=+nDUaKHqg@mail.gmail.com>
Subject: Re: [PATCH] scripts: remove unused argument 'type'
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     David Howells <dhowells@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
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

On Wed, Sep 14, 2022 at 9:02 PM Zeng Heng <zengheng4@huawei.com> wrote:
>
> Remove unused function argument, and there is
> no logic changes.
>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>

Applied to linux-kbuild.
Thanks.



> ---
>  scripts/asn1_compiler.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
> index adabd4145264..71d4a7c87900 100644
> --- a/scripts/asn1_compiler.c
> +++ b/scripts/asn1_compiler.c
> @@ -832,7 +832,7 @@ static void parse(void)
>
>  static struct element *element_list;
>
> -static struct element *alloc_elem(struct token *type)
> +static struct element *alloc_elem(void)
>  {
>         struct element *e = calloc(1, sizeof(*e));
>         if (!e) {
> @@ -860,7 +860,7 @@ static struct element *parse_type(struct token **_cursor, struct token *end,
>         char *p;
>         int labelled = 0, implicit = 0;
>
> -       top = element = alloc_elem(cursor);
> +       top = element = alloc_elem();
>         element->class = ASN1_UNIV;
>         element->method = ASN1_PRIM;
>         element->tag = token_to_tag[cursor->token_type];
> @@ -939,7 +939,7 @@ static struct element *parse_type(struct token **_cursor, struct token *end,
>                 if (!implicit)
>                         element->method |= ASN1_CONS;
>                 element->compound = implicit ? TAG_OVERRIDE : SEQUENCE;
> -               element->children = alloc_elem(cursor);
> +               element->children = alloc_elem();
>                 element = element->children;
>                 element->class = ASN1_UNIV;
>                 element->method = ASN1_PRIM;
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
