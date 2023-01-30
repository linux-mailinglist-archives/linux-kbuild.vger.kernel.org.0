Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC37A681790
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jan 2023 18:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjA3R1y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Jan 2023 12:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236106AbjA3R1x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Jan 2023 12:27:53 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CEEC40C1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Jan 2023 09:27:51 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so16236171pjq.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Jan 2023 09:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YdbDWXlrKea8gRK3DBQ271yzRiLxpBwjs6Sh63rgTgk=;
        b=OmzTS6+kT3phODuRjnYkk9z9ylcvcBVLq7ymoMiznRH4Up+SU0UFyAEZHyJgzfqNOv
         Ofuio0hv8BSI+FAetegq/OxEaI+JWKk/5lSSzL8Y2ADrtR7RIQUpg1S0eCJmgLWZfGlV
         imExZiQfygkBS0PFJQ9r6qIyyXZaLmSh6Cx7u+cbv9T7RxGNVWoaUv3Vwr7hCMm7jbD9
         rPBpYkNsdESD49WDAPP76SbNfHzlpxjDfs1o4vI+Xm5DtgwfRzRBK5kGIBIilPaWzlw0
         uBI+hc4W+MlC90LCWsfs7e1001LJ9UfUTfSWxNPiJKIiiJtZgLnSd0FV9+OmbhcNYe6x
         4CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdbDWXlrKea8gRK3DBQ271yzRiLxpBwjs6Sh63rgTgk=;
        b=DOMuKbhGkstdFTZPn+hHMszKKLE/esGTJzn4FPwoDToogqLXu2V80zI44HegovcwSF
         +TYyCjrJtpEw9uSB0fu4aImIndFns2DOVSpIHnsp7udqjlCb7uqkI5GNUeU+AmwgjhQn
         +hvkPedRR9PqtDExjq1Mq20Do4OnV7OlIoHw22Aw2oH/mddZmHSca1IbA+su/6D70VNJ
         rvZ4+NDRKfXQ5ofedwH/DiZQ+vAGBbNQgPNkHJw6+JOXSm7ni61Yog2J+fTk6me7DT9c
         w5tecwOrT7dvIfTqIdlb7sZ53n2kTdpX54eWvSFclW6bLC/wIsshv8fLOC0q/yUEezl+
         Qwjg==
X-Gm-Message-State: AO0yUKWsUt4Jjr4MemCWugdi5WCdIEAD/eFYCw91k3O04STfGD5/Fpgo
        nmxr2JofD1eRn6o7azpqIYUV0bUVofcBLTWRs/Mi5Q==
X-Google-Smtp-Source: AK7set/Vqqmd8iwFki78mxKNOfTDk1LMHHbCP1JASkx4Z9kgaPwRc7nbtYiQxztmkLDdWXcHD0o+Y5SDsrURM8Ehj7c=
X-Received: by 2002:a17:90a:9c1:b0:22c:816f:3203 with SMTP id
 59-20020a17090a09c100b0022c816f3203mr1077650pjo.28.1675099670433; Mon, 30 Jan
 2023 09:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20230130021902.4088173-1-masahiroy@kernel.org>
In-Reply-To: <20230130021902.4088173-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 30 Jan 2023 09:27:38 -0800
Message-ID: <CAKwvOd=amcV=wbdq5enu+6=dh5BhXkejHgcnhNt5UfKTO7rTDA@mail.gmail.com>
Subject: Re: [PATCH] .gitignore: ignore *.mbx
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jan 29, 2023 at 6:19 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The 'b4' command creates a *.mbx file. Ignore it.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch! (I commonly pipe mbox files directly into `git`
to avoid this, but I do use b4 a lot!)
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitignore b/.gitignore
> index 22984d22d29e..4dc02ef62202 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -33,6 +33,7 @@
>  *.lz4
>  *.lzma
>  *.lzo
> +*.mbx
>  *.mod
>  *.mod.c
>  *.o
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
