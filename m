Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D35F30B71E
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 06:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbhBBFd6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 00:33:58 -0500
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:49441 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231440AbhBBFdv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 00:33:51 -0500
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 1125X8jm028689;
        Tue, 2 Feb 2021 06:33:08 +0100
Date:   Tue, 2 Feb 2021 06:33:08 +0100
From:   Willy Tarreau <w@1wt.eu>
To:     Amy Parker <enbyamy@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: Alternative compilers to GCC/Clang
Message-ID: <20210202053307.GB28542@1wt.eu>
Reply-To: linux-kernel@vger.kernel.org
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Amy,

On Mon, Feb 01, 2021 at 03:31:49PM -0800, Amy Parker wrote:
> Hello! My name's Amy. I'm really impressed by the work done to make
> Clang (and the LLVM toolchain overall) able to compile the kernel.
> Figured I might as well donate my monkey hours to helping make it run
> on other compilers as well. I haven't been able to find any that use
> the same arguments structure as GCC and Clang (read: you can pass it
> in as CC=compilername in your $MAKEOPTS). Any compilers along that
> route anyone here has worked with that I could work with?

If you're interested, you should have a look at TCC (tiny CC) :

     https://repo.or.cz/tinycc.git

It compiles extremely fast, implements some subsets of gcc (a few
attributes for example), but is far from being able to compile a kernel
(at least last time I checked). Its speed makes it very convenient for
development. I made some efforts to make haproxy support it (and provided
some fixes to tcc) as it compiles the whole project in 0.5 second instead
of ~10 seconds with a modern gcc. It could probably compile a kernel in
15-20 seconds if properly supported, and this could be particularly handy
for development and testing.

Regards,
Willy
