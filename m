Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 131AD4EB2AC
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Mar 2022 19:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240176AbiC2R2O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Mar 2022 13:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239057AbiC2R2N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Mar 2022 13:28:13 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3FB25B909
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Mar 2022 10:26:29 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 17so24346489ljw.8
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Mar 2022 10:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lvT/B5UyGGfXB9H/0ToFtVxAgxElFg49xc7wYGAcXVk=;
        b=im10hmyQ5qCy+ZyjDuG3axiiK0atBzb6fC/VLF6Rer8NEmi/WqQsBpPa27g123Pjxx
         c17H1FzBE/heoVIlaMMnBHQYQcJN0st9uHhPT4pZO36m/kVF+wSmZ8IyPv9k7aqBgJBs
         rjviRIhlX99slvazNJ0/ilL2hgkq0vO1LQTD/lO1fYs0yTza3IlmJfucWhiy5MU+UZiL
         hSw1YLOkf/ENK9JfjryhtDUunGqyQtxZS8tO+lFTWG7C/wmkYF1Zjht3fpgmiQuZ5+JA
         GKneT7H2jtkQGPLjiO2WC7p31pi3KdriviLlYl/dg7OIW46sEG0JlcQVB7DYpoib6LWl
         MH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lvT/B5UyGGfXB9H/0ToFtVxAgxElFg49xc7wYGAcXVk=;
        b=Jp786f1N97dUEFp40XDM7zK3i+YCm03Bad9GBItgDwjlURMmjrIGxHmLyJHoHuCGLH
         9xOy9WxsL4quc1SlcKoL6dI3UKfKUM2TkxFVbGscX+u3fIDnvgL7Asfkx118u4mVcufx
         4IJtlDncsOGcIB/bshf7pYE51GNPXEr54nMDKBASD6brYUch7J/T7aCcCYxGexG7OIwL
         r2EV7pyMLNrV2Mr32SiynGcJyXwZne7LStD0mT/iUuyTPV1mKHkmASlO+nSHyqkMtpUA
         VFcrdlrDNWsP2Qkyp8rBy0p87BpAYF6Y0pDVNm6FEm3O3UtXE1INgr1WegJIQFwU+4hD
         euQQ==
X-Gm-Message-State: AOAM531O4VJ0Nz8cGoHIcirFcag26Pg81PS2Kx+bBwJ2pzcp+PxJF5Oi
        ygmJGIR4qZgYF8GtzuJqj4To85HHB/GokYrmGJYSrw==
X-Google-Smtp-Source: ABdhPJxwSBWNiTH2PffW5bH1OLZ2NnJhXodXOyfGKs5tkoYM2T6fdCD0I0cwrpUiTaPInh2XEVaXFnL4ZPvANmU8VHE=
X-Received: by 2002:a2e:611a:0:b0:249:83e5:9f9b with SMTP id
 v26-20020a2e611a000000b0024983e59f9bmr3659783ljb.165.1648574787837; Tue, 29
 Mar 2022 10:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220329021437.308790-1-masahiroy@kernel.org>
In-Reply-To: <20220329021437.308790-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 29 Mar 2022 10:26:16 -0700
Message-ID: <CAKwvOd=z5BQcQnhkgMOpZXPLkggmdPo=jvZxXkfVG7D8GuEYRw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix empty ${PYTHON} in scripts/link-vmlinux.sh
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 28, 2022 at 7:15 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The two commits
>
>   d8d2d38275c1 ("kbuild: remove PYTHON variable")
>   a8cccdd95473 ("init: lto: ensure initcall ordering")
>
> were applied in the same development cycle, in two different trees.
>
> After they were merged together, this ${PYTHON} expands to an empty
> string.
>
> Therefore, ${srctree}/scripts/jobserver-exec is executed directly.
> (it has the executable bit set)
>
> This is working but let's fix the code into the intended form.

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/link-vmlinux.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index f704034ebbe6..20f44504a644 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -50,7 +50,7 @@ gen_initcalls()
>  {
>         info GEN .tmp_initcalls.lds
>
> -       ${PYTHON} ${srctree}/scripts/jobserver-exec             \
> +       ${PYTHON3} ${srctree}/scripts/jobserver-exec            \
>         ${PERL} ${srctree}/scripts/generate_initcall_order.pl   \
>                 ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}   \
>                 > .tmp_initcalls.lds
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
