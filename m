Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6912663DC
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Sep 2020 18:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgIKQ0c (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Sep 2020 12:26:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:55304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbgIKPWb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Sep 2020 11:22:31 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 208ED2076C;
        Fri, 11 Sep 2020 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599837751;
        bh=BKLdy4IRivTz8mf+Py2iEA2QbIQ46WCjrnO5DWhj2/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZaScDjksZQfTvPPFWBLq3BHa2J7z1whP1167eiKIIuOZMaV0yYLKTKe7aKsaLt1Nw
         qhddBbhj3e4ZqsKizZZtgyq0I+ERl0AY6xVuYBvOX3ElN3S8vJuWRBnrBgih8Jf7p9
         AAoowWlIZ+c9KM+5aJ8eie4bNrKHofd2gmiLhLZs=
Date:   Fri, 11 Sep 2020 16:22:25 +0100
From:   Will Deacon <will@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        clang-built-linux@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] kbuild: remove cc-option test of -fno-strict-overflow
Message-ID: <20200911152225.GB20374@willie-the-truck>
References: <20200910135120.3527468-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910135120.3527468-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 10, 2020 at 10:51:17PM +0900, Masahiro Yamada wrote:
> The minimal compiler versions, GCC 4.9 and Clang 10 support this flag.
> 
> Here is the godbolt:
> https://godbolt.org/z/odq8h9
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile                          | 2 +-
>  arch/arm64/kernel/vdso32/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This, and the other patch (4/4 -- I didn't see 2 or 3), look good to me.
Are you taking them via the kbuild tree, or shall I queue them in the arm64
tree? Please just let me know what you prefer.

Will
