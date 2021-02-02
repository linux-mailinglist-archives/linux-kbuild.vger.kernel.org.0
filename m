Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E38430CE20
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 22:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbhBBVlw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 16:41:52 -0500
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:49450 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231526AbhBBVlo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 16:41:44 -0500
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 112Lf1C9029878;
        Tue, 2 Feb 2021 22:41:01 +0100
Date:   Tue, 2 Feb 2021 22:41:01 +0100
From:   Willy Tarreau <w@1wt.eu>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Amy Parker <enbyamy@gmail.com>, linux-kernel@vger.kernel.org,
        linux-gcc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Michael Matz <matz@suse.de>
Subject: Re: Alternative compilers to GCC/Clang
Message-ID: <20210202214101.GA29871@1wt.eu>
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
 <20210202053307.GB28542@1wt.eu>
 <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
 <CAE1WUT7zprk-3naBGwZk=bsVR8Od=PT0kqNO6EVBQUOG+F1h3w@mail.gmail.com>
 <20210202201920.GA18106@zn.tnic>
 <20210202210039.GB29751@1wt.eu>
 <20210202212048.GG18075@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210202212048.GG18075@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 02, 2021 at 10:20:48PM +0100, Borislav Petkov wrote:
> It would be good to start forward-porting and integrating some of the
> fixes and even extend tcc to handle some of the gnuisms we're using in
> the kernel so that we can build the kernel with it too.

I agree. And the team is responsive and shows great consideration for
patches.

> I can imagine having CONFIG_TCC - as long as that doesn't get too
> intrusive and get in the way of things - and those who wanna build the
> kernel with it, can enable it. For example...

I like this idea. It's way better than having to implement everything
at once or degrade some code just to make it build. It could be solved
at config time by automatically excluding some features.

It should also be less of a hassle than dealing with many gcc versions
because if we see it as a development speed up tool we can easily accept
that we occasionaly break compatibility with older of its versions and
that those who want to use it just rebuild the latest one (it's trivial
and fast, basically "make" and you're done, not the typical toolchain
experience). You don't care if it doesn't work for one week, you're not
supposed to ship any form of official code built with it anyway. It's
just an aid, and a nice one.

Willy
