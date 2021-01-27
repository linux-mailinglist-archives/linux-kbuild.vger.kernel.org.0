Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C569E306047
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 16:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235473AbhA0PyR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Jan 2021 10:54:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236550AbhA0Pvy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jan 2021 10:51:54 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F07DC061574;
        Wed, 27 Jan 2021 07:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=yTIh3fBlogzGP2kxjnRGBjLpamHkkFYq65tuvbJ7oyM=; b=tK3T1gCTP/LCO80TXHAxpweUHA
        WVs7v/RB0qsJTGi+vC6SKXOvudWotNS4BTJFd5TA30bo9IaTshShWu1hVB9xWJ9jbpbSQCO7jD5iJ
        vUTGFiRoV6iFNrr1DRSmGZRynNCbuF2U8N+Gms4AjauMK6Z8aUBTLN/FhGROf5ERQaGq/m1DafXbI
        MUiUdR50nGuv2ObTcDaBY7ExjfKO8RN2bDvp3LihtLbq7Xih8Rx9hph6+cA5hUQqlVp1RfnT3n1cT
        zbhReKAH4QwsolguzVq+rIisgx/E8eVGQh43g1aFCkHPt5rxAzRNFQeoOROxgw4OwNX0pshq8UVvr
        RRUy9x2w==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l4n5y-007CWF-4l; Wed, 27 Jan 2021 15:51:03 +0000
Date:   Wed, 27 Jan 2021 15:51:02 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Sami Tolvanen <samitolvanen@google.com>,
        Trilok Soni <tsoni@codeaurora.org>,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Jeff Johnson <jjohnson@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC 0/2] Kbuild: Support nested composite objects
Message-ID: <20210127155102.GA1709780@infradead.org>
References: <1611343638-28206-1-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611343638-28206-1-git-send-email-eberman@codeaurora.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 22, 2021 at 11:27:16AM -0800, Elliot Berman wrote:
> This series was developed after discussion in https://lkml.org/lkml/2021/1/19/850
> 
> The motivation for this series is an out-of-tree module which contains a large
> number of source files. This causes Kbuild to exceed the maximum command line
> argument length when linking the files. Proposal here permits composite objects

Please don't even try to bloat the kernel build system for this.
Thanks!
