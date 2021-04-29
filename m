Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358BA36EC56
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 16:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240018AbhD2O1K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 10:27:10 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:52791 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233862AbhD2O1K (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 10:27:10 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13TEQGj7013528;
        Thu, 29 Apr 2021 16:26:16 +0200
Date:   Thu, 29 Apr 2021 16:26:16 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     mceier+kernel@gmail.com, Kajetan Puchalski <mrkajetanp@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210429142616.GA11709@1wt.eu>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
 <878s51e3jc.fsf@gmail.com>
 <CAJTyqKOEG1tF0YGOvNeyidjF+2MaXoY5kCo9-cZ4Ri_Jb8XV8Q@mail.gmail.com>
 <CAGngYiXCui0iGW0890BMDUrTkgRe5HQNuiEyEbf=NdvFe06eug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGngYiXCui0iGW0890BMDUrTkgRe5HQNuiEyEbf=NdvFe06eug@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 29, 2021 at 10:13:23AM -0400, Sven Van Asbroeck wrote:
> On Thu, Apr 29, 2021 at 10:06 AM Mariusz Ceier <mceier+kernel@gmail.com> wrote:
> >
> > Let's assume the hipothetical corporation wants to add some
> > proprietary stuff to the kernel and avoid sharing the code
> 
> Wouldn't Greg KH be itching to remove such patches from the kernel? If
> they made it in, in the first place.

That's not what he was saying, he's saying the code could be distributed
(i.e. on the company's github repo for example) to comply with GPL though
they wouldn't care about getting it merged (like plenty of crappy vendors
today).

But the point is irrelevant since this can already be done using, say,
clang which is already capable of building the kernel and where such
extensions could already be added.

I.e. that's just a non-argument, let's move along.

Willy
