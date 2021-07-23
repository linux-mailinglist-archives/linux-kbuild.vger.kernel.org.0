Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A1F3D3C2A
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jul 2021 17:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235409AbhGWO1f (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Jul 2021 10:27:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:34272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235351AbhGWO1f (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Jul 2021 10:27:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E875260EBC;
        Fri, 23 Jul 2021 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627052888;
        bh=QgDjEfpuy0APKmZWIXq1ynq1Oo4VifnevoiZPA+uy8k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RwE3xnBUH4mgZomNTeTmUIFAb9P0s4pApOLRObsCuXTi+kB88S6MNGykFqwhpjaqm
         NEGfDAB2i9Cz9RPXI4Wd5uGVSkS3HCSxkKGj4itwAYz9Ayd57kGv+h1pbRy0RWBrR0
         CeI8nWoE8OPm8pFKt/PhdveXblQifatUqUSszKSDEoPJCkMETXItZyCU4LgpGvrq92
         YBUihj5oR9hg+tAVJOZy5AnKGjGAkSj4ROnL7ObIkc4++nkh3NN9VUc5+RcVQ29p5O
         AoMZPKYjQqx169nTUvpidCqL5Yhn7XS6DV8pmbcQe98bYptRBbxdmX10GTWIpAiDwa
         vmYoucGbHqbbg==
Date:   Fri, 23 Jul 2021 08:08:06 -0700
From:   Keith Busch <kbusch@kernel.org>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Finn Behrens <finn@kloenk.dev>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/17] Rust support
Message-ID: <20210723150806.GA2021417@dhcp-10-100-145-180.wdc.com>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <YOVNJuA0ojmeLvKa@infradead.org>
 <CANiq72mKPFtB4CtHcc94a_y1V4bEOXXN2CwttQFvyzwXJv62kw@mail.gmail.com>
 <YOWjLmg/Z7kr2+tx@kroah.com>
 <YOW1Nj8+a2Yth2++@google.com>
 <YOXB7FRqldZik2Xn@kroah.com>
 <BFD5298D-00CD-4FEF-AE77-61E69AF78604@kloenk.dev>
 <YOZNuEtNbsLxRM0R@casper.infradead.org>
 <YPn3fgDX8uNkF8Vp@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPn3fgDX8uNkF8Vp@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 22, 2021 at 11:55:58PM +0100, Wedson Almeida Filho wrote:
> On Thu, Jul 08, 2021 at 01:58:32AM +0100, Matthew Wilcox wrote:
> > A simple NVMe driver is less than a thousand lines of C.
> > I know the one in the kernel now is ridiculously complicated and has
> > been thoroughly messed up with abstractions to support NVMeoF instead
> > of having a separate driver, but it's really a simple interface at heart.
> 
> The latest NVMe spec is 452 pages long, which seems to contradict your claim
> that it's simple. In any case, translating less than 1K lines of C shouldn't be
> too hard (after I've built the abstractions, of course). Would you mind sharing
> the simple driver you mention above?

You can use the 1.0 spec, which is much shorter. A 1.0 capable driver
should be forward compatible with newer devices, too.

The current nvme driver became less simple since blk-mq integration and
has only gotten more complicated since then with other transports and
more advanced features. For a simpler example, you can reference an in
kernel version <= 3.16, and ignore the "nvme-scsi" parts.
