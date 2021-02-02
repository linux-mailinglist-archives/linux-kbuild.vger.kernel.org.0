Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E26430CD8C
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 22:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234000AbhBBVBt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 16:01:49 -0500
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:49446 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232563AbhBBVBd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 16:01:33 -0500
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 112L0dpN029850;
        Tue, 2 Feb 2021 22:00:39 +0100
Date:   Tue, 2 Feb 2021 22:00:39 +0100
From:   Willy Tarreau <w@1wt.eu>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Amy Parker <enbyamy@gmail.com>, linux-kernel@vger.kernel.org,
        linux-gcc@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: Alternative compilers to GCC/Clang
Message-ID: <20210202210039.GB29751@1wt.eu>
Reply-To: linux-kernel@vger.kernel.org
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
 <20210202053307.GB28542@1wt.eu>
 <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
 <CAE1WUT7zprk-3naBGwZk=bsVR8Od=PT0kqNO6EVBQUOG+F1h3w@mail.gmail.com>
 <20210202201920.GA18106@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210202201920.GA18106@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 02, 2021 at 09:19:20PM +0100, Borislav Petkov wrote:
> On Tue, Feb 02, 2021 at 11:11:32AM -0800, Amy Parker wrote:
> > On Tue, Feb 2, 2021 at 8:26 AM Amy Parker <enbyamy@gmail.com> wrote:
> > > > It compiles extremely fast, implements some subsets of gcc (a few
> > > > attributes for example), but is far from being able to compile a kernel
> > >
> > > Well, we'll see what I can do with that. :)
> > 
> > Well, just installed it and tried building the kernel. Fails every file. :)
> > 
> > It's definitely something to work towards - but I don't know if kernel
> > advancements requiring newer GCC versions will go slow enough to allow
> > TCC improvements to arise. This isn't just something like with Clang
> > where a few tweaks to files and to Clang itself did the trick.
> 
> Maybe this'll help you find something to do:
> 
> https://www.youtube.com/watch?v=iU0Z0vBKrtQ
> 
> Yes, it would be lovely to be able to compile the kernel with tcc but it
> is not going to be trivial.

In any case there will always be numerous limitations, but at least being
able to perform the basic build check with limited options could save quite
some time to many developers. Using gcc once the tcc-based "typo check"
passes would already be a nice start. Getting the kernel to boot would
indeed be a huge step forward! In haproxy we can only build with threading
disabled and it works slowly but sufficiently for basic tests and printf-
based debugging. It's convenient for bisecting certain bugs.

Thanks for the video Boris, I wasn't aware of it, definitely interesting!

Willy
