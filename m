Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03BEB768486
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Jul 2023 10:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjG3I7n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 30 Jul 2023 04:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjG3I7m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Jul 2023 04:59:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9714CAF
        for <linux-kbuild@vger.kernel.org>; Sun, 30 Jul 2023 01:59:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27B5360B93
        for <linux-kbuild@vger.kernel.org>; Sun, 30 Jul 2023 08:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE3DC433C8
        for <linux-kbuild@vger.kernel.org>; Sun, 30 Jul 2023 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690707579;
        bh=HsirDCwYrc2hpTCMHB5UpWWSHbF7RBvqxWAEZ0YH0rs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QqGK7T/cXhzCJmWum6LY9CCQ5A5aPP2pQq/O3QnW1FdUSW4ob3fkloY6ZX/Njczm7
         OMFw5GEkWCDBVPwxVnIYG7uTOge2mx4UsmwZAjaeI8ckQRNN+bbmpbzFaC0M8ca+YJ
         E0Hz+vDSAg/ENU7fB+SYfVApwkmbYb9EYTiLW55NO7PWGTc8wAcRvNfLlVhJV7Yj3J
         LSErjT9qeeZMhdM019yuGzmtoUSTto2scSpYOb1VLnnFhzMmPl858bo4Pm4qwnJjUk
         6edyFBFxANZnPBDD9pWMUvhO1PiuBSMfuDKf05m5XCrQdLgx/gLDOysX/xXkboBaTe
         b2KbXENgTia8g==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1bb7d1f7aeaso2741136fac.1
        for <linux-kbuild@vger.kernel.org>; Sun, 30 Jul 2023 01:59:39 -0700 (PDT)
X-Gm-Message-State: ABy/qLa19ufH8FMsd2YLF1O6Hji/aEUvkCBSaOYZRovgFQaIz5MoYuyL
        sHcWI3K0kod/jjfUKuiAJn6gF52v9aZg2P4f2fE=
X-Google-Smtp-Source: APBJJlFoW0D9dlUtxBrUi18Le7zSTpjyhszTYK3HGxjpheZGA7KgQc1Rm0ueagiVIMPtqoYEUDwJmX4Qt0yH8PRT7rE=
X-Received: by 2002:a05:6870:648e:b0:1b7:610e:2d8 with SMTP id
 cz14-20020a056870648e00b001b7610e02d8mr8489555oab.54.1690707578758; Sun, 30
 Jul 2023 01:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <387d7f82-aa8e-759f-7e12-08dfc329c47f@smile.fr>
In-Reply-To: <387d7f82-aa8e-759f-7e12-08dfc329c47f@smile.fr>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 30 Jul 2023 17:59:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQHP5B0bSaqdgjD+q5nET-hA=RD+b0t=zZBmnpOV9NvRg@mail.gmail.com>
Message-ID: <CAK7LNAQHP5B0bSaqdgjD+q5nET-hA=RD+b0t=zZBmnpOV9NvRg@mail.gmail.com>
Subject: Re: oldconfig loop infinitely with a hex/int config without valid
 default and a closed stdin
To:     Yoann Congal <yoann.congal@smile.fr>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 29, 2023 at 12:23=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:
>
>
> Hi,
>
> While analyzing a Yocto bug[0] I think I've identified a problem in kconf=
ig.
> The problem happens if you have a hex or int type config without a defaul=
t value.
> Like this :
>   config TEST_KCONFIG
>         hex "Test kconfig"
>         # No default value
> ... and try to start oldconfig with a closed stdin (like we have in Yocto=
):
>   echo -n "" | make oldconfig
>
> When this happens, oldconfig prompts for the value of TEST_KCONFIG but st=
din is closed it get the global default value : an empty string. This is no=
t a valid hex/int value so it prompts again, hence the infinite loop.
>
> I'm having trouble pointing where the bug is exactly :
> * Should the global default value for hex/int be valid in their context? =
(like the minimal value of the range or 0/0x0)
> * Must all int/hex config provide a valid default value? (This is the cas=
e for hex config in the kernel). This would have to be documented somewhere=
 (Some other KConfig implementation did [1])


Presumably, it is reasonable to require explicit 'default' for int/hex.

Most of the int/hex entries in Linux are already doing it.


> * Should all oldconfig/syncconfig/... exit with an error when trying to p=
rompt on a closed stdin? (I might be able to send a patch for this one)

No.
I have seen multiple scripts piping the 'yes' command to Kconfig.
There is no reason to prohibit pipe or redirection.





I think the fastest fix is to send a patch to U-Boot
to add a default for CONFIG_DEBUG_UART_BASE
(and more patches if there are other similar cases).





>
> NB: I know of olddefconfig but in the case of U-boot, syncconfig is used =
at a later stage and the problem appears again.
>
> What do you think?
>
> Regards,
>
> [0]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14136
> [1]: https://docs.zephyrproject.org/1.14.0/guides/kconfig/index.html#redu=
ndant-defaults
> --
> Yoann Congal
> Smile ECS - Tech Expert



--=20
Best Regards
Masahiro Yamada
