Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632903BE33C
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jul 2021 08:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhGGGqq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 02:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbhGGGqq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 02:46:46 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4155C061574;
        Tue,  6 Jul 2021 23:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=eCjoCZTUUUrpQwlZ2gVEXtfu5F2b0mXoNtpwGUgEA2A=; b=c/AJ0FX41pROObhvxIuMFfx6ns
        2+F7abXVsjQDnfx+7mYqJy3VgONfS9Z5b23jzxceElD5X8vkQRFdjGrsZa8K+8sJ5pbUD17vDF+fn
        q809c64dhxNvT0qFJmR5o8IHibp/qDsYnqq2R4Wq7Hm6+t/oqgu28TaFuiGBpHnd7YecnJJQ9Ic7j
        cfbZXuRcNhQ2zNZhQogKEgHeokOjxNZlRkJ4NUDaTx7s4xKIKh78aByYU1Hr2DHPH0dMRlYG7HvIn
        gD96WMtYOWK3CFk6i4QeIY7QdKO14dOclaT51Q5MGDyuh6bGnECZHkERwD6t/fU56aO1LLZgBybLy
        zsWvZkPA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m11Hi-00C8EL-N4; Wed, 07 Jul 2021 06:43:51 +0000
Date:   Wed, 7 Jul 2021 07:43:50 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/17] Rust support
Message-ID: <YOVNJuA0ojmeLvKa@infradead.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Not sure if this is just a state of the union post or if you actually
want to submit it.  If the later I strongly disagree with merging it,
as you should refined it and prove it actually is useful first.  Where
useful would be a real-life driver like say nvme or a usb host
controller driver that actually works and shows benefits over the
existing one.  Until it shows such usefulness it will just drag
everyone else down.
