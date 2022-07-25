Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9477580312
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jul 2022 18:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbiGYQrF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jul 2022 12:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbiGYQrF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jul 2022 12:47:05 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76A8BE27
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Jul 2022 09:47:03 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id p11so14117269lfu.5
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Jul 2022 09:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K/pBROa2cxulg04mS4nY9g+xJXu7b+OWgs5E6WiaGlk=;
        b=qXycICYK/067txSS/FCBMFsUwF4g4Y3jCP46hSOPLJQN9W1UCXiEGeAOVALmqvaqtV
         TOd5rXfX90KAcJc4cr8hU2Xr9pjBb6gmtsn+TfkSTeEzm5JYYmCljhvbeTyX1lVcqUn5
         13d8f8gchsrOHImcd0tHJjiKKz3hTB9141Rzl0F//imFhUGXyixS8lJdN2tBDeJt8EST
         4rMIRBr8Roy8+Irq46VsWx2GEmgylOPPRivQ5M327dlqrDxQshg8P99ZLMhjnpR8AivS
         ZM+awjLXKJcDnnEngsVbNfzuFnrIYetgONhZ/Xbbsqfdtf1iGxwImqa36RxGP4E0GO8C
         +kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K/pBROa2cxulg04mS4nY9g+xJXu7b+OWgs5E6WiaGlk=;
        b=5JOzB2R4SBLtHKZlLFGqd01YsHdM7uPTw6SzkXwZwumHP3xbOFXwLaVNY33a1j4wJT
         Bk2LwJG7I3CiqO7fWyWRlg7y3ZJmBDrXvv2UYPGqEt3BBgVchonY6m9uirZ6eoAcg9Hp
         BmBzS4QcbaXel4Amjk31tfHbchsqcuEnbg7iCGs+ZPLqn1TX0SYv8TioU2v/r9OhcfA5
         jv2cymztOpkeDRtkH1ml6pdILf5x2Qc8Bih4w37xssBV0uRGvDh0EiA9XWfcl0Dr9sW+
         1Qsy9VpP1OnQv1D19UwXUPTZN/FOn+DbEZnsHd2quKOMk1eNc9Lh4gl5PIMziJBT+ylQ
         m3qA==
X-Gm-Message-State: AJIora9UGdF9onuoIu02pBCnN5VQuFkNwWEvtfjPHt+3S5nF+rpLMLjh
        JAPTRrCC28Va7o8A1+pIVMglDGaVOgfz0UVA1t70tA==
X-Google-Smtp-Source: AGRyM1sbl/0EjcN5ppaNFnALxBedCjWF4X60IusdTDXaQ103NDsUxDekVhpAWrm9Bn4zif9yEz5u9HL7hC9h1nl5Ma4=
X-Received: by 2002:a05:6512:1190:b0:48a:19d5:ef23 with SMTP id
 g16-20020a056512119000b0048a19d5ef23mr4694530lfr.401.1658767621669; Mon, 25
 Jul 2022 09:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220716080530.119961-1-masahiroy@kernel.org>
In-Reply-To: <20220716080530.119961-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 25 Jul 2022 09:46:49 -0700
Message-ID: <CAKwvOdmiecdvuP-xnKgyhand9r5nsivJNSy3sbAmKo2MHzhQAA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove RCS_TAR_IGNORE
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
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

On Sat, Jul 16, 2022 at 1:06 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This reverts the 20-year-old commit [1], hard-coding '--exclude .git'
> instead of '--exclude CVS'.
>
> RCS_TAR_IGNORE is used for packaging the mainline kernel, so I cannot
> imagine other version control systems would be used.
>
> I keep RCS_FIND_IGNORE because it is used for external modules, e.g.
> 'make clean M=...', where git may not be used.
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=c2dd03a9e2d8bf508f6b3d9ee327c37a928b3351
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  Makefile                 | 5 +----
>  scripts/Makefile.package | 2 +-
>  scripts/package/mkspec   | 2 +-
>  3 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 80b19675ae91..8b166766b4ef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -552,13 +552,10 @@ export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
>  export PAHOLE_FLAGS
>
>  # Files to ignore in find ... statements
> -
> +# (Take care of various version control systems for external modules?)
>  export RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o    \
>                           -name CVS -o -name .pc -o -name .hg -o -name .git \) \
>                           -prune -o
> -export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn \
> -                        --exclude CVS --exclude .pc --exclude .hg --exclude .git
> -
>  # ===========================================================================
>  # Rules shared between *config targets and build targets
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 5017f6b2da80..d9c91ebcf2bf 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -45,7 +45,7 @@ if test "$(objtree)" != "$(srctree)"; then \
>         false; \
>  fi ; \
>  $(srctree)/scripts/setlocalversion --save-scmversion; \
> -tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
> +tar -I $(KGZIP) -c --exclude=.git -f $(2).tar.gz \
>         --transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
>  rm -f $(objtree)/.scmversion
>
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index 54906174bda2..97efc85b845c 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -29,7 +29,7 @@ fi
>
>  PROVIDES="$PROVIDES kernel-$KERNELRELEASE"
>  __KERNELRELEASE=$(echo $KERNELRELEASE | sed -e "s/-/_/g")
> -EXCLUDES="$RCS_TAR_IGNORE --exclude=*vmlinux* --exclude=*.mod \
> +EXCLUDES="--exclude=.git --exclude=*vmlinux* --exclude=*.mod \
>  --exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation \
>  --exclude=.config.old --exclude=.missing-syscalls.d --exclude=*.s"
>
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
