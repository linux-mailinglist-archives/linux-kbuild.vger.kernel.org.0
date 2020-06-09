Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D989B1F3402
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2020 08:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgFIGUP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jun 2020 02:20:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:49554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726886AbgFIGUO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 02:20:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15C0220760;
        Tue,  9 Jun 2020 06:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591683614;
        bh=exUDV2J9JxWIk54v1sf9Jxd5EhusLTjEp6+l+MK3hf0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hfXiNDu+MHItIX1POBiMTgAXiCJsANVm44QN6el+qusXnvzP8Ldc5d+6SN+xbLkJR
         g+t/wiNisdoKFTM58QaOhTGMMNs/2J8Ij2FWWKux9aLGzeL4ZCD3f6vSbQAPavpWVE
         g2PGUSzNp/Mu/V8piMlMDRnVJZG+O9x1ix07vyvM=
Date:   Tue, 9 Jun 2020 08:20:12 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: make module name conflict fatal error
Message-ID: <20200609062012.GA499862@kroah.com>
References: <20200511042149.1712876-1-masahiroy@kernel.org>
 <20200608020256.GA256950@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608020256.GA256950@roeck-us.net>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 07, 2020 at 07:02:56PM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Mon, May 11, 2020 at 01:21:49PM +0900, Masahiro Yamada wrote:
> > I think all the warnings have been fixed by now. Make it a fatal error.
> > 
> 
> Not entirely. With this patch in the tree, I get:
> 
> Building sparc64:allmodconfig ... failed
> --------------
> Error log:
> error: the following would cause module name conflict:
>   drivers/char/adi.ko
>   drivers/input/joystick/adi.ko
> make[1]: *** [modules_check] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [__sub-make] Error 2
> 
> Reverting this patch fixes the problem.

As it doesn't look like either of these drivers can be "auto-loaded"
based on hardware detection, I don't know what to suggest as for
renaming either of them.

Any ideas?

thanks,

greg k-h
