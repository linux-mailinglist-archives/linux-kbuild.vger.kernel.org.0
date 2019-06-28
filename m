Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFA865A1B8
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2019 19:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfF1RDb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Jun 2019 13:03:31 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:40824 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbfF1RDb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Jun 2019 13:03:31 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 386D080617;
        Fri, 28 Jun 2019 19:03:28 +0200 (CEST)
Date:   Fri, 28 Jun 2019 19:03:26 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH] kbuild: get rid of misleading $(AS) from documents
Message-ID: <20190628170326.GB12826@ravnborg.org>
References: <20190628020433.19156-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628020433.19156-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=m9WLzkJrn2f4Qo16t4EA:9 a=CjuIK1q_8ugA:10
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro.

On Fri, Jun 28, 2019 at 11:04:33AM +0900, Masahiro Yamada wrote:
> The assembler files in the kernel are *.S instead of *.s, so they must
> be preprocessed. Hence, we always use $(CC) as an assembler driver.
> 
> $(AS) is almost unused in Kbuild. As of writing, there is just one user.
> 
>   $ git grep '$(AS)' -- :^Documentation
>   drivers/net/wan/Makefile:  AS68K = $(AS)
> 
> The documentation about *_AFLAGS* sounds like the flags were passed
> to $(AS). This is somewhat misleading since we do not invoke $(AS)
> directly.
Thanks, another of your many nice cleanups.

>  AFLAGS_KERNEL
>  --------------------------------------------------
> -Additional options for $(AS) when used for assembler
> -code for code that is compiled as built-in.
> +Additional options when used for assembling code that is compiled as built-in.
To me reading "assembling code" make me think of something else than the
assembler.
It would be nice to spell out that we talk about the assembler
everywhere. Even though the assembler is invoked via gcc.
This comments applies to a few places, some where "assembling" was used
in the old text.

Other than this - looks good!

	Sam
