Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81EF5DA6BA
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 09:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392874AbfJQHtl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Oct 2019 03:49:41 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35605 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbfJQHtk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 03:49:40 -0400
Received: by mail-oi1-f195.google.com with SMTP id x3so1365723oig.2
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2019 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cUHCv9N4xmS+l1KgWpk7F+i9WTYTBzhVIUBy6Hulrwk=;
        b=dt61IqtloaZiwqdtmjmdhi8e3I0pzOWxPhzFhs+0FutgvUJ++FJOjdWO4BjIZxdya4
         caOrhbydK56exS2QuA7Fd/bGjBtmOLqdRwkisDlBpmKuprQVBzPi+VbRWrE1Qg6x33eB
         L75C7W/XAakRnGcEUuRBZ2z0un1gUplzXJroKi8gc4pISSeGK+cslFlF67xNbSnSkcrH
         LFchrXP3xHyls9CwuwZQyeVw5GAWJqlGniCs+QihxmqhsqJFUxxUdUPgx8sH/6i8mrEB
         sJzIy+1BqIQwiJztBJmzppL/ZLh/4Dco+FslmOq/Cu10P2FffFtoC2Vy5Qpl06EYeyt4
         9GPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cUHCv9N4xmS+l1KgWpk7F+i9WTYTBzhVIUBy6Hulrwk=;
        b=YcprqNR7zXRqYump+2m1j1PmHh0LZlYBx+vpoo7Xs42f/kJktoZnIZgBIk1dIYZOpF
         rW719YsaS6kOisqF/r+63QoAZqIKQ9nIUb89/24eycMDC3OccPYhjt6ZQnF3LkLY0g7q
         t4ycWehnTjYyF9iJcWKv265ue/avV0r9Hlo4Mq4lh5XYWRDFrQVG/ePUtsO3hNnGIrSa
         fGeEcBxRD08xLHHWIPr/2jfbVUP767wjSak16xt/ATy/pVXQmLAWA0kpOvqgrC9AS9JR
         X7Bql9dpq4OX7KqpeOxYAw7N3y9/7dfQj5LffaPra+kWXvxD5X2yMvDlfQYAXtcqWdQb
         cq9g==
X-Gm-Message-State: APjAAAUCua0x0YM9lvW4XZMZbWeZ2VHVp/Nd5u5o2FBX0OZzBpAr0/3E
        XWU4kkgLw5d4e3vZZY1rqeozSq1ZIo6YS68atvZzBw==
X-Google-Smtp-Source: APXvYqw1eEq8EzjwYbx0MRbK18Xsa8AnqD+7ouVLKZUwR1kvjQzxQA3cqofqYXLP73Ei/x91O0n2XeJ8s6UCZGf1FOg=
X-Received: by 2002:aca:55cb:: with SMTP id j194mr1913152oib.155.1571298579393;
 Thu, 17 Oct 2019 00:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191016083959.186860-1-elver@google.com> <20191016083959.186860-2-elver@google.com>
 <20191016184346.GT2328@hirez.programming.kicks-ass.net> <CANpmjNP4b9Eo3ZKE6maBs4ANS7K7sLiVB2CbebQnCH09TB+hZQ@mail.gmail.com>
 <20191017074730.GW2328@hirez.programming.kicks-ass.net>
In-Reply-To: <20191017074730.GW2328@hirez.programming.kicks-ass.net>
From:   Marco Elver <elver@google.com>
Date:   Thu, 17 Oct 2019 09:49:27 +0200
Message-ID: <CANpmjNPKbCrL+XzmMrnjqw+EYOa2H94cgE5sPJeuVONbCSqBHg@mail.gmail.com>
Subject: Re: [PATCH 1/8] kcsan: Add Kernel Concurrency Sanitizer infrastructure
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     LKMM Maintainers -- Akira Yokosawa <akiyks@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Alexander Potapenko <glider@google.com>,
        Andrea Parri <parri.andrea@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>, Daniel Axtens <dja@axtens.net>,
        Daniel Lustig <dlustig@nvidia.com>,
        dave.hansen@linux.intel.com, David Howells <dhowells@redhat.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Luc Maranget <luc.maranget@inria.fr>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-efi@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 17 Oct 2019 at 09:47, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Oct 16, 2019 at 09:34:05PM +0200, Marco Elver wrote:
> > On Wed, 16 Oct 2019 at 20:44, Peter Zijlstra <peterz@infradead.org> wrote:
> > > > +     /*
> > > > +      * Disable interrupts & preemptions, to ignore races due to accesses in
> > > > +      * threads running on the same CPU.
> > > > +      */
> > > > +     local_irq_save(irq_flags);
> > > > +     preempt_disable();
> > >
> > > Is there a point to that preempt_disable() here?
> >
> > We want to avoid being preempted while the watchpoint is set up;
> > otherwise, we would report data-races for CPU-local data, which is
> > incorrect.
>
> Disabling IRQs already very much disables preemption. There is
> absolutely no point in doing preempt_disable() when the whole section
> already runs with IRQs disabled.

Ah thanks for the clarification, in that case I assume it's safe to
remove preempt_disable() for v2.

> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20191017074730.GW2328%40hirez.programming.kicks-ass.net.
