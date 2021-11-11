Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28FB44D427
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Nov 2021 10:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbhKKJjT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Nov 2021 04:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhKKJjT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Nov 2021 04:39:19 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F1EC061767
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Nov 2021 01:36:30 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so7229583otg.4
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Nov 2021 01:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FQNotspdE85/ckyfVd22yizASeOICaHxBSL2D6Rwwpw=;
        b=UpJAsHH3wXt4nQODZVjA9FrGKUqqDF32IatYTS1SYxwoDbaRut+X6zfgkOHGkn0yt0
         CNegVOkjnK2sjy9Nms1243+zJFMjwFxKJ0owcLdYwK4/PjI+gpArN+24oajV3xi/bhAy
         y4ZTyZR4eWiJ2OqOTzZEw2+igo64Nc8xI9URhaWwqZL/ND7O6tYzZtsA/GOBw2sWuoEm
         +sywwDbjeG7T5ZEbZY9f9HgkehvolqW8JKcnjE2AosQdOyQoLdVupvgtXCV4bh2itKzF
         r4pIhz+pgijcQhHbDC5rWqcGvaxt/0sD85qniaK0p3CW+j8Sz9/u8rlcxct8jbsPhSNe
         rQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FQNotspdE85/ckyfVd22yizASeOICaHxBSL2D6Rwwpw=;
        b=Qs2s35dQDMv+UQV9O522kObaFT5rVyLs3Zf4WaaCOZyusE7owmKCFm9ooranQQY3+5
         8Yu8hms6PZsV/BbsLex6aZ3ydVuq3yhnwSSWQ42jyb+yeXG/7pYkm5wVpgOp/KFrsbfS
         5td0g6sJKsLX+pi1HhTY8YmTtGXVW9qdD6fp6me1NFBPkSIkYXBDx2WmkehyDyzJy8+q
         fxvXR2ydBlCikFyxREXO/RE8kYrADRrsfjZK+GFWfzVbqs2m4DfIKZQ5n1P+82nAaAEZ
         HDzSlJdb5nlhPbiV04KDQGa38+3XgGAVCb2MlRDumyfCVx6uzSCvonlQSrBwJ0vOjOaf
         vzPA==
X-Gm-Message-State: AOAM530xBagvWUeWFbhdcGpn6cSdCm4eSRc5T194MUMkxQcdP40hXi+e
        JXCsM+uZ27IczdH9ew6qv/L6EwrUvMdJ6qCmzoPZUQ==
X-Google-Smtp-Source: ABdhPJyQO1Ypmss7F9JtBJvfyJ2T6gA/zHz3aGDcxE2LvRHMlB0JEESu8sJ8bZ99S47xs/37ijAQqTB+ACr333KyuJw=
X-Received: by 2002:a9d:77d1:: with SMTP id w17mr4791136otl.329.1636623388618;
 Thu, 11 Nov 2021 01:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-3-valentin.schneider@arm.com> <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
 <803a905890530ea1b86db6ac45bd1fd940cf0ac3.camel@gmx.de> <a7febd8825a2ab99bd1999664c6d4aa618b49442.camel@gmx.de>
In-Reply-To: <a7febd8825a2ab99bd1999664c6d4aa618b49442.camel@gmx.de>
From:   Marco Elver <elver@google.com>
Date:   Thu, 11 Nov 2021 10:36:17 +0100
Message-ID: <CANpmjNPeRwupeg=S8yGGUracoehSUbS-Fkfb8juv5mYN36uiqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
To:     Mike Galbraith <efault@gmx.de>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 11 Nov 2021 at 04:47, Mike Galbraith <efault@gmx.de> wrote:
>
> On Thu, 2021-11-11 at 04:35 +0100, Mike Galbraith wrote:
> > On Thu, 2021-11-11 at 04:16 +0100, Mike Galbraith wrote:
> > > On Wed, 2021-11-10 at 20:24 +0000, Valentin Schneider wrote:
> > > >
> > > > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > > > index 5f8db54226af..0640d5622496 100644
> > > > --- a/include/linux/sched.h
> > > > +++ b/include/linux/sched.h
> > > > @@ -2073,6 +2073,22 @@ static inline void cond_resched_rcu(void)
> > > >  #endif
> > > >  }
> > > >
> > > > +#ifdef CONFIG_PREEMPT_DYNAMIC
> > > > +
> > > > +extern bool is_preempt_none(void);
> > > > +extern bool is_preempt_voluntary(void);
> > > > +extern bool is_preempt_full(void);
> > > > +
> > > > +#else
> > > > +
> > > > +#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
> > > > +#define is_preempt_voluntary()
> > > > IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
> > > > +#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)
> > >
> > > I think that should be IS_ENABLED(CONFIG_PREEMPTION), see
> > > c1a280b68d4e.
> > >
> > > Noticed while applying the series to an RT tree, where tglx
> > > has done that replacement to the powerpc spot your next patch
> > > diddles.
> >
> > Damn, then comes patch 5 properly differentiating PREEMPT/PREEMPT_RT.
>
> So I suppose the powerpc spot should remain CONFIG_PREEMPT and become
> CONFIG_PREEMPTION when the RT change gets merged, because that spot is
> about full preemptibility, not a distinct preemption model.
>
> That's rather annoying :-/

I guess the question is if is_preempt_full() should be true also if
is_preempt_rt() is true?

Not sure all cases are happy with that, e.g. the kernel/trace/trace.c
case, which wants to print the precise preemption level.

To avoid confusion, I'd introduce another helper that says true if the
preemption level is "at least full", currently that'd be "full or rt".
Something like is_preempt_full_or_rt() (but might as well write
"is_preempt_full() || is_preempt_rt()"), or is_preemption() (to match
that Kconfig variable, although it's slightly confusing). The
implementation of that helper can just be a static inline function
returning "is_preempt_full() || is_preempt_rt()".

Would that help?
