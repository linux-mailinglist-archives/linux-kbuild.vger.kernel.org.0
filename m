Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7142978460E
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Aug 2023 17:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237294AbjHVPrQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Aug 2023 11:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233844AbjHVPrQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Aug 2023 11:47:16 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD6ECCB
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Aug 2023 08:47:14 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-7a257fabae5so952797241.2
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Aug 2023 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692719233; x=1693324033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYNvV23/sQh2KUeEtBQywg5ma3vCxQAqr4Fitqyx0c4=;
        b=UN77YUOelf5sJQMuE+614A5Z84E2e6FM84c3z6tTCr6fuXnbnqGlC4ndp0jdFNAtHk
         MqVEHFAGNEBE57eFoVnRrvGC6tw1cyDaceDUw2Q5XzhsWU3I75Nz+p/HgJaJUnDj0oLj
         C0ouC1ra3gvDQ5hhAmIA9MmPYICUNSJgL+Wl2xt7Mt/zFVJ4E5wJnlUnkdVL8lU+RlFM
         MSWyZXsKWxc9ossbSLXVPY/mGxsQEe3/Cq1O02zt/qxIoDoJ5HGP9axj+xvWuJCYdJBi
         PTE3Eq8dg0BPPpZ8BSjUtqxRPTT8iI/ZA9muVe8V3uEVr5t1Bjqo8voB435c6gsuRh7N
         YMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692719233; x=1693324033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYNvV23/sQh2KUeEtBQywg5ma3vCxQAqr4Fitqyx0c4=;
        b=g+Kl5VujjfFK3H7rS/7wDyAr6U+xcE7pFGZblWvhiCBAA9g/z75Kyd47wefU+d6wLa
         OdHAFnlaymj1aCwJZ7tOYI5AGG0WzZ0/H7/e/yj7kxbff2OYZUfwx8PEED0jRP0wW0ge
         cm0WXt163eA5vBXLqYllOlbRHVqBsWpRD8+rt6Zd02OVoS/Mz7qRW90VWbegWXrv3X7W
         mtZxIAmLzS43FTaHLfW6zf4EX+yYElByKgz8ea8YA+rIWmDgv+Wfo6KaBZSYXWpjo5Z+
         ndZiG/ncgE/UdBzaD6vL/jp1J/np40I1qmW9ghIL+Nx9Xbu31/jaCUwjWjF9ni3jIY9G
         L8YQ==
X-Gm-Message-State: AOJu0YxBL+ksYsi1Myg25JOfCa9JO1j6KruJXZd9YiDvHS5d76toAvPj
        lLQixDX0GjmPbOkeggbuy8p//XyWZGfAF8uDGFO8kg==
X-Google-Smtp-Source: AGHT+IGObL+V0/ELRu9qQaqOGv9Tp3eKDjtfRuftO2ZQwK2jpACBoKq2mdTSjTDQSxxhDvDhAGyMDcJJCgF8fGBxxk0=
X-Received: by 2002:a67:b34b:0:b0:440:b7df:767b with SMTP id
 b11-20020a67b34b000000b00440b7df767bmr8953767vsm.11.1692719233347; Tue, 22
 Aug 2023 08:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org>
In-Reply-To: <20230822065256.163660-1-denik@chromium.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 22 Aug 2023 08:47:02 -0700
Message-ID: <CAKwvOdmvUCKDk0kU0DVywRRPS9qT09PsQ435GzzuinHkBcRZ0w@mail.gmail.com>
Subject: Re: [PATCH] modpost: Skip .llvm.call-graph-profile section check
To:     Denis Nikitin <denik@chromium.org>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
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
> profiles (e.g. -fprofile-sample-use=3D<llvm.profile>). The section holds
> metadata for symbols beloning to other sections and hence doesn't need
> modpost checks.
>
> This change fixes the kernel build with sample profiles which fails
> with:
> "FATAL: modpost: Please add code to calculate addend for this architectur=
e"
>
> Signed-off-by: Denis Nikitin <denik@chromium.org>

Thanks for the patch. If you send a v2 with Fangrui's suggested
changes+additions, feel free to carry forward my reviewed by tag.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

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


--=20
Thanks,
~Nick Desaulniers
