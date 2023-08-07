Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0581772BBB
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Aug 2023 18:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjHGQzi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Aug 2023 12:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjHGQzi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Aug 2023 12:55:38 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958E91990
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Aug 2023 09:55:16 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-63d2b7d77bfso33298056d6.3
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Aug 2023 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691427295; x=1692032095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5cddJzIOPCTcsiTflLavXmr7qSZtA1VgTifuJQg0Dk=;
        b=VNz6c1jOtKboiDGkYmzFk2dxRBEGQhwM3JVWTqlT6u+8gQeqV1dNNEb+vql8z4uY9E
         XC8gEJo02hnLguERc3oXDPOtJ1uFeNFjeik0QEuR0ICXLEk2i/V2Ch1hX6Uk7p7Kf4L9
         OalbP4FMkppD8l4XIAbqopvPxCx2Qxey0FajTNurZho/fhCIMvdWfuf5mTODjcgMw3p4
         xpvVaOb/hgqGmHGMcO+xdBpC39edYE+8hm1b33AnIFRXI/1iPnZYYBXtlJrST1ja5PLK
         GcusknhpcXYEE+9wvRR3UmTaiKyWm333aPays6oxy+rQFBTaIPF/ytpitjt2en/eMXSc
         poOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691427295; x=1692032095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5cddJzIOPCTcsiTflLavXmr7qSZtA1VgTifuJQg0Dk=;
        b=XxYKAzoT6F+ojhf36q7lNAtDBvjQ/nTnXfrrh0bbeEatMYeCy1RRleCVKR+4rBQtRQ
         tCMWkHHK+D+67tgjbUkuJHtb4VUZbA2q6laWyVGI1w3Qi+Q4p8MK5OuzGg2PaB+rkeox
         bAnYxPokbn+XwpZauNz6spMqjiMCHE9dSGP7l40wib4AqIx2xKmYQEUtpC75poEclelA
         q7nrmCjzAI8WE9XJ6edN/01uXuDpr1+0XbKLWbXXud65qa2bLEhBX/K/tfEMZgfHYxpr
         JINYVd0Lrb9+p7p7QDSiu2H62NU738aS1FQx8iBlMj5IZG0CCYxKaOYKEMe8MzOzVyF3
         iT8g==
X-Gm-Message-State: AOJu0YxCJH2661zA+25ieIA1auogJTh/uPtzaXkJUwWpZzxueyUNfhmA
        NzQbr1wUM0loGG6KQt37uIIq0f+CpSwzHfO41qt6QVZftHkd3q7RSv4=
X-Google-Smtp-Source: AGHT+IEQiIfK4z3yyCGkeZPF2C+P8nQA6AbqE0wDfTzyMPFrsW44XDNbBzE3YEEGxN3ZSCFic2gL6lZuymo8psJnyW4=
X-Received: by 2002:a0c:f50d:0:b0:63c:ef89:1a5c with SMTP id
 j13-20020a0cf50d000000b0063cef891a5cmr10219908qvm.62.1691427295460; Mon, 07
 Aug 2023 09:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230807-missing_proto-v1-1-7f566b7ba5ca@google.com>
In-Reply-To: <20230807-missing_proto-v1-1-7f566b7ba5ca@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 7 Aug 2023 09:54:44 -0700
Message-ID: <CAKwvOdncCH4uoKfTnYf5pgTtY49b-S7XfWoF4UnH4b3AV3R3vA@mail.gmail.com>
Subject: Re: [PATCH] Makefile.extrawarn: enable -Wmissing-variable-declarations
 for W=1
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
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

On Mon, Aug 7, 2023 at 9:50=E2=80=AFAM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> I noticed Tom was sending patches where smatch was recommending
> annotating functions as static when no previous declaration existed.
> Surely the compiler could make such recommendations as well, I thought.
>
> Looks like -Wmissing-variable-declarations can make such
> recommendations.
>
> GCC just added support for this warning (gcc 14.1.0 will ship with
> support), and all versions of clang relevant to building the kernel
> support this flag.
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  scripts/Makefile.extrawarn | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 40cd13eca82e..617739eb84e2 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -32,6 +32,7 @@ KBUILD_CFLAGS +=3D $(call cc-option, -Wunused-but-set-v=
ariable)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wunused-const-variable)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wpacked-not-aligned)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wstringop-truncation)
> +KBUILD_CFLAGS +=3D $(call cc-option, -Wmissing-varibale-declarations)

^ sigh, misspelled

>  # The following turn off the warnings enabled by -Wextra
>  KBUILD_CFLAGS +=3D -Wno-missing-field-initializers
>  KBUILD_CFLAGS +=3D -Wno-sign-compare
>
> ---
> base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
> change-id: 20230807-missing_proto-0cb90ec6454c
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>


--=20
Thanks,
~Nick Desaulniers
