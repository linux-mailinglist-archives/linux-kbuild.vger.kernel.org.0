Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97F540EA9A
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Sep 2021 21:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243994AbhIPTH0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Sep 2021 15:07:26 -0400
Received: from mail.skyhub.de ([5.9.137.197]:56646 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346824AbhIPTHU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Sep 2021 15:07:20 -0400
Received: from zn.tnic (p200300ec2f11c600a255bc81368aa6d8.dip0.t-ipconnect.de [IPv6:2003:ec:2f11:c600:a255:bc81:368a:a6d8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 547CF1EC02DD;
        Thu, 16 Sep 2021 21:05:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1631819153;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=GPHrZA8eT90xnNQWKOPWxTxqG3zYBZeppwwDINVeVlk=;
        b=KqdrJwPq/XcXtA1xTAjF6t7sSSpsnbf4CC4VEl5vj1j6bWcQ1mSjqkBtcx7WGsBgXAYyOh
        6rUcKZsHXmyuZRcll8L/yZRZPAtaQHpIA2JScNf6qbqVpvff91bLLLLYoPPwmLh9FHHyph
        KIOHb5OWWW9aRUKRVskbnoh6LvIa2/8=
Date:   Thu, 16 Sep 2021 21:05:47 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] x86: Do not add -falign flags unconditionally for
 clang
Message-ID: <YUOVi6dDqR20qsmx@zn.tnic>
References: <20210824022640.2170859-1-nathan@kernel.org>
 <20210824022640.2170859-2-nathan@kernel.org>
 <YUN8coiEx3JZQytc@zn.tnic>
 <4d88e0ed-422d-447a-ea8f-36e54b38fac1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4d88e0ed-422d-447a-ea8f-36e54b38fac1@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 16, 2021 at 11:42:19AM -0700, Nathan Chancellor wrote:
> Done, I'll be sure to keep that prefix in mind for future flag-based
> changes.

Yeah, what you could do in the future is

git log <filename>

and see the previous prefixes. But not that important - we fix those
usually before applying.

> Sure thing, kind of hard to do that on the initial submission but I will do
> it for the v2 shortly :)

Haha, very hard. :-)

> Thank you for the ack. The conflicting changes that I mentioned in the cover
> letter have been merged in 5.15-rc1 so if you guys want to take these
> changes via -tip, just holler for an ack from Masahiro on the second patch
> on v2 (but I am going with the assumption this will be merged via the kbuild
> tree).

I'm fine either way. So whatever Masahiro prefers.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
