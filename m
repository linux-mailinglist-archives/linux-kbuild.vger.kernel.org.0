Return-Path: <linux-kbuild+bounces-10054-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D73FCB4195
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 22:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3A4B300C2AC
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 21:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3948432C31E;
	Wed, 10 Dec 2025 21:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dUHOtY4k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124BC32AADE
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Dec 2025 21:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765403452; cv=none; b=OEzZA+aMpQ0zSMz/ATy17ul/IeROij6CUWCJdOp2g5PvOlr3+xhQkEAymXk9+8VQeAdxebIqx3PVwI/luwLHVi/58oCwJC8ThXyNUISQgYh0Vanrec01M7zIv4eJZHoG2cNUvxbXQX5dOS28k2MQVzTITXKovZ+I9y2DrDdVPIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765403452; c=relaxed/simple;
	bh=eg7NOYB72vuAjlC7Jtq7lDutOvbdb3fL5OXCKTdJXIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u86Q9LzJzePATLfJ0mnj3i9EvjD+VIcO6FJOlNAADmW/1PgqwIexmwHv/w+ca9kfUxUFGND4HIZh3ftyoxz+UOvlWpBz0z4gPv21syUl35721l7tTgWck4bZghF2f5UmMMEU58exeko5Y2varfdL8whbCGXwaIRURRpih02jxCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dUHOtY4k; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-298250d7769so2686665ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Dec 2025 13:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765403449; x=1766008249; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KCsZw6r2H+GxT2oqUVKFZFncfDO2e0BQEMkV3Qsj/LU=;
        b=dUHOtY4kxbBK0+4hWVsxXHJyng7jxHj0D4Wbbmrdq2zYzMswkoHc69Pn1qWwjMYAp3
         FSFfSeVLLls8wIqABKVVbENABvkkG78+TUJjkhtZXAxnaz/gv38wQqJqRKWEoc9pEd/J
         y/no19GRG/WkXsFnVVIu9Qpcs9w4R+RvugDc2J1gCmgJYI7ZGgGdL3G9uq7L/Qmn5vXh
         VZwiSD9HiikdDmil4H9xTtMvPWb4DWS1TK37Ccc4K3uJwg6avS1I/+xrq3ZdE8mWvLkz
         Xwf7P9e/ZhVI72dKIKLylu9OEceJQQeDjg51Ivw1OROJlQBKL6daI38s3NucG4G3KCPA
         JD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765403449; x=1766008249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCsZw6r2H+GxT2oqUVKFZFncfDO2e0BQEMkV3Qsj/LU=;
        b=BSNxkAVVzVHsJ0Z99OvECz6z1BdIOnfCGNZjW0Z8ewElCHBpgT1hYxQq8MlyQc7vY0
         UTLdE6GpICru0pVE1i4vs7u6uxRV56gcBYEpBqyFj1hkaF0v+uncAcQkXbfR2gifFzRd
         XqIK8R/gxz5WYZi9JCeESw+EARBtHf4jDpyNFsAiPcu+Q5JSnmbEtDExftbvtVtOUXFZ
         D+e9geOGSxH+cwQuruqziUZ5MYB+W7q7y5prNDVzPk7/AKw/PbUt23Qj0d4fh5RcS9xD
         mklO8tU+odsdm707DqdFIFXqz+p3D8Unv0lZKBNXFE6GYW4MG0dRYT3rawehYMH3X6Fa
         il7w==
X-Forwarded-Encrypted: i=1; AJvYcCWUSMG4fpzcselOsmiOYrM6KGTrs+LAW0vTUzb6MwtxxTJhPxRxgJxXE2BtyvY91Blvb1ZUb5wLiQfGLFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnDWLlz9RvYmCQiJ5AuUW4JnKIH8lRwCx+gxL/LpXgFcavvete
	S2bRlIAVhRiy+UpLxCexWZrgPONn9+SO3/MRXd7pZe5g1W/CN0/PN1eLoAEKvmYXiQdFMawCnhA
	FxwSMjlWDXsvLscQDNySz3VE3jTCmdjqKfP306ErS
X-Gm-Gg: ASbGncuVzMmejMEj5EvMSiMQQGKryU3NOuQkv6SvqId5GlpFlAgdd53ju7MDRtt1BeT
	94I5Mrg/VJN903LRL1G21VB4GTBaEegwtGDmBBYKYjOCwk0KJ9bxL9gdCIy5GBA7YDwhYCXE8MT
	qLxkf9ULbhv7QTNrVVurIDE4GYsZ1ZrhCzdMZLo+NiWZdTuk6KL98OkNgyWacqjXRDByM4VlKhl
	xS3PzGx/QtDTwt8tm6oG+E2CNuXDJU1L2aUcDCRtpeBNoFWy2huF5CdGXN6VBIcv7NfSA2Ufd4C
	yFWpFk0MvmPTcT+NU6Kx9fh8YvM=
X-Google-Smtp-Source: AGHT+IHcqqK/RTKOSxZWEANFuU3c8u73aLDpG+WRToaBe7OD17Ln70WBODyf5Ae5mb8izrjo+C8lI0krQmOvZa0lPLM=
X-Received: by 2002:a05:7022:b9c:b0:11e:1bc:bd9c with SMTP id
 a92af1059eb24-11f296cbd83mr2505193c88.28.1765403448696; Wed, 10 Dec 2025
 13:50:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
 <20251120151033.3840508-15-elver@google.com> <98453e19-7df2-43cb-8f05-87632f360028@paulmck-laptop>
In-Reply-To: <98453e19-7df2-43cb-8f05-87632f360028@paulmck-laptop>
From: Marco Elver <elver@google.com>
Date: Wed, 10 Dec 2025 22:50:11 +0100
X-Gm-Features: AQt7F2rgWALnmd_GDAhG6zPIDGFcnPDoNGOr0zzF94TJ0iWpe4L1lGnI4olCNso
Message-ID: <CANpmjNNsR_+Mx=H6+4zxJHwpRuM7vKUakS8X+edBD521=w4y_g@mail.gmail.com>
Subject: Re: [PATCH v4 14/35] rcu: Support Clang's context analysis
To: paulmck@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, 
	Eric Dumazet <edumazet@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Johannes Berg <johannes.berg@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Dec 2025 at 20:30, Paul E. McKenney <paulmck@kernel.org> wrote:
> On Thu, Nov 20, 2025 at 04:09:39PM +0100, Marco Elver wrote:
> > Improve the existing annotations to properly support Clang's context
> > analysis.
> >
> > The old annotations distinguished between RCU, RCU_BH, and RCU_SCHED;
> > however, to more easily be able to express that "hold the RCU read lock"
> > without caring if the normal, _bh(), or _sched() variant was used we'd
> > have to remove the distinction of the latter variants: change the _bh()
> > and _sched() variants to also acquire "RCU".
> >
> > When (and if) we introduce context guards to denote more generally that
> > "IRQ", "BH", "PREEMPT" contexts are disabled, it would make sense to
> > acquire these instead of RCU_BH and RCU_SCHED respectively.

 ^

> > The above change also simplified introducing __guarded_by support, where
> > only the "RCU" context guard needs to be held: introduce __rcu_guarded,
> > where Clang's context analysis warns if a pointer is dereferenced
> > without any of the RCU locks held, or updated without the appropriate
> > helpers.
> >
> > The primitives rcu_assign_pointer() and friends are wrapped with
> > context_unsafe(), which enforces using them to update RCU-protected
> > pointers marked with __rcu_guarded.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Good reminder!  I had lost track of this series.
>
> My big questions here are:
>
> o       What about RCU readers using (say) preempt_disable() instead
>         of rcu_read_lock_sched()?

The infrastructure that is being built up in this series will be able
to support this, it's "just" a matter of enhancing our various
interfaces/macros to use the right annotations, and working out which
kinds of contexts we want to support. There are the obvious
candidates, which this series is being applied to, as a starting
point, but longer-term there are other kinds of context rules that can
be checked with this context analysis. However, I think we have to
start somewhere.

> o       What about RCU readers using local_bh_disable() instead of
>         rcu_read_lock_sched()?

Same as above; this requires adding the necessary annotations to the
BH-disabling/enabling primitives.

> And keeping in mind that such readers might start in assembly language.

We can handle this by annotating the C functions invoked from assembly
with attributes like  __must_hold_shared(RCU) or
__releases_shared(RCU) (if the callee is expected to release the RCU
read lock / re-enable preemption / etc.) or similar.

> One reasonable approach is to require such readers to use something like
> rcu_dereference_all() or rcu_dereference_all_check(), which could then
> have special dispensation to instead rely on run-time checks.

Agree. The current infrastructure encourages run-time checks where the
static analysis cannot be helped sufficiently otherwise (see patch:
"lockdep: Annotate lockdep assertions for context analysis").

> Another more powerful approach would be to make this facility also
> track preemption, interrupt, NMI, and BH contexts.
>
> Either way could be a significant improvement over what we have now.
>
> Thoughts?

The current infrastructure is powerful enough to allow for tracking
more contexts, such as interrupt, NMI, and BH contexts, and as I
hinted above, would be nice to eventually get to!  But I think this is
also a question of how much do we want to front-load for this to be
useful, and what should incrementally be enhanced while the baseline
infrastructure is already available.

I think the current series is the baseline required support to be
useful to a large fraction of "normal" code in the kernel.

On a whole, my strategy was to get to a point where maintainers and
developers can start using context analysis where appropriate, but at
the same time build up and incrementally add more supported contexts
in parallel. There's also a good chance that, once baseline support
lands, more interested parties contribute and things progress faster
(or so I'd hope :-)).

Thanks,
-- Marco

