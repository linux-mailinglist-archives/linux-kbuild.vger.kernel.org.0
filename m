Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 103572C01F8
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 10:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgKWJDF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 04:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgKWJDF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 04:03:05 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B601C0613CF;
        Mon, 23 Nov 2020 01:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=JDpXGCHvWNgNlns7tmEcP2rIqPer/1GssjPOAGQyYj4=; b=QOVjHe7UKNijwCGwiVtd9gYH7S
        4ekSVBvIYDe3HjI3M8cVI0Kq/AT3U4d1Ivuxbsns5kW/B/J74/6GjJvQcuTNeq8B09tto9dhsp1x6
        77UevXuRrxvvvgIJpwaC7pGmMzXRNAPyPhxotrnSoDx9VtUOweUBGzr7cJjwnlkXeiBoaTTVGJu1n
        ubXxZQmJ8c2e23S9gs67hmBpaTmeha1yySuqQjorWtE42szisAZBmrFOvoTisElhIst7DQilhQw9t
        20/eH5M3RCYwTbkJsJWGELCASLQR1aNcpVVKzN7qEcPXml2O+L5HfGiLBVTnJfLhvPnTFPpI+BBTz
        VO46cxGg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kh7kP-00030G-6h; Mon, 23 Nov 2020 09:02:57 +0000
Date:   Mon, 23 Nov 2020 09:02:57 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@google.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/2] Add support to capture external module's SCM
 version
Message-ID: <20201123090257.GB6334@infradead.org>
References: <20201121011652.2006613-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201121011652.2006613-1-willmcvicker@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 21, 2020 at 01:16:49AM +0000, Will McVicker wrote:
> These two patches add module support to capture an external module's SCM
> version as a MODULE_INFO() attribute. This allows users to identity the SCM
> version of a given kernel module by using the modinfo tool or on the device
> via sysfs:

As this obviously is of no use for in-tree modules it falls under the we
don't add code to support things that are not in tree rule and has no
business in the kernel.
