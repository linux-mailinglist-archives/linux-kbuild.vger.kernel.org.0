Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7418430B91
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Oct 2021 20:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344453AbhJQSon (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Oct 2021 14:44:43 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:16483 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231517AbhJQSom (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Oct 2021 14:44:42 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Alu3RXasYaaCFfrr/5E0jv4Rd7skDXdV00zEX?=
 =?us-ascii?q?/kB9WHVpm5Sj5qWTdYcgpHvJYVEqKQodcLG7SdG9qBznlKKdjbN6AV7mZniFhI?=
 =?us-ascii?q?LKFvAZ0WKB+V3d8kTFn4Y36U4jSdkcNDSaNzRHZLPBjjVQZOxO/DDoys2VbKzl?=
 =?us-ascii?q?vhBQpElRGsddBilCe3+mLnE=3D?=
X-IronPort-AV: E=Sophos;i="5.84,326,1620684000"; 
   d="scan'208";a="534379835"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Oct 2021 20:42:31 +0200
Date:   Sun, 17 Oct 2021 20:42:31 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Randy Dunlap <rdunlap@infradead.org>
cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: build reproducibility
In-Reply-To: <7e5485df-a17b-304b-627d-9a85d2464df3@infradead.org>
Message-ID: <alpine.DEB.2.22.394.2110172041010.4761@hadrien>
References: <alpine.DEB.2.22.394.2110172002450.4761@hadrien> <7e5485df-a17b-304b-627d-9a85d2464df3@infradead.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On Sun, 17 Oct 2021, Randy Dunlap wrote:

> On 10/17/21 11:12 AM, Julia Lawall wrote:
> > Hello,
> >
> > If I do the following:
> >
> > git clean -dfx
> > cp saved_config .config
> > make olddefconfig && make && make modules_install && make install
> >
> > Should I always end up with the same kernel, regardless of the kernel that
> > is currently running on the machine?
> >
> > I see a large performance difference between Linux 5.10 and all versions
> > afterwards for a particular benchmark.  I am unable to bisect the problem
> > eg between 5.10 and 5.11, because as soon as I come to a kernel that gives
> > the bad performance, all of the kernels that I generate subsequently in
> > the bisecting process (using the above commands) also have the bad
> > performance.
> >
> > It could of course be that I have completely misinterpreted the problem,
> > and it has nothing to do with the kernel.  But I have tested the program a
> > lot when only working on variants of Linux 5.9.  I only start to have
> > problems when I use versions >= 5.11.
>
> Hi,
>
> My "guess" is that this has something to do with the build
> reusing some current file(s) that need to be rebuilt.
> I.e., adding a "make clean" or "make proper" might be needed.

This was my guess too.  But I have the git clean -dfx.  I did a comparison
with make distclean and this does a little more (mostly some files in
tools).

thanks,
julia

>
> I say this only because sometimes I cannot even reproduce
> a build that has errors or warnings unless I prefix it with
> make clean or mrproper. (i.e., nothing to do with booting
> and running the new kernel)
> Even though the .config file has changed and I do
> "make olddefconfig", the same build errors do not show up
> unless I do the clean or mrproper step also.
>
>
> --
> ~Randy
>
