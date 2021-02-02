Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F255E30B8DA
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 08:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhBBHnr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 02:43:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbhBBHno (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 02:43:44 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACA1C061788;
        Mon,  1 Feb 2021 23:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=GTTfpsR4IK4LxzOgI1aGeZfqhLOjs1dzptijFaJWsxs=; b=WggDBW9Cl/cCdoY1Mcr4UW6N6P
        7DGjDITwMv0LNX7VsuslAT8/mCBu65UxspByL3woDE7qbA2S72t4ytM1D2cjCDrT2qmdA5K5Wcffx
        WOng7vGvl5Xr7V6R3jDMkZ91RU5V49yuRa9ZTBO3p2vDFVPhj41kD4yMhgxpLlanRhQ4ZaXNBGx4p
        xskZLgu6xrwaMo3SkRx9KCX01ANIvbQEfZ4nK2TlQmkzqA/WlNDQWqaJB1lJ5d7an854tDmxIBksG
        n6k1pOc6HglM6W+REmzTgLB0pky4cUuAuHUtlxv3jZcnFhbcKWexJbfktYT+xFndTyM2Z4I/rUS3A
        dGi4IqUg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l6qKj-00EsJP-C0; Tue, 02 Feb 2021 07:42:45 +0000
Date:   Tue, 2 Feb 2021 07:42:45 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>
Subject: Re: [PATCH v6] modules: introduce the MODULE_SCMVERSION config
Message-ID: <20210202074245.GA3545218@infradead.org>
References: <20210121213641.3477522-1-willmcvicker@google.com>
 <CABYd82Yk91u287iZvkUik+UYg2mHMpHimZzsg72cXOK6k8WpRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABYd82Yk91u287iZvkUik+UYg2mHMpHimZzsg72cXOK6k8WpRg@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Just to deposit my opposition again:  I don't think this hack for your
out of tree builds has any place in the kernel tree.
