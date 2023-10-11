Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0DD27C5706
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Oct 2023 16:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbjJKOha (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Oct 2023 10:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234906AbjJKOh1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2023 10:37:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD11A7
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2023 07:37:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4A7C433BD
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2023 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697035045;
        bh=qlrlgNR9c9NwljPSRVXGSLE+ERLcAnEuYmF0m0xExQg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tyWbLFfgvJsYS7FBpoeUg3qx+Oiz+orJSVZnUEK0hnBhLKmL3oqaj4riq7gqGX5FR
         ehdNPENRvSnAbpRKnMHZgR4S7C72DLWD+3tD3JpztEB+Evgblsm3dJizcRSUcHDlLA
         pPEK0E0pwHBGBM1pUrUqTlqpTSXYFgvc0qEYEIFn6wROIVflCM50eWKtAEuCqO8RUn
         l4uWo3b1JQzehYMZPqYtk2tZrZAuiF5LGYkyBTRrx6RcwGBFU/MHa60EM8Qv2/A2Yy
         al3yir9PTfhdBI3lg4DVvUZcGqejMpslRfX1SbhIMldQTsqbukLOfoBvUFvtR7c4fd
         BqR8zj/QF9Cew==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1e562706d29so4055917fac.2
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2023 07:37:25 -0700 (PDT)
X-Gm-Message-State: AOJu0YwqV0yrWNWv7Sbwb+JWVwBLhiL+xzxp7GBPlj+QGU81znBfiAMc
        ASxktWgFZ0YrJL/j67eun4Fgq+/nmUlbgvvbouY=
X-Google-Smtp-Source: AGHT+IHcTYhZ/p2JE4i4+l0tyVjg/hM60s6lkQ6UYCGbU6W0dZvTopmVtUwm+U4kNbdfq54Fog2gUm4sLAFGbuJsBQQ=
X-Received: by 2002:a05:6871:6a2:b0:1bb:6792:4787 with SMTP id
 l34-20020a05687106a200b001bb67924787mr24260850oao.40.1697035044767; Wed, 11
 Oct 2023 07:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697009258.git.jani.nikula@intel.com> <5ab754ddc2e342c75deb8476275984918e573beb.1697009258.git.jani.nikula@intel.com>
In-Reply-To: <5ab754ddc2e342c75deb8476275984918e573beb.1697009258.git.jani.nikula@intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 11 Oct 2023 23:36:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQxmCMfLrfi9wW5M434Dw+CF_Ld_soq8Q996=Es=knO1g@mail.gmail.com>
Message-ID: <CAK7LNAQxmCMfLrfi9wW5M434Dw+CF_Ld_soq8Q996=Es=knO1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/i915: drop -Wall and related disables from
 cflags as redundant
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

On Wed, Oct 11, 2023 at 4:29=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
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
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>



--=20
Best Regards
Masahiro Yamada
