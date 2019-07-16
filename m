Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 888676A8F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 14:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfGPMyw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 08:54:52 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51426 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfGPMyw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 08:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=xhpoIoqvW1VJHZbGo76qDnYFPD0KXuaoqgNk9c8CJVc=; b=AkELagJ1jf90vb6oxee/3qDgv
        HgR1FVs3sShL5SAO0VNewuCryMUIh9Ym0pv6qYUqwgv0Z+1SQbbLwYD/jJ9SLwshhKUnZADyJqT7e
        6lsZAX/IQCCrICvcQlgOfjCKgV6n8McEoZBQdoGMplfYX+crTN+Pq2hC1H/KbcujApeq2V3icbGA3
        HoHI7AVFF8Q08wNKAkU577dEjUlTyQpILETb2dt6dOiKoP7kyYMb81rpuLJ/xk1nauLwTrYEWHBlR
        JbiAUnmPY+1Pe9Qhsi12EU5DTsypRkGxtkQU0Waz9sOe09x2rhoM5F9o7rhbURBOcwuGJP1qvoc7M
        24wR5XNOA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnMyn-0002rE-D7; Tue, 16 Jul 2019 12:54:49 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id CB3EE20B172C9; Tue, 16 Jul 2019 14:54:47 +0200 (CEST)
Date:   Tue, 16 Jul 2019 14:54:47 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: kbuild: Fail if gold linker is detected
Message-ID: <20190716125447.GZ3402@hirez.programming.kicks-ass.net>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 16, 2019 at 02:47:56PM +0200, Thomas Gleixner wrote:
> The gold linker has known issues of failing the build in random and
> predictible ways. H.J. stated:
> 
>   "Since building a workable kernel for different kernel configurations
>    isn't a requirement for gold, I don't recommend gold for kernel."
> 
> So instead of dealing with attempts to duct tape gold support without
> understanding the root cause, fail the build when gold is detected.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Right, life is too short to fight toolchains that aren't interested in
working.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  scripts/Kconfig.include |    3 +++
>  1 file changed, 3 insertions(+)
> 
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -35,5 +35,8 @@ ld-option = $(success,$(LD) -v $(1))
>  $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
>  $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
>  
> +# Fail if the linker is gold as it's not capable of linking the kernel proper
> +$(error-if,$(success, command -v $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
> +
>  # gcc version including patch level
>  gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
