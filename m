Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C1E60FD3B
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Oct 2022 18:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236580AbiJ0QhO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Oct 2022 12:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbiJ0QhN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Oct 2022 12:37:13 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B9618E729
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Oct 2022 09:37:12 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id b185so2095212pfb.9
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Oct 2022 09:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/U6QNXQ/xCPGTTB1SAGiuHHJBka8um7FPSVO88evHYI=;
        b=VSrXHgK1wthxTiSvcuhaQbjJeIf88juMO1vdkrfo8WfFh1W8lrjC/FEAR/tfSGGiaI
         MwL2e/KdbjhhU5Mvx64WTzDvM28en1ruz6tMYyq71mEdM2mUXPl7YsB9GXfSG3zXUdL3
         U0JN8NqLuwTvA7DsT/+Z2LG8SnF4BakmBHO6rvnjvJ2wyzmZ82j7VbOXOvCM4FTenpjf
         LUXfcAQJLSbblvmH06iJVgcMmmP76BqS6KGm/FBWFP1CkRZ14QuwLiNAFLMCuAx/VC3X
         y1k+lyPjJvUOCVaMMDcxwoNJbPK7skwJ05kKMxPx1sab1r+g80HAIayEjDwr2Z3Vaz1U
         tTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/U6QNXQ/xCPGTTB1SAGiuHHJBka8um7FPSVO88evHYI=;
        b=tLx+dAMu/Bt009GTXsxJl5RSrl1bqkOqnt4ZcRMRAgS8RqkjInSIM03ArWL/EuW6dI
         VqgUUN588qSfMDKRS0+klXDQe/NyRSEDDSvuMTiB13gVo7VyUSuDX/E/daZI0EIVZRqw
         bXcTQhPqnwxkRvb+MDvLewFbY5GRoe8Ap6HSn0Hg4o9v0pOMKpi+m1iF9limBR4EclzE
         wcw0HFXnrwPowbP00nubvjT2B32jvSVZ1gSQ1dJ1lF+5NfPZmLg74762Zkd8egEKIT+d
         usegPZJu0nfiY1uB6y2OBsIE8wOxyUg/SL2lUZ8ubYHG9aOo0WTs9ynIiorYw5/qAXHC
         JqiQ==
X-Gm-Message-State: ACrzQf2TdyzpQt6MFsXE8/pagRi4luZOru+hNuMn5JURNsScvISOTekZ
        sUKVP2Dyow0q9ZdBuzPVvWNDe9mCMZRZcjKDFFhESw==
X-Google-Smtp-Source: AMsMyM74RkehYChf05WveFojOxGE9ShcFGDHudhN3+Bi2xfxS50UVNk6k4zl48d16veCpcNgt4M8U3ECMEQxzyXkjHU=
X-Received: by 2002:aa7:83cd:0:b0:563:5f54:d78c with SMTP id
 j13-20020aa783cd000000b005635f54d78cmr51545714pfn.66.1666888628868; Thu, 27
 Oct 2022 09:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221027162839.410720-1-masahiroy@kernel.org>
In-Reply-To: <20221027162839.410720-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 27 Oct 2022 09:36:57 -0700
Message-ID: <CAKwvOdmDFxr_PgY4WK392zCgs2QGxrsPfWoX=5h+y3R5r1xrJA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: fix SIGPIPE error message for AR=gcc-ar and AR=llvm-ar
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
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

On Thu, Oct 27, 2022 at 9:28 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Jiri Slaby reported that building the kernel with AR=gcc-ar shows:
>   /usr/bin/ar terminated with signal 13 [Broken pipe]
>
> Nathan Chancellor reported the latest AR=llvm-ar shows
>   error: write on a pipe with no reader
>
> The latter occurs since LLVM commit 51b557adc131 ("Add an error message
> to the default SIGPIPE handler").
>
> The resulting vmlinux is correct, but it is better to silence it.
>
> 'head -n1' exits after reading the first line, so the pipe is closed.
>
> Use 'sed -n 1p' to eat the stream till the end.
>
> Fixes: 321648455061 ("kbuild: use obj-y instead extra-y for objects placed at the head")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1651
> Reported-by: Jiri Slaby <jirislaby@kernel.org>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Looks great! Thanks all.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - Update commit description to mention llvm-ar
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index e90bb2b38607..e9e7eff906a5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1218,7 +1218,7 @@ quiet_cmd_ar_vmlinux.a = AR      $@
>        cmd_ar_vmlinux.a = \
>         rm -f $@; \
>         $(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> -       $(AR) mPiT $$($(AR) t $@ | head -n1) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
> +       $(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
>
>  targets += vmlinux.a
>  vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt autoksyms_recursive FORCE
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
