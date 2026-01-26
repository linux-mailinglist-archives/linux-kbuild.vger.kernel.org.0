Return-Path: <linux-kbuild+bounces-10870-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDhqAw20d2nKkQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10870-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 19:35:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 758688C234
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 19:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E15E630080B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 18:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCD123183C;
	Mon, 26 Jan 2026 18:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wvJJT80O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FF9238C0D
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Jan 2026 18:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769452546; cv=none; b=FfAXvi0YV469epjgssPJtiQqAJt9NmW1l0j3jKSAzEgxzorBJghAWtFVxjhKeGfaWjYFocMx2OfiBQKdX9ZrS/v+eyNx4X7LSegbLxW7p6nGDDNuSL7l3qk9DjvtEqoeYI+qYXwv/r1JDCueg8PE9kjZVTWo+t1tHnPCTzbqyDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769452546; c=relaxed/simple;
	bh=3akyaakir9OAMjeT8WvM8HDWBZfX+8duXF5SLqJafO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idWgLVk1+xJF+tUPoTUw+56u2fyIHqksAZXT906f0RV4Ndzz3v8bBZY6xwuNH83d0pBndl5V3Lzz9z7pOgJB57UNV79O3krsmMxOEi38O8l+MZj/1YvvwRhTjhqnkRgddGIgdzBFvvCRBANnxePrNX1mVC51hfckdwHJUmB69S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wvJJT80O; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-42fbc305882so2931957f8f.0
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Jan 2026 10:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769452542; x=1770057342; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wtupvaEvwne0Vq+SODEHB1y4+FGimHGUXOjd7XL3Zo=;
        b=wvJJT80OLvni3EYE47w8AnsZMY8snhAhLXWOMn6pvJxMZBpzm0usVVgJ29KSDqdKV7
         2vqDe7fyCrTaHkpNYup+/jabmU/g1j29n6fCqxDlWrCnJjCpT28McsS5DZBFECIDU/Y9
         cSQl+o9tfvdygSKhtk+122URO1O5VKatL85F0Ki8fC/RFDY76MDCU9WezatXoDVkEKc3
         wSq6fdWnSfERLbsV1XiaqCtgA1kCvy56c6ZM2mGvbVqxM1tkuC6jZM/COWWfvSmAAxYC
         SrtjkKVhyeVLiTussvucj7klXvIOmwuXoBsa9J9+ac7v16OFAS+oyICYhb3NVGQOFc9j
         WS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769452542; x=1770057342;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wtupvaEvwne0Vq+SODEHB1y4+FGimHGUXOjd7XL3Zo=;
        b=MMu0orHG90bXg8A3zfemGyVWydfznoY4Ru2FaxHMiwmyWSuQChww/ag7EeIWv5WkaT
         5kkwHQb5j0W12r5axuYS0MPQw1Us638idSTY155J1RQByzMLrNj2pHw9RDQTdf6TujJO
         jW/dNuXCPwp+fYlP7QrATomqjeQy3r2ORCtZLhDQNlYy6j54QpFct8GhV9y7D8WrzZ9f
         esa2+XokYKyJnWYnOsursNBTOcyntqyu/OPu4rMiXUVGnkn9K24I4MfQOyrbfuIM2z3k
         0TizQVqR+sQKf5lPEEhVzEb8BzAQnfXCC480KTfDg+fX+g1DLfnUpVzLIUD83902b7x1
         OUcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnsZuU0MjpdQha7l4OIj2n6DpjPCMxV9PhPT0n2ELCZ251XIrr1pwVkynwTE7F12rj651wbhpDIF5lHfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeAjnouuSRmMZQ2mJVG6D8nKEQ7bbPm+HLTvhonarSTeiht6mh
	GQOV8VjlIYXKU1lvNa5P83lCJRHwnHDLpzAZhia5r+Ys0OhpwI1lLOzRD+ROdIc1pA==
X-Gm-Gg: AZuq6aKziMNhdu6oykXDE94cnyjlBd0kOZo7pX+JL+bGjoQVbvby+IfCuP26P9BofQv
	ShM73sA5WNrGdQhUUuCfh31Q+IlhAfWv7YaNiyQr4EHKvnEnyzFOjg9/MJPxL0RVCSCQkK3bxWx
	Mho6C4DXKHakKEl+FMCpuovRV8b1WsYiHDACHMNfcLRNWOPC4XNNsA7OQyb88e2X4iLwBbYDohO
	JceirnQtl2ZKX8wZGT/vx2bjbxyoiE6Po3iyw1HTHRHmKxChsh4SI9sUXhzQFYI1VcsYpAEUmpt
	gp7Qp+5kJw+VeHHzjcoqS9qvZdyl/qd8npykmY4uEc2YCqJkYnQpSPXuSw3yqVduLZVYXB1sK3Y
	q1yyP9A4/prgQAp9oQ+1U0vXjoBac6pOWdODt2OlHVGcKHOHUUmUkQNHV/7zwj8jFceZymqLACt
	fwhtlYKs5QwTH5kbS+YwUnWmHo84sjMSBR8cTEs0ZOcWRQyxxyMgDhFuwyjz4=
X-Received: by 2002:a5d:5d06:0:b0:429:c14f:5f7d with SMTP id ffacd0b85a97d-435ca18f3cbmr9441304f8f.29.1769452542172;
        Mon, 26 Jan 2026 10:35:42 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:c598:7cce:ca6b:8ab7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1b6e2besm32040119f8f.0.2026.01.26.10.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 10:35:41 -0800 (PST)
Date: Mon, 26 Jan 2026 19:35:33 +0100
From: Marco Elver <elver@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	Chris Li <sparse@chrisli.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
	Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, kasan-dev@googlegroups.com,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-security-module@vger.kernel.org,
	linux-sparse@vger.kernel.org, linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev, rcu@vger.kernel.org
Subject: Re: [PATCH v5 15/36] srcu: Support Clang's context analysis
Message-ID: <aXez9fSxdfu5-Boo@elver.google.com>
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-16-elver@google.com>
 <dd65bb7b-0dac-437a-a370-38efeb4737ba@acm.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd65bb7b-0dac-437a-a370-38efeb4737ba@acm.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,kernel.org,davemloft.net,chrisli.org,google.com,arndb.de,lst.de,linuxfoundation.org,gondor.apana.org.au,nvidia.com,intel.com,lwn.net,joshtriplett.org,nttdata.co.jp,arm.com,efficios.com,goodmis.org,i-love.sakura.ne.jp,linutronix.de,suug.ch,redhat.com,googlegroups.com,vger.kernel.org,kvack.org,lists.linux.dev];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_FROM(0.00)[bounces-10870-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[elver.google.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 758688C234
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 09:31AM -0800, Bart Van Assche wrote:
> On 12/19/25 7:40 AM, Marco Elver wrote:
> > +/*
> > + * No-op helper to denote that ssp must be held. Because SRCU-protected pointers
> > + * should still be marked with __rcu_guarded, and we do not want to mark them
> > + * with __guarded_by(ssp) as it would complicate annotations for writers, we
> > + * choose the following strategy: srcu_dereference_check() calls this helper
> > + * that checks that the passed ssp is held, and then fake-acquires 'RCU'.
> > + */
> > +static inline void __srcu_read_lock_must_hold(const struct srcu_struct *ssp) __must_hold_shared(ssp) { }
> >   /**
> >    * srcu_dereference_check - fetch SRCU-protected pointer for later dereferencing
> > @@ -223,9 +233,15 @@ static inline int srcu_read_lock_held(const struct srcu_struct *ssp)
> >    * to 1.  The @c argument will normally be a logical expression containing
> >    * lockdep_is_held() calls.
> >    */
> > -#define srcu_dereference_check(p, ssp, c) \
> > -	__rcu_dereference_check((p), __UNIQUE_ID(rcu), \
> > -				(c) || srcu_read_lock_held(ssp), __rcu)
> > +#define srcu_dereference_check(p, ssp, c)					\
> > +({										\
> > +	__srcu_read_lock_must_hold(ssp);					\
> > +	__acquire_shared_ctx_lock(RCU);					\
> > +	__auto_type __v = __rcu_dereference_check((p), __UNIQUE_ID(rcu),	\
> > +				(c) || srcu_read_lock_held(ssp), __rcu);	\
> > +	__release_shared_ctx_lock(RCU);					\
> > +	__v;									\
> > +})
> 
> Hi Marco,
> 
> The above change is something I'm not happy about. The original
> implementation of the srcu_dereference_check() macro shows that it is
> sufficient to either hold an SRCU reader lock or the updater lock ('c').
> The addition of "__srcu_read_lock_must_hold()" will cause compilation to
> fail if the caller doesn't hold an SRCU reader lock. I'm concerned that
> this will either lead to adding __no_context_analysis to SRCU updater
> code that uses srcu_dereference_check() or to adding misleading
> __assume_ctx_lock(ssp) annotations in SRCU updater code.

Right, and it doesn't help 'c' is an arbitrary condition. But it's
fundamentally difficult to say "hold either this or that lock".

That being said, I don't think it's wrong to write e.g.:

	spin_lock(&updater_lock);
	__acquire_shared(ssp);
	...
	// writes happen through rcu_assign_pointer()
	// reads can happen through srcu_dereference_check()
	...
	__release_shared(ssp);
	spin_unlock(&updater_lock);

, given holding the updater lock implies reader access.

And given the analysis is opt-in (CONTEXT_ANALYSIS := y), I think
it's a manageable problem.

If you have a different idea how we can solve this, please let us know.

One final note, usage of srcu_dereference_check() is rare enough:

	arch/x86/kvm/hyperv.c:	irq_rt = srcu_dereference_check(kvm->irq_routing, &kvm->irq_srcu,
	arch/x86/kvm/x86.c:	kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
	arch/x86/kvm/x86.c:	kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
	drivers/gpio/gpiolib.c:	label = srcu_dereference_check(desc->label, &desc->gdev->desc_srcu,
	drivers/hv/mshv_irq.c:	girq_tbl = srcu_dereference_check(partition->pt_girq_tbl,
	drivers/hwtracing/stm/core.c:	link = srcu_dereference_check(src->link, &stm_source_srcu, 1);
	drivers/infiniband/hw/hfi1/user_sdma.c:	pq = srcu_dereference_check(fd->pq, &fd->pq_srcu,
	fs/quota/dquot.c:			struct dquot *dquot = srcu_dereference_check(
	fs/quota/dquot.c:				struct dquot *dquot = srcu_dereference_check(
	fs/quota/dquot.c:		put[cnt] = srcu_dereference_check(dquots[cnt], &dquot_srcu,
	fs/quota/dquot.c:		transfer_from[cnt] = srcu_dereference_check(dquots[cnt],
	include/linux/kvm_host.h:	return srcu_dereference_check(kvm->memslots[as_id], &kvm->srcu,
	virt/kvm/irqchip.c:	irq_rt = srcu_dereference_check(kvm->irq_routing, &kvm->irq_srcu,

, that I think it's easy enough to annotate these places with the above
suggestions in case you're trying out global enablement.

