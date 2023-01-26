Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 638A467C800
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Jan 2023 11:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbjAZKFw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Jan 2023 05:05:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236127AbjAZKFv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jan 2023 05:05:51 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0069311EA7
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Jan 2023 02:05:50 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4P2btw0J1Wz4xZb;
        Thu, 26 Jan 2023 21:05:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1674727549;
        bh=P+pKB31T+nGljehfFqRVXunWhIcYvj3vXGbYNYsut+g=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bIX2pRRDeu7g+dWGMkZsM3GN1RksgQ0vg8jSRQ9hXRcrl+77Sq7usFghmvF/YwEL8
         QN1DqRIrmUnHbUkbkEoydqQLi78FZpgGsGFYKaHA5gWF8Om33Qu5yNwIEY24CptzMU
         NV87WaPFTdj7+K3/ZwQ5A1QM5whAc8BYTSP7Z8uP0sS73VJahbROKSUlhkTI86iB9C
         OTdhJaqhjFCzKTHRiujbfmDhjmyJd9WoeXBbCmZZpqtohOaIPBP8Re/t4+tkjTB+0T
         c+2xWY76nUHDStcvNUQhWPURaHyJ6tbRQQd5Jytfa4uiir2mdVlhFA9Ym/PFIVJDgI
         3DtzUqzp2b9mA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
In-Reply-To: <CAK7LNAROfEi7021v+SkDd=uU1hM_vzuGYvDD6OQ0bJ2Tu0yjvA@mail.gmail.com>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org>
 <871qnjqmmq.fsf@mpe.ellerman.id.au>
 <CAK7LNAR2ASj6bGS6sR5x=cDCDDFW3ZkHRTdsHAY_+JEqojTUNQ@mail.gmail.com>
 <Y9HgXE9kmcfmva1C@dev-arch.thelio-3990X>
 <CAK7LNAROfEi7021v+SkDd=uU1hM_vzuGYvDD6OQ0bJ2Tu0yjvA@mail.gmail.com>
Date:   Thu, 26 Jan 2023 21:05:43 +1100
Message-ID: <87ilgtpq4o.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Thu, Jan 26, 2023 at 11:07 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On Thu, Jan 26, 2023 at 10:29:54AM +0900, Masahiro Yamada wrote:
>> > On Wed, Jan 25, 2023 at 1:11 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> > >
>> > > Nathan Chancellor <nathan@kernel.org> writes:
>> > > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
>> > > > points out that KBUILD_AFLAGS contains a linker flag, which will be
>> > > > used:
>> > >
>> > > Should that say "unused" ?
>> >
>> >
>> >
>> > Nathan, shall I fix it up locally?
>> > (it will change the commit hash, though.)
>>
>> Yes please, if you would not mind. Sorry about that and thank you for
>> spotting it Michael!
>>
>> Since you have to rebase to fix it, you can include Michael's acks?
>>
>> Cheers,
>> Nathan
>
> Done.

Thanks.

cheers
