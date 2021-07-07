Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EAC3BEA3B
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jul 2021 17:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbhGGPEu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 11:04:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232200AbhGGPEs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 11:04:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A661661CB2;
        Wed,  7 Jul 2021 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625670128;
        bh=iUEaNmD1G8AtYx+9qSBK4uhIyEmiUz6skAmuZSeVgAM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sp6UbCh6nuEdb2cILd/CA2SPHg0uGN334YlbJyyqdk6XGHIQYJZixCWrMxOInyLan
         /a6PWp2pdC4IhVmnGnkMK6VceFklJVCQY9rdoXdElqUdEG8uIpB+TzIU60tz4OPxO2
         z0ICeTzdVmDeliK8N1DIbIM9rLzJUOzPogoCnZvQ=
Date:   Wed, 7 Jul 2021 17:02:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/17] Rust support
Message-ID: <YOXB7FRqldZik2Xn@kroah.com>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <YOVNJuA0ojmeLvKa@infradead.org>
 <CANiq72mKPFtB4CtHcc94a_y1V4bEOXXN2CwttQFvyzwXJv62kw@mail.gmail.com>
 <YOWjLmg/Z7kr2+tx@kroah.com>
 <YOW1Nj8+a2Yth2++@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOW1Nj8+a2Yth2++@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 07, 2021 at 03:07:50PM +0100, Wedson Almeida Filho wrote:
> > Last I looked at this thing, it was not
> > feature-complete compared to the in-kernel binder code, has that been
> > resolved and the needed filesystem changes added?
> 
> It is not feature-complete in comparison to the C one just yet, it is missing a
> few things but not for any fundamental reason -- we were mostly focusing on the
> kernel crate and tests.

I love it how you call "binderfs is missing" a "few things" :)

> Miguel's point is that it does implement the vast majority of binder features
> and is non-trivial, so it could be used as evidence that useful kernel drivers
> can be built with Rust; not just "transpiled" from C, but written with the Rust
> safety guarantees.

As Christoph said, and I and others have said before, binder is in no
way shape or form anything that resembles any sort of "driver" at all.
It is a crazy IPC mechanism that is tacked onto the side of the kernel.
Not to say that it doesn't have its usages, but the interactions between
binder and the rest of the kernel are very small and specific.
Something that almost no one else will ever write again.

Please work on a real driver to help prove, or disprove, that this all
is going to be able to work properly.  There are huge unanswered
questions that need to be resolved that you will run into when you do
such a thing.

Good luck!

greg k-h
