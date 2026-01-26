Return-Path: <linux-kbuild+bounces-10889-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMMFJhb9d2kvnAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10889-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 00:47:34 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 449FD8E4EC
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 00:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7573E301BC11
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 23:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52AC2233722;
	Mon, 26 Jan 2026 23:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QPyFHk96"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A1A2FE598
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Jan 2026 23:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769471248; cv=pass; b=eyMmEOiSnhxEtmuM+0iRQYuaEfXjGps09r37qWR7g9AArH49TEcZ9kbj6rN+guWokmqmg4lPhSryEn6DavZc4mvTLNLEQFEJBU1mAQ0OEipR7R74FrgT3KQ7IYQ8w5zcBdvTM3Lgl548+GlFPDlxYnmBLW5yzpNFUclbXihbPx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769471248; c=relaxed/simple;
	bh=fG2Ruh+rMXy8HECrlWrSGEzE9JMwnw/wcqEcRF2te3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwiCOQPgrGdkyWmzc6HTfE4klzQV4OoEFpFruAGE5JdtMb/e1o49e/SR9NaYma3Sz9z8Q6sYq+AmPhCWzGark6M1QmHFRsDljWc/xyyR55UTemPRwzNggnoyXafhQS5ZJQstaUMIAzO0rXWrl4bM2UpC1J7IHM+zQSoiewLEM+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QPyFHk96; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1249b9f5703so1040959c88.0
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Jan 2026 15:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769471245; cv=none;
        d=google.com; s=arc-20240605;
        b=i44iol6M99r+I5BuiqRVKAL+oFTl/zbY032jajXWIhFgDLKoGJIbF6UEcPheG/sq2o
         K3q0KUmOGWAV4swrHRR9mRY+r1pbE+XJuGb6TtMpklys0CN9AVR1g5B/g4huacM73qDh
         TaqMP7Xs3AxUdpTb+UiovGjJdboSyLlr2wtY+PirDrTjHnOo/5UDdFEqr2sZvpUj8o1E
         PNdvedP6h5ZdqDL/pXhUC1OhkLu5COIpIe+AlrXCgSpI1iJTL/YEZGKwDPS3CFYfFK+x
         ZqiVXr1FPpbOcZnXSRdkXCqACcfZg+nV8eRz1z5kjmXtDyTW0z7TIb95yRr17zOEqrUl
         svBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X34tjfxPPMupW8WHmEJAIsWdH0Oem6uch60iKqedEdc=;
        fh=7bqI5rTIPA0NXpmIhSkCs+bVMTHgFDRG797KbQYE6NI=;
        b=iCq0Cf+ogRoc/1tc2dHSAm85cEAmktiJ8J8J2FMJbkxRBXXfC2p6x7MQo0geX6D0Kl
         WNAF8IqvAZxLjpueM0fBrjJAOf88dNsEaV/A7oP2YxMs95aEpvVrHhk9w1Cj8XJB68bl
         2Eer71WUWuRPYwrz2+JuQcPt6fEny8U3A71l6o4KZFZa7wcumkmHNKwvk+bT1SO20BmY
         BWaQmGQGhzRkq/30EiSy1xJV8UwbzGUd6dJV023JqqfNyv0Y4T3NSJcUW6FK/H28W9uH
         YaWafrEimu3k0TmKzJKpoY54FOlpF09YzFOMzQvr6wgDh5DA8RyADXD2nI7JcQzTzYEQ
         ymig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769471245; x=1770076045; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X34tjfxPPMupW8WHmEJAIsWdH0Oem6uch60iKqedEdc=;
        b=QPyFHk96UvMrpMwkoIa7K76IVIsyFEnfZylNFV5QMW6rzMt1q1yhPRJPbtVPkVYr37
         QQih6C5oGngtDrT2O6TJ/NmalrhezMNkb25dAEFdF2KrioK3GhDmedvDZGFMwEh3ihqY
         JVQlTZ1GsSZw62zjipX4WnEYc1xlFLHZ/rBXw+v03T9uvrvWmt9jJfxjhDBTrivMhecH
         xY5XiTzs4FuuW3ITTswqPixr9Dy8rk2WBhWOlxNNBc7UF3/u5o1AfjHwCch4TOYbauT2
         KWPjRIH+OaDaBKqKOStCJSGsldadRt4KZBNG7dUZlgqW5w7DYgS30qdNee0ahFDUD1nl
         VIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769471245; x=1770076045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X34tjfxPPMupW8WHmEJAIsWdH0Oem6uch60iKqedEdc=;
        b=u+1WdaOJ41/+i5yM35cx98FZ8f6bY34MNr5RnBvQXet0eI1jTJU2ln8B4Ye1tWi3V6
         JhD72lGLnjsJhIFOefp1EY9UMi9VOmchrBFlUCivTOsn3Kryx8tbufHnc0pGxj+edtzt
         oIf6E7WpFF4bEVSMI1GxM9/2mzPXmA/LD3JrJ/zJh70KQrxY97rUpBcXUieIbhAm4suF
         j82K3od0cHgCQbj5VOpiKpXVe2fkWkwFuRoMMKGOTlkDDbwJ4V9ThShUpCbDRykvE6Q/
         jFDS7BC9O+7PWJNla6/RB8oUSb1+TWIVDVFdaItE/ks1U2gaGgEKF1X1L2yT3GHdrG0w
         c+Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVqV90Bw6J1dSl/5VMhpsccNMfUyowyZ21gyMA0cZ1hTjOULl4gZvZsVbovjtBnrpOZvp0bKNqikN39034=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya1XLP2fwYhA/+tJuL4tR97Wkw2EMHTlL3AtUP8gdtkpIFa6So
	hrvWbboC0AyCCy1YZ5qQiATRQ03lp/diO4GIWsIuKK2rbJye1s41F0fT4rGqG38nmUEe9JThfsr
	Ef6w0IQ6VXReVChnI++nE5z7WiNNuhRFScm6/bLeK
X-Gm-Gg: AZuq6aL660qb2KSnUe88nc7F2bI+9gcumECOkronEAUdmuMmlNj3gdzew6J9q20ND1Q
	U4mmUjWRt0OtKQnScJKCgGtnjIq05Ce597AVKUO7ODtutJ4Gx0ZuTvuPSf8FMMYg3Wz96k0/zWh
	msBBM/s0gs1ZAo8Feh6jDpGKnYFP1GaFzqRAi3ogx0b2HeMtkfEjiDaUBrYItffvmnrR3Q5YBW3
	sEc+clsMnkWuFmz3ZrF8cG+8nyvrxChXwf51F/pUKUTXtcl8HVdqdRpBK8TOhQz3QsJEFS5E0Vo
	MsU1hHnn9vOI3LhxnmUgzFNQh2DpoKTupYwJCw==
X-Received: by 2002:a05:7022:eb46:20b0:124:9e46:82fb with SMTP id
 a92af1059eb24-1249e468815mr157327c88.38.1769471245289; Mon, 26 Jan 2026
 15:47:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-16-elver@google.com>
 <dd65bb7b-0dac-437a-a370-38efeb4737ba@acm.org> <aXez9fSxdfu5-Boo@elver.google.com>
 <8c1bbab4-4615-4518-b773-a006d1402b8b@acm.org> <20260126213556.GQ171111@noisy.programming.kicks-ass.net>
In-Reply-To: <20260126213556.GQ171111@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 00:46:49 +0100
X-Gm-Features: AZwV_QgcknJe0PlLV-z7bksgFQT7uSnaZ1B5QvyI9tPRocr5FzcCAIEUg9yCt-Y
Message-ID: <CANpmjNPs9CtY1w1-MqL1-CnHVFLxXoA2rbd6d2w4wfxT8AP0ew@mail.gmail.com>
Subject: Re: [PATCH v5 15/36] srcu: Support Clang's context analysis
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[acm.org,gmail.com,kernel.org,davemloft.net,chrisli.org,google.com,arndb.de,lst.de,linuxfoundation.org,gondor.apana.org.au,nvidia.com,intel.com,lwn.net,joshtriplett.org,nttdata.co.jp,arm.com,efficios.com,goodmis.org,i-love.sakura.ne.jp,linutronix.de,suug.ch,redhat.com,googlegroups.com,vger.kernel.org,kvack.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-10889-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 449FD8E4EC
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 at 22:36, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Jan 26, 2026 at 10:54:56AM -0800, Bart Van Assche wrote:
>
> > Has it ever been considered to add support in the clang compiler for a
> > variant of __must_hold() that expresses that one of two capabilities
> > must be held by the caller? I think that would remove the need to
> > annotate SRCU update-side code with __acquire_shared(ssp) and
> > __release_shared(ssp).
>
> Right, I think I've asked for logical operators like that. Although I
> think it was in the __guarded_by() clause rather than the __must_hold().
> Both || and && would be nice to have ;-)

Some attributes take multiple arguments (__must_hold does), though
__guarded_by doesn't. Yet, && can still be had with adding it multiple
times e.g. '__guarded_by(pi_lock) __guarded_by(rq->__lock)'.

Only thing that doesn't exist is ||. I think the syntax you ask for
won't fly, but I can add it to the backlog to investigate an _any
variant of these attributes. Don't hold your breath though, given the
time it takes to land all that in a released Clang version.

> Specifically, I think I asked for something like:
>
>         cpumask_t       cpus_allowed __guarded_by(pi_lock && rq->__lock)
>                                      __guarded_shared_by(pi_lock || rq->__lock);
>
>
> I think Marco's suggestion was to use 'fake' locks to mimic those
> semantics.

