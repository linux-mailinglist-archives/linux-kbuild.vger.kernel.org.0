Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB844153A46
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2020 22:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgBEVd6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Feb 2020 16:33:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:41012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727106AbgBEVd5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Feb 2020 16:33:57 -0500
Received: from localhost (unknown [193.117.204.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E829E2072B;
        Wed,  5 Feb 2020 21:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580938436;
        bh=WgGVdmgCO6PpmlPK9iFW836z1BNGktrqNPAvcXenJAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M+MLwCZPgcvkGnMO7LtSd1O5y9LkwtzGnSPuxpRcX/DdJ7H9GPvvovj/Z/NOO8euv
         WB4trnnaDNagTPVP8H6amaTSg2z1FC/iNczN1IflXqxuEz9bTO0BYnRsokBOnHzMcM
         N5ZKNYLPnq6dH3X+luUCLS1EI80Qe6qM8IGxnejc=
Date:   Wed, 5 Feb 2020 21:33:54 +0000
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
Message-ID: <20200205213354.GB1465126@kroah.com>
References: <20200205154629.GA1257054@kroah.com>
 <20200205160250.GG142103@google.com>
 <CAOesGMj7Z9JoEYrnQaiHrHsjG7cv9ebEbyZM-QFWN2HJDa=UGA@mail.gmail.com>
 <20200205171353.GI142103@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205171353.GI142103@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 05, 2020 at 12:13:53PM -0500, Joel Fernandes wrote:
> On Wed, Feb 05, 2020 at 04:55:39PM +0000, Olof Johansson wrote:
> > On Wed, Feb 5, 2020 at 4:02 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> > >
> > > On Wed, Feb 05, 2020 at 03:46:29PM +0000, Greg Kroah-Hartman wrote:
> > > > Now that BPF does not need a copy of the kernel headers anymore in order
> > > > to build programs, there's no real need for putting the kernel headers
> > > > into a kernel module.  So drop the feature quick, before someone starts
> > > > using it :)
> > >
> > > Temporary Nack. Adding Alexei to the thread.
> > >
> > > I believe at the time of this going in, the BPF's BTF feature was not fully
> > > ready or able to support the usecases. Especially because BPF programs can
> > > call or use macros in kernel headers as well.
> > >
> > > Also, now BCC project does depend on this and so does bpftrace. Have both
> > > of these tools migrated to use BTF and don't need CONFIG_KHEADERS to be
> > > compiled? Sorry if I lost track.
> > >
> > > Just last week someone was using CONFIG_KHEADERS for BPF tracing purposes at
> > > Google and pinged me as well. There are several others. This would at least
> > > them some amount of pain.
> > >
> > > I'd suggest let us discuss more before ripping it out. thanks,
> > 
> > 
> > Greg, please use olof@lixom.net on the patch, I try to keep LKML out
> > of my non-upstream inbox. :-)
> > 
> > 
> > Alexei was part of the discussion, and from others in the same room it
> > sounded like there are no users of the upstream version of this
> > feature. Posting this patch is the obvious way to find out if that is
> > the case.
> > 
> > I.e. even if there was a version of bcc that required this, it sounds
> 
> The upstream BCC currently does require it since several tools include kernel
> headers and bpftrace does require it as well. I guess my point was before
> ripping it out, someone needs to complete the migration of all of those tools
> to BTF (if BTF can even handle all usecase) following the motto of "Don't
> break userspace".
> 
> > like the BTF approach is significantly better and said users are
> > hopefully moving forward to it quickly, and if they can't move
> > forward, then they're likely also not going to move forward to newer
> > kernels either?
> 
> I think BCC runs on a lot of upstream machines. I think the migration
> strategy is a matter of opinion, one way is to take it out and cause some
> pain in the hope that users/tools will migrate soon (while probably carrying
> the reverted patches out of tree). Another is to migrate the tools first and
> then take it out (which has its own disadvantages such as introducing even
> more users of it while it is still upstream).

Do we "know" what tools today require this, and what needs to be done to
"fix" them?  If we don't know that, then there's no way to drop this,
pretty much ever :(

greg k-h
