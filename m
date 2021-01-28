Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2253A307818
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 15:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbhA1Oav (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 09:30:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbhA1Oak (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 09:30:40 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64CBDC061573;
        Thu, 28 Jan 2021 06:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=z72LpoxZZhEjQSjvA+zDb9r+inOH6Yghk71zYmjuIfM=; b=mW54jTGnHMJZipQZTAjofQ/Zd9
        RWx8RWtJXHJxneBzMyhqI0uDM6MilsL+YrvUEHbMofDMIP9ZrhJ2xbNtukEuuJVo18pjMAn7101H6
        +EZkogGbBcFgwgywJ7UR/kJwu2geeh7ovTpSLqpJgzXsSllZ6xu7iM8jP64H6UVUY8nVoSBYNeYl7
        MZhQoQWveSd1+d4a/5fbnSLwam+YvYPcN8kLRIWCjk6Dl8NE3dsf2UFlXx3aruqlNRBxOeePQ0kWx
        /EHZY0mn1jRO+4mq5eCsGHm6B52HKS8xoz7EMXIPH+g2uYZzzwio5rvU4UCQYBvB8gGHnAcSxHyUa
        WRTWurOQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l58Iy-008ZAB-1r; Thu, 28 Jan 2021 14:29:52 +0000
Date:   Thu, 28 Jan 2021 14:29:52 +0000
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
Message-ID: <20210128142952.GA2041496@infradead.org>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210127180215.GA1745339@infradead.org>
 <20210127183856.moe3p5pxw6bbtunk@treble>
 <20210127184327.GA1755516@infradead.org>
 <20210127185113.c3est2vssf5tlyyq@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127185113.c3est2vssf5tlyyq@treble>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 27, 2021 at 12:51:13PM -0600, Josh Poimboeuf wrote:
> Is this a joke?  I've never met anybody who builds OOT modules as a
> development aid...

I'm pretty sure you've met me before.

> On the other hand I know of several very popular distros (some paid,
> some not) who rely on allowing users/partners to build OOT modules as
> part of their ecosystem.  To say it's not supported is a farce.

This is not a farce.  The kernel only supports infrastructure for the
kernel itself, not for any external consumers.  If you have a business
model that relies on something else you should think hard if you are in
the right business.
