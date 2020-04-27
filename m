Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDEC1B995C
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2020 10:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgD0IGG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Apr 2020 04:06:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:46530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726561AbgD0IGG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Apr 2020 04:06:06 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF6B92063A;
        Mon, 27 Apr 2020 08:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587974766;
        bh=zj/dt/5c6Yckt6vj2KqloJRjdxQZ9M9SfMwirnXwTA0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OOt6fQ6WwTbtIjRR6IazVyZ/dpJ29bgrWHVtpS2D1cyDvdJmrC90eJzUqyFEE/Xui
         bcorH73RJWhIdoKnpb/jlE/aPzd66uiDRGzRI7wifeMIeHlc1Y8J6PsRpSTAG+CBcq
         DKPGfWzxC/ns3xKK3b2QoOFlEO4KyUvfV/tC2hLc=
Date:   Mon, 27 Apr 2020 09:06:00 +0100
From:   Will Deacon <will@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nathan Huckleberry <nhuck15@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: remove unused AS assignment
Message-ID: <20200427080600.GC11787@willie-the-truck>
References: <20200427003019.2401592-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427003019.2401592-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 27, 2020 at 09:30:19AM +0900, Masahiro Yamada wrote:
> $(AS) is not used anywhere, hence commit aa824e0c962b ("kbuild: remove
> AS variable") killed it.
> 
> Remove the left-over code in arch/{arm,arm64}/Makefile.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/arm/Makefile   | 2 --
>  arch/arm64/Makefile | 2 --
>  2 files changed, 4 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

(If you post the arm64 part as a separate patch, I can pick it up)

Will
