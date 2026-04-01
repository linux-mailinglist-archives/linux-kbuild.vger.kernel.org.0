Return-Path: <linux-kbuild+bounces-12552-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iErILcWGzWkregYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12552-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 22:57:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCCC3806A4
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 22:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 722D03029788
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 20:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E418038C2CB;
	Wed,  1 Apr 2026 20:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVi0a+/C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7BD389DE8;
	Wed,  1 Apr 2026 20:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775076747; cv=none; b=pCt+n4CrxpCAL9rEgg3MTdOx6C7Fz+Nmm1qVYK7nS2+1wolOpawauIhXU/1XS6OXcLxvQAUuDkyl8RUDCAlgWxXBUv/RaOT32McjWkJ/VbyNnmT4M6FLwYobyoqJwcx3HiDVIaugOCFSzzEdtG3tAS4FYrP1yEkXuiszmXqvkew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775076747; c=relaxed/simple;
	bh=7U8DXkXO5xEXAzWxweG2+f+OAX+HPKtTv0z8sczanq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1somc/TsMCb80RgwsBMhYBNlMrqR90snFZMtjkMhKiyT692PYse2VRY/6oXQNUESWWwFvJcTyne0A9V2aFMWZx3rayp4sCgPJUnTwOMgQSeoxivqhhH6W5WmKPVZ66eUsEs9YcwhTdy/g0uHivvg3HYhsc9q2v8ZED6WaxaguQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVi0a+/C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D244AC116C6;
	Wed,  1 Apr 2026 20:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775076746;
	bh=7U8DXkXO5xEXAzWxweG2+f+OAX+HPKtTv0z8sczanq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MVi0a+/C0XAQHgElHRerU3IyB5Dp3mShfUcp5qNt2OgO9DCqg3dXoz14ibv0Ach6m
	 3tUs4cuG3b53d+0g/f6MjqRRQc3wRyrRoKF8kGaL+KWZhlZ91JPSAhzu7JF8QDgRwn
	 pyrhQ0NSpQu7QTAsB15RcGiwpwKCaPsHDutmB1Mlw8kFXDmHXDjtNeidZtzNfSNRgz
	 QajTEQSqMbLjVw58m0565vLh194SxgHhYpe0r1bRs4kL1cM+0jwWOtyM219HDXYU5K
	 DIw8aqxQu9L3kBXtxxw1f8DxtDMtCz1u5r4UyDQqEyAvsnvqM66H7zCPD1nW1tQExz
	 d22zL/lztbZYQ==
Date: Wed, 1 Apr 2026 13:52:26 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Finn Thain <fthain@linux-m68k.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	llvm@lists.linux.dev, Marco Elver <elver@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nsc@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar
 types
Message-ID: <202604011328.D3821379@keescook>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook>
 <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook>
 <20260401083137.GT3738786@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401083137.GT3738786@noisy.programming.kicks-ass.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12552-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5CCCC3806A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 10:31:37AM +0200, Peter Zijlstra wrote:
> On Tue, Mar 31, 2026 at 01:31:16PM -0700, Kees Cook wrote:
> 
> (still slowly digesting the thread)
> 
> > Yeah, as you mentioned earlier, I'd agree that nesting is rarely
> > useful. The only thing I'd want to be careful about is ordering/scope. I
> > *think* it would just operate as a "goto" and things like the cleanup.h
> > handlers wouldn't be involved: they operate when a scope is crossed
> > like before. And I think the overflow result wouldn't be represented
> > anywhere. i.e. the wrapped/truncated value wouldn't be stored:
> > 
> > int func()
> > {
> > 	...
> > 	u8 __ob_trap product = 5;
> > 	...
> > 	product = a * b; // if store is truncated, goto __overflow
> > 	...
> > 	return product;
> > 
> > __overflow:
> > 	pr_info("%u\n", product); // shows "5"
> > 	return -1;
> > }
> 
> Note that there is a 'fun' problem with this in combination with
> cleanup.h.
> 
> Something like:
> 
> int func()
> {
> 	u8 __ob_trap prod = 0;
> 
> 	scoped_guard (mutex, &my_lock) {
> 		prod = a * b;
> 	}
> 
> 	return prod;
> 
> __overflow:
> 	// whatever
> 	return -1;
> }
> 
> is fine. *HOWEVER*, something like:
> 
> int func()
> {
> 	int __ob_trap size = base + count * extra;
> 	int err;
> 
> 	struct my_obj *obj __cleanup(kfree) = kzalloc(size, GFP_KERNEL);
> 
> 	err = my_obj_init(obj);
> 	if (err)
> 		return ERR_PTR(err);
> 
> 	return_ptr(obj);
> 
> __overflow:
> 	// what now..
> 	return NULL;
> }
> 
> is most terribly broken. Specifically, the goto will jump into the scope
> of obj -- and that is not allowed.

Right, this has been my primary concern about having an implicit "goto"
sprinkled basically anywhere into the code flow. However, it does seem
that initialization checking is aware of the problem:

void func(void)
{
        unsigned long __ob_trap value = ({ goto weird; 256; });
        size_t outcome = 99;

        outcome = get_outcome();

	pr_info("outcome: %zu\n", outcome);
        return;
weird:
        pr_info("value: %lu\n", value);
        pr_info("outcome: %zu\n", outcome);
}

../drivers/misc/lkdtm/bugs.c:1059:35: warning: variable 'outcome' is uninitialized when used here [-Wuninitialized]
 1059 |         pr_info("outcome: %zu\n", outcome);
      |                                   ^~~~~~~
../drivers/misc/lkdtm/bugs.c:1021:2: note: variable 'outcome' is declared here
 1021 |         size_t outcome = 99;
      |         ^
../drivers/misc/lkdtm/bugs.c:1058:33: warning: variable 'value' is uninitialized when used here [-Wuninitialized]
 1058 |         pr_info("value: %lu\n", value);
      |                                 ^~~~~
../drivers/misc/lkdtm/bugs.c:1020:2: note: variable 'value' is declared here
 1020 |         unsigned long __ob_trap value = ({ goto weird; 256; });
      |         ^

But most importantly, if I add a cleanup after it, it gets rejected:

        unsigned long __ob_trap value = ({ goto weird; 256; });
        size_t outcome = 99;
        u8 *obj __cleanup(kfree) = kzalloc(33, GFP_KERNEL);
	...

../drivers/misc/lkdtm/bugs.c:1021:37: error: cannot jump from this goto statement to its label
 1021 |         unsigned long __ob_trap value = ({ goto weird; 256; });
      |                                            ^
../drivers/misc/lkdtm/bugs.c:1023:6: note: jump bypasses initialization of variable with __attribute__((cleanup))
 1023 |         u8 *obj __cleanup(kfree) = kzalloc(33, GFP_KERNEL);
      |             ^


(Though I would note that GCC does _not_ refuse the jump when there is a
cleanup; it only see the other two uninitialized values.)

So that makes it not totally broken, but it does make it a bit fragile.



Another concern I have is dealing with older compilers and how to
"hide" the label and its code. e.g. if I remove the "goto" from above:

../drivers/misc/lkdtm/bugs.c:1060:1: warning: label 'weird' defined but not used [-Wunused-label]
 1060 | weird:
      | ^~~~~

Oddly, the unreachable code isn't a problem, so we could just wrap the
label is some macro like:

#define force_label(x) if (0) goto x; x

force_label(weird):
        pr_info("value: %lu\n", value);
        pr_info("outcome: %zu\n", outcome);


-- 
Kees Cook

