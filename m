Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60FADF0DD0
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 05:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730583AbfKFEbV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 23:31:21 -0500
Received: from fieldses.org ([173.255.197.46]:33414 "EHLO fieldses.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbfKFEbU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 23:31:20 -0500
Received: by fieldses.org (Postfix, from userid 2815)
        id 661EB1C19; Tue,  5 Nov 2019 23:31:20 -0500 (EST)
Date:   Tue, 5 Nov 2019 23:31:20 -0500
From:   "J. Bruce Fields" <bfields@fieldses.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191106043120.GB6355@fieldses.org>
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
 <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 06, 2019 at 11:53:28AM +0900, Masahiro Yamada wrote:
> BTW.
> Bruce,
> Does the current script expect RHEL or something?
> I do not see 'new-kernel-pkg' on my Ubuntu machine.

I test on Fedora.  Looks like on recent Fedora that's only provided by
an rpm "grubby-deprecated", which is an inauspicious name....

I think maybe you're supposed to use "grubby" itself now.  Do you have
that?

> It would still work with 'new-kernel-pkg: command not found'
> warning.
> 
> We could bypass it if we like.
> 
> command -v new-kernel-pkg && new-kernel-pkg --remove $f

Looks like it's what updates the grub configuration, which is probably a
nice thing to do if you can.

--b.
