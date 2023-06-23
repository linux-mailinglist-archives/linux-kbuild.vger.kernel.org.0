Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80E6F73BE09
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jun 2023 19:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbjFWRrp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Jun 2023 13:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjFWRro (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Jun 2023 13:47:44 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A87197
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 10:47:43 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-3f9b4a656deso9655861cf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 10:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687542463; x=1690134463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qEXPbdvOITtF78jwrTXORqWaGEAtN/sfBgbj8S0W5w=;
        b=O6ASrmx+PfXHgCskz1yP04s3WLd6KJdj6j0igWHXefGLr6bwoNZBmFGB2jmEKCEG0D
         P9VkBpcy3HQIc+Qm4HlQb6HupIZuyxqmSK6YYj+Gb16/lVqTcAcPALKzHFi1ubJuZrsM
         cNaDVhKmHms6PjAbWoJ0As6JtWQpURWIX+XKkKpDM8qh+hIZfivcn7sIYmkRaeJY2kbS
         rRn+G21GikGG7445s7v8zeWJNNbQ36EN4O4jHr0PETlSXtt4hnOF4gh7qN4l8lgKaEdn
         4QjS2NyA8frDsQ3j0AYHdcjAAjvQiEhP1atwUcXZvqpc9bDTr8uUNRNNmgV3KgwYzbh8
         o9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687542463; x=1690134463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qEXPbdvOITtF78jwrTXORqWaGEAtN/sfBgbj8S0W5w=;
        b=gXkN56pp1nqWEaQRg9RLZ5Mqt39K/Jp8a3ctXKn/hToqPoP2SGKqEq+fxVCct5jd5k
         db0A8QKn0cnq1zomYXkOJvzFDYAahukR6RtB2F9Lt6k4ZuDFbvmEmZlG9k97AAnwclCB
         8qGPprca5/v/T7tPoccHenlgnAQI0klUolprwkaBi7e9OO2fvoJARFNuiDET2TJ/PXN9
         5q9q7YSCDpmFowiaS/HIeCbEABlvKMlfnn0Sz+SqQnnbVMd1PmvCYqMbnRmalBgysSFL
         IH9TA28+y9sHisMMkoTo/4WQVYEDYsitZDQmqQcWTYgpTz1EYWmF7ryKYXMR59tUoJu6
         DKJw==
X-Gm-Message-State: AC+VfDx8JKcc6YkdGVrfNIsSK3vOGIkYhRsJkV77X4AjrsM5DAIu2Rc3
        D7c2V+AeY2qP9gaxF21y+Rsg+mlYk4FaR5BZNJdpcw==
X-Google-Smtp-Source: ACHHUZ49Lngv6h7bS98lDoHYzgXRiJrDLyQL+764lfL6TFT3JL4w/mg9E39Nqha7JyAQW1pR97F1nbLXTXwKqUdIQwA=
X-Received: by 2002:a05:6214:226b:b0:62f:f276:7a39 with SMTP id
 gs11-20020a056214226b00b0062ff2767a39mr30296315qvb.11.1687542463036; Fri, 23
 Jun 2023 10:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230623001140.1111494-4-samitolvanen@google.com>
In-Reply-To: <20230623001140.1111494-4-samitolvanen@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 23 Jun 2023 10:47:32 -0700
Message-ID: <CAKwvOdkMkXYKUKmMdGG8B+afHWEcJ=SBZAZBsu2b8ojGZw86=Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix CFI failures with GCOV_PROFILE_ALL
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org, Joe Fradley <joefradley@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jun 22, 2023 at 5:11=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi folks,
>
> The following two patches fix CFI failures with GCOV_PROFILE_ALL,
> where the compiler injects indirectly called functions to object
> files that otherwise contain no executable code, and are not
> processed by objtool or don't have CFI enabled. This results in
> missing or incorrect type hashes during boot and when modules are
> loaded.
>
> Sami Tolvanen (2):
>   kbuild: Fix CFI failures with GCOV
>   kbuild: Disable GCOV for *.mod.o
>
>  init/Makefile             | 1 +
>  scripts/Makefile.modfinal | 2 +-
>  scripts/Makefile.vmlinux  | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)

Thanks for the patches!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
>
> base-commit: 007034977130b49b618a5206aad54f634d9f169c
> --
> 2.41.0.162.gfafddb0af9-goog
>
>


--=20
Thanks,
~Nick Desaulniers
