Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6B067C260
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Jan 2023 02:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbjAZBae (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Jan 2023 20:30:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjAZBae (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Jan 2023 20:30:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE5A4698
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Jan 2023 17:30:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AC4BA61729
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Jan 2023 01:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E27C4339C
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Jan 2023 01:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674696632;
        bh=9Lh0ux9Zjc+mk8Ceh0QCNDAViDCua68lGhmuTig8r+w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KtA+CZIwrH2qb+NoBg9EilsCesGAwuRFzBgPw9ft82cmuEAuuKVJrb4djefWh/u2W
         jufWPMY6x55uBlfYyLUyOD3huU90EFEWLQxXmu8n3O7PUFUZH6VgiQYmgNhus/lpsi
         cvcTbOWvypkWDeegrFmzYB9R4irpqtIjmK7BK7oZLGC4962oxd66t1P0SdBhwcCwM/
         9INhR1YaJq4T1iZpHafFdTkaj4PO9OKt5D6+wuqIQ0q41q3cM3AA39BZL1Lp3pBNHC
         yaBl3aOeveTk/3dmmryrxW87A0rs3qj34wzoEqkbjBWltF+hJLu6VJjWrzJEKZ6VdM
         armPQIea1APnw==
Received: by mail-oi1-f180.google.com with SMTP id s124so262579oif.1
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Jan 2023 17:30:32 -0800 (PST)
X-Gm-Message-State: AFqh2krkvy9aGWn6YhHbZfoqwQ+rsuotDCgHSDSEpFUNuFqhyhZ0g9Qi
        bNbtFxLogp+nv7QhWFbmVmfwippp3rIvAni+zXw=
X-Google-Smtp-Source: AMrXdXsfvPvL2urzZZqRicG4SfEFSLP9JKSv0AoUExWqN2ZCFertmu8zVDPffGSN+eWZWjZTXnLVCYhlaPJoasY3fXM=
X-Received: by 2002:a05:6808:1786:b0:35e:7c55:b015 with SMTP id
 bg6-20020a056808178600b0035e7c55b015mr2087600oib.287.1674696631283; Wed, 25
 Jan 2023 17:30:31 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org> <871qnjqmmq.fsf@mpe.ellerman.id.au>
In-Reply-To: <871qnjqmmq.fsf@mpe.ellerman.id.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 26 Jan 2023 10:29:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR2ASj6bGS6sR5x=cDCDDFW3ZkHRTdsHAY_+JEqojTUNQ@mail.gmail.com>
Message-ID: <CAK7LNAR2ASj6bGS6sR5x=cDCDDFW3ZkHRTdsHAY_+JEqojTUNQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Nathan Chancellor <nathan@kernel.org>, ndesaulniers@google.com,
        nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 25, 2023 at 1:11 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Nathan Chancellor <nathan@kernel.org> writes:
> > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > points out that KBUILD_AFLAGS contains a linker flag, which will be
> > used:
>
> Should that say "unused" ?



Nathan, shall I fix it up locally?
(it will change the commit hash, though.)





>
> >   clang: error: -Wl,-a32: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> >
> > This was likely supposed to be '-Wa,-a$(BITS)'. However, this change is
> > unnecessary, as all supported versions of clang and gcc will pass '-a64'
> > or '-a32' to GNU as based on the value of '-m'; the behavior of the
> > latest stable release of the oldest supported major version of each
> > compiler is shown below and each compiler's latest release exhibits the
> > same behavior (GCC 12.2.0 and Clang 15.0.6).
> >
> >   $ powerpc64-linux-gcc --version | head -1
> >   powerpc64-linux-gcc (GCC) 5.5.0
> >
> >   $ powerpc64-linux-gcc -m64 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
> >   .../as -a64 -mppc64 -many -mbig -o /dev/null /tmp/cctwuBzZ.s
> >
> >   $ powerpc64-linux-gcc -m32 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
> >   .../as -a32 -mppc -many -mbig -o /dev/null /tmp/ccaZP4mF.sg
> >
> >   $ clang --version | head -1
> >   Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214622.5
> >
> >   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
> >     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
> >    "/usr/bin/powerpc64-linux-gnu-as" "-a64" "-mppc64" "-many" "-o" "/dev/null" "/tmp/null-80267c.s"
> >
> >   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
> >     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
> >    "/usr/bin/powerpc64-linux-gnu-as" "-a32" "-mppc" "-many" "-o" "/dev/null" "/tmp/null-ab8f8d.s"
> >
> > Remove this flag altogether to avoid future issues.
> >
> > Fixes: 1421dc6d4829 ("powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> > Cc: mpe@ellerman.id.au
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> cheers



-- 
Best Regards
Masahiro Yamada
