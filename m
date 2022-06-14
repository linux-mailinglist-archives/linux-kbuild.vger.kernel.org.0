Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7816654BA06
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jun 2022 21:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357718AbiFNTBl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Jun 2022 15:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357624AbiFNTBO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jun 2022 15:01:14 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBDB218B
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jun 2022 11:59:55 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id g2so10792730ljk.5
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jun 2022 11:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8CLjdm0fv8JCDmSYjgnWu5fkb8HC9HIzs0HHNU0IgVE=;
        b=DK8cpE1V6UMumzHAkRyd1w9x4mo+MEOSq6zru7t9LG18M5czUGkCsUs2EH9j1u4iHL
         LezrPxUpihEdcOokbl+dCMk30RmUolnINcwzTq0O+zn+E9nm/zz14C9bl90HItDPjOKl
         ERLItC0N42ryT5EVISS92P/0yKv70hgcnsJJNWXZ+9Etj4J/2tpwTPWContHA2JZvT1o
         5n3mgto6vkYIYGXkau8ei41v6T735IsjgvOQ1gln4RE9vX/3EmjuCzMtGP7516gzpQo1
         yO8OIyQv3p11rhwu5RSVdrVRMRguDlSCuDEChIy0QkxPKNzkWECvLC2W6FVXUUXrTL3k
         g16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8CLjdm0fv8JCDmSYjgnWu5fkb8HC9HIzs0HHNU0IgVE=;
        b=LA+NywCBT08MT6WIql08lG0eh3fZbLtqZXW2QKhsid9RPnAunYan26Ncst0g0TiFPn
         IUZ3fNa36ysISmZqfPvWt3wOYZ5PCxW2YKZDHl6L2GET+8Zf43hJIGQsDNVXtb3f3yAJ
         oGikJFWEOTmQKORtfltIaUAFmvNiuKWugD9HM+sqwYuFQ7OEU2xG4q7WNIzJon9MIL/7
         CCoVwndYTgE4HpzFqwK/39AAe4XeyL5XFLz7XpkIgcCnx4xU8O/Hj17EeVfQI8pTT5Yv
         tEnyKfJdeqh1HU5/JKfsN+Awk9NDHR3VgtXdO2a/YvcGFepfzPV0NpU8voPThT+PFZZr
         GHSw==
X-Gm-Message-State: AJIora/JW5wz6uAQdFE3hSA1MSSqGTz5jIyhpv2uBooTqncdYs592QW9
        v9OXpbeMeLmh5sWeQ8r4we/L5GjUp46ajETnPc4WnaL3+ls=
X-Google-Smtp-Source: AGRyM1vEBCTUhPhDtXrKLEbsOE+r55A+HtUc7YmYWYz5meaQwiyvwOHmtqy2QzAWoa8+f58p9jQwavLDWb803hojJiU=
X-Received: by 2002:a05:651c:50b:b0:259:957:f2c6 with SMTP id
 o11-20020a05651c050b00b002590957f2c6mr3275924ljp.26.1655233193050; Tue, 14
 Jun 2022 11:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220614055149.1900535-1-masahiroy@kernel.org>
In-Reply-To: <20220614055149.1900535-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 14 Jun 2022 11:59:41 -0700
Message-ID: <CAKwvOdmcLCV6J+PYXCugH=0Pt_=yARZ-Y3SEmYy8F+oBpb1UYw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: remove sed command from cmd_ar_builtin
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
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

On Mon, Jun 13, 2022 at 10:53 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Replace a pipeline of echo and sed with printf to decrease process forks.

If you're trying to minimize process forks, is it possible to remove
the use of xargs as well and just invoke $(AR) with the parameters
splatted out? I don't know myself, but maybe you're creative enough?

Otherwise,
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - Avoid the pipeline if there is no object to put in the archive
>
>  scripts/Makefile.build | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index cac070aee791..784f46d41959 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -358,9 +358,8 @@ $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
>
>  quiet_cmd_ar_builtin = AR      $@
>        cmd_ar_builtin = rm -f $@; \
> -               echo $(patsubst $(obj)/%,%,$(real-prereqs)) | \
> -               sed -E 's:([^ ]+):$(obj)/\1:g' | \
> -               xargs $(AR) cDPrST $@
> +       $(if $(real-prereqs), printf "$(obj)/%s " $(patsubst $(obj)/%,%,$(real-prereqs)) | xargs) \
> +       $(AR) cDPrST $@
>
>  $(obj)/built-in.a: $(real-obj-y) FORCE
>         $(call if_changed,ar_builtin)
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
