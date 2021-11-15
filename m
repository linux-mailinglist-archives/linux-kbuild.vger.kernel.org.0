Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0E044FC9F
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Nov 2021 01:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhKOA55 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Nov 2021 19:57:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:48910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229627AbhKOA5x (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Nov 2021 19:57:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EF5F60EFE;
        Mon, 15 Nov 2021 00:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636937699;
        bh=K/bDQvzEk6wg+vkCZMLcZAhWuWHVT9JW8G5cC3fuh8Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gtCzB7X6a3f9Kw2ckghQ7uTuEt4NmGkDM/PyQPnDIbLo8pyU4oVSxAWvXsSpU/51/
         rA3OqLRDftPWoqwr078BT9oGefoyVMS5g/2j+9q09y/+fzG7S77z2HBKf1Y81lDxas
         4iEIVqjHLaZK63lIJr4zenhJ4sT3phdOOwSPV5fGFd85FN+iBGfGVGhjsFSUdMXRKO
         PGlrH2X13X220Lf69NobCuBDBZtScBa/jdsFCFJALi1hhxGnuviwXl2EevB6QtAbYl
         ldYE0Wva72Ow3FS6OmFleoMcToWI572yYxvbl1cWVEyRyBtQk044X6jZOG58nkyCIe
         HSK7/44kvyISA==
Date:   Sun, 14 Nov 2021 19:00:01 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev
Subject: Re: [PATCH] kconfig: Add support for -Wimplicit-fallthrough
Message-ID: <20211115010001.GA44147@embeddedor>
References: <20211114005725.GA27075@embeddedor>
 <YZF9MY6rRLQwdTgM@archlinux-ax161>
 <YZGnL3nfA5876hX3@archlinux-ax161>
 <20211115003501.GA43686@embeddedor>
 <CAK7LNAQY4Y-wnY8wQOuHh5eyVdUBGGP58Uu2aZSe+zdxt7km-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQY4Y-wnY8wQOuHh5eyVdUBGGP58Uu2aZSe+zdxt7km-A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 15, 2021 at 09:44:40AM +0900, Masahiro Yamada wrote:
> On Mon, Nov 15, 2021 at 9:30 AM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> >
> 
> Please use a subject prefix different than "kconfig:"
> 
> I want to see "kconfig:' only for changes in scripts/kconfig/.

How about kbuild for this case, instead?

Thanks
--
Gustavo

