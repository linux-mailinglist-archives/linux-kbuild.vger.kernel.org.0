Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36274F1EC5
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 20:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfKFTaK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Nov 2019 14:30:10 -0500
Received: from fieldses.org ([173.255.197.46]:34206 "EHLO fieldses.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726713AbfKFTaK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 14:30:10 -0500
Received: by fieldses.org (Postfix, from userid 2815)
        id 5443E1BE7; Wed,  6 Nov 2019 14:30:10 -0500 (EST)
Date:   Wed, 6 Nov 2019 14:30:10 -0500
From:   "J. Bruce Fields" <bfields@fieldses.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191106193010.GG17669@fieldses.org>
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
 <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
 <20191106043120.GB6355@fieldses.org>
 <20191106044223.GA18076@Gentoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106044223.GA18076@Gentoo>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 06, 2019 at 10:12:26AM +0530, Bhaskar Chowdhury wrote:
> On 23:31 Tue 05 Nov 2019, J. Bruce Fields wrote:
> >On Wed, Nov 06, 2019 at 11:53:28AM +0900, Masahiro Yamada wrote:
> >>BTW.
> >>Bruce,
> >>Does the current script expect RHEL or something?
> >>I do not see 'new-kernel-pkg' on my Ubuntu machine.
> >
> >I test on Fedora.  Looks like on recent Fedora that's only provided by
> >an rpm "grubby-deprecated", which is an inauspicious name....
> >
> >I think maybe you're supposed to use "grubby" itself now.  Do you have
> >that?
> >
> >>It would still work with 'new-kernel-pkg: command not found'
> >>warning.
> >>
> >>We could bypass it if we like.
> >>
> >>command -v new-kernel-pkg && new-kernel-pkg --remove $f
> >
> >Looks like it's what updates the grub configuration, which is probably a
> >nice thing to do if you can.
> >
> >--b.
> 
> Bruce,
> 
> Two things,
> 
> If the system doesn't run grub , how the fallback policy???
> 
> This binary "new-kernel-pkg" also missing in other systems too...I can
> confirm that... i.e gentoo,slackware,
> 
> So , you are only targeting the rpm based system????

It's just what I happen to use.  If someone wants to make it work
elsewhere that'd be great, as long as we don't break what already works.

I think Debian uses grub2-mkconfig?  Might be OK for Fedora too, I
dunno.

--b.
