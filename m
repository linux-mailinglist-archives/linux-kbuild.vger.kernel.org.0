Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15161430DE9
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Oct 2021 04:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236807AbhJRCm4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Oct 2021 22:42:56 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:44324 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237610AbhJRCm4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Oct 2021 22:42:56 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 19I2e79V014554;
        Mon, 18 Oct 2021 04:40:07 +0200
Date:   Mon, 18 Oct 2021 04:40:07 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: build reproducibility
Message-ID: <20211018024007.GA14455@1wt.eu>
References: <alpine.DEB.2.22.394.2110172002450.4761@hadrien>
 <7e5485df-a17b-304b-627d-9a85d2464df3@infradead.org>
 <alpine.DEB.2.22.394.2110172041010.4761@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2110172041010.4761@hadrien>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Julia,

On Sun, Oct 17, 2021 at 08:42:31PM +0200, Julia Lawall wrote:
> On Sun, 17 Oct 2021, Randy Dunlap wrote:
> > My "guess" is that this has something to do with the build
> > reusing some current file(s) that need to be rebuilt.
> > I.e., adding a "make clean" or "make proper" might be needed.
> 
> This was my guess too.  But I have the git clean -dfx.  I did a comparison
> with make distclean and this does a little more (mostly some files in
> tools).

Have you tried power-cycling the machine between boots, or just
rebooting on a working kernel before booting again on a faulty one ?
It could be possible that "something" changes a hardware setting that
the BIOS does not touch, leaving your machine in a different state
after you've booted the first problematic kernel. For example, it's
possible to set some CPU MSRs that affect the maximum CPU power, hence
its performance. Normally the BIOS should reset them, but for this it
must know about the one your kernel (or even userland) would set.

Hoping this helps,
Willy
