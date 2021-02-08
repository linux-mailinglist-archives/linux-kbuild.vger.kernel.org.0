Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F2F313B8D
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Feb 2021 18:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhBHRwX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Feb 2021 12:52:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234992AbhBHRuz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Feb 2021 12:50:55 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A923C061794;
        Mon,  8 Feb 2021 09:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=UkfFdgNX9ewseD8DQkTcogcfdbSnU1zlfGHBdnEbdZE=; b=ZZF57D67T0uW2+eX2W2hDAuxHq
        o+eth4xhEXUIpAwK1aG2TEK3HJ6ZymGrAE4KV9nksRpqnIICRwsG+mg4ZgtOoRjj+UveZJIA+zB2s
        kWaSAU9F7WyRPQ69Wr1CWVz3KeCIsr7LfBpE/nhnHGBrAr5RJw6gwB58wGceNobUWOeS87tlDpoh5
        QcBVRelkNekE6x2xEFde1bX4Vyun1CbdsY9l0U9gKx/JRbdPjMvpsGZRrGacfHsySZoCaRXBHHymY
        WJOhisLKoAvFH9OH2ySsD04uAAicxQ96/tnZISulbbFSLWev89je+UIueVI9A6gO6q/2d0WyUwhRN
        tXpMbFuQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l9Afn-006J2K-Lw; Mon, 08 Feb 2021 17:50:07 +0000
Date:   Mon, 8 Feb 2021 17:50:07 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH] kbuild: simplify access to the kernel's version
Message-ID: <20210208175007.GA1501867@infradead.org>
References: <20210207161352.2044572-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210207161352.2044572-1-sashal@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 07, 2021 at 11:13:52AM -0500, Sasha Levin wrote:
> +		(u8)(LINUX_VERSION_MAJOR), (u8)(LINUX_VERSION_PATCHLEVEL),
> +		(u16)(LINUX_VERSION_SUBLEVEL));

No need for the casts and braces.

Otherwise this looks good, but please also kill off KERNEL_VERSION
and LINUX_KERNEL_VERSION entirely while you're at it.
