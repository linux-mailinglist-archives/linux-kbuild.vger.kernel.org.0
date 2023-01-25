Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBEB67A985
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Jan 2023 05:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjAYELg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Jan 2023 23:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjAYELd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jan 2023 23:11:33 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7009E49573
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Jan 2023 20:11:31 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4P1r4Y6yPLz4xwp;
        Wed, 25 Jan 2023 15:11:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1674619888;
        bh=490Aut76SVYQ50BiNDD2OExog3lplcLjgXShI99t2n8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=MxyyPw5qPPKCGFjUGIO9bcDDwFZzx5BzmupP5hnIjnqlE3hVjGBviuL4ucBfqRnIo
         ZvaI1hB4vaKh0+/LbDn3uJ/A4YnJlLfZIh7r4fuLAzc9WfudUncgSIEc8dgqWkzvyp
         g1eFesoLTUQnfwiRc5G7arZIdn2W4c0u6SypVEQLAkASmDa66+Yb68l8JQtPomf7TO
         6EvybHLpJhkNQm/4Tu3F3fKxAhCtGAQOE5S6nTCKnFftUvmiY2cbLNVnwLaGhBiIBA
         EFRgvFs1KV7owWDwopxw+JFuEfYfxTiB74dM5RLvL4q00bTfItirHeWyXKHvCRFjwc
         Q5eH65HxXGDIA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Nathan Chancellor <nathan@kernel.org>, masahiroy@kernel.org
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
In-Reply-To: <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org>
Date:   Wed, 25 Jan 2023 15:11:25 +1100
Message-ID: <871qnjqmmq.fsf@mpe.ellerman.id.au>
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

Nathan Chancellor <nathan@kernel.org> writes:
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> points out that KBUILD_AFLAGS contains a linker flag, which will be
> used:

Should that say "unused" ?

>   clang: error: -Wl,-a32: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>
> This was likely supposed to be '-Wa,-a$(BITS)'. However, this change is
> unnecessary, as all supported versions of clang and gcc will pass '-a64'
> or '-a32' to GNU as based on the value of '-m'; the behavior of the
> latest stable release of the oldest supported major version of each
> compiler is shown below and each compiler's latest release exhibits the
> same behavior (GCC 12.2.0 and Clang 15.0.6).
>
>   $ powerpc64-linux-gcc --version | head -1
>   powerpc64-linux-gcc (GCC) 5.5.0
>
>   $ powerpc64-linux-gcc -m64 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
>   .../as -a64 -mppc64 -many -mbig -o /dev/null /tmp/cctwuBzZ.s
>
>   $ powerpc64-linux-gcc -m32 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
>   .../as -a32 -mppc -many -mbig -o /dev/null /tmp/ccaZP4mF.sg
>
>   $ clang --version | head -1
>   Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214622.5
>
>   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
>     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
>    "/usr/bin/powerpc64-linux-gnu-as" "-a64" "-mppc64" "-many" "-o" "/dev/null" "/tmp/null-80267c.s"
>
>   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
>     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
>    "/usr/bin/powerpc64-linux-gnu-as" "-a32" "-mppc" "-many" "-o" "/dev/null" "/tmp/null-ab8f8d.s"
>
> Remove this flag altogether to avoid future issues.
>
> Fixes: 1421dc6d4829 ("powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Cc: mpe@ellerman.id.au

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
