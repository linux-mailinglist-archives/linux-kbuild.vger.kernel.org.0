Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68684430FF4
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Oct 2021 07:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbhJRFx0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Oct 2021 01:53:26 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:25935
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229533AbhJRFx0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Oct 2021 01:53:26 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AF3W7oqhXV7W3I79BNV5miBCsVHBQXt0ji2hC?=
 =?us-ascii?q?6mlwRA09TyX4rbHLoB1173TJYVoqMk3I3OrgBEDiewK4yXcW2+ks1N6ZNWHbUS?=
 =?us-ascii?q?mTXeJfBODZrQEIdReTygcQ79YDT4FOTOy1N1R8gMrgiTPUL/8ryrC8n5yVuQ?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.84,326,1620684000"; 
   d="scan'208";a="396192502"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 07:51:13 +0200
Date:   Mon, 18 Oct 2021 07:51:13 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Willy Tarreau <w@1wt.eu>
cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: build reproducibility
In-Reply-To: <20211018024007.GA14455@1wt.eu>
Message-ID: <alpine.DEB.2.22.394.2110180746440.3174@hadrien>
References: <alpine.DEB.2.22.394.2110172002450.4761@hadrien> <7e5485df-a17b-304b-627d-9a85d2464df3@infradead.org> <alpine.DEB.2.22.394.2110172041010.4761@hadrien> <20211018024007.GA14455@1wt.eu>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On Mon, 18 Oct 2021, Willy Tarreau wrote:

> Hello Julia,
>
> On Sun, Oct 17, 2021 at 08:42:31PM +0200, Julia Lawall wrote:
> > On Sun, 17 Oct 2021, Randy Dunlap wrote:
> > > My "guess" is that this has something to do with the build
> > > reusing some current file(s) that need to be rebuilt.
> > > I.e., adding a "make clean" or "make proper" might be needed.
> >
> > This was my guess too.  But I have the git clean -dfx.  I did a comparison
> > with make distclean and this does a little more (mostly some files in
> > tools).
>
> Have you tried power-cycling the machine between boots, or just
> rebooting on a working kernel before booting again on a faulty one ?
> It could be possible that "something" changes a hardware setting that
> the BIOS does not touch, leaving your machine in a different state
> after you've booted the first problematic kernel. For example, it's
> possible to set some CPU MSRs that affect the maximum CPU power, hence
> its performance. Normally the BIOS should reset them, but for this it
> must know about the one your kernel (or even userland) would set.

OK, thanks for the suggestions.  My impression is that there is a real
performance problem in 5.11.  The part I don't understand is why once I
have booted that kernel, all of the kernels I make afterwards have the
same performance characteristics.

If I do git clean -dfx, then copy a fixed configuration to .config, and
then use make olddefconfig, should anything about the currently running
kernel have an impact on the kernel that is produced?

I'll try simply rebooting the machine on each git bisect step.  That
should eliminate one more aspect of local state.

thanks,
julia
