Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 409645A60FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Aug 2022 12:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiH3KoH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Aug 2022 06:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbiH3KoF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Aug 2022 06:44:05 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13A99F754;
        Tue, 30 Aug 2022 03:44:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MH3nr5wnlz4xG6;
        Tue, 30 Aug 2022 20:44:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1661856241;
        bh=7FFszpKAwHkUcxfIIXTrsjmWHYTLLEAcEncl3AbzgmY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=fVf/5xnChhmP5DNHOSS9QSyyCN2N3VX7gGKy3eglqlHvJuahftMSqb1BlXSI9rrDX
         6DP3LrXiQXRsB05renWOiocFqYxY6u+JvWhyAgxQMcFdeoBKSj2pDJ+7uM2dZbBiRO
         SrkQFagFwarD+ForSxKLf234yS6ScXJQQJjah00n8cFUjgFncZ8ZfzWyst8FL6Uwon
         F9NbMQUnA6MHgi+jMKkSDYjde0gnDgZSLiCKDJu/LsUAp8pPtme9dzAmdrmmWMcbeY
         zfH3AaHP1JvZm+QsJljRKHTVELGAUWcEsC1jQOE0VRBTjrt3dkJIityRWZ2OMwN3e4
         Ybf3KFKj11ciw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Daniel Axtens <dja@axtens.net>,
        Heiko Carstens <hca@linux.ibm.com>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc: clean up binutils version check
In-Reply-To: <7daf34ca-ed5e-90ea-8ccc-6821127cbd96@csgroup.eu>
References: <20220827164056.3365356-1-masahiroy@kernel.org>
 <58a90319-668f-7c87-4168-e0df10644aa7@csgroup.eu>
 <CAK7LNATJiQc5HMdsct1S5z15-b1fzc5-Y2xtBs6oT17Na79H_w@mail.gmail.com>
 <7daf34ca-ed5e-90ea-8ccc-6821127cbd96@csgroup.eu>
Date:   Tue, 30 Aug 2022 20:43:56 +1000
Message-ID: <87o7w2j9jn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 27/08/2022 =C3=A0 20:03, Masahiro Yamada a =C3=A9crit=C2=A0:
>> On Sun, Aug 28, 2022 at 2:37 AM Christophe Leroy
>> <christophe.leroy@csgroup.eu> wrote:
>>> Le 27/08/2022 =C3=A0 18:40, Masahiro Yamada a =C3=A9crit :
>>>> The checkbin in arch/powerpc/Makefile errors out if ld <=3D 2.24.
>>>> So, the requirement on PPC is binutils >=3D 2.25. It is cleaner to
>>>> specify it in scripts/min-tool-version.sh. If binutils < 2.25 is
>>>> used, the toolchain check will fail in the Kconfig stage going
>>>> forward.
>>>>
>>>> Since binutils >=3D 2.25 is already required, another version test
>>>> for --save-restore-funcs on PPC64 is always met.
...
>>>> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
>>>> index 250925aab101..7df9f2150ea1 100755
>>>> --- a/scripts/min-tool-version.sh
>>>> +++ b/scripts/min-tool-version.sh
>>>> @@ -14,7 +14,13 @@ fi
>>>>
>>>>    case "$1" in
>>>>    binutils)
>>>> -     echo 2.23.0
>>>> +     if [ "$SRCARCH" =3D powerpc ]; then
>>>
>>> Isn't this limitation only for ppc64le ?
>>>
>>> Refer commit 60e065f70bdb ("powerpc: Reject binutils 2.24 when building
>>> little endian")
>>=20
>> I do not see any CONFIG check in the current checkbin.
>>=20
>> Refer commit a3ad84da0760 ("powerpc/toc: Future proof
>> kernel toc")
>
> That's odd. There is no toc on PPC32.

I think that's just a bug in a3ad84da0760.

But that means we inadvertantly dropped support for 2.24 about 8 months
ago, and no one noticed.

Let's see what the responses are to Nick's proposal to increase the
minimum to 2.25.1.

cheers
