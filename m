Return-Path: <linux-kbuild+bounces-12458-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK1sCMBdzGmDSgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12458-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 01:50:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECD9372E9D
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 01:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2FEE3024528
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1AC311958;
	Tue, 31 Mar 2026 23:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgbIMLga"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8280C27456;
	Tue, 31 Mar 2026 23:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775000953; cv=none; b=SqC6jLJn2pSdHbZ2LzxV82MuNBpwllmrrgC/cvu/p0OyZudT2hJHBaboaLBmP/plpV4mRWowJ6/Ckw3DQpXhMIrdrVxbIk7JQwz1aEDwoaAHMWTXf4cjX+X5oav6A26xNbIL1Gh10jcj59fuUGFpXJLl003DFDFqu0guvufJSyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775000953; c=relaxed/simple;
	bh=6YJkmQVzpKV7KhQnIqpsWBqhHxlFy7A4yeFwdgNV0iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8vGOiepfFLE49TjuLiXsfWW1W1GBw7fc6Q0NGTvFnfQfctE6Qkh8xwXScuCpXXAEeXXu8bDJS6Mtw+3amhMMFeMIW3SOHldOu1jjW8aZZ/kDWqOXdhmpH8DLSkD3pWJ5ialEg8NRJD4NSxsEJHhTIjuFE1wy6/0idLJF5qUU14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgbIMLga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1183AC19423;
	Tue, 31 Mar 2026 23:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775000953;
	bh=6YJkmQVzpKV7KhQnIqpsWBqhHxlFy7A4yeFwdgNV0iY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgbIMLga6uhGrTXrqPK69a5DzQZS22lZKQ2ecq7f+/WWbxz/OAlVZskmgNyhWoCov
	 zMj5dKwtvVI6cEq14tHbJRacm/CtOAnYAEbcMe2No/+g5C/XPZ0//R5TSfrPaEkNtH
	 ZbwCL4dEMu390lwFfkk55OSeHGvEZwFtQJBN6yKtZtCC2N1aQZg18BV+5psaOXfzig
	 J6UX0W4TxHzyzMaE17dT7pH1Y0Sc5BbLelSSjKNB5F23LxyBywmRk2YAufd/jrGt2E
	 VrbXS9umSaJVton9h/etZAhfDU7yfjz7YKUKBDm63h/HPYYAbXNmORujHKN0EMPFFj
	 HFRKQsZ7yFOgQ==
Date: Tue, 31 Mar 2026 16:49:12 -0700
From: Kees Cook <kees@kernel.org>
To: Justin Stitt <justinstitt@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <202603311643.47D533CD4@keescook>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook>
 <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook>
 <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
 <CAFhGd8rE+ggYghcwUphSRc2ftQMaX7LbKKPwQZzsw43bg9VVmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFhGd8rE+ggYghcwUphSRc2ftQMaX7LbKKPwQZzsw43bg9VVmA@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-12458-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:email]
X-Rspamd-Queue-Id: 8ECD9372E9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 02:50:39PM -0700, Justin Stitt wrote:
> On Tue, Mar 31, 2026 at 2:05 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Tue, 31 Mar 2026 at 13:31, Kees Cook <kees@kernel.org> wrote:
> > >
> > > (Isn't this just an implicit "try"?)
> >
> > Yes. And I think that's ok.
> >
> > I think try/catch is broken for a few reasons, but the fact that catch
> > and try are tied together so closely is the main one. You can't "try"
> > inside a scope without having the "catch" inside the same scope.
> >
> > So then the solution is to just move the try to the outermost layer,
> > and I think that's pretty much what everybody does.
> >
> > But at that point, why not just move it *all* the way out, and make it
> > implicit and invisible?
> 
> How do we feel about type-defined labels? We can specify sane default
> handlers where we define the types:
> 
>    typedef int __attribute__((overflow_behavior(trap, __handle_me))) trapping_int;
> 
> ... and define specialized handlers later on
> 
> int func()
> {
>         ...
>         u8 __attribute__((overflow_behavior(trap, __BOOOOM))) product = 5;
>         ...
>         product = a * b; // if store is truncated, goto __overflow
>         ...
>         return product;
> 
> __BOOOOM:
>         pr_info("%u\n", product); // shows "5"
>         return -1;
> }

Yeah, I think this could work. As long as there's nothing special about
the label mapping (i.e. many types can share the same label).

> We would then probably want a kernel shorthand to avoid long type definitions.
> 
>         #define __TRAP(handler) __attribute__((overflow_behavior(trap,
> handler)))
> 
> 
> At least this way the label is always defined somewhere in-source
> rather than by a magic -fhandle-my-overflow-at=__overflow

Yeah, this sticks to Peter's "define in source" mandate from Plumbers.

Linus, does that still sound reasonable?

Also, is the preference still for "loud" names ("trap_u32") for the
trapping scalar typedefs, or does the advent of the "required label on
usage" make it more reasonable to have shorter names ("u32t")? I'm fine
either way. I think there are pros and cons all over the place for the
naming.

-Kees

-- 
Kees Cook

