Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 472941984C
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 08:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfEJGVT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 02:21:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:53738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726808AbfEJGVT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 02:21:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BC732175B;
        Fri, 10 May 2019 06:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557469279;
        bh=Z66d2Vn2xlb9VjxzpZ2kAEvngB+d1lg50Gc6MnTLXCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xMm1u3gLqIRjl1JDOc/aQToGdtS1yf9wH5p6NXoiOJ6GIAfL/MlWSfoZLMlMPiw0q
         j2N3/tce0TuE+4T5FjhNcApDT2P7lprAbXl/IxyvOZoJaSzviG0dv0VHzzJkHR75Kp
         EnuzW4vfTRHs8y7IR4M1Zpvbbqs7fv+EQDbRNkW8=
Date:   Fri, 10 May 2019 08:21:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kconfig: do not write .config if the content is the
 same
Message-ID: <20190510062116.GA18014@kroah.com>
References: <20190510061205.28753-1-yamada.masahiro@socionext.com>
 <20190510061205.28753-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510061205.28753-2-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 10, 2019 at 03:12:05PM +0900, Masahiro Yamada wrote:
> Kconfig updates the .config when it exits even if its content is
> exactly the same as before. Since its timestamp becomes newer than
> that of other build artifacts, additional processing is invoked,
> which is annoying.
> 
> - syncconfig is invoked to update include/config/auto.conf, etc.
> 
> - kernel/config.o is recompiled if CONFIG_IKCONFIG is enabled,
>   then vmlinux is relinked as well.
> 
> If the .config is not changed at all, we do not have to even
> touch it. Just bail out showing "No change to .config".
> 
>   $ make allmodconfig
>   scripts/kconfig/conf  --allmodconfig Kconfig
>   #
>   # configuration written to .config
>   #
>   $ make allmodconfig
>   scripts/kconfig/conf  --allmodconfig Kconfig
>   #
>   # No change to .config
>   #
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reported-by: Linus Torvalds <torvalds@linux-foundation.org> ?

:)

Anyway, nice change, looks good to me:


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

