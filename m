Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C13A65EEA5
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jan 2023 15:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjAEOVe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Jan 2023 09:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233077AbjAEOVc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jan 2023 09:21:32 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19984FD4B
        for <linux-kbuild@vger.kernel.org>; Thu,  5 Jan 2023 06:21:29 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id c133so32108419oif.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jan 2023 06:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VCmu3jJ7Nlxelagke1iSb8wxFg1JY+FjQQE47k7d8dM=;
        b=hKUgWT7YXESJh/RZM84Wvm5DUabxzj4moIqEVvGV85ai322jDXTsRN4ZFtRvOFcfDO
         UHHY/tMCAVFAt2hPtFpx3hZScq71/j10BeH0RyW79KBpTnJspIk5NGrX62r092+Kq/5A
         dVJPGdR0SanhJwco5SNaQofIgzpj16JS1jBURzOOv2qdCer+HhwmkestxSRfRe367QTv
         0sNPeSbIOV8qeeYdtXHnjGHgRuCdG0zQuwZTrqj0b3OQZBABoFF7820rl9m+f0qDjRNl
         Gv9ezaevDQtrufO3bwoqn52AR4d6uzpIR4jNuWEGa8ri4EvsbcA0vPvz6sPtsaVEnvd6
         7ELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCmu3jJ7Nlxelagke1iSb8wxFg1JY+FjQQE47k7d8dM=;
        b=VbdhUEns0t5Wk9CBtZ5F3/+cHLZaDHEcATdLLUiskVMrRnX7aur5c3qthmWIQaeSQP
         5GSIbWSEmx5B1+NdRA7OFAhC2wbNbVGiJhQVZlzVOmMVTQWqOnBXg39URPWC+VOH7L02
         369VqZjC98oV5XduLGBofQ9nu/8AdhxWp8NdaqDWgiCTlbIQej1jM80gnL2DQKUoBYAB
         XqdnoioAAphmGK3iKpcK9YJmSo3+1xnWx5UCosQ/JQf7PdSPK8lsh7/VGpkSODYohIDT
         HvOryxfDVjR9wB2vVrZIMNnW3kMkUlsSrt2P6/cta2a4J5n7+RsDDIK1NxRmwz49mMGN
         eB8A==
X-Gm-Message-State: AFqh2kpODGMbR4novgd79tStb8b2II38XKU1UOzTUel/w1lA2w2/pVqS
        P/t8jL+dX6aMRrolRcrLgjGniNM7z8z8G5Vyj00=
X-Google-Smtp-Source: AMrXdXss6pLzkv+6RMrSqTNpQ6Z+DzO3VSYyYkr56kXLuRqy482ixVPQh/8ymY3KcL5PQWbJRxdlPG42uLrpQJQn6zs=
X-Received: by 2002:a05:6808:2994:b0:35b:f5f7:3ed0 with SMTP id
 ex20-20020a056808299400b0035bf5f73ed0mr3417836oib.46.1672928489064; Thu, 05
 Jan 2023 06:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-12-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-12-658cbc8fc592@kernel.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 5 Jan 2023 09:21:17 -0500
Message-ID: <CADnq5_O6W2j7QKm-JHsf8FOeuRFu0V4w=Ac8AV8r0KFZTegPdw@mail.gmail.com>
Subject: Re: [PATCH 12/14] drm/amd/display: Do not add '-mhard-float' to
 dml_ccflags for clang
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, ndesaulniers@google.com, Xinhui.Pan@amd.com,
        kernel test robot <lkp@intel.com>,
        linux-kbuild@vger.kernel.org, sunpeng.li@amd.com, trix@redhat.com,
        llvm@lists.linux.dev, Rodrigo.Siqueira@amd.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        nicolas@fjasle.eu
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 4, 2023 at 2:55 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns:
>
>   clang-16: error: argument unused during compilation: '-mhard-float' [-Werror,-Wunused-command-line-argument]
>
> Similar to commit 84edc2eff827 ("selftest/fpu: avoid clang warning"),
> just add this flag to GCC builds. Commit 0f0727d971f6 ("drm/amd/display:
> readd -msse2 to prevent Clang from emitting libcalls to undefined SW FP
> routines") added '-msse2' to prevent clang from emitting software
> floating point routines.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: harry.wentland@amd.com
> Cc: sunpeng.li@amd.com
> Cc: Rodrigo.Siqueira@amd.com
> Cc: alexander.deucher@amd.com
> Cc: christian.koenig@amd.com
> Cc: Xinhui.Pan@amd.com
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Feel free to take this via whatever tree makes sense.

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dml/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 0ecea87cf48f..9d0f79dff2e3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -26,7 +26,8 @@
>  # subcomponents.
>
>  ifdef CONFIG_X86
> -dml_ccflags := -mhard-float -msse
> +dml_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
> +dml_ccflags := $(dml_ccflags-y) -msse
>  endif
>
>  ifdef CONFIG_PPC64
>
> --
> 2.39.0
