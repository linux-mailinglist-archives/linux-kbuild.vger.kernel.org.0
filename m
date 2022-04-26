Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A7C510517
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Apr 2022 19:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353756AbiDZRT6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Apr 2022 13:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353648AbiDZRRn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Apr 2022 13:17:43 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3F142495
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 10:14:34 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 17so22870972lji.1
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 10:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ni6LS4WRIid4Cj4AB+HeVRc/u0ggtCmwJRNEkXzGU0I=;
        b=ncIGWjTDHznLp1yaKK/3x12wlf+QAclDOEjA52ORLaxlKBeCHZW9cjSMYZ+YC0HVqq
         5tFYMu1EmGmsWKDv+1+pwPYT0l7ntgZDDJOvewG2Rs63vt2qgZf6ymkgdXlvntUS4peG
         ESfR0UAOaevXCBHid5FA75S7wCs9FCTVL5mXrsBoLYpGPZGQ2Qo+JVDomIfOvmBET0Z6
         eU6M9oaf76fWtZTNNoREWE/4BY2Jbiu5k+MMo3VPXrvgn8DrLHpb1MT9qWDU+w2DjN32
         dLg98Ve0mCp+NDrA5w/rO4d0YkuMQDBQOKDL7CfHgDNGZmcUXlQ1Y6PnQR4dwAs+0AR2
         odZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ni6LS4WRIid4Cj4AB+HeVRc/u0ggtCmwJRNEkXzGU0I=;
        b=at5krGs5AF6lPzlutwmmy6TRDrm57cK0MOTOSM7GeZXYlmLW9rnn3DuSYu0r2P8elC
         xAeV4iARb59uMz1Q9KMLXCoXeYx3QVqPCFeyTt7fR7pR/GwY0S1YIXgaEOuIXth9bqa+
         mrOcL9tlfGKYhEjFJ+2kZuNn8/rwlmTX2d+YVn5h55CUWAyaTjWBWQ93yeomjJmMyw0F
         JjFh11EOI7vWFhUV6le/QvzkVrXiYGPBCzW4PIZPjvP6VLOeYqVGlMRq19brDYzgNrLk
         DWS0dKD7VewFnb7MsXf8imXKZXj9gq6aJuDRgL2/Raf9xZJbVkaojJdE8PguT/2Pjvmb
         yCOA==
X-Gm-Message-State: AOAM531dCUZk4d3wlvtAWDEE/uuTXPErq/TTy5RYhSlENkmvNvDPm6Us
        knDcTn0O8RS3gTCiEKAmP6VbFQuELljr3RSd9fuw7A==
X-Google-Smtp-Source: ABdhPJyc8q71y0xMH3JeQT82JcezC7bQ0ByCO3FEz0CmsKkUJGUv/k0zGXyoz3eO4nNBBQRSoOkhEIsR93tEsNyC5Ro=
X-Received: by 2002:a2e:91cf:0:b0:24f:11ea:d493 with SMTP id
 u15-20020a2e91cf000000b0024f11ead493mr6834233ljg.408.1650993272973; Tue, 26
 Apr 2022 10:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220424190811.1678416-1-masahiroy@kernel.org> <20220424190811.1678416-12-masahiroy@kernel.org>
In-Reply-To: <20220424190811.1678416-12-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 26 Apr 2022 10:14:20 -0700
Message-ID: <CAKwvOdnLg+Sc=+cZdBTC7r3WF682r4f6iXgWH8VZ0AfEwbFuQA@mail.gmail.com>
Subject: Re: [PATCH 11/27] modpost: use doubly linked list for dump_lists
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 24, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This looks easier to understand (just because this is a pattern in
> the kernel code). No functional change is intended.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index e1eb188d6282..4c074d6c1721 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2496,7 +2496,7 @@ static void write_namespace_deps_files(const char *fname)
>  }
>
>  struct dump_list {
> -       struct dump_list *next;
> +       struct list_head list;
>         const char *file;
>  };
>
> @@ -2508,8 +2508,8 @@ int main(int argc, char **argv)
>         char *dump_write = NULL, *files_source = NULL;
>         int opt;
>         int n;
> -       struct dump_list *dump_read_start = NULL;
> -       struct dump_list **dump_read_iter = &dump_read_start;
> +       LIST_HEAD(dump_lists);
> +       struct dump_list *dl, *dl2;
>
>         while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
>                 switch (opt) {
> @@ -2517,10 +2517,9 @@ int main(int argc, char **argv)
>                         external_module = true;
>                         break;
>                 case 'i':
> -                       *dump_read_iter =
> -                               NOFAIL(calloc(1, sizeof(**dump_read_iter)));
> -                       (*dump_read_iter)->file = optarg;
> -                       dump_read_iter = &(*dump_read_iter)->next;
> +                       dl = NOFAIL(malloc(sizeof(*dl)));
> +                       dl->file = optarg;
> +                       list_add_tail(&dl->list, &dump_lists);

Consider NULL'ing out dl since you reuse its storage below.  Either way
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>                         break;
>                 case 'm':
>                         modversions = true;
> @@ -2554,13 +2553,10 @@ int main(int argc, char **argv)
>                 }
>         }
>
> -       while (dump_read_start) {
> -               struct dump_list *tmp;
> -
> -               read_dump(dump_read_start->file);
> -               tmp = dump_read_start->next;
> -               free(dump_read_start);
> -               dump_read_start = tmp;
> +       list_for_each_entry_safe(dl, dl2, &dump_lists, list) {
> +               read_dump(dl->file);
> +               list_del(&dl->list);
> +               free(dl);
>         }
>
>         while (optind < argc)
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
