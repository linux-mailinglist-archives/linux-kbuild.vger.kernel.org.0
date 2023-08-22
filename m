Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD40783A48
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Aug 2023 09:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233147AbjHVHGL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Aug 2023 03:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233048AbjHVHGK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Aug 2023 03:06:10 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB38F132
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Aug 2023 00:06:08 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4036bd4fff1so218941cf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Aug 2023 00:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692687968; x=1693292768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+BLM0MEGdVJh+GeM8RFbfl7FvS0GBuGY0HLrEk98+g=;
        b=67ZpPxdZmKHU+iKIy/rCIH+0m4sPPbuLv3JEZOkQdtA2gwADZISSzgjyJbhJbp1wli
         G/EUH+NnkpcYFhgkGACJYocyLocDqDOprM8a8om7B7RL0Sr+9V548YZFMk+xRSeavD9t
         4WOooJ+EVxQgdQ/EnV4f2YRIXq0nqF4fkRHO11j9gKoUcSEUxU4E5Y0mW+lSfSU98db3
         5XMD6rlglHsRS0sGcQpfymaPo6qEd+wSE70nHluvK2wU6g589BRkQ0vcFL9WYcVq9iAu
         TZdRzHy9sho8jv4Mlv7KHSnxe2zT4QTsqXDQ9MkZVY3ZFytz38yoz3NZCYll7zAw5Ft0
         UubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692687968; x=1693292768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+BLM0MEGdVJh+GeM8RFbfl7FvS0GBuGY0HLrEk98+g=;
        b=e6NSQzwqalL55iIaNIXroN0WQ0Lf2C+vd2rjJkbovZXOC4CHFvynBALJpqek+CW35D
         Qa5844bkVPnxjDlMmMMr1N+eRBUpb+tYRJIFD64INtgWnMQbC602XYhcr/o/DVjj6r/4
         3xowC7eaICNF4H19lT+6W5zEVXNdatZksQu1zn5uMeeLEZyTtY9AmgURS6Nd5nd9oLIx
         ABIHIF7XYiEx/GANBGUvyBsFe+pC5r76Sl0bCdQs4/CVy5cvT7BKTDIRIywoQrdRVQ0I
         /gPOVW6yNBbDKq/xUGT5P36FKL5BmH4d/w0FvtWdzoyQ6DwJDTjhRYZ3TQoeLdBbs2FI
         884Q==
X-Gm-Message-State: AOJu0YwJrwLcs5IwgQz5JLKQyjvvwujmvkJxbNIsKqFkZpu4GackXHSX
        gxYYQl7mzYt63wj3ReQCZsxFHvGJRiD7/G2F9m2bzw==
X-Google-Smtp-Source: AGHT+IEtr6/EVKNg+/y3fk4iAA9e3QLd3eUcYWapQqAXgr+9utt53HzxrVcvxexkPJCnIW4avRUN+C1IkvFlz38cUgU=
X-Received: by 2002:a05:622a:144a:b0:3f2:2c89:f1ef with SMTP id
 v10-20020a05622a144a00b003f22c89f1efmr99219qtx.5.1692687967985; Tue, 22 Aug
 2023 00:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org>
In-Reply-To: <20230822065256.163660-1-denik@chromium.org>
From:   Fangrui Song <maskray@google.com>
Date:   Tue, 22 Aug 2023 00:05:56 -0700
Message-ID: <CAFP8O3J2pUddEfL+W2j=tpjdj1ufsQMJqjcARbYvY3+khtBPig@mail.gmail.com>
Subject: Re: [PATCH] modpost: Skip .llvm.call-graph-profile section check
To:     Denis Nikitin <denik@chromium.org>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 21, 2023 at 11:54=E2=80=AFPM Denis Nikitin <denik@chromium.org>=
 wrote:
>
> .llvm.call-graph-profile section is added when the kernel is built with
> profiles (e.g. -fprofile-sample-use=3D<llvm.profile>).

Right. .llvm.call-graph-profile may also be added when the kernel is
built with clang -fprofile-use=3D (though instrumentation-based PGO
support is not upstreamed yet).

> The section holds
> metadata for symbols beloning to other sections and hence doesn't need
> modpost checks.

Typo: belonging.

.llvm.call-graph-profile contains edge information derived from text
sections, so .llvm.call-graph-profile itself doesn't need more
analysis as the text sections have been analyzed.

> This change fixes the kernel build with sample profiles which fails
> with:
> "FATAL: modpost: Please add code to calculate addend for this architectur=
e"
>
> Signed-off-by: Denis Nikitin <denik@chromium.org>
> ---
>  scripts/mod/modpost.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index b29b29707f10..64bd13f7199c 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -761,6 +761,7 @@ static const char *const section_white_list[] =3D
>         ".fmt_slot*",                   /* EZchip */
>         ".gnu.lto*",
>         ".discard.*",
> +       ".llvm.call-graph-profile",     /* call graph */
>         NULL
>  };
>
> --
> 2.42.0.rc1.204.g551eb34607-goog
>
>

Otherwise the change looks good to me.


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
