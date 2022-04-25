Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 443F650E87C
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Apr 2022 20:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244505AbiDYSsK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Apr 2022 14:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244498AbiDYSsG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Apr 2022 14:48:06 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841F718A
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2022 11:45:01 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id w19so27792606lfu.11
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2022 11:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rPYT150/TgDCQnQi6RAX3N2BAWKYB/YL6OZrjYbF8qs=;
        b=PzhYBMGk3KmW7fU21XlBba4klpEtyP9pF/8aiI74Vtl/bASHLfyHVC9RublvjZ76Nj
         EJshZ4vUTZvh/bzH5PDwDsmigevSQK7xIf/Dy+mfP9KxgNfvRYY4/pSMSVJmGXsAOgGT
         YtPa9FmCbtqWn3Zx84Vmhd0KWeXeEnm7mRfn9N8wh4qm2K6uWiQg6aw3QFz5MxYMdbWv
         dnafjlHZoCDFG06v2E51q6G5bIKpHZMJH4goSsrv4c9xX8Yf6Aj9+ZhyJIMzO5Vi2Gtj
         rqRcw35Zu4ClXT7FQwugzuTpDOV9CiMaDP++5kS1fdYNXkZ0OFeycRxLTux+ix2DVDuV
         /rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rPYT150/TgDCQnQi6RAX3N2BAWKYB/YL6OZrjYbF8qs=;
        b=EgqoES2KBMwUewVWA3uqfF3VPFfL53IMrwVwQYuvf4AVazCpa33/ihN6smsyeIy/fe
         AETa0zEcOQQgy7A9JVYN0iU7jBZf9LW1o9fTJrf0e5PYGoM5hqrGk5nX6B2EICy3UuZo
         jHnht2VF+RvHUwAHL0/adM0PF20co8ige/TZjQL/9IufDoUPny7XelzsIU/MTYQpjdaf
         +J3niMUGWGJ1lynSZEurdeNpILtNcblmAvIH0I8UUtGVAz5Cgb02wTaEGuxk4Xf1IkCp
         zPzmjNkeLvM5tvMPlXUxxx7QCHF/bvwV623pD+w2qqYxKNu5/niuL2V8N+m2A7Uqh/lO
         hlcA==
X-Gm-Message-State: AOAM5320u4hwAcHOP8NbaPXKuN/Omyf0omz8wKnkCkuhgnihk465O3aP
        /UzNuhSaj1KrqA/JPwY1bajXlMF9K1v0bE5w8Yu4sg==
X-Google-Smtp-Source: ABdhPJwjgTPoMpc+pBz6fYD1asL1ro/MpPg0IKB3kD8/kkVxYqrx0AlVFLe3aazNH9tSZKtztKmmuHjMoXyvT4rmG+w=
X-Received: by 2002:ac2:4646:0:b0:472:108e:51af with SMTP id
 s6-20020ac24646000000b00472108e51afmr1740247lfo.184.1650912299561; Mon, 25
 Apr 2022 11:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220424190811.1678416-1-masahiroy@kernel.org> <20220424190811.1678416-13-masahiroy@kernel.org>
In-Reply-To: <20220424190811.1678416-13-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 25 Apr 2022 11:44:48 -0700
Message-ID: <CAKwvOd=DHNvJU_tNGNLEVTJQZVOTBB1Y1gpTRmz_=Qr-OBaEGw@mail.gmail.com>
Subject: Re: [PATCH 12/27] modpost: move struct namespace_list to modpost.c
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Sun, Apr 24, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> There is no good reason to define struct namespace_list in modpost.h
>
> struct module has pointers to struct namespace_list, but that does
> not require the definition of struct namespace_list.
>
> Move it to modpost.c.

Looks like modpost.h is included in:
- scripts/mod/sumversion.c
- scripts/mod/file2alias.c
- scripts/mod/modpost.c

But indeed, only modpost.c uses struct namespace_list.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 5 +++++
>  scripts/mod/modpost.h | 5 -----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 4c074d6c1721..6f2748340746 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -281,6 +281,11 @@ static struct symbol *find_symbol(const char *name)
>         return NULL;
>  }
>
> +struct namespace_list {
> +       struct namespace_list *next;
> +       char namespace[];
> +};
> +
>  static bool contains_namespace(struct namespace_list *list,
>                                const char *namespace)
>  {
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index 6a90bfc08458..2dbafbda9b0f 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -109,11 +109,6 @@ buf_printf(struct buffer *buf, const char *fmt, ...);
>  void
>  buf_write(struct buffer *buf, const char *s, int len);
>
> -struct namespace_list {
> -       struct namespace_list *next;
> -       char namespace[];
> -};
> -
>  struct module {
>         struct list_head list;
>         int gpl_compatible;
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
