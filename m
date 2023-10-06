Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F2B7BC100
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Oct 2023 23:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbjJFVMQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Oct 2023 17:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbjJFVMQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Oct 2023 17:12:16 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337F6C2
        for <linux-kbuild@vger.kernel.org>; Fri,  6 Oct 2023 14:12:14 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-4527d436ddfso1146687137.1
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Oct 2023 14:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696626733; x=1697231533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbAwly3dikrgqzK4k8R0+8k+e23Msjxly1PWuzBfu1g=;
        b=FbWMHimh2utW/vedRQM5Ae0xDDihyylbElg84FiE0WVDXsZjCNw6Q8H5wI+Qz5qlu5
         rHZU/HvmtkOaTcxLwp0Hn9coI4OzDtSY5gS+SS2Gy/FJ8CbwJ7z1lDNDC39grIr3vCKc
         gmso65j5osaiD64l0/IhniRBeI/VyKW9wA/FjvVFR559jceCiqANo073WPG2MGqsHBBU
         bL0moRIB56mdVq68LuUIS9wvVEdRqH31OTHL7Wcpw/OuLK0i0A8V878Sm099QGEWaxY2
         /TFWmarN2kSBw1Ye/wzunLaLEezPWxVpdEhPJgLlqJ4AAJZob3sGVdOUFMh4o/3Ey64J
         FsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696626733; x=1697231533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbAwly3dikrgqzK4k8R0+8k+e23Msjxly1PWuzBfu1g=;
        b=f6mqIJ04FmHQILsYd4BNTq6ejpZ8KGfWny6BnT2ouxOEQMF3vMBDiAjHfhYKjWjKfn
         tQpuEJj/2vRE56h338xuD6qB7gIzMIS04Jyu8diXqwy3oo8ClfmUyXEgGNJ8NPfMcq8c
         jXoWfVw3lXySwNmePnmTlRfZme6sJd8BzIKvJOLnn3LKvuSWvxc4F5dV0MUlbAyn7NCy
         s6NmlQs5m20fpctFUM6nOiVfhiy0uE0UcN0GqotrTvQFKVSlDlFqZDwqjvviRUUoSBH/
         i6pKYC5xxIfAb/7ugDcui44uaEudaf+3E8LsjqlC9cfGmd8M2TjNzCohnGcuCVBF648G
         vI5Q==
X-Gm-Message-State: AOJu0YzvQaJsop1FX7ARC6ADLM3XAwf6PVLhsKv/6NMEjnWJKYlcBb9j
        PYs0/YPBUpkhwi4h01emL1HkHGg77Qgtvr5D7ETqkllo3ieDV2UubYU=
X-Google-Smtp-Source: AGHT+IFEBXD2wp73cuO/Du0AW1Z2vCNdjoG5TcUTWAONcm55bIcnRmUJtJBUTyJn8wz0plhuvSLhqTMfe4pKQMBO4Sc=
X-Received: by 2002:a67:f754:0:b0:452:7f81:1502 with SMTP id
 w20-20020a67f754000000b004527f811502mr8785778vso.26.1696626732971; Fri, 06
 Oct 2023 14:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696595500.git.jani.nikula@intel.com> <48f11648d7169687e7242e4c9b4694a0c03c4263.1696595500.git.jani.nikula@intel.com>
In-Reply-To: <48f11648d7169687e7242e4c9b4694a0c03c4263.1696595500.git.jani.nikula@intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 6 Oct 2023 14:12:00 -0700
Message-ID: <CAKwvOdkWX9GU_kvpqjRDgMuB_91RJTLZND+aDVh2tTEq3eK=Tg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i915: drop -Wall and related disables from cflags
 as redundant
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 6, 2023 at 5:35=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
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

I didn't carefully cross reference these specific flags so I provide
and ack rather than RB, but the logic in the description checks out
IMO.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

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


--=20
Thanks,
~Nick Desaulniers
