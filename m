Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA0025A1CC4
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Aug 2022 00:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243989AbiHYWwL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Aug 2022 18:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244166AbiHYWwK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Aug 2022 18:52:10 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7B57FE66;
        Thu, 25 Aug 2022 15:52:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MDJB75nWmz4x1N;
        Fri, 26 Aug 2022 08:51:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1661467920;
        bh=QzUqfZa0fF0JU5NNb8XHyYrURc4kns7FREDr0t9N9RQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=OuII/6zhB03t1wPs832ZkI3lcWzdiIItZjGhSLzkzJUP6iCub2TDgLLw6zyaSU1LL
         R9CKaFW1D8hwbQSLlAL0VzYUFjedsaDAFHvIueylf4Z7PeWh+5B6XKgWUAjxyZ6zn9
         1nF9yTtv3VkSqO90eWNXcCnpkDNqX8f4v3GuRzPp+5Uj1hAATTXWVSMKkXL1G7owKk
         g8hcb2wANfp3nqk8x0dsJwHnVlwlzjI+8YOfFYstdh4reXKyWTvI2IAeY+E6zrZuvi
         Hcf20vWe+CfT1tiItcCVkuWbl2+PvpJrgNk80SuHpsZQfC0TGGb56w6l/QKrf2/ih9
         Iq4RLS+LHqpEw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc: align syscall table for ppc32
In-Reply-To: <CAK7LNAQ8ZQHYzoJTPxiRYBsdVXdYUt=bxyrag-d7UnwQ9r7q=w@mail.gmail.com>
References: <20220820165129.1147589-1-masahiroy@kernel.org>
 <874jy0lpy9.fsf@mpe.ellerman.id.au>
 <CAK7LNAQ8ZQHYzoJTPxiRYBsdVXdYUt=bxyrag-d7UnwQ9r7q=w@mail.gmail.com>
Date:   Fri, 26 Aug 2022 08:51:55 +1000
Message-ID: <87wnawj5ro.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Thu, Aug 25, 2022 at 4:53 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Masahiro Yamada <masahiroy@kernel.org> writes:
>> > Christophe Leroy reported that commit 7b4537199a4a ("kbuild: link
>> > symbol CRCs at final link,  removing CONFIG_MODULE_REL_CRCS") broke
>> > mpc85xx_defconfig + CONFIG_RELOCATABLE=y.
>> >
>> >     LD      vmlinux
>> >     SYSMAP  System.map
>> >     SORTTAB vmlinux
>> >     CHKREL  vmlinux
>> >   WARNING: 451 bad relocations
>> >   c0b312a9 R_PPC_UADDR32     .head.text-0x3ff9ed54
>> >   c0b312ad R_PPC_UADDR32     .head.text-0x3ffac224
>> >   c0b312b1 R_PPC_UADDR32     .head.text-0x3ffb09f4
>> >   c0b312b5 R_PPC_UADDR32     .head.text-0x3fe184dc
>> >   c0b312b9 R_PPC_UADDR32     .head.text-0x3fe183a8
>> >       ...
>> >
>> > The compiler emits a bunch of R_PPC_UADDR32, which is not supported by
>> > arch/powerpc/kernel/reloc_32.S.
>> >
>> > The reason is there exists an unaligned symbol.
>> >
>> >   $ powerpc-linux-gnu-nm -n vmlinux
>> >     ...
>> >   c0b31258 d spe_aligninfo
>> >   c0b31298 d __func__.0
>> >   c0b312a9 D sys_call_table
>> >   c0b319b8 d __func__.0
>> >
>> > Commit 7b4537199a4a is not the root cause. Even before that, I can
>> > reproduce the same issue for mpc85xx_defconfig + CONFIG_RELOCATABLE=y
>> > + CONFIG_MODVERSIONS=n.
>> >
>> > It is just that nobody did not notice it because when CONFIG_MODVERSIONS
>
> I wrote weird English (double negation)
>
> nobody did not notice   --> nobody noticed
>
> Please fix it if you have not yet.

Yeah I did fix it up when applying :)

  It is just that nobody noticed because when CONFIG_MODVERSIONS is
  enabled, a __crc_* symbol inserted before sys_call_table was hiding the
  unalignment issue.

cheers
