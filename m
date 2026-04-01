Return-Path: <linux-kbuild+bounces-12553-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Qes2LKuHzWnFegYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12553-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 23:01:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB303806DC
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 23:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD81C305DD59
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 20:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188E9388E4F;
	Wed,  1 Apr 2026 20:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEKBKde8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C6A26E706;
	Wed,  1 Apr 2026 20:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775076943; cv=none; b=lLP9p233OjGTVNB4Hg2sWeCvi0QRASolcHissLPRuvuwZc+VrxdEAdhSkGLf/OioDELvipEByLfWN0R1hMKDSW7mu3rxOC53mBJs28C0/qvudoDXv2BeorHBy+z/GMNqpnSG5tvQcCTUNImM1iO30vPS28isxxysPNcAheoOTJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775076943; c=relaxed/simple;
	bh=FjeFNTHKVGRPWTkDkVN3AnH6lzJfCOl7DJ2Lud2KSxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQf+nSZYsAhr4/Ka+Ceg+k3TwqGxexKJoEYF+9PEU6oF8SX8zHINRgXrhKVHH2txNLX+4thoSQabSQq+vOwe184NVdgnW38uNdAjRWHIX4tGmiZwTAkdphQCNq+7ZNmAKgnusgqVS+Ik8VqjsE43laQeYdKhADY3kvbrnTS/3i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEKBKde8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B4CC4CEF7;
	Wed,  1 Apr 2026 20:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775076942;
	bh=FjeFNTHKVGRPWTkDkVN3AnH6lzJfCOl7DJ2Lud2KSxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEKBKde8g4PYt5CG3WUL599vYVMJMnz5uwVRnrEvuBtKZ9BWCgP79+vz+HgEEcEhj
	 gYMlSh1j/9TAOKAt2TJBBTHozaqjRu2d6NnSTCdyaPzkPB8OWyof4Oj3Owbl40RSeL
	 nIPoCd50m+VFgUC8dA8u8d3PT+BwnASD2M1odt/Y/oozUSBd4tdCE6Y/XxAXN3tUi8
	 z4NMn42SbIBO5ZDbRDGlFDZDKIpvoRolFbu7kfbcOmvz/yJB7qkplcVjv8jZ+AogUr
	 S/KbE2UcYrjjbps6yQCUrSboYYA/EiwGsvOsCYtUD9wRIpAGdgcZbDZuwtMoDUxFbA
	 LEAVlW6FpyqUw==
Date: Wed, 1 Apr 2026 13:55:42 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org, llvm@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
Message-ID: <202604011352.3993A4D70@keescook>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
 <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
 <202603311249.30B44C66@keescook>
 <20260401090815.GV3738786@noisy.programming.kicks-ass.net>
 <202604011313.AD471BC8@keescook>
 <20260401203053.GC3254421@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401203053.GC3254421@noisy.programming.kicks-ass.net>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12553-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,gmail.com,lwn.net,linuxfoundation.org,kernel.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EBB303806DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 10:30:53PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 01, 2026 at 01:21:17PM -0700, Kees Cook wrote:
> > On Wed, Apr 01, 2026 at 11:08:15AM +0200, Peter Zijlstra wrote:
> > > On Tue, Mar 31, 2026 at 12:52:10PM -0700, Kees Cook wrote:
> > > 
> > > > I think for this series, __ob_trap/__ob_wrap is what should be used.
> > > > 
> > > > And for other folks, the background here is that we originally wanted
> > > > to use macros for "__trap" and "__wrap", but the powerpc C compiler
> > > > (both Clang and GCC) have a builtin macro named "__trap" already. So
> > > > I switched to just using the Clang-native type qualifier. We can use
> > > > the attribute style too, but there was a lot of confusion during the
> > > > Clang development phases where people kept forgetting this was a type
> > > > qualifier, not an attribute (i.e. the attribute is an internal alias
> > > > for the qualifier, and the qualifier is a new type).
> > > 
> > > Since you mention qualifiers...
> > > 
> > > What is the result of __typeof_unqual__(int __ob_trap) ?
> > 
> > Hmm, it seems like "const" doesn't get peeled off. That can be fixed, if
> > that's needed?
> > 
> > 'typeof_unqual(int)' (aka 'int')
> > 'typeof_unqual(__ob_trap int)' (aka '__ob_trap int')
> > 'typeof_unqual(const int)' (aka 'int')
> > 'typeof_unqual(__ob_trap const int)' (aka '__ob_trap const int')
> 
> So how can something be called a qualifier if unqual doesn't strip it?
> 
> (We might already have had this discussion, but I can't find the answer
> in the LLVM documentation page and didn't search our previous
> correspondence on this).

I'll let Justin answer this correctly, but I suspect I'm using the wrong
name for things. I think I should have said "keyword"? The mechanism
produces a distinct type, so it's not actually a "qualifier", but the
intent is that they are distinct types (this came from a long long
discussion with the LLVM devs, etc), but that they have implicit casts
to the non-obt scalars, but Justin knows more on this.

-- 
Kees Cook

