Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E0A409BCB
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Sep 2021 20:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237610AbhIMSJu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Sep 2021 14:09:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:51804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235056AbhIMSJu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Sep 2021 14:09:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1037560EE9;
        Mon, 13 Sep 2021 18:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631556514;
        bh=ywiRedTR5zeyIz8MBcSAEfY/rfpHmNISjeocjDRzgzI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ebY5qZQgF1O3prH+NZwpoV4lCtWt2UxvQ5jFaOgo7IXSYrbpjzXRtH922oEnxs3it
         2XhK0/vgQSpcYzsJIOVPFWyCbS/ttldHMSOu+uVg3mlpRyEWZeri9nIfEmJhWM0sEZ
         agYIhsPLnOMEyop3PBPTR0/s2/ZA4Di+8wwGXLOl7v7w1WH8o2dRxLSKGnZjK0h20+
         OBdlyinH0cCnqG9pciu2ac1mdkMsInmDRZk9doY+Oo7Tx6bhpfO9z2s0aUQbhUKiCn
         tY0t5TGXo4XRHyAjIN5N+YSZeNIwOHiWxPAAqAeFftQkYILXS3EAVuIjuBe6FPYBrW
         ro0TK5fH2UK/g==
Date:   Mon, 13 Sep 2021 11:08:19 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Cc:     "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] Harden clang against unknown flag options
Message-ID: <YT+Tk55IKG/PyYgr@archlinux-ax161>
References: <20210824022640.2170859-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824022640.2170859-1-nathan@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 23, 2021 at 07:26:38PM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> This series cleans up an issue that was noticed by the kernel test robot
> where flags that clang does not implement support for are
> unconditionally added to the command line, which causes all subsequent
> calls to cc-{disable-warning,option} to fail, meaning developers are
> flooded with unnecessary and pointless warnings.
> 
> I hope the patches in and of themselves are reasonable and
> non-controversial. This is based on Masahiro's kbuild tree as there was
> a fairly large refactor around where clang's flags were added so I
> figured it would be best to go there with an x86 ack since the first
> patch does not depend on anything in -tip.
> 
> Cheers,
> Nathan
> 
> Nathan Chancellor (2):
>   x86: Do not add -falign flags unconditionally for clang
>   kbuild: Add -Werror=ignored-optimization-argument to CLANG_FLAGS
> 
>  arch/x86/Makefile_32.cpu | 12 +++++++++---
>  scripts/Makefile.clang   |  4 ++++
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> 
> base-commit: fb3fdea450305d932d933d7e75eead0477249d8e
> -- 
> 2.33.0
> 
> 

Hello x86 folks,

Would you guys be able to give me feedback on this series or accept it?
We are continuously getting false positive warning reports from i386 randconfigs.

https://lore.kernel.org/r/ece61908-f8eb-4c45-5d5f-bfc52f3b8f45@kernel.org/
https://lore.kernel.org/r/YT+RqrkQAOVhbkWu@archlinux-ax161/

Cheers,
Nathan
