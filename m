Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0EB8214A6
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 09:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbfEQHib (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 03:38:31 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:54156 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727727AbfEQHib (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 03:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=4y+BMtQWomyB2L1H+6GtRYBBGAXJShvCIuwb2gYi3eg=; b=Z97MoOwIvXidOqh4GUdK7xv98
        pqxc9+84nplfhaZHP4QkD8vU6ITCgHnOq4B/1WMnA0aHigKsIhTJjbYJcZlmtKnPxfXlwMwgYTsOg
        LJp2pdjWTyPO1DnTtS4nzdJ2HBc5wC2o07EZItlgTcwr1jf86Ge8ZscBvvUfUN9jlEMGcF96bo7Cf
        kELfUxwLhNEj7yh4jxWs5XpJ5ngAKmFAoc3s1pB59L/UXU1748TncDr2S7zjMprPl+H6BKmdw60BK
        ffV050abCdOJx530zSF4wIXYMyAUrK+K7hNUa2rIjofxaJissXVOeQcMUpzYOU7qLLFz2zCLHHZWU
        pMOE/CbuQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hRXRX-00058s-2j; Fri, 17 May 2019 07:38:15 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 64D192027C9FD; Fri, 17 May 2019 09:38:13 +0200 (CEST)
Date:   Fri, 17 May 2019 09:38:13 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Ivan Babrou <ivan@cloudflare.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190517073813.GB2589@hirez.programming.kicks-ass.net>
References: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
 <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
 <20190516225013.nvhwqi5tfwtby6qb@treble>
 <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517050931.GB32367@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 07:09:31AM +0200, Greg KH wrote:
> On Thu, May 16, 2019 at 08:14:25PM -0700, Ivan Babrou wrote:
> > We are building the upstream kernel. There are a few patches, but
> > nothing related to objtool.
> > 
> > Unless you mean mainline/stable by upstream, I haven't tried that. We
> > stick to LTS.
> 
> Please work and all of these issues fixed up in Linus's tree and then I
> will be glad to take the fixed into the stable releases.

Right; if there is anything you can reproduce on linus.git I'll happily
have a look. If it doesn't reproduce all you have to do is find the
patches that make it work and ask Greg.
