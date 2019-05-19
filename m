Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9941B22815
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2019 19:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbfESRwc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 May 2019 13:52:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:44542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727883AbfESRwV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 May 2019 13:52:21 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E8592133F;
        Sun, 19 May 2019 07:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558250214;
        bh=ZxpcTYPDeqA9hbzxoEyOc3nx7/tnxge/HI1C8VBQqYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nsTXLDLl6k6AfhgV4VI11c6wRNUeVKzo7OdR3OyZx5DCAsDslojLJhhg3rf5QUwe4
         QQC/MEh/Bj7FNOAhS8BVbxEbqXZsJun7tGtQ/9ys1kQDEC+g+Weueu4aAbVG+/VtOx
         LPFZCfi6m5U9rjQZ87ubIqn1hIs3x+JBFFEmIpXY=
Date:   Sun, 19 May 2019 09:16:51 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Bernd Petrovitsch <bernd@petrovitsch.priv.at>,
        Alexander Kapshuk <alexander.kapshuk@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: check uniqueness of module names
Message-ID: <20190519071651.GA19681@kroah.com>
References: <1558109235-23042-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558109235-23042-1-git-send-email-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 18, 2019 at 01:07:15AM +0900, Masahiro Yamada wrote:
> In the recent build test of linux-next, Stephen saw a build error
> caused by a broken .tmp_versions/*.mod file:
> 
>   https://lkml.org/lkml/2019/5/13/991
> 
> drivers/net/phy/asix.ko and drivers/net/usb/asix.ko have the same
> basename, and there is a race in generating .tmp_versions/asix.mod
> 
> Kbuild has not checked this before, and it suddenly shows up with
> obscure error message when this kind of race occurs.
> 
> Non-unique module names cause various sort of problems, but it is
> not trivial to catch them by eyes.
> 
> Hence, this script.
> 
> It checks not only real modules, but also built-in modules (i.e.
> controlled by tristate CONFIG option, but currently compiled with =y).
> Non-unique names for built-in modules also cause problems because
> /sys/modules/ would fall over.
> 
> I tested allmodconfig on the latest kernel, and it detected the
> following:
> 
> warning: same basename if the following are built as modules:
>   drivers/regulator/88pm800.ko
>   drivers/mfd/88pm800.ko
> warning: same basename if the following are built as modules:
>   drivers/gpu/drm/bridge/adv7511/adv7511.ko
>   drivers/media/i2c/adv7511.ko
> warning: same basename if the following are built as modules:
>   drivers/net/phy/asix.ko
>   drivers/net/usb/asix.ko
> warning: same basename if the following are built as modules:
>   fs/coda/coda.ko
>   drivers/media/platform/coda/coda.ko
> warning: same basename if the following are built as modules:
>   drivers/net/phy/realtek.ko
>   drivers/net/dsa/realtek.ko
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
