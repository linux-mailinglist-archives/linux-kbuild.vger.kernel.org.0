Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44AA960BBB2
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Oct 2022 23:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbiJXVKy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Oct 2022 17:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235639AbiJXVKW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Oct 2022 17:10:22 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A523884
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Oct 2022 12:17:08 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso4842761pjg.5
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Oct 2022 12:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lEIAgIaq7xwDYOXkCfqCwVLGJ7bTE5nHIiB+jrGhv9o=;
        b=N+cAdNyMQXR/tbR8q02b2KsJU34NsOg8AsmZchm09Z2l4h6y4DUccY8EGCAKpFsyo+
         hVUIcNMrL7/tnzDf5cv+joc3p07uIr/yzJbz+OvO17e7SsF6tb9f4yBJcOuBSoLp0ES1
         s5B1qsFCCADwGRqSnL8cxDy82PrJ3kjygJ5mqJ1q4rkm1CSxew9saqIaoal+qYo0pRBR
         aVvUz4wGZQqnUzXObp4x9hDTVuLE6IUQIzjb7EFc+ekpHAaHAGFmTgdGFyAK6CfK6rLf
         3dxwl447zqq1U/1aHH7GQL+/vSEEBAS7gtdGRmuVyzUfhMRuBOxs7t7JZNTQhO2xnzhh
         o9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEIAgIaq7xwDYOXkCfqCwVLGJ7bTE5nHIiB+jrGhv9o=;
        b=Ul48TFThPv62iYfRCe24A8KxqATJph4Un17BoV60gjitCL61WmZw3A3vK6xS3ekn9r
         tZzxd1E7Epxuq1yeqFaxp0TZU63fZH9c+8dEmNrcyay1ApMXC2DZVWkrOj0Ju7CU83Ow
         VqkRandYhV0iyZasgXITmZtkg5aqaEvYUsj8U5NcYZj1PjdX+w+dC+JIO+4WLnv8X6VR
         LcKLmqL4HXhR+vGwIC00l6A+kHAOGPieETHsuDcvypU65NLTf4uaayPzrEdzB0fJVGnr
         r8Ruw+j41sNRB9f7uM7SaXaoJ6kwMwXu+FJ1QkO7gCKpwi39nhYLVGRx+A+awiZA8ZGq
         9eKw==
X-Gm-Message-State: ACrzQf1c/1lQ/jqOT4BPPytfKc/CiDXRqaVC1xKIMpMNL46fMlk5BNEK
        2czAumi7G2bGrooD9TFv2cLkGmwzm7QlD+zbFEieWw==
X-Google-Smtp-Source: AMsMyM7tbBbsSJUv0yupVMnL0+TpbuvReM9TeIGhfkgoLv6T1JBl44WEe3hE4Q6zQu0W3AhFNSVNU/KHSbG8x77l5ik=
X-Received: by 2002:a17:902:b210:b0:17d:c3ca:4a4f with SMTP id
 t16-20020a170902b21000b0017dc3ca4a4fmr33920252plr.33.1666638950116; Mon, 24
 Oct 2022 12:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221023195257.175946-1-masahiroy@kernel.org>
In-Reply-To: <20221023195257.175946-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 24 Oct 2022 12:15:38 -0700
Message-ID: <CAKwvOd=pimEoN_OvyefPiTTsOdzo+Xda1gJrYg8+jAE5GA0rqA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix 'Broken pipe' message for AR=gcc-ar
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>, eng.stk@sapo.pt
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

On Sun, Oct 23, 2022 at 12:53 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit 321648455061 ("kbuild: use obj-y instead extra-y for
> objects placed at the head"), 'make AR=gcc-ar' shows the following
> message:
>
>   /usr/bin/ar terminated with signal 13 [Broken pipe]

Not just AR=gcc-ar, but also AR=llvm-ar:

error: write on a pipe with no reader

Link: https://github.com/ClangBuiltLinux/linux/issues/1651
Reported-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Note that due to
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8017ce50641c303b9b5d96f3c10229ecfd770a70
we should send a backport to stable like:
https://github.com/engstk/op8/commit/6f2688e3eb4ec06b276e541640d4f06364b68442

>
> The resulting vmlinux is correct, but it is better to silence this.
>
> 'head -n1' exits after reading the first line, so the pipe is closed.
>
> Use 'sed -n 1p' to eat the stream till the end.
>
> Fixes: 321648455061 ("kbuild: use obj-y instead extra-y for objects placed at the head")
> Reported-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index f41ec8c8426b..0e42a7982826 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1218,7 +1218,7 @@ quiet_cmd_ar_vmlinux.a = AR      $@
>        cmd_ar_vmlinux.a = \
>         rm -f $@; \
>         $(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> -       $(AR) mPiT $$($(AR) t $@ | head -n1) $@ $$($(AR) t $@ | grep -F --file=$(srctree)/scripts/head-object-list.txt)
> +       $(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F --file=$(srctree)/scripts/head-object-list.txt)
>
>  targets += vmlinux.a
>  vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt autoksyms_recursive FORCE
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
