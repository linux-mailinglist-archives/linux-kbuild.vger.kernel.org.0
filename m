Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220A1771572
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Aug 2023 15:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjHFNtI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 6 Aug 2023 09:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjHFNtH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Aug 2023 09:49:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CA3F4;
        Sun,  6 Aug 2023 06:49:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6668661153;
        Sun,  6 Aug 2023 13:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A0CC433C8;
        Sun,  6 Aug 2023 13:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691329744;
        bh=2MiTIyRYpvZ0qKbA5ZLbhbcYcbSW27jN3rhzL/cNYUM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SeC+gKMleNswHd5DWRuVdEG7A2C9RZ74EtCFglqeckD91dQvMATCs9889hJc4XGC0
         oHRBE+8K8pkJSOEFusdxWdFPZ2jaXo1GD7uk8W0LcCbB8SnFjrNs0d9ilbY0jfnBzy
         V0FA2wmY/Etyr50YxGgdMI8D88rjXfy7e024Z6Hfc0uSpecbyOq+XflOiLzOo9thd8
         8H+NkEhyAEjt1BknxH86aAieOHvG50Scst5ret3cWW5ODWXpRqJc0celMbNCVqT9e4
         TiP9XNIQjnyUy0YT65eYxE5Rc6jT2p6Hcv00gGxxfpLnqL35i2mlUKM1EYHoPYsISk
         INS1w+3ffAC2w==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-56ce1bd7fc4so2572465eaf.2;
        Sun, 06 Aug 2023 06:49:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YwiLmDz8FRWSAX0/KY0nfle7/BKLisReYGC8g3aaLufR67XPHeu
        xNbBbgHYJsxU85xVUtq3KEM7SkCuA+8WPimfBg8=
X-Google-Smtp-Source: AGHT+IFWAuVOQzvsC9iij/iNYZqPid4o62oHAwo9RoTsh7/6PvGQIKbdama6HA3dAufLsxKyDQ+itPYx718wfEyuF5Y=
X-Received: by 2002:a4a:2a05:0:b0:56c:ea3f:42fd with SMTP id
 k5-20020a4a2a05000000b0056cea3f42fdmr5943343oof.6.1691329744084; Sun, 06 Aug
 2023 06:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230805034445.2508362-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20230805034445.2508362-1-Mr.Bossman075@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 6 Aug 2023 22:48:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQnMOhzX27c4kPe7_3rQRRWO1CXp+Q5xDn3=qpVcv3t1Q@mail.gmail.com>
Message-ID: <CAK7LNAQnMOhzX27c4kPe7_3rQRRWO1CXp+Q5xDn3=qpVcv3t1Q@mail.gmail.com>
Subject: Re: [PATCH v1] docs: kbuild: Document search jump feature
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>
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

On Sat, Aug 5, 2023 at 12:44=E2=80=AFPM Jesse Taube <mr.bossman075@gmail.co=
m> wrote:
>
> Menuconfig has a feature where you can "press the key in the (#) prefix
> to jump directly to that location. You will be returned to the current
> search results after exiting this new menu."
>
> This feature is poorly documented,
> so add it to the kconfig.rst documentation.
>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  Documentation/kbuild/kconfig.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kcon=
fig.rst
> index 5967c79c3baa..463914a7fdec 100644
> --- a/Documentation/kbuild/kconfig.rst
> +++ b/Documentation/kbuild/kconfig.rst
> @@ -210,6 +210,10 @@ Searching in menuconfig:
>         first (and in alphabetical order), then come all other symbols,
>         sorted in alphabetical order.
>
> +       In this menu, pressing the key in the (#) prefix will jump
> +       directly to that location. You will be returned to the current
> +       search results after exiting this new menu.
> +
>  ----------------------------------------------------------------------
>
>  User interface options for 'menuconfig'
> @@ -262,6 +266,10 @@ Searching in nconfig:
>         F8 (SymSearch) searches the configuration symbols for the
>         given string or regular expression (regex).
>
> +       In the SymSearch, pressing the key in the (#) prefix will
> +       jump directly to that location. You will be returned to the
> +       current search results after exiting this new menu.
> +
>  NCONFIG_MODE
>  ------------
>  This mode shows all sub-menus in one large tree.
> --
> 2.40.0
>


Applied to linux-kbuild.
Thanks.

--=20
Best Regards
Masahiro Yamada
