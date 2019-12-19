Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94BC7125A01
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 04:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbfLSD3e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Dec 2019 22:29:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:34580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbfLSD3e (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 22:29:34 -0500
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 10B9420684;
        Thu, 19 Dec 2019 03:29:32 +0000 (UTC)
Date:   Wed, 18 Dec 2019 22:29:31 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Eugene Loh <eugene.loh@oracle.com>
Cc:     corbet@lwn.net, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, jeyu@kernel.org,
        linux-kbuild@vger.kernel.org, maz@kernel.org,
        songliubraving@fb.com, tglx@linutronix.de,
        jacob.e.keller@intel.com, Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>
Subject: Re: [PATCH v4] kallsyms: add names of built-in modules
Message-ID: <20191218222931.76131c6a@rorschach.local.home>
In-Reply-To: <2a535000-e71e-fab9-cf6a-e7e5fb8053d8@oracle.com>
References: <7e0f4a74-63c5-ad62-c619-c6277c4bc791@oracle.com>
        <20191210174826.5433-1-eugene.loh@oracle.com>
        <2a535000-e71e-fab9-cf6a-e7e5fb8053d8@oracle.com>
X-Mailer: Claws Mail 3.17.4git76 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 18 Dec 2019 15:55:18 -0800
Eugene Loh <eugene.loh@oracle.com> wrote:

> Ping.

Couple of notes:

1) this affects code that doesn't really have a maintainer. I could
take it in my tree, but I would like to have acks from other
maintainers. Perhaps Jessica Yu (Module maintainer), and probably one
from Linus himself.

2) Do not send new versions of a patch as a reply to the old version. I
and many other maintainers sort our inbox by threads, and I look at the
top of the thread for patches. That is, if there's another version of a
patch that is a reply to a previous version, it is basically off my
radar, unless I happen to notice it by chance (which I did with this
email).

You can send your v4 patch again, but please send it as its own thread,
that way it will be on the radar of other maintainers. Hopefully we can
get some acks on this as well.

-- Steve


> 
> 
> On 12/10/2019 09:48 AM, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> >
> > /proc/kallsyms is very useful for tracers and other tools that need
> > to map kernel symbols to addresses.
> >
> > It would be useful if there were a mapping between kernel symbol and
> > module name that only changed when the kernel source code is changed.
> > This mapping should not vanish simply because a module becomes built
> > into the kernel.
> >
