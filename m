Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03294576C86
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Jul 2022 10:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiGPIOh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 16 Jul 2022 04:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiGPIOg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Jul 2022 04:14:36 -0400
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80D62B1AA
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Jul 2022 01:14:33 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 26G8E1i7022308
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Jul 2022 17:14:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 26G8E1i7022308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1657959242;
        bh=nGQI/zKDMxIM94bk3Ggexz9eZR7sOAFp9eC5wI2DFk4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KqRoxHRx2ZOCBf4CV9x0aMbVBCXidtbdLF63fCnBGS1WE1w96i/xnZv5+xjv3TKB8
         tURgw79Tj7XQcekHI9uIuEfXhrJBvvve9dugHRFUqsTAHq9I9qyfSrJ6/w/o5vkJ65
         gqlcBiQLnSv8CuLad8zv3iQOtancOwQhvjrp0aU5SbrAEFpvYahREXH90bKHQBzsJQ
         ZXna0H+AyrDr0v1fbwQSOXRGdcEo+7ZGS1AUaw5AtfYj56Lr0kDhUNU31IZkngABQ3
         pYGrX555BXiCz5r6W1vYUECs+EPrwQsdKtFSiR6F0q3RLJH7A3ncWPZrl5C2rNWnXg
         8NGlxtzYrd9XQ==
X-Nifty-SrcIP: [209.85.221.53]
Received: by mail-wr1-f53.google.com with SMTP id r2so8629204wrs.3
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Jul 2022 01:14:02 -0700 (PDT)
X-Gm-Message-State: AJIora9gG0Oc0N+zewx24PFbfKC3VanbQhi8s0OoJw1LdISyZzsUXwge
        WvW1B+pKy8QRiGCFIBLIX4oT6246GOP4zvKEcDw=
X-Google-Smtp-Source: AGRyM1tB3KSfnGyF9mFlHELt/873pH6tu3ZkglvUTANXyad7usqqH0LHPRxKmVBZ7HBPu5Ft8JQ6guVgs5JqOiw4DYo=
X-Received: by 2002:a5d:5957:0:b0:21d:75ca:5e99 with SMTP id
 e23-20020a5d5957000000b0021d75ca5e99mr15233920wri.235.1657959241063; Sat, 16
 Jul 2022 01:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <d78714e8005b52d5c5dee59bd47a0ba7011b0e55.1657772746.git.baruch@tkos.co.il>
In-Reply-To: <d78714e8005b52d5c5dee59bd47a0ba7011b0e55.1657772746.git.baruch@tkos.co.il>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 16 Jul 2022 17:13:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQS-Z3Tct-zBejoghABuRk7b7iBFt_U5W+hBFBjK3B9ag@mail.gmail.com>
Message-ID: <CAK7LNAQS-Z3Tct-zBejoghABuRk7b7iBFt_U5W+hBFBjK3B9ag@mail.gmail.com>
Subject: Re: [PATCH] docs: kbuild: fix typo
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 14, 2022 at 1:26 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
> on -> one.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---


Applied to linux-kbuild.
Thanks.


>  Documentation/kbuild/kconfig-language.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index a7173843a294..7fb398649f51 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -672,7 +672,7 @@ Future kconfig work
>  Work on kconfig is welcomed on both areas of clarifying semantics and on
>  evaluating the use of a full SAT solver for it. A full SAT solver can be
>  desirable to enable more complex dependency mappings and / or queries,
> -for instance on possible use case for a SAT solver could be that of handling
> +for instance one possible use case for a SAT solver could be that of handling
>  the current known recursive dependency issues. It is not known if this would
>  address such issues but such evaluation is desirable. If support for a full SAT
>  solver proves too complex or that it cannot address recursive dependency issues
> --
> 2.35.1
>


-- 
Best Regards
Masahiro Yamada
