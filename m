Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5101306381
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 19:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343941AbhA0Soy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Jan 2021 13:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343525AbhA0Sol (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jan 2021 13:44:41 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA88C061574;
        Wed, 27 Jan 2021 10:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=qvOVQ+emId709g0fRRromVJAvjd0lfbW3+lzsS9Pf9A=; b=g7GNAB87PYB6KJ9b4Mn3hMyUPC
        5HjWpORzs4qDR/FcrBIOsXK9DfSH7nTIcy4gzCcCanwdbuvF+y1sJjgSdrIr2VLs0MdpdaFXg5ofa
        WORsZI/N82fl6JYXdj4b9kFE27DcSOJjAzPiwDI/avADX6/cY2lHzHoWr8xdBZSQxGqCgy/4N2H3Z
        +culQWyh16I9l69fxoBgKPWtTD2duCWIrrRagA+EGEz9Iy3gbfcml87oW7g1m9GIyj33KGKj/G7Dm
        qZY2r3aiI407tHThpuRYzcsHZIgl0fyFdFpyUiGEk2tED6LxXYe/uIrzMN/KCaJIwNd6RF8OK8Jlg
        lzmDhfzw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l4pmp-007Mme-AY; Wed, 27 Jan 2021 18:43:35 +0000
Date:   Wed, 27 Jan 2021 18:43:27 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210127184327.GA1755516@infradead.org>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210127180215.GA1745339@infradead.org>
 <20210127183856.moe3p5pxw6bbtunk@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127183856.moe3p5pxw6bbtunk@treble>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 27, 2021 at 12:38:56PM -0600, Josh Poimboeuf wrote:
> On Wed, Jan 27, 2021 at 06:02:15PM +0000, Christoph Hellwig wrote:
> > Please don't add all this garbage.  We only add infrastructure to the
> > kernel for what the kernel itself needs, not for weird out of tree
> > infrastructure.
> 
> This isn't new, the kernel already has the infrastructure for building
> out-of-tree modules.  It's widely used.  Are you suggesting we remove
> it?  Good luck with that...
> 
> Either it should be supported, or not.  Make the case either way.  But I
> can't understand why people are advocating to leave it half-broken.


It is not support as any kind of interface.  It is a little aid for
local development.  Adding any kond of complexities for out of tree
modules is a complete no-go.
