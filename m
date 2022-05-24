Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0D153328C
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 May 2022 22:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241606AbiEXUmX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 May 2022 16:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239005AbiEXUmW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 May 2022 16:42:22 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98C76E8FB
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2022 13:42:19 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id q1so12597256ljb.5
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2022 13:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L2IMR3qnRYTC2ifKlTEprymQ23atlDm3rUUvrvgkX3c=;
        b=ryjPOJRcDOrpY1Kc/6TKon40kQIBpKO7a4H3wZLVw8V+dBVtTMjVXPNRuQQxqgLAjF
         clkN1r0ETSpPnFDRTaGrlsRsSK6ZFXyHTaoHWprvzV34PsIxwWZpJlw1EWhzTUwaDq3e
         aq0aCm119ANhWTb9oCRUHFie9vPB/IEiW/QCwp0yO9UvNMmuAizwMcngUywG2ZiQdpss
         zCqCaYwu7pHyAu1ZNjIP1YfASIKX5Mbl3ZwE3fxrS6B1/R9qXFBj9LakquKxrZvoS1Qi
         NqxePdKdgjL6esYMrA6ComcGu66yb08stflO8J6mY6/lFC6gSxULw5u7mSPcfBFXCZy7
         FrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L2IMR3qnRYTC2ifKlTEprymQ23atlDm3rUUvrvgkX3c=;
        b=ZibZmxY6JMAZixxzXSfcIZ3jLGwiBha2NfwW9SX5MqylKBSzhYCLxQQc1eZwYU9ueX
         XLClHhaGO6g4M3Zs334hjA4o8nOSSmTNV19dZIJ5kyotf4Ku3luVUO+uvK3Irw9SbWgS
         spVziDi3YCAQ/UeyBznTLD1OqAiSYaa7NwdLnM1vWvg/Q8V9vsHeO5Aju/2ARxMRgAmC
         QF4x+SIPZLFlOxCFyY1Bo7l57OsGfdalQNwWBAxAVpQCYf/mwYfbqchQ/NN8XS40FyxQ
         u7KQpZNp8g0NZtPLNVJ652zTs7PJrdQwEF/ezlT1VlAfdf0xUXRdj7H5Qe6sWyVQcE+R
         O2oA==
X-Gm-Message-State: AOAM5314219hmt7IgTvAHl/0U4uO+ZxNnnABLkX8th6Mk+0y1vDREJfK
        8rSs9Pfb5K9w08qfRnpLnAcTYpVdZ9sZIdgF8ZdIy2M7PhY=
X-Google-Smtp-Source: ABdhPJzsxiF1QJFARs3RtG3t2Oqk3wVbaKE5OmP7uI7VZTff5ZDKjiDUk4bqK6Mkmqx466OMjmIFaIDxaqcVveNJ6lI=
X-Received: by 2002:a2e:b1c7:0:b0:253:dfbf:56cf with SMTP id
 e7-20020a2eb1c7000000b00253dfbf56cfmr12601797lja.513.1653424937882; Tue, 24
 May 2022 13:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220523164626.858340-1-masahiroy@kernel.org>
In-Reply-To: <20220523164626.858340-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 May 2022 13:42:06 -0700
Message-ID: <CAKwvOdkzNaJhM9PGBY_Ae+B34F2H_4aGjD+kBEC_5ZcQUuDm2g@mail.gmail.com>
Subject: Re: [PATCH 1/5] modpost: fix undefined behavior of is_arm_mapping_symbol()
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

On Mon, May 23, 2022 at 9:48 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The return value of is_arm_mapping_symbol() is unpredictable when
> "$" is passed in.
>
> strchr(3) says:
>   The strchr() and strrchr() functions return a pointer to the matched
>   character or NULL if the character is not found. The terminating null
>   byte is considered part of the string, so that if c is specified as
>   '\0', these functions return a pointer to the terminator.
>
> When str[1] is '\0', strchr("axtd", str[1]) is not NULL, and str[2] is
> referenced (i.e. buffer overrun).
>
> Test code
> ---------
>
>   char str1[] = "abc";
>   char str2[] = "ab";
>
>   strcpy(str1, "$");
>   strcpy(str2, "$");
>
>   printf("test1: %d\n", is_arm_mapping_symbol(str1));
>   printf("test2: %d\n", is_arm_mapping_symbol(str2));
>
> Result
> ------
>
>   test1: 0
>   test2: 1
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

I guess this is shorter than a call to strlen then conditional call to strchr.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 6f5c605ab0fb..845bc438ca49 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1179,7 +1179,8 @@ static int secref_whitelist(const struct sectioncheck *mismatch,
>
>  static inline int is_arm_mapping_symbol(const char *str)
>  {
> -       return str[0] == '$' && strchr("axtd", str[1])
> +       return str[0] == '$' &&
> +              (str[1] == 'a' || str[1] == 'd' || str[1] == 't' || str[1] == 'x')
>                && (str[2] == '\0' || str[2] == '.');
>  }
>
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
