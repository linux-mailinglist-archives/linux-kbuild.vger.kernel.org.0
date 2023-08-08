Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79E20774975
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Aug 2023 21:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233795AbjHHT4D (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Aug 2023 15:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjHHTzp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Aug 2023 15:55:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8CC67693
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Aug 2023 11:10:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CD2B062992
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Aug 2023 18:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3364BC433C8
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Aug 2023 18:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691517759;
        bh=y+bRzZEI+/uaEjLsFPrnsVbMgwvQeO3bTp1RLft5tGY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dtKuGOV7HSKyDqCTTPb96i2G+koap94M+5AoHF/oAPDTUUgQHD9IinFm8XxUgl3lg
         3zBbHBF/kDoyyvozr4b2d0psryFnoAJkR1XgpWq/XwHVCD0fTNiU86ZDA6iFy0lHuk
         opg46wMkEvGY5r6ikHOXhxX3Pe0RVQGF3Z08l23evthpx+3gacch79+HmQZWq/qpW+
         3GA9pgvQ5lpcjXgfmbQUPu6glMsyN64Vwxka1tTVdDUAch833+w6ADupcqHjuPsxPu
         4pfcNQ1VeBKu1oss1+hcsskY+tR6YM8Wm3jEMMIcAGQaZmWht8zAKjZHjBAy6+I/OS
         /JuZXbJL4GpUA==
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-56cca35d8c3so3225264eaf.3
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Aug 2023 11:02:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxo8jUpd6qBk4r30U9zN1KreQb1rxwA0UOcZj0foBmdM4VJTVO8
        2bECMuhktFM/Z1MOM5o4+vVAgUosu1dsv4cshGE=
X-Google-Smtp-Source: AGHT+IEZIdJw3D/wjNYKCyyj16WHw2TZ5efp/pHvCarVG6Vpo8X10HNFeHZB/qcqtQ06Vh/NRIMirTG9lHYTpsvX0ZU=
X-Received: by 2002:a4a:6d4a:0:b0:56d:2adf:80db with SMTP id
 w10-20020a4a6d4a000000b0056d2adf80dbmr570998oof.3.1691517758517; Tue, 08 Aug
 2023 11:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=KCT-aqcWctRPVhEoOjkjP+y5TpNK1hV9mq6PuZDvApQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=KCT-aqcWctRPVhEoOjkjP+y5TpNK1hV9mq6PuZDvApQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 9 Aug 2023 03:02:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNASVZLYh1PZ_0QqVEfopGHUKq8fCVDmpKDZfODzgspPXEQ@mail.gmail.com>
Message-ID: <CAK7LNASVZLYh1PZ_0QqVEfopGHUKq8fCVDmpKDZfODzgspPXEQ@mail.gmail.com>
Subject: Re: missing separator. Stop. after rebuild
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 9, 2023 at 2:31=E2=80=AFAM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> $ wget https://download.01.org/0day-ci/archive/20230808/202308081050.sZEw=
4cQ5-lkp@intel.com/config
> -O .config
> $ make LLVM=3D1 ARCH=3Dum -j128 arch/um/drivers/port_kern.o
> $ make LLVM=3D1 ARCH=3Dum -j128 arch/um/drivers/port_kern.o
> arch/um/drivers/.hostaudio_kern.o.cmd:843: *** missing separator.  Stop.
> $ sed -n -e 842p -e 843p arch/um/drivers/.hostaudio_kern.o.cmd
> $(deps_arch/um/drivers/hostaudio_kern.o):
> o)
>
> Any idea if this is some form of malformed Makefile rule, or actually
> a compiler bug generating these .cmd files?


Presumably, this is the same symptom as Jiri Slaby reported
some time ago.

If you run a single build for arch/um/drivers/*, bad things may happen.

He reported.
  This leads often to corrupted arch/um/arch/um/drivers/.ssl.o.cmd.

https://lore.kernel.org/linux-kbuild/92f4dfe9-eb87-766b-271a-e57ada3a7dbd@k=
ernel.org/


A patch exists in ML.

https://lore.kernel.org/all/20230721171857.3612639-2-masahiroy@kernel.org/



I really want to stop using core-y or drivers-y in arch/*/Makefile.



--=20
Best Regards
Masahiro Yamada
