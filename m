Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD2BC6A8D5B
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Mar 2023 00:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjCBXxK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Mar 2023 18:53:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjCBXxJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Mar 2023 18:53:09 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4EB125BC
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Mar 2023 15:53:07 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSSbL53c3z4x1R;
        Fri,  3 Mar 2023 10:53:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1677801183;
        bh=xuqUkcOcM+A60OFN+8mffp69qEpQc4jR8LVTswUzgd8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=o3WsOut0g4DzM8MBqXBE3rEuKste6e7hZgsYIRNyrWZTaa5U/M/AIDCigOzTyTP0h
         ZlkeLkC9WLYjpFBDAtW32+VXOA+aYExDouGbFHhcbqOOijhrQMKWLpF2UIN+rUtxx0
         myCFggwdzcDH80OlPSrdoaVdvpzdXHDiG4bVfN+lDtLApZah2hgTXJWngrLtBm/7XH
         G9W/KK7rFS1uCZ05p/EC0ZOebO8qyPJUD7af5cuNnia6846hNI6U+btvgGtgNcZrI6
         yoT3oUONElMQKUXzpktEreDjV7/jymv3fEtmhDaOlvLS9dE1xZSXQR3/pxKlgaMLDh
         X1t9k25cbIobg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/2] powerpc/64: Use -mtune=pwr10/9/8 for clang
In-Reply-To: <20230302164324.GB3010526@dev-arch.thelio-3990X>
References: <20230302131656.50626-1-mpe@ellerman.id.au>
 <20230302131656.50626-2-mpe@ellerman.id.au>
 <20230302164324.GB3010526@dev-arch.thelio-3990X>
Date:   Fri, 03 Mar 2023 10:53:02 +1100
Message-ID: <878rgelnhd.fsf@mpe.ellerman.id.au>
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
> Hi Michael,
>
> Thanks for the workaround and sorry this has come to bite us :/
>
> On Fri, Mar 03, 2023 at 12:16:56AM +1100, Michael Ellerman wrote:
>> For the -mtune option clang doesn't accept power10/9/8, instead it
>> accepts pwr10/9/8. That will be fixed in future versions of clang, but
>> the kernel must support the clang versions in the wild.
>> 
>> So add support for the "pwr" spelling if clang is in use.
>> 
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>
> I think that should actually be
>
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>

I guess yeah.

>> BugLink: https://github.com/ClangBuiltLinux/linux/issues/1799
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks.

>> ---
>>  arch/powerpc/platforms/Kconfig.cputype | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> Need to confirm the clang <= 16 statement is correct.
>
> Currently, this is indeed the case. It is possible that Nemanja's patch
> will get applied to release/16.x before 16.0.0 final but it might not.
>
> We can always update it later. I think we do want to push to get that
> patch applied because I forgot that it is only in 16.0.0 that '-mtune'
> starts to do something on PowerPC:
>
> https://github.com/llvm/llvm-project/commit/1dc26b80b872a94c581549a21943756a8c3448a3
>
> Prior to that change, '-mtune' was accepted but did nothing. It is only
> once it was hooked up to the backend that we got the spew of warnings. I
> think that warrants us trying to get Nemanja's patch into 16.0.0, which
> may allow us to drop this workaround altogether...

Aha OK, I missed that the warning was new in 16.

I'll sit on this for now then until we know if that change will make it
into clang 16.

cheers
