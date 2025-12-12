Return-Path: <linux-kbuild+bounces-10083-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81795CB8A23
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Dec 2025 11:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2351D304DEB3
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Dec 2025 10:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9B63168E2;
	Fri, 12 Dec 2025 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wtLV9uLE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63878311C16
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Dec 2025 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765535912; cv=none; b=aryRc9x2pmIVu41OZrupctWTVJN33+L+UCMtkyeLtcfl+p55yRHYyVN9tVa3eYlwzkzP3rK/F1lSRIWYkgSNgu9G/zkYIMoFl7/nBZGSnnXxVu5dyZgzw+ZNRCirRoPkFVFnG4vlSIwY+cStAwu/YwRxMQHBWyREMMVNTfBXqwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765535912; c=relaxed/simple;
	bh=nctQCqtW4QYyeaejz8PEb38w/v2g7uc6tb41WntjKNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMcWALfm/s1SN+cgIuUO63eWE3Q+t8rHCvi15zjWeI15ltJib99TONld/3NhAQcIzrff18TZMLxFfAn5lz4og8fslFHf6MBrbeZP5yuXqMg9AWgVdF24SnB9IIUuBao+Z5daoXgfbG9XUx+fWZ7LrK9/HXuD7Ro3MmYfTLh30CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wtLV9uLE; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-349bb6f9c86so1469723a91.0
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Dec 2025 02:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765535911; x=1766140711; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nctQCqtW4QYyeaejz8PEb38w/v2g7uc6tb41WntjKNI=;
        b=wtLV9uLEJ8zGhaL4wKcOMyzwlj7uEoqLP5ERNoV1rB3MPH+6lFfeCEOqtTG+oP/fcW
         HGpBFUZbgj83fZgoAxHjZqAy9ZpcXj3xsbc+3VWVErj6/tKNnvoOy/HwS+/1+X4i89iB
         +X26zSMrjD7X6MDPXJTfhiOSF2kD8XWxXhjnE0P0BBmQ6OrgN49HNUgVVdxxb3VL/+gC
         POW/ri/J2PD0pcCUBURT4yXCX/Miipf/Ma3wOy7gBSu+4ewCZzxDCRp2MLTcR13GzmII
         KqNixkzAhP2++PWhMyYRYPJyGGpka2IPweeHNWT8olNfOSrAx8B/sH65h/hs690SL0/0
         H+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765535911; x=1766140711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nctQCqtW4QYyeaejz8PEb38w/v2g7uc6tb41WntjKNI=;
        b=ppI0Vy2dfjF6hleUnHbwitx5CWWXL6GkswV3p6IDZaoGqA6+IweoaQbvfhTdDxQyO2
         uL0pIjPpp4weAZOo74o5L3ZbcpAwnQAgmQDuk94de3eLWwqrJe+G3amI/IeOlol4iHzT
         hcJf7KnCsy5CHoi86v2LIJ3E6xzKA8s8aTvvjdWOTTUwEnqIcYJKP54c6GuFtfpgff2o
         MyXvxE/81QGY39dZQONtXGvawEWGSjj88bFcLuQIUNkT8Rqo3APxkozqvSYoDUX/AnbB
         bXvTv+PRkNeUNpbTECdcmLr7S/CpKSKUsyu2Q/3oham+CRRM/E1qxmhpBeGIodCq2iL9
         ztSg==
X-Forwarded-Encrypted: i=1; AJvYcCUSzkIgOONztOuSzDFKCxMCAXgQ4/oHyTbTfA0QEEnt819fl/Lk/I5trRvad0KcHlytPDevTOkgOSFEGxo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8qKxyVq6jVgxwaz519Cseohlp6O1xNdWDZ6KDx04hHuSAVIId
	72PerxS4EHVa2uOWGO34t6xyQ1mXpqUmvv6iUD/cskoTJg0TWpB4dm8hUyo+idtgT1alyFPrFTn
	gTmPxudlFjj8GZw3uKj5kguN7EyCo0Kz6K9yoQO/6
X-Gm-Gg: AY/fxX6V90feVRteG7dl9qMX0h1E0vbF/obgpD3SN7pwmNQ2k/qUaoeNabsztG3PtBC
	IKlwohpmJAR1HaBxb/eMOxY8ycNeHtj/1ivJ+8fgK2riDBbgsjG2xJJ6uoqKjgA5f50h41XPoyu
	eBzJtWsN4YR2fK+AWkzoh5N4b5db2Dwif62zqeZ8Lfa+prJzgwMAandmsTTBMqKYJOw6lfAuJOc
	YmXnjXFKHrPuroQqAZdqcD+Ar73ebaGGF4NLz1+E2qpZ2wL73T1wODcCbG+zj7Y1wQ9PVppoLQ6
	nz6FQL3POrS1nI3H55pHTDOyQyQ=
X-Google-Smtp-Source: AGHT+IHEQqbAgYefprbsSuiVLt7KDiCECxoW496oPYm+Bj8DbPCCV7ccSZXk9zoE7kqarbEHot35Mb+a9uphNkvnkwk=
X-Received: by 2002:a05:701b:2719:b0:11d:c86c:652e with SMTP id
 a92af1059eb24-11f34ac540dmr1125346c88.5.1765535910093; Fri, 12 Dec 2025
 02:38:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120145835.3833031-4-elver@google.com>
 <20251211120441.GG3911114@noisy.programming.kicks-ass.net>
 <CANpmjNOyDW7-G5Op5nw722ecPEv=Ys5TPbJnVBB1_WGiM2LeWQ@mail.gmail.com> <20251212093149.GJ3911114@noisy.programming.kicks-ass.net>
In-Reply-To: <20251212093149.GJ3911114@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Fri, 12 Dec 2025 11:37:51 +0100
X-Gm-Features: AQt7F2qnWyV-H6zf6AeMnZTuFb_nb7UwLLraoghpFqSJ0q6RecRlENqaq0woPuo
Message-ID: <CANpmjNPcw5AnpLpaFvyRee7mH12Ym-NKTx331xXEusK5zpiscA@mail.gmail.com>
Subject: Re: [PATCH v4 02/35] compiler-context-analysis: Add infrastructure
 for Context Analysis with Clang
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
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

On Fri, 12 Dec 2025 at 10:32, Peter Zijlstra <peterz@infradead.org> wrote:
> On Thu, Dec 11, 2025 at 02:12:19PM +0100, Marco Elver wrote:
>
> > What's a better name?
>
> That must be the hardest question in programming; screw this P-vs-NP
> debate :-)
>
> > context_lock_struct -> and call it "context lock" rather than "context
> > guard"; it might work also for things like RCU, PREEMPT, BH, etc. that
> > aren't normal "locks", but could claim they are "context locks".
> >
> > context_handle_struct -> "context handle" ...
>
> Both work for me I suppose, although I think I have a slight preference
> to the former: 'context_lock_struct'.
>
> One other possibility is wrapping things like so:
>
> #define define_context_struct(name) ... // the big thing
>
> #define define_lock_struct(name) define_context_struct(name)

Note that 'context_lock_struct' (assuming that's the new name) can be
used to just forward declare structs, too, so 'define' in the name is
probably incorrect. And to avoid more levels of indirection I'd just
stick with one name; if 'context_lock_struct' isn't too offensive to
anyone, that'd be the name for the next version.

Thanks,
-- Marco

