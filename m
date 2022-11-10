Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB1AB624C0C
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Nov 2022 21:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbiKJUjD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Nov 2022 15:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbiKJUix (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2022 15:38:53 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E2924BF6
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 12:38:52 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so2878288pjd.4
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 12:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H6HJqwbFQzOSfewkKzRYA9L3eARhSxF4DnXNzTPQdwA=;
        b=TpF2z0lumyKhWKhb8gt+jw88T3okmUaK51MPW4Owmm2jkSfPdDnA9ADk8TgYAUmjj/
         6VZD6f8rv84NouvBiKQEpC8lydBRDGU/Ta7gJ8Z3r2Z5CZY9Oz0GSKSKVCrG5KOJMRWK
         OMte5zblnPtnDfIpXq65YxonwkDnYFzA3y2AbD3I0EmFJzMc21Wh5AxRwn4xdh0kVpU7
         P7UkzVH7RhuplSRgJ0y8VMWWRQytsETZfXf8h7wqp/7Mn6ZldGNl83Wy8SzqjmSdyl99
         7CMv8+H7FB/twGAg2IgSDo7iz2WnwxJkJ7X3EER2wUwb7S663+cLja2SfFZGKyP2fbl9
         ojJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6HJqwbFQzOSfewkKzRYA9L3eARhSxF4DnXNzTPQdwA=;
        b=ZmI+owUHcK0qnji3d2old+UwOmvY5/m2aMGjUfE/W5i/KnqE9vy/Qp70qDbPBH3bHl
         OGJwiwmzzj4cdrw46Gcym8p/0o1E5Ear6MKuKuD/k7Kr393vicjkLJArZk6NObOHpCJm
         SsY1jMvUq7AR4GG5Ad8knPy0VEBqoOoH2HUqVEvhOiOdLUJHvl9/cphwRZ7rRmacahqv
         qPuDHkBxnAqpg0yizylnioZodTClcdXMdiwJHj499tFgnRXQTmZ1mbhN8qKmemXe16uo
         A9k+XOCtiH1+cZAElqnE/axwgfdyDmryYRlelCyVSx7GJCoWSBt4BzXs3zNNR8WHKPwg
         SbJA==
X-Gm-Message-State: ACrzQf21qQEOXOSvEmAoGxDc/aTZFo8Lz7soUI217Iyul2ozjQ9SUAFp
        f9XUqFmgMNrUNw5s5wHsj/7xIUkOHEkxdBzqLbbReZ/OsI4=
X-Google-Smtp-Source: AMsMyM6GWVipmNTP3S2p27gLARs1ej+GleHgzO2ZQWrI00RMyagtd3N5hWShIgBARxLh5bsUy1y6XX+MQ7u0kz0nRDg=
X-Received: by 2002:a17:902:768c:b0:186:b136:187a with SMTP id
 m12-20020a170902768c00b00186b136187amr64122201pll.94.1668112732267; Thu, 10
 Nov 2022 12:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20221110150425.164386-1-nicolas@fjasle.eu> <20221110150425.164386-3-nicolas@fjasle.eu>
In-Reply-To: <20221110150425.164386-3-nicolas@fjasle.eu>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 10 Nov 2022 12:38:40 -0800
Message-ID: <CAKwvOd=U_viWP0gvs00thCeYMT1u5AqP7_Lp1rHEzb0Fx+S+Lw@mail.gmail.com>
Subject: Re: [PATCH 2/3] MAINTAINERS: Remove Michal Marek from Kbuild maintainers
To:     Nicolas Schier <nicolas@fjasle.eu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
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

On Thu, Nov 10, 2022 at 7:05 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> Remove Michal Marek from Kbuild maintainers as there is response since
> October 2017.

Randy mentioned that the word "no" is likely missing from the above.

Also, Nathan mentioned to me once that CREDITS is perhaps a good place
to enshrine maintainers emeritus, let's add an entry for Michal in
this commit v2?

For a change like this, please make sure to CC the maintainer in question!

Thank you for your service Michal.


>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 61a6848192c5..45c88bb34b6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11083,7 +11083,6 @@ F:      fs/autofs/
>
>  KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
>  M:     Masahiro Yamada <masahiroy@kernel.org>
> -M:     Michal Marek <michal.lkml@markovi.net>
>  R:     Nick Desaulniers <ndesaulniers@google.com>
>  R:     Nicolas Schier <nicolas@fjasle.eu>
>  L:     linux-kbuild@vger.kernel.org
> --
> 2.37.2
>


-- 
Thanks,
~Nick Desaulniers
