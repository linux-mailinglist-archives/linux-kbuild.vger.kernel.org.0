Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95452CF3CF
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 19:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgLDSS6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Dec 2020 13:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgLDSS5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Dec 2020 13:18:57 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947FAC0613D1;
        Fri,  4 Dec 2020 10:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Nlb27gOIz2SmsAyu6K72xtrnZxBbjqGUhaedoDoNJ5U=; b=v81Nqn1QAIeCQWqVcMHNHb8ovS
        aCoM6YQ27ZI+zBYptGpbs7neLx847cQHyVkFNnKfjhuTbY6bhypvfgrFlgKoT2qLLK1sbKqwVwvzd
        WndUrufh1oGnrjOXDlD337yx9os+D61CZp1GEkPX5eQNmBB81IpDGe6bIjGDowzD2ZCsD3aKrCQC9
        48WDG979Fw1IlzLDIYebxAwT8UL8259V7Nsmcuo6mbcysuqFp9/5LRk0N7XRbpgkjrXSaluSiOe1W
        KUvnZ7nOjPcbkLq9bxC1Cpi7NqZMVOUCRDy2qE3t9P7k8ufpzpsJAnh44FEPOAWIprwvGF6KLh/Ul
        VHLDxenw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1klFej-0006v1-1b; Fri, 04 Dec 2020 18:18:09 +0000
Date:   Fri, 4 Dec 2020 18:18:08 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v2 0/2] Adds support to capture module's SCM version
Message-ID: <20201204181808.GA26478@infradead.org>
References: <CAGETcx8unBFUHxM67VdOoaWRENGXYoc4qWq2Oir=2rUyJ7F5nA@mail.gmail.com>
 <20201125010541.309848-1-willmcvicker@google.com>
 <X8mEhIeYeMjZc/+7@google.com>
 <20201204075159.GA29752@infradead.org>
 <X8p8ZK1sXQ2E7hSA@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8p8ZK1sXQ2E7hSA@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Dec 04, 2020 at 10:13:56AM -0800, Will McVicker wrote:
> On Fri, Dec 04, 2020 at 07:51:59AM +0000, Christoph Hellwig wrote:
> > I think your decription still shows absolutely no benefit for the
> > kernel, so I'not sure why anyone would want to waste time on this.
> Hi Christoph,
> 
> Did you get a chance to read my earlier responses regarding the uses for
> in-tree modules?
> 
> The biggest benefit for the upstream community is being about to get the SCM
> version for *any* module (including in-tree modules) in the initramfs via the
> sysfs node. Currently there is no way to do that and there is no guarantee that

That assumes the SCM version of a module has any kind of meaning for
an in-tree module.  Which it doesn't.  If you care about the SCM version
of an in-tree module the only thing we need is one single global sysfs
file.
