Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8FAD42C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2019 16:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728503AbfJKOYx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 10:24:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:36588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728394AbfJKOYw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 10:24:52 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7551E206A1;
        Fri, 11 Oct 2019 14:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570803892;
        bh=7WNbNuVGYV5eZL82IZCet7k3ExN3DOziqXTv/0qhn2w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qdijBbRWLgIi6ow0KgKI8n99W/Sxk++JlvicO3KdIs2F4mLiedmPi/GRUUrHaJOcu
         eytioo23qnU7+M3W0YKpmGoUCBhArQ86ryXhkkycOc00lSZ/fKvHpfYA++KrlmFw7g
         CbAM7stPzlFmPfZthvSD9N+LsTYxiErkF1Gu9gHU=
Date:   Fri, 11 Oct 2019 15:24:47 +0100
From:   Will Deacon <will@kernel.org>
To:     Matthias Maennich <maennich@google.com>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH 3/4] symbol namespaces: revert to previous __ksymtab name
 scheme
Message-ID: <20191011142446.nyxhlhsfzcroipnf@willie-the-truck>
References: <20191010151443.7399-1-maennich@google.com>
 <20191010151443.7399-4-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010151443.7399-4-maennich@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 10, 2019 at 04:14:42PM +0100, Matthias Maennich wrote:
> The introduction Symbol Namespaces changed the naming schema of the

Missing "of" ?

> __ksymtab entries from __kysmtab__symbol to __ksymtab_NAMESPACE.symbol.
> 
> That caused some breakages in tools that depend on the name layout in
> either the binaries(vmlinux,*.ko) or in System.map. E.g. kmod's depmod
> would not be able to read System.map without a patch to support symbol
> namespaces. A warning reported by depmod for namespaced symbols would
> look like
> 
>   depmod: WARNING: [...]/uas.ko needs unknown symbol usb_stor_adjust_quirks
> 
> In order to address this issue, revert to the original naming scheme and
> rather read the __kstrtabns_<symbol> entries and their corresponding
> values from __ksymtab_strings to update the namespace values for
> symbols. After having read all symbols and handled them in
> handle_modversions(), the symbols are created. In a second pass, read
> the __kstrtabns_ entries and update the namespaces accordingly.
> 
> Suggested-by: Jessica Yu <jeyu@kernel.org>
> Fixes: 8651ec01daed ("module: add support for symbol namespaces.")
> Signed-off-by: Matthias Maennich <maennich@google.com>
> ---
>  include/linux/export.h | 13 +++++--------
>  scripts/mod/modpost.c  | 33 ++++++++++++++++++---------------
>  scripts/mod/modpost.h  |  1 +
>  3 files changed, 24 insertions(+), 23 deletions(-)

Patch looks fine, and it would be good to have this fixed in 5.4:

Acked-by: Will Deacon <will@kernel.org>

Will
