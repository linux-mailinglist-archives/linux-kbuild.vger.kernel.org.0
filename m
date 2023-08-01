Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 687AD76B308
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Aug 2023 13:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233473AbjHALVm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Aug 2023 07:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjHALVQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2023 07:21:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99213B0;
        Tue,  1 Aug 2023 04:19:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BD7D61560;
        Tue,  1 Aug 2023 11:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B389C43391;
        Tue,  1 Aug 2023 11:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690888795;
        bh=iN0rhRO3R5bKk55KycwoSdQvpyCcSxYOhnNdMsDP5S0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ReMQQDGDfo+UneZbeB25nJSxBDZHPpmTZFYDnvvzVkwgTyt4QtActXi0JV+9e2Kj9
         R1aZm/GRdWo23GBEahZc39LMS+kjQM5mPD2Rd4ctTFViYi2JLopQJgI6FHO6x228ZZ
         Zri2gB5mZSKydUcXVD/xUmp721kF3WUmYlAIrpFSA+W0KK6ZlAC1yxHXv7y1gDHLl9
         RKf12XW1x8KbT2BFs5YKp0g5XVRSzvQjmTEjNN5KW30Ou6VAppskskieZsZWmJlhgM
         Kh4RDG0IyZIgmzuzuV42AB3jAJCD/HNcdWtp5L/rOuPD3VcXWzBhXG0bKaH7BODOS7
         jIcEnypCU5dWg==
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3a44cccbd96so3833389b6e.3;
        Tue, 01 Aug 2023 04:19:55 -0700 (PDT)
X-Gm-Message-State: ABy/qLZL2/SKQwl68P/Yok5wUMgLbqNT7flLxvnqQ01rGeJFOxxeBBq6
        JqIrW2oz/Ljkt7UiNz9SYxb5QCu8s/Kdn8cX8go=
X-Google-Smtp-Source: APBJJlHYgCXqhf4G2/P9JF8GH7xoVT4w2q7upYQvvGCrL8KECJtesU3BEMytnaGo0UsMDGV7EDqu1paubQRW8s1FWSU=
X-Received: by 2002:a05:6808:11c9:b0:3a3:ed22:5a4a with SMTP id
 p9-20020a05680811c900b003a3ed225a4amr14663655oiv.40.1690888794713; Tue, 01
 Aug 2023 04:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230729143814.1509196-1-masahiroy@kernel.org>
 <20230729143814.1509196-2-masahiroy@kernel.org> <ZMVXb008ULiyHLie@bergen.fjasle.eu>
In-Reply-To: <ZMVXb008ULiyHLie@bergen.fjasle.eu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Aug 2023 20:19:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNATC_3BjAgc=6EkyK6FFqvYFd6hLbk0p1k4JSW8nru16Ng@mail.gmail.com>
Message-ID: <CAK7LNATC_3BjAgc=6EkyK6FFqvYFd6hLbk0p1k4JSW8nru16Ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: deb-pkg: split debian/rules
To:     Nicolas Schier <nicolas@fjasle.eu>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben Hutchings <ben@decadent.org.uk>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 30, 2023 at 3:23=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu> =
wrote:
>
> On Sat 29 Jul 2023 23:38:14 GMT, Masahiro Yamada wrote:
> > debian/rules is generated by shell scripting, but the escape sequence
> > (\$) is unreadable.
> >
> > debian/rules embeds only two variables (ARCH and KERNELRELEASE).
> >
> > Split them out to debian/rules.vars, and check-in the rest of Makefile
> > code to scripts/package/debian/rules.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/package/debian/rules | 28 ++++++++++++++++++++++++++++
> >  scripts/package/mkdebian     | 32 ++++----------------------------
> >  2 files changed, 32 insertions(+), 28 deletions(-)
> >  create mode 100755 scripts/package/debian/rules
> >
> > diff --git a/scripts/package/debian/rules b/scripts/package/debian/rule=
s
> > new file mode 100755
> > index 000000000000..a4e5ab5abdd9
> > --- /dev/null
> > +++ b/scripts/package/debian/rules
> > @@ -0,0 +1,28 @@
> > +#!/usr/bin/make -f
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +srctree ?=3D .
> > +
> > +include debian/rules.vars
> > +
> > +.PHONY: binary binary-indep binary-arch
> > +binary: binary-arch binary-indep
> > +binary-indep: build-indep
> > +binary-arch: build-arch
> > +     $(MAKE) -f $(srctree)/Makefile ARCH=3D$(ARCH) \
> > +     KERNELRELEASE=3D$(KERNELRELEASE) \
> > +     run-command KBUILD_RUN_COMMAND=3D+$(srctree)/scripts/package/buil=
ddeb
> > +
> > +.PHONY: build build-indep build-arch
> > +build: build-arch build-indep
> > +build-indep:
> > +build-arch:
> > +     $(MAKE) -f $(srctree)/Makefile ARCH=3D$(ARCH) \
> > +     KERNELRELEASE=3D$(KERNELRELEASE) \
> > +     $(shell $(srctree)/scripts/package/deb-build-option) \
> > +     olddefconfig all
> > +
> > +.PHONY: clean
> > +clean:
> > +     rm -rf debian/files debian/linux-*
> > +     $(MAKE) -f $(srctree)/Makefile ARCH=3D${ARCH} clean
>
> possibly use '$(ARCH)' instead of '${ARCH}' here, too?


Thanks, I will fix it in v2.




--=20
Best Regards
Masahiro Yamada
