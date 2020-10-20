Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65655293A1A
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Oct 2020 13:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393373AbgJTLho (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Oct 2020 07:37:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:52826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393361AbgJTLho (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Oct 2020 07:37:44 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31BE22173E;
        Tue, 20 Oct 2020 11:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603193863;
        bh=2zCir24O0t7kmJm4N3nVBboIcPTEjdjSKiHza2K8S34=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NURBkOROng+LL+bOQ3x30vblL7WTwJloDS6KRFVoVeuo3MtICYbXRNx2otIOg9s6P
         wHWiYEmNueTGJvDFiYBco85k01Z589Uo1P1UKeHfuQkdzTLKcjDZhy3y1q4m33w/90
         y1i4Sdj35FmZ0McEsj6K5+Fs/IX4VGIH42XgJzFI=
Date:   Tue, 20 Oct 2020 12:37:38 +0100
From:   Will Deacon <will@kernel.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: [PATCH v2] arm64: vdso32: Allow ld.lld to properly link the VDSO
Message-ID: <20201020113738.GC16084@willie-the-truck>
References: <20201013033947.2257501-1-natechancellor@gmail.com>
 <20201020011406.1818918-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020011406.1818918-1-natechancellor@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 19, 2020 at 06:14:07PM -0700, Nathan Chancellor wrote:
> As it stands now, the vdso32 Makefile hardcodes the linker to ld.bfd
> using -fuse-ld=bfd with $(CC). This was taken from the arm vDSO
> Makefile, as the comment notes, done in commit d2b30cd4b722 ("ARM:
> 8384/1: VDSO: force use of BFD linker").
> 
> Commit fe00e50b2db8 ("ARM: 8858/1: vdso: use $(LD) instead of $(CC) to
> link VDSO") changed that Makefile to use $(LD) directly instead of
> through $(CC), which matches how the rest of the kernel operates. Since
> then, LD=ld.lld means that the arm vDSO will be linked with ld.lld,
> which has shown no problems so far.
> 
> Allow ld.lld to link this vDSO as we do the regular arm vDSO. To do
> this, we need to do a few things:
> 
> * Add a LD_COMPAT variable, which defaults to $(CROSS_COMPILE_COMPAT)ld
>   with gcc and $(LD) if LLVM is 1, which will be ld.lld, or
>   $(CROSS_COMPILE_COMPAT)ld if not, which matches the logic of the main
>   Makefile. It is overrideable for further customization and avoiding
>   breakage.
> 
> * Eliminate cc32-ldoption, which matches commit 055efab3120b ("kbuild:
>   drop support for cc-ldoption").
> 
> With those, we can use $(LD_COMPAT) in cmd_ldvdso and change the flags
> from compiler linker flags to linker flags directly. We eliminate
> -mfloat-abi=soft because it is not handled by the linker.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1033
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---

Cheers, I'll try to remember to queue this at -rc1 but please feel free to
resend then to remind me :)

Will
