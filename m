Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA5D7772EA1
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Aug 2023 21:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjHGT2Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Aug 2023 15:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjHGT2P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Aug 2023 15:28:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8D8E72
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Aug 2023 12:28:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FB6462189
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Aug 2023 19:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855A3C433C8
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Aug 2023 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691436493;
        bh=7kM9XDS5C3j24fp2xVE7pwGaiKOpZPiLUU/N25Ztiew=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GHumo10x5T82gKwEZ180gnZ2SLa1FkubbVxLTB+XwwfVYDF4fWujRrtH9Qnp+PKyW
         QAhFCO/1ffEbovXJ3evnPHh77BYrU+Cc/GNTXwoc0FZ8nIh1fFKME2DmOBdaltzEcU
         5ecqBbGmxgevyzaIFWEXuhLuR9Up7B4+P4UoB7MzsSAvAESSJQ+qd92FyKx71p9Rsa
         P41OCiZntq8HIejueFbQvQ2uaHb3iTXJYrR6tZknl1ip670K6tTQrDOc+SIkdf9/vY
         BksEr5xJegM4Td4o7+N4Itp8IlDI0BzjmAXaNXaFzBQWWYKeWkZHwQRjjrDYe+U2Qu
         hbeEmMPLyMisQ==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-56d0f4180bbso3228169eaf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Aug 2023 12:28:13 -0700 (PDT)
X-Gm-Message-State: AOJu0YxNDeorB8/Ag5FmffZNHRedaYRY+3u5OlpA60p22js8bW2y34bQ
        obL8r4SV5UEFC/2BXxL8JWfKHXRxWHAK2CEwIi4=
X-Google-Smtp-Source: AGHT+IF1nqkvUzgS2bAvVtyn+q+siT6gveobuYLhBJuf/OjbxF89DD1C2Bz1UfOmmorHKIcqnMmlqb5eVMLUIcoJVVE=
X-Received: by 2002:a4a:300f:0:b0:56d:10bb:c2d2 with SMTP id
 q15-20020a4a300f000000b0056d10bbc2d2mr8921387oof.0.1691436492805; Mon, 07 Aug
 2023 12:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <387d7f82-aa8e-759f-7e12-08dfc329c47f@smile.fr>
 <CAK7LNAQHP5B0bSaqdgjD+q5nET-hA=RD+b0t=zZBmnpOV9NvRg@mail.gmail.com> <e14f2645-f8a4-fb48-9e29-d6886b22711b@smile.fr>
In-Reply-To: <e14f2645-f8a4-fb48-9e29-d6886b22711b@smile.fr>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 8 Aug 2023 04:27:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDo+oDhf7zr5mCvaVLrBczBqkvQzcTF=nH7nUSrHUgWg@mail.gmail.com>
Message-ID: <CAK7LNAQDo+oDhf7zr5mCvaVLrBczBqkvQzcTF=nH7nUSrHUgWg@mail.gmail.com>
Subject: Re: oldconfig loop infinitely with a hex/int config without valid
 default and a closed stdin
To:     Yoann Congal <yoann.congal@smile.fr>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 2, 2023 at 8:29=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> On 7/30/23 10:59, Masahiro Yamada wrote:
> > On Sat, Jul 29, 2023 at 12:23=E2=80=AFAM Yoann Congal <yoann.congal@smi=
le.fr> wrote:
> >> Hi,
>
> Hi,
>
> >> While analyzing a Yocto bug[0] I think I've identified a problem in kc=
onfig.
> >> The problem happens if you have a hex or int type config without a def=
ault value.
> >> Like this :
> >>   config TEST_KCONFIG
> >>         hex "Test kconfig"
> >>         # No default value
> >> ... and try to start oldconfig with a closed stdin (like we have in Yo=
cto):
> >>   echo -n "" | make oldconfig
> >>
> >> When this happens, oldconfig prompts for the value of TEST_KCONFIG but=
 stdin is closed it get the global default value : an empty string. This is=
 not a valid hex/int value so it prompts again, hence the infinite loop.
> >>
> >> I'm having trouble pointing where the bug is exactly :
> >> * Should the global default value for hex/int be valid in their contex=
t? (like the minimal value of the range or 0/0x0)
> >> * Must all int/hex config provide a valid default value? (This is the =
case for hex config in the kernel). This would have to be documented somewh=
ere (Some other KConfig implementation did [1])
> >
> > Presumably, it is reasonable to require explicit 'default' for int/hex.
> >
> > Most of the int/hex entries in Linux are already doing it.
>
> Shouldn't this be documented somewhere? (Sorry if it already is, I could =
not find it)


I am more interested in showing a warning
as not all people read the document.






--=20
Best Regards
Masahiro Yamada
