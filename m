Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0AA34F6CDE
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Apr 2022 23:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236175AbiDFVjk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Apr 2022 17:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237081AbiDFVh6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Apr 2022 17:37:58 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DDC3B3E4
        for <linux-kbuild@vger.kernel.org>; Wed,  6 Apr 2022 13:54:14 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b21so6193835lfb.5
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Apr 2022 13:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ww++6lY9qtCS7Tb+W0av3e3vzWAaXVMYqc4+oMmKte8=;
        b=Y7H9oQ83ZoDYg0JVp6YP02u5yok/m9H+AZNO+MhqFB9W1g5zG7tAGi+Oj8SKEPk9NC
         ueYJqUvbX9+gtEoXkd16FGau9RxsCKE5kYzbhfZVsKGHGWsPbst50jQVVUB+Kbrtupra
         uQpRAfybu8aJNDdPe6e/52z3hCTj204qqw3VkSQOEZCpJSpSzEUt/d9yBl+4QU+9dLTC
         hOeoX8BbKtKAVAS7+4Xq5zSIsAO72K5V7oEIsDY0z5H3vIUAJPUUk2kOOJ3bmJzo/a0l
         CWiZpFAFzAguez+e8/4uzSrjej+N7uFugl1jSssOU2MVfJvhlR9kZ4qj5gT7cDSMm8AD
         cDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ww++6lY9qtCS7Tb+W0av3e3vzWAaXVMYqc4+oMmKte8=;
        b=6kxc8C/aRykC7NsVfb9w9M0nEvVPlb8GvbO+cfa1XLrkzxXK0GA7fRugYkBWy5sylE
         UBTarcG7BEJ74yJ8pMPHkyhHy9NeyOL5prYLtwH1ToFH1a9ZHtev3qxpzb6avBdvdsxZ
         ULQUIROGNGsZqIoYbkZZzgtNnOxSG1Dxtr0pYYxfgP9sevD4ZbI6Y2FuORhxYpi9y95g
         dNdioYz0kY6ndpfMpNc6Jpd81bZxd3Qd1Ca5MCcen0j8ovaMYcHWHyGfL/JKKWmAzy+g
         7SldrA2HkRUlBkZMwt/fmAq45KHTnQa36MpLUHjv0eUEHK3TTXfHBA4KU8Hmg9rUOsFN
         TNng==
X-Gm-Message-State: AOAM532kuluUl/G3pQ3ghp2NvQJYOFuvyl1ByGeOG1p7+GjKhjEKwgeK
        8YyCe12MU2lT2Yu+d9iFvUqIMdYUhP8w5yKYRQuhfvfPDJU=
X-Google-Smtp-Source: ABdhPJwPaUYkfsnPk3yf26f0Mn8XqDz21sD5lQkfNpVMQidnilf7I+YC/Lepuh3g5n53maIwiKXy/aHv7TarIED6BLw=
X-Received: by 2002:a05:6512:b9e:b0:44a:10eb:9607 with SMTP id
 b30-20020a0565120b9e00b0044a10eb9607mr6999490lfv.626.1649278452698; Wed, 06
 Apr 2022 13:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220406153023.500847-1-masahiroy@kernel.org> <20220406153023.500847-2-masahiroy@kernel.org>
In-Reply-To: <20220406153023.500847-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 6 Apr 2022 13:54:01 -0700
Message-ID: <CAKwvOdmjdF1mE5LYXm67KPT1kLgignZSNmwY5KfAuiu7hUseYQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] kbuild: reuse suffix-search to refactor multi_depend
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 6, 2022 at 8:31 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The complicated part of multi_depend is the same as suffix-search.
>
> Reuse it.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 9f69ecdd7977..d56cda3c1e8a 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -238,7 +238,7 @@ endif
>  define multi_depend
>  $(foreach m, $(notdir $1), \
>         $(eval $(obj)/$m: \
> -       $(addprefix $(obj)/, $(foreach s, $3, $($(m:%$(strip $2)=%$(s)))))))
> +       $(addprefix $(obj)/, $(call suffix-search, $m, $2, $3))))
>  endef
>
>  # Copy a file
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
