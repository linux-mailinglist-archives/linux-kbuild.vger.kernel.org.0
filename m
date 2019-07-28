Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67AE477EBB
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2019 11:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbfG1JNx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jul 2019 05:13:53 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:51491 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbfG1JNx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jul 2019 05:13:53 -0400
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1hrfFR-0000mT-Bf; Sun, 28 Jul 2019 11:13:45 +0200
Date:   Sun, 28 Jul 2019 11:13:44 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
cc:     LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sebastian Sewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] Kbuild: Handle PREEMPT_RT for version string and magic
In-Reply-To: <CAK7LNAS1=+OccAd3asj9P9JMWnhimRWR+dPQREOyK3y=Dx2odg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1907281111570.1791@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1907262245320.1791@nanos.tec.linutronix.de> <CAK7LNAS1=+OccAd3asj9P9JMWnhimRWR+dPQREOyK3y=Dx2odg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro,

On Sun, 28 Jul 2019, Masahiro Yamada wrote:
> 
> Since CONFIG_PREEMPTION was introduced after -rc1,
> I think this should be queued on top of -rc2.

Right. Are you picking it up?

> > -#ifdef CONFIG_PREEMPT
> > -#define MODULE_VERMAGIC_PREEMPT "preempt "
> > +#ifdef CONFIG_PREEMPTION
> > +# ifdef CONFIG_PREEMPT
> > +#  define MODULE_VERMAGIC_PREEMPT "preempt "
> > +# else
> > +#  define MODULE_VERMAGIC_PREEMPT "preempt_rt "
> > +# endif
> >  #else
> > -#define MODULE_VERMAGIC_PREEMPT ""
> > +# define MODULE_VERMAGIC_PREEMPT ""
> 
> Maybe, is the following more readable?
> 
> #if defined(CONFIG_PREEMPT_RT)
> #define MODULE_VERMAGIC_PREEMPT "preempt_rt "
> #elif defined(CONFIG_PREEMPT)
> #define MODULE_VERMAGIC_PREEMPT "preempt "
> #else
> #define MODULE_VERMAGIC_PREEMPT ""
> #endif

Doh. That's obvious. Must be a result of the heat wave we had.
Will send a V2.

Thanks,

	tglx
