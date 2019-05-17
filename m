Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA10C211E8
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 04:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbfEQCEZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 May 2019 22:04:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59826 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfEQCEZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 22:04:25 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id CBD83C049E24;
        Fri, 17 May 2019 02:04:23 +0000 (UTC)
Received: from treble (ovpn-120-13.rdu2.redhat.com [10.10.120.13])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 99CB12706D;
        Fri, 17 May 2019 02:03:57 +0000 (UTC)
Date:   Thu, 16 May 2019 21:03:39 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Ivan Babrou <ivan@cloudflare.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190516225013.nvhwqi5tfwtby6qb@treble>
References: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
 <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 17 May 2019 02:04:24 +0000 (UTC)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 16, 2019 at 11:20:54PM +0200, Miguel Ojeda wrote:
> > mm/slub.o: warning: objtool: init_cache_random_seq()+0x36: sibling
> > call from callable instruction with modified stack frame
> > mm/slub.o: warning: objtool: slab_out_of_memory()+0x3b: sibling call
> > from callable instruction with modified stack frame
> > mm/slub.o: warning: objtool: slab_pad_check.part.0()+0x7c: sibling
> > call from callable instruction with modified stack frame
> > mm/slub.o: warning: objtool: check_slab()+0x1c: sibling call from
> > callable instruction with modified stack frame
> 
> AFAIK those are non-critical, i.e. stack traces may be wrong (or not),
> but it does not mean the generated kernel itself is wrong. CC'ing the
> objtool maintainers too.

I don't think I recognize those warnings.  Do you also see them in the
upstream kernel?

-- 
Josh
