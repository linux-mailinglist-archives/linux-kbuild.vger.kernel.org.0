Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424717749D2
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Aug 2023 22:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbjHHUE4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Aug 2023 16:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbjHHUEo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Aug 2023 16:04:44 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4557C7EEF
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Aug 2023 11:24:02 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-63d23473ed5so34480476d6.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Aug 2023 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691519041; x=1692123841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuHu2aaGBtXDGm6ZbqKeYvS7JNps7v7hBHb8nXUWyCA=;
        b=Szm+Vlx1Tmywbd71ISdGfvHzo0S11pvxk8Zu8eH5AWgDVpVmjOfx9T2c/S7v9DhvRs
         SVXeLVpS4LFejNPELELQsdXNFG3tqCy5u/IcY9VGm7ltFF/7Vgp3uc2y+dHfwx/XqGQ2
         nyFbRp7LsFY2cYdWXCCJcG3UzplEGvdj86LimvE/TFAArOnUMZuFlGfKs9voq3fxRew/
         Cdvbw0HwOsexbyJuW8dj4gf1S6ae8FY/Hqq3t7A18oz8ltfyxp32MHDoFE1gaHt7upqZ
         cy2N5fqsx68LfVRUZCJX9Gf/hivW5Y17MUJ9aRcSEnxmHGAmt6kXHSftBagzVSxwEP4t
         O8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691519041; x=1692123841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuHu2aaGBtXDGm6ZbqKeYvS7JNps7v7hBHb8nXUWyCA=;
        b=KkxOonpw0pztZZZ/Ab7dSudeG1NibbmJfDzRRw+RdM2P2zngjE43mXcTmMQt0NuvE4
         IWgHET5xKL6CSqixyadR8YRd+PBjVT84hBy1DPkKNRmVaW4SwSe/1TKwLR6cnnCTrvmY
         RV5IMLhmRajbYA5FLeTGfp3i0CB8M6EJeqdkE19ZDi8E7KPw57nmKwjuO/82mNCdFfg5
         nehMRbR23okgTRj3zGUDW9MOrtBxhGqW6cSUop7NwgXDQyAAQ7l8HEv8qcX5yjRcPWVS
         D6FLAt0I/wi7m1F9KZ8yv31f6jPhslGQlOHsiANANVS3UGSVouCHFhfrIInhrDvu+wmH
         olaA==
X-Gm-Message-State: AOJu0YwqnLlCV/EEISKzUb0reig0mGx4ktLUY3V8U4w4CrHLVIYn7Wth
        Jo7Xowh/frJ0fK6+k8ucl7BVhO4lBxQZ7CGzezQwNg==
X-Google-Smtp-Source: AGHT+IEuGYfM7Ti1gjPOBrG90iQRTcKJFDV2Zy0ZEcRXgZXpwwv/qmU8lNj+mqkZvmlZCUr5ZljsFeJuq0iBxNf/iao=
X-Received: by 2002:a0c:aa94:0:b0:636:14d4:445b with SMTP id
 f20-20020a0caa94000000b0063614d4445bmr215145qvb.9.1691519041270; Tue, 08 Aug
 2023 11:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=KCT-aqcWctRPVhEoOjkjP+y5TpNK1hV9mq6PuZDvApQ@mail.gmail.com>
 <CAK7LNASVZLYh1PZ_0QqVEfopGHUKq8fCVDmpKDZfODzgspPXEQ@mail.gmail.com>
In-Reply-To: <CAK7LNASVZLYh1PZ_0QqVEfopGHUKq8fCVDmpKDZfODzgspPXEQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 8 Aug 2023 11:23:50 -0700
Message-ID: <CAKwvOdno6=XZsAfDpUMgoBtE2kOM+fiO_KOEbkfYMPi1hg+2HA@mail.gmail.com>
Subject: Re: missing separator. Stop. after rebuild
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Nathan Chancellor <nathan@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 8, 2023 at 11:02=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Aug 9, 2023 at 2:31=E2=80=AFAM Nick Desaulniers <ndesaulniers@goo=
gle.com> wrote:
> >
> > $ wget https://download.01.org/0day-ci/archive/20230808/202308081050.sZ=
Ew4cQ5-lkp@intel.com/config
> > -O .config
> > $ make LLVM=3D1 ARCH=3Dum -j128 arch/um/drivers/port_kern.o
> > $ make LLVM=3D1 ARCH=3Dum -j128 arch/um/drivers/port_kern.o
> > arch/um/drivers/.hostaudio_kern.o.cmd:843: *** missing separator.  Stop=
.
> > $ sed -n -e 842p -e 843p arch/um/drivers/.hostaudio_kern.o.cmd
> > $(deps_arch/um/drivers/hostaudio_kern.o):
> > o)
> >
> > Any idea if this is some form of malformed Makefile rule, or actually
> > a compiler bug generating these .cmd files?
>
>
> Presumably, this is the same symptom as Jiri Slaby reported
> some time ago.
>
> If you run a single build for arch/um/drivers/*, bad things may happen.
>
> He reported.
>   This leads often to corrupted arch/um/arch/um/drivers/.ssl.o.cmd.
>
> https://lore.kernel.org/linux-kbuild/92f4dfe9-eb87-766b-271a-e57ada3a7dbd=
@kernel.org/
>
>
> A patch exists in ML.
>
> https://lore.kernel.org/all/20230721171857.3612639-2-masahiroy@kernel.org=
/

Thanks. That resolves the issue for me. Can you pick it up if the UML
folks don't?  It's been nearly 3 weeks.

>
>
>
> I really want to stop using core-y or drivers-y in arch/*/Makefile.
>
>
>
> --
> Best Regards
> Masahiro Yamada



--=20
Thanks,
~Nick Desaulniers
