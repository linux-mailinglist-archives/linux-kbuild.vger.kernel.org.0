Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B29587BC89B
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Oct 2023 17:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbjJGP3Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Oct 2023 11:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjJGP3Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Oct 2023 11:29:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081F6B9
        for <linux-kbuild@vger.kernel.org>; Sat,  7 Oct 2023 08:29:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B768C433C7
        for <linux-kbuild@vger.kernel.org>; Sat,  7 Oct 2023 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696692563;
        bh=RrPW5HklluwVDVti+Xfv8od2i4xaTW66N3UN1/QbkXw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mpIWSOgqTZPpSm5JRvhS/ds5+CxJJmVLYQaRnPfQSMypH58zFKOz2fYQB+lbu/a7p
         FUWPUe7ATVk20k6icxm+uosvYf1jEwpLUy73WAGUfFVTTXtXiByBgB0VfKlP7/Rcy5
         p36ZfWV1z5fEUEEKyhYzTl8pGof/lvftDiMuy5qGClvtrs1QS7QA6oag3WYN8Rma7M
         VvtNe8cyOPzqDOCpLsCq8+9eqQ5PwHxpDwoB0RXxU3TYGAEKDHTrMs7GU8Y2gzT+D5
         pcyR1GHZvCgthz9FzVpPH9lYO64CoclSp3cOI2SdJGPsTmrBOd7yOp1noI8taEd+Va
         4G7KQRddoqBig==
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6c6504c9ac5so2121543a34.0
        for <linux-kbuild@vger.kernel.org>; Sat, 07 Oct 2023 08:29:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YzL91qXZjSytg1BUSt4B1QxlvsgL1ZkC7MCPFE1EIc69vFNoL2p
        KtRn+GWgI+GIdeIHsFEGMqHEo19maZkDNLRl4hY=
X-Google-Smtp-Source: AGHT+IGovfLTbcaNo+ReMkIuhxmwfb83xaEljH5AC3SMZsX2pJChHCsMY3YCuqsmimoF19TI2rFsO5v3NYM3olhvwXQ=
X-Received: by 2002:a05:6871:60b:b0:1dd:651a:73a0 with SMTP id
 w11-20020a056871060b00b001dd651a73a0mr12683897oan.13.1696692562921; Sat, 07
 Oct 2023 08:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696595500.git.jani.nikula@intel.com> <48f11648d7169687e7242e4c9b4694a0c03c4263.1696595500.git.jani.nikula@intel.com>
In-Reply-To: <48f11648d7169687e7242e4c9b4694a0c03c4263.1696595500.git.jani.nikula@intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 8 Oct 2023 00:28:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT6MzbcjR7KZMEFUCHkq+WXgTB=Qmp_VD4UC7TvMg+dMg@mail.gmail.com>
Message-ID: <CAK7LNAT6MzbcjR7KZMEFUCHkq+WXgTB=Qmp_VD4UC7TvMg+dMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i915: drop -Wall and related disables from cflags
 as redundant
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 6, 2023 at 9:35=E2=80=AFPM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> The kernel top level Makefile, and recently scripts/Makefile.extrawarn,
> have included -Wall, and the disables -Wno-format-security and
> $(call cc-disable-warning,frame-address,) for a very long time. They're
> redundant in our local subdir-ccflags-y and can be dropped.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>


I made a similar suggestion in the past
https://lore.kernel.org/dri-devel/20190515043753.9853-1-yamada.masahiro@soc=
ionext.com/

So, I am glad that Intel has decided to de-duplicate the flags.



I think you can drop more flags.

For example,

 subdir-ccflags-y +=3D -Wno-sign-compare


It is set by scripts/Makefile.extrawarn
unless W=3D3 is passed.


If W=3D3 is set by a user, -Wsign-compare should be warned
as it is the user's request.


drivers/gpu/drm/i915/Makefile negates W=3D3.
There is no good reason to do so.


Same applied to


subdir-ccflags-y +=3D -Wno-shift-negative-value






> ---
>  drivers/gpu/drm/i915/Makefile | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefil=
e
> index dec78efa452a..623f81217442 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -5,22 +5,20 @@
>
>  # Add a set of useful warning flags and enable -Werror for CI to prevent
>  # trivial mistakes from creeping in. We have to do this piecemeal as we =
reject
> -# any patch that isn't warning clean, so turning on -Wall -Wextra (or W=
=3D1) we
> +# any patch that isn't warning clean, so turning on -Wextra (or W=3D1) w=
e
>  # need to filter out dubious warnings.  Still it is our interest
>  # to keep running locally with W=3D1 C=3D1 until we are completely clean=
.
>  #
> -# Note the danger in using -Wall -Wextra is that when CI updates gcc we
> +# Note the danger in using -Wextra is that when CI updates gcc we
>  # will most likely get a sudden build breakage... Hopefully we will fix
>  # new warnings before CI updates!
> -subdir-ccflags-y :=3D -Wall -Wextra
> -subdir-ccflags-y +=3D -Wno-format-security
> +subdir-ccflags-y :=3D -Wextra
>  subdir-ccflags-y +=3D -Wno-unused-parameter
>  subdir-ccflags-y +=3D -Wno-type-limits
>  subdir-ccflags-y +=3D -Wno-missing-field-initializers
>  subdir-ccflags-y +=3D -Wno-sign-compare
>  subdir-ccflags-y +=3D -Wno-shift-negative-value
>  subdir-ccflags-y +=3D $(call cc-option, -Wunused-but-set-variable)
> -subdir-ccflags-y +=3D $(call cc-disable-warning, frame-address)
>  subdir-ccflags-$(CONFIG_DRM_I915_WERROR) +=3D -Werror
>
>  # Fine grained warnings disable
> --
> 2.39.2
>


--
Best Regards
Masahiro Yamada
