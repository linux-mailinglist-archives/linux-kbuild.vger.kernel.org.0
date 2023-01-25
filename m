Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5576867A988
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Jan 2023 05:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjAYEMb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Jan 2023 23:12:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjAYEM3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jan 2023 23:12:29 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CD53E600
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Jan 2023 20:12:27 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4P1r5j0GJRz4xyY;
        Wed, 25 Jan 2023 15:12:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1674619946;
        bh=leUmDE+CZ32bv0Iqn7DI7Je7HT39oOea5EznvVolH2A=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=D/u0rmtQPBZO4VOc1rVoVtHOn4lBMOTL7Bc/hB9ejP5Zvln/aVBEQKvxRiPsxfeAR
         8CZKcCDA4U1VqKP02X1wgsodQXh1gWRK4+FtKZmmUijJuwGMvCFHKeg+k9j8ho4wQ/
         AOWD0AizqG/goj4UgMFID/48DHvs+iD7x3gIddS6KxXrX00koFM2yxItHaukxIG11C
         efuu1M6CVsvEE86PcKXdkps2ccpkGZ5+zmTjDaDriXmXby07g0JrE5GIOS6r9Etrve
         JjP8gE9UvzCB5zUMQI778oAIRz6DLG6gxCSuqAQVThv2Irmq07KWd14+ZuWcTFATIl
         z6pT44cH9Sjgg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Nathan Chancellor <nathan@kernel.org>, masahiroy@kernel.org
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 06/14] powerpc/vdso: Remove unused '-s' flag from
 ASFLAGS
In-Reply-To: <20221228-drop-qunused-arguments-v2-6-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-6-9adbddd20d86@kernel.org>
Date:   Wed, 25 Jan 2023 15:12:24 +1100
Message-ID: <87y1prp80n.fsf@mpe.ellerman.id.au>
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
> warns:
>
>   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
>
> The compiler's '-s' flag is a linking option (it is passed along to the
> linker directly), which means it does nothing when the linker is not
> invoked by the compiler. The kernel builds all .o files with '-c', which
> stops the compilation pipeline before linking, so '-s' can be safely
> dropped from ASFLAGS.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
> ---
> Cc: mpe@ellerman.id.au

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
