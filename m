Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94CF64328A2
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Oct 2021 22:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhJRUyd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Oct 2021 16:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhJRUyc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Oct 2021 16:54:32 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D2FC06161C;
        Mon, 18 Oct 2021 13:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ZV5+WcCEKk90ojpXM/Oql5rLKslHw/tmipq6bTY9rn8=; b=ycMUFEsjkqUPB4ncHsCJB+IHFK
        XRKYg4ag3GWc/xw/zHMblCYs/27Wrp9RnHIgrYEFznE2ZSdqefZE/WhclnstlUtoeRfKxhLdW0d2P
        RmS/8MFTaPaw111dlZ/EMWkgFjG3T0uOAbcSMyN1ZeFPvjmayoUHuJX3wghntVmzPUVvuudXfG06h
        9ghxu/n7+rR+wAQHD/zyUCjrx+uqdLmzGHJ8aSAzqPHRnPTI1XmQNcw6Tgmh3FoD/yToM81aKpj95
        j7Wgl6fmEh/WaxLmuT3ntpnO9uBrt2qM5RtJY7V6KZ3qn1UO/yR1cve1J229lVf98Uznj0PlzVy/N
        XxKy7dFg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mcZcH-00HFWp-Lo; Mon, 18 Oct 2021 20:52:17 +0000
Date:   Mon, 18 Oct 2021 13:52:17 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Vegard Nossum <vegard.nossum@oracle.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: Kconfig issue with LOG_CPU_MAX_BUF_SHIFT + BASE_SMALL
Message-ID: <YW3egZRCwQPsnuMM@bombadil.infradead.org>
References: <f6856be8-54b7-0fa0-1d17-39632bf29ada@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6856be8-54b7-0fa0-1d17-39632bf29ada@oracle.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 18, 2021 at 11:21:22AM +0200, Vegard Nossum wrote:
> The most straightforward fix seems to be change init/Kconfig and
> LOG_CPU_MAX_BUF_SHIFT to say:
> 
>   default 12 if BASE_SMALL=0
>   default 0 if BASE_SMALL!=0

Thanks for reporting! Please feel free to send a patch with a Fixes
annotation.

> In fact, I'm not sure what the point of BASE_SMALL is in the first
> place. Should we get rid of it altogether? (git blame says it's been
> there since the initial commit.)

That's just the inverse of BASE_FULL, if you'd like to remove BASE_SMALL
take it up with the folks with added BASE_FULL, but I have a feeling
that may not be something they are up for.

  Luis
