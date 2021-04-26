Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE31836B4D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Apr 2021 16:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbhDZO2E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Apr 2021 10:28:04 -0400
Received: from one.firstfloor.org ([193.170.194.197]:39640 "EHLO
        one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233802AbhDZO2D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Apr 2021 10:28:03 -0400
X-Greylist: delayed 382 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Apr 2021 10:28:03 EDT
Received: by one.firstfloor.org (Postfix, from userid 503)
        id ACF8B87339; Mon, 26 Apr 2021 16:20:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firstfloor.org;
        s=mail; t=1619446857;
        bh=QsL2onNoF2HNsEZUwCo22PMI9aRGaByrkAjz43AmnY0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g2TKWM0QeG6liyQIEYA43/T4gpvu9hdvbfixpSlG+1C+6nsaKkPxMBrsqBvZ1qwcO
         CV3J54vyq6E2WL2k6XbQnCpKTb6i76LoH3PMvrJr7zvZNKI9tBgRdarwjc5BY5l7yx
         fcSZtJ7ad41aUXXEjefx6x3IY/d0e8zYiauWRqDg=
Date:   Mon, 26 Apr 2021 07:20:57 -0700
From:   Andi Kleen <andi@firstfloor.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] kbuild, link-vmlinux: Don't delete output files with
 make -i
Message-ID: <20210426142057.okgmsfdsfu5j4csz@two.firstfloor.org>
References: <20210425213521.3159899-1-ak@linux.intel.com>
 <CAK7LNASP3yvjY-7=xTJvuXyEqZ_9uuNhAQYHm7PCXfGHKGbRsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASP3yvjY-7=xTJvuXyEqZ_9uuNhAQYHm7PCXfGHKGbRsg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> How about removing on_exit() and on_signals() entirely?
> 
> .DELETE_ON_ERROR target removes vmlinux on error anyway.
> 
> Leaving intermediate files is safe, I think.

My guess is it because the tmp vmlinux can be rather big.
But makes sense. Build dirs shouldn't be that space
constrained.

We just need to make sure make clean cleans them too.

-Andi
