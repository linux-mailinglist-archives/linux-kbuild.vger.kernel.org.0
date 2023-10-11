Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0615C7C570D
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Oct 2023 16:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbjJKOhr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Oct 2023 10:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbjJKOhr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2023 10:37:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7638392
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2023 07:37:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224F0C433C9
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2023 14:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697035065;
        bh=7qhDIjEahUBJY8grbBjPeffhQFkjcEwyxJwNzbhDKXs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qB8vJvODhWp9Q34p8cTwoygz0AzOEtNJLSoD28yET3iNOGC4NAz5ZbVIro/PXKyY6
         heWZum11DgXOXo3NZ0pF+LM3iATBr4ZIm2wN2TNxg3m43pp+CdAmTjNFGj7rP4FmJq
         N1oPAtNMMjGw9mBnD+8VyE8RowmPiDsQgM284eby5JQGd6oYT1umbMSCWOIsD9qje5
         u5wx+0gmUc5JhfqQ+UdsZhwGAssOqQTXlH2bvQLwlAb+46IkLLG/O3sKORy1yQUqyC
         ntXwYhBjrCtwJzjB6o6jE/HJ1hM4/bntnveWMkwYajzXEBuD5WKro9AAsHAo+xrI/J
         ypaSOsgJpOiuQ==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1e1e25ab32bso4650821fac.1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2023 07:37:45 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy2krk9KBjJViGZcAVBAqx5Uy83VKNe+HJLRbvuxyuOFZ9BjJ7v
        avSwlfzyMwfZubVWiriUn0dqx91V6YrtXShaMxU=
X-Google-Smtp-Source: AGHT+IFfoKSfxco6bpMTRC12qYucoC1r/Nc5njdsdncYOsJPff8MzHHBKVsLM6xCm+1bigy+21Tndyy6qA6YN/dySMQ=
X-Received: by 2002:a05:6870:588c:b0:1d0:f5bd:6d2 with SMTP id
 be12-20020a056870588c00b001d0f5bd06d2mr25274423oab.38.1697035064584; Wed, 11
 Oct 2023 07:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697009258.git.jani.nikula@intel.com> <69a812273091b6535ddc7f9346289d71bb30f43d.1697009258.git.jani.nikula@intel.com>
In-Reply-To: <69a812273091b6535ddc7f9346289d71bb30f43d.1697009258.git.jani.nikula@intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 11 Oct 2023 23:37:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ1K4X6=jW1b8cyS9vs_hpn+YGzF2qw7YTFawo-bs_9gQ@mail.gmail.com>
Message-ID: <CAK7LNAQ1K4X6=jW1b8cyS9vs_hpn+YGzF2qw7YTFawo-bs_9gQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/i915: enable W=1 warnings by default
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
> We enable a bunch more compiler warnings than the kernel
> defaults. However, they've drifted to become a unique set of warnings,
> and have increasingly fallen behind from the W=3D1 set.
>
> Align with the W=3D1 warnings from scripts/Makefile.extrawarn for clarity=
,
> by copy-pasting them with s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it
> easier to compare in the future.
>
> Some of the -Wextra warnings do need to be disabled, just like in
> Makefile.extrawarn, but take care to not disable them for W=3D2 or W=3D3
> builds, depending on the warning.
>
> v2: Add back some -Wextra warning disables (Nathan)
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


--=20
Best Regards
Masahiro Yamada
