Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1739D3D7A48
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jul 2021 17:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhG0P4k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 11:56:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:54194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229720AbhG0P4k (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 11:56:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E3906136F;
        Tue, 27 Jul 2021 15:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627401400;
        bh=4tb1WeA1yxMZbiqCRvE/QSWrfbsh5i+dQ9i2gAEILbA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uLTikFf1s8jckkQ2jsLde76FX/lAhqEB5GL+47frEwZmQBkooo9JqNigpm2TohWjL
         RL6Nn70+M025tATN1sPHZ+fjh56ajMTAxx0OdCuMIqJ3R3VQmFMmpBNbeNbysioCC1
         hV2mUtd5IYm6p5pTtWu+wu+1VTLAGfMWTa94loDc=
Date:   Tue, 27 Jul 2021 17:56:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Wan Jiabing <wanjiabing@vivo.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] scripts: make some scripts executable
Message-ID: <YQAsth0TA3AwtxvK@kroah.com>
References: <20210727153924.79473-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727153924.79473-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 28, 2021 at 12:39:24AM +0900, Masahiro Yamada wrote:
> Set the x bit to some scripts to make them directly executable.
> 
> Especially, scripts/checkdeclares.pl is not hooked by anyone.
> It should be executable since it is tedious to type
> 'perl scripts/checkdeclares.pl'.
> 
> The original patch [1] set the x bit properly, but it was lost when
> it was merged as commit 21917bded72c ("scripts: a new script for
> checking duplicate struct declaration").
> 
> [1] https://lore.kernel.org/lkml/20210401110943.1010796-1-wanjiabing@vivo.com/
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/checkdeclares.pl               | 0
>  scripts/gcc-plugins/gen-random-seed.sh | 0
>  scripts/syscallnr.sh                   | 0
>  scripts/xen-hypercalls.sh              | 0
>  4 files changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 scripts/checkdeclares.pl
>  mode change 100644 => 100755 scripts/gcc-plugins/gen-random-seed.sh
>  mode change 100644 => 100755 scripts/syscallnr.sh
>  mode change 100644 => 100755 scripts/xen-hypercalls.sh

Please no, as other tools (i.e. patch), can not set mode bits, and some
people still rely on patch in places.

If these need to be called by other parts of the build, we should
execute them properly, not rely on the mode settings.

thanks,

greg k-h
