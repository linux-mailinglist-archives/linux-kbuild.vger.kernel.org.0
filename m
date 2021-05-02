Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C70370F75
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 May 2021 00:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbhEBWcX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 May 2021 18:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbhEBWcW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 May 2021 18:32:22 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A5DC06174A;
        Sun,  2 May 2021 15:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=sxg9T1l2P1TCAt0KGvVd11DgxmUSs0be5EJPC9/f71E=; b=udzO03mH7WI7B+E+YTdUOwtAf1
        pjHtqAcqFvgk6A/VPnylKxmrsD2lIsft1hfQrFKrFeNBtjNS6w+ZE+mHiu5d5gHPflr/5ZEY0rMY3
        j/Vp83jF/iLnG6XdNPzIyF+mF5/lYl4l1cbzzG1WNvagPbMrY6WOJxtjqyegDj+NUVKUcLudh1Jxj
        aIs6ARBcGAieZGWtA+1xInBrNjRM1WzTAXphw3z434iaMpsXozUAAxgXsgOVhK/ROYowwzYtHNMjt
        qTvAIs7sHWprczN8zI56TNESOK3PApv5dUV0ZiJ8bjyK89wcLViH+1YjrBh3jVl2hZIW2BIswvKuA
        GSIUL4Rg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1ldKbH-00EKpr-87; Sun, 02 May 2021 22:30:19 +0000
Date:   Sun, 2 May 2021 23:30:07 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Segher Boessenkool <segher@kernel.crashing.org>,
        Joe Perches <joe@perches.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210502223007.GZ1847222@casper.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 02, 2021 at 02:08:31PM -0700, Linus Torvalds wrote:
> What is relevant is what version of gcc various distributions actually
> have reasonably easily available, and how old and relevant the
> distributions are. We did decide that (just as an example) RHEL 7 was
> too old to worry about when we updated the gcc version requirement
> last time.
> 
> Last year, Arnd and Kirill (maybe others were involved too) made a
> list of distros and older gcc versions. But I don't think anybody
> actually _maintains_ such a list. It would be perhaps interesting to
> have some way to check what compiler versions are being offered by
> different distros.

fwiw, Debian 9 aka Stretch released June 2017 had gcc 6.3
Debian 10 aka Buster released June 2019 had gcc 7.4 *and* 8.3.
Debian 8 aka Jessie had gcc-4.8.4 and gcc-4.9.2.

So do we care about people who haven't bothered to upgrade userspace
since 2017?  If so, we can't go past 4.9.
