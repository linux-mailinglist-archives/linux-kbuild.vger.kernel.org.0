Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 816CC153F0D
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2020 08:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgBFHEq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Feb 2020 02:04:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:43902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727358AbgBFHEp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Feb 2020 02:04:45 -0500
Received: from localhost (unknown [213.123.58.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BBF4D206CC;
        Thu,  6 Feb 2020 07:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580972684;
        bh=4ysceoC63lI7xZahrtI8MfuoiltYgZmmut3aPCCS7QM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UGLqbwHFmGySWcxx4pWEb8R7MFA16FMLf3OizEgIAo77WwycU9zgScTRvIn3RyZh6
         s8jfUnt+nBAZ2HDLP1MJeEDzyhwl6LZv07NdamLUT6SOWAy58tBxzn+IUqc8saCYJZ
         BYydv0KBEYtSF6UoQDZ7VA38WQ/pHoksW2yWkohc=
Date:   Thu, 6 Feb 2020 07:04:41 +0000
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Joel Fernandes <joel@joelfernandes.org>
Cc:     Olof Johansson <olof@lixom.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tejun Heo <tj@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert kheaders feature
Message-ID: <20200206070441.GB3265390@kroah.com>
References: <20200205154629.GA1257054@kroah.com>
 <20200205160250.GG142103@google.com>
 <CAOesGMj7Z9JoEYrnQaiHrHsjG7cv9ebEbyZM-QFWN2HJDa=UGA@mail.gmail.com>
 <20200205171353.GI142103@google.com>
 <20200205213354.GB1465126@kroah.com>
 <CAEXW_YSU_Zm24R2TYFQd42CfXyotowv42BbvbvKfSFbZGUqOHQ@mail.gmail.com>
 <20200205214841.GB1468203@kroah.com>
 <CAEXW_YST9qj91=TbJ9j4boQgV=k=8E6fSQZB-iojRBLwGXSOag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEXW_YST9qj91=TbJ9j4boQgV=k=8E6fSQZB-iojRBLwGXSOag@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 05, 2020 at 01:53:15PM -0800, Joel Fernandes wrote:
> On Wed, Feb 5, 2020 at 1:48 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Feb 05, 2020 at 01:35:56PM -0800, Joel Fernandes wrote:
> > > On Wed, Feb 5, 2020 at 1:33 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > [snip]
> > > > > > like the BTF approach is significantly better and said users are
> > > > > > hopefully moving forward to it quickly, and if they can't move
> > > > > > forward, then they're likely also not going to move forward to newer
> > > > > > kernels either?
> > > > >
> > > > > I think BCC runs on a lot of upstream machines. I think the migration
> > > > > strategy is a matter of opinion, one way is to take it out and cause some
> > > > > pain in the hope that users/tools will migrate soon (while probably carrying
> > > > > the reverted patches out of tree). Another is to migrate the tools first and
> > > > > then take it out (which has its own disadvantages such as introducing even
> > > > > more users of it while it is still upstream).
> > > >
> > > > Do we "know" what tools today require this, and what needs to be done to
> > > > "fix" them?  If we don't know that, then there's no way to drop this,
> > > > pretty much ever :(
> > >
> > > Is there a real reason to drop it or a problem dropping this solves though?
> >
> > Olof had some reasons, but as we were drinking at the time when it came
> > up last night, I can't really remember them specifically.  Hopefully he
> > does :)
> > But that didn't answer my question of "who is still using this"?  I was
> > hoping we actually knew this given it was created for specific users.
> 
> I think I mentioned this in a previous thread of this email. Several
> BCC tools are using it - see for example the criticalstat BCC tool
> which includes linux/sched.h :
> https://github.com/iovisor/bcc/blob/master/tools/criticalstat.py#L73
> , or filetop BCC tool which uses struct dentry :
> https://github.com/iovisor/bcc/blob/master/tools/filetop.py#L101
> 
> These would break without kernel headers either on the host or via
> CONFIG_IKHEADERS.

Ah, ok, then this can't work just yet.  If those get fixed up, then we
can do this.

thanks for the info, nevermind about this patch :(

greg k-h
