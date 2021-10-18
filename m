Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5EB3431014
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Oct 2021 07:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhJRGBx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Oct 2021 02:01:53 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:44368 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229735AbhJRGBw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Oct 2021 02:01:52 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 19I5xTKq016171;
        Mon, 18 Oct 2021 07:59:29 +0200
Date:   Mon, 18 Oct 2021 07:59:29 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: build reproducibility
Message-ID: <20211018055929.GB15718@1wt.eu>
References: <alpine.DEB.2.22.394.2110172002450.4761@hadrien>
 <7e5485df-a17b-304b-627d-9a85d2464df3@infradead.org>
 <alpine.DEB.2.22.394.2110172041010.4761@hadrien>
 <20211018024007.GA14455@1wt.eu>
 <alpine.DEB.2.22.394.2110180746440.3174@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2110180746440.3174@hadrien>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 18, 2021 at 07:51:13AM +0200, Julia Lawall wrote:
> My impression is that there is a real
> performance problem in 5.11.  The part I don't understand is why once I
> have booted that kernel, all of the kernels I make afterwards have the
> same performance characteristics.
> 
> If I do git clean -dfx, then copy a fixed configuration to .config, and
> then use make olddefconfig, should anything about the currently running
> kernel have an impact on the kernel that is produced?

Normally not at all, especially if you restart from a fixed .config. By
the way, you should compare the resulting .config after "make oldconfig"
for all your kernels, in case you spot a difference there, but there is
no reason for that difference to depend on the currently running kernel.
Or maybe it detects something related to your machine and adjusts the
.config accordingly, and that detection depends on the running kernel
(e.g. CPU affecting default optims etc) ? If that's the case you'll see
it in the final .config.

> I'll try simply rebooting the machine on each git bisect step.  That
> should eliminate one more aspect of local state.

Just to be avoid wasting your time, perform a cold reboot (reset button).
If you just do a hot reboot and the problem persists, there will still
be a tiny part of doubt leaving a "what if" in your mind that will make
you want to run it all again.

Willy
