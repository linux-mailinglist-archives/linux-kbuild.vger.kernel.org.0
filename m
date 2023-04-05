Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 658C46D890A
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Apr 2023 22:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbjDEUsU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Apr 2023 16:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjDEUsS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Apr 2023 16:48:18 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7161712
        for <linux-kbuild@vger.kernel.org>; Wed,  5 Apr 2023 13:48:02 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50240a3b7fcso859749a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Apr 2023 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680727681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gar2SeDIgd9oWPuJFUbMEAp6q8OZkPojCAqDAzQ9Ib8=;
        b=oxVYwvA/pxaMCpxJgfICt1fx2F/kIPfFHtyq6Umx5oQ81kZrDcLkVwewwobLUrMuNU
         Sho5W3Zc08FmHFSJzOBOo5PdIVqXGDBbZlHMabSp6FGJl3C0MJePjiV/zxWu+0T2VzCg
         n3gjBjO5nRkR9tPC86yhtgqjw7+ZI5wVtekL3suVnokVG39UeczPZbdwWOHliLT6BadM
         ErXLEi2y/c8I4aTSFm9gDItfVv9r1wMSh6Ji6oYf9I4RBCFr1SXWkXYSLiMmlQxGtXeD
         pemfiZwC8Qtk5FvYtrgCvr3pjT0dfifYIxCHgvNsngC93vrbE34y9KE805ud5iGjRowO
         /9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gar2SeDIgd9oWPuJFUbMEAp6q8OZkPojCAqDAzQ9Ib8=;
        b=BVdYHrqAlSLlqGSIrFQkVSsr3cd3PqZNsCXEWIYxVfYMukgYxVWg9KUYn758Tv2r9v
         FMDcagSA7+LrKQz850hZmAIe82HGVmnOorLl/NQ3IUWhd9YP6vJZznbFbPX/Gj6x+mTy
         kUAs9GZJD8W+vW6pXGTCRWZ0eKWjBjEj4XXrnph8BDrbLaMQETZgz0d8BNo0szCW7rBl
         TS3BQ0HRHSbdUsw0lqqVs416DuPggYTEBgCnWpjTOLYxTECLWtm6Zj4q+9QpTAbPEQFz
         spI3I4/f5pHNdT3MCdWXI/DAuB/wzb4Ns2i4tPIUppX3RPkm/aAQFs0KW7HkPfx1OWg3
         +v2A==
X-Gm-Message-State: AAQBX9cC2Lg0fORMZmifQ3o7+V3SFcvpWKPjA/7u+aPiUTPgyQRSPjb9
        xJBgeOtSMC8bkWoTF5uRstp3R8FTV6bDyv9l0sbf
X-Google-Smtp-Source: AKy350b/2tIT+e5QlFHEXhYsP01fC6fj0DfEQOEvWRjfflFPrhmacJNsGrlHJlO4vRKfn452es59o8bqrjpYSjzmRcE=
X-Received: by 2002:a50:9fc7:0:b0:4fa:123:3b32 with SMTP id
 c65-20020a509fc7000000b004fa01233b32mr1930469edf.7.1680727680545; Wed, 05 Apr
 2023 13:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-korg-llvm-tc-docs-v1-1-420849b2e025@kernel.org>
In-Reply-To: <20230405-korg-llvm-tc-docs-v1-1-420849b2e025@kernel.org>
From:   Bill Wendling <morbo@google.com>
Date:   Wed, 5 Apr 2023 13:47:44 -0700
Message-ID: <CAGG=3QX65iJEtvMiSD2Ju18f0KfHsi2zPXAQDSh0ScqbCLv=Cg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Add a note about prebuilt kernel.org toolchains
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     ndesaulniers@google.com, masahiroy@kernel.org, corbet@lwn.net,
        arnd@arndb.de, keescook@chromium.org, trix@redhat.com,
        nicolas@fjasle.eu, llvm@lists.linux.dev, patches@lists.linux.dev,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 5, 2023 at 1:44=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I recently started uploading prebuilt stable versions of LLVM to
> kernel.org, which should make building the kernel with LLVM more
> accessible to maintainers and developers. Link them in the LLVM
> documentation to make this more visible.
>
> Link: https://lore.kernel.org/20230319235619.GA18547@dev-arch.thelio-3990=
X/
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  Documentation/kbuild/llvm.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rs=
t
> index bfb51685073c..3e1f67b05ca6 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -171,6 +171,10 @@ Getting Help
>  Getting LLVM
>  -------------
>
> +We provide prebuilt stable versions of LLVM on `kernel.org <https://kern=
el.org/pub/tools/llvm/>`_.
> +Below are links that may be useful for building LLVM from source or proc=
urring

s/procurring/procuring/

Otherwise:

Reviewed-by: Bill Wendling <morbo@google.com>

-bw

> +it through a distribution's package manager.
> +
>  - https://releases.llvm.org/download.html
>  - https://github.com/llvm/llvm-project
>  - https://llvm.org/docs/GettingStarted.html
>
> ---
> base-commit: 7e364e56293bb98cae1b55fd835f5991c4e96e7d
> change-id: 20230405-korg-llvm-tc-docs-84304e881bc5
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>
