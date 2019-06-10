Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F21373B842
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2019 17:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389555AbfFJPZp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Jun 2019 11:25:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:40578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389293AbfFJPZp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jun 2019 11:25:45 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A253206C3;
        Mon, 10 Jun 2019 15:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560180344;
        bh=ZW4R91QDmRfH9azlM/uSwSTSj7wDQXeKgtSkREaj4cY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WVetzT/qmHeSi5jL/NUgUVF5GujCXMUHqbQc30TGaB/FBxlcH+3FrnLFsox20AmtV
         410GCw8chUJfN0QGMLJ/kHPVwCMvNvqQD0eE+CxYbVPkmNwbYu2KfsKaVqeCR8HdJy
         Ytt3zq0sHN6fhILygA/Rz8FnTJwCZtTEfcPpmXFQ=
Date:   Mon, 10 Jun 2019 17:25:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc:     Ivan Babrou <ivan@cloudflare.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190610152542.GA4132@kroah.com>
References: <20190517050931.GB32367@kroah.com>
 <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com>
 <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517152200.GI8945@kernel.org>
 <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
 <4FE2D490-F379-4CAE-9784-9BF81B7FE258@kernel.org>
 <CABWYdi2XXPYuavF0p=JOEY999M4z3_rk-8xsi3N=do=d7k09ig@mail.gmail.com>
 <20190610151407.GS21245@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610151407.GS21245@kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 10, 2019 at 12:14:07PM -0300, Arnaldo Carvalho de Melo wrote:
> Em Mon, Jun 10, 2019 at 12:21:51AM -0700, Ivan Babrou escreveu:
> > Looks like 4.19.49 received some patches for GCC 9+, but unfortunately
> > perf still doesn't want to compile:
> > 
> > [07:15:32]In file included from /usr/include/string.h:635,
> > [07:15:32] from util/debug.h:7,
> > [07:15:32] from builtin-help.c:15:
> > [07:15:32]In function 'strncpy',
> > [07:15:32] inlined from 'add_man_viewer' at builtin-help.c:192:2,
> > [07:15:32] inlined from 'perf_help_config' at builtin-help.c:284:3:
> > [07:15:32]/usr/include/x86_64-linux-gnu/bits/string3.h:126:10: error:
> > '__builtin_strncpy' output truncated before terminating nul copying as
> > many bytes from a string as its length [-Werror=stringop-truncation]
> > [07:15:32] 126 | return __builtin___strncpy_chk (__dest, __src, __len,
> > __bos (__dest));
> > [07:15:32] | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > [07:15:32]builtin-help.c: In function 'perf_help_config':
> > [07:15:32]builtin-help.c:187:15: note: length computed here
> > [07:15:32] 187 | size_t len = strlen(name);
> > [07:15:32] | ^~~~~~~~~~~~
> > [07:15:32]cc1: all warnings being treated as errors
> 
> The patch below should've taken care of that, and it has a Fixes: tag,
> i.e. the stable scripts should've noticed that, and it was noticed with
> gcc 8.2.

No, stable scripts do not always pick up the "Fixes:" tag, they are only
guaranteed to pick up the "cc: stable@" tag.  Sometimes we catch the
fixes ones too, but not always by far.

Anyway, I'll queue this patch up after this next round of kernels are
released, thanks!

greg k-h
