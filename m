Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792113BE976
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jul 2021 16:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhGGOQE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 10:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbhGGOQE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 10:16:04 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04FE9C061574;
        Wed,  7 Jul 2021 07:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=1beiS8DyOGB4mPJMRb5VvAAAysTju3B6A9C01iJQHKs=; b=rFQ3w5Ja82VoyWKPejP7LFvo0O
        C2O/iPJuJG/H9n7vUa/VKqV1nhTUNbYCTKttBM/5V0XxtJWMoj8Q70ALih5kdZZl5mMw8B5kVWSp/
        p3BlZ1U2JoIa4j/EttU3J6fTKXohRIWqqX/oC1pxW7wYkqRE2eDAVEkX/nWqEm1cJLOqBZ9/46VgO
        5sKmb+xuyBv5BY6aATpcwbMeroYHHu4/H+t39h5kbUABcg4GJL9/QP3A0PDGBukQ1tEJTQvK7gE/q
        rMG43cIDoxKm8cpeMjfbIU3U5qHKwCc09OHXOHU6sYhbYretKRw0aWgJtxzLlyQSwERh32L93C+eF
        itr/f/8A==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m18IM-00CT5V-Fq; Wed, 07 Jul 2021 14:12:59 +0000
Date:   Wed, 7 Jul 2021 15:12:58 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/17] Rust support
Message-ID: <YOW2auE24e888TBE@infradead.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <YOVNJuA0ojmeLvKa@infradead.org>
 <CANiq72mKPFtB4CtHcc94a_y1V4bEOXXN2CwttQFvyzwXJv62kw@mail.gmail.com>
 <YOWjLmg/Z7kr2+tx@kroah.com>
 <YOW1Nj8+a2Yth2++@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOW1Nj8+a2Yth2++@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 07, 2021 at 03:07:50PM +0100, Wedson Almeida Filho wrote:
> Miguel's point is that it does implement the vast majority of binder features
> and is non-trivial, so it could be used as evidence that useful kernel drivers
> can be built with Rust; not just "transpiled" from C, but written with the Rust
> safety guarantees.

binder is not a kernel driver.  It is a ill design IPC mechanism
absolutely no representative for other kernel code.

Please write an actual real driver dealing with real (and common) hardware
and come back with the results.
