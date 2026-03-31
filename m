Return-Path: <linux-kbuild+bounces-12440-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHKUEO0lzGnHPgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12440-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 21:52:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D0B370DCD
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 21:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30AF9302B9CB
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3093EE1DD;
	Tue, 31 Mar 2026 19:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GoS4l/ty"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156F7371D04;
	Tue, 31 Mar 2026 19:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986731; cv=none; b=FcOUQEOJIw9FkyBRh9k0wUgOCSDlttDWMIJbnHC9wy1opQCF3bWEqjG1MngUePOi765/Uf3gc9J4OKER7Et+SmdqfCHmTICaYIY8+/G33ImTXG9pWZ1GvUuEGYVGsYJQIDVauFa7QQYDCZvdQJXsKeZE1LeVW1onfvUYNlCZ0zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986731; c=relaxed/simple;
	bh=yDqHYQlphNi7NM7Fr9Z0F57GE+N/2wp/OlWZUNKCtFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WS08QpLt+jRNutdD+YTG9aTdzB3lYuQVlft3/WlZIooirEHzDHQ90ihPdDwtyMAWvy/rh8mHgsPJ+O+UysnEhpQ5UC3ZI8iSVqKkxz9WWHs22Zjg5sYCi/yqnF6tqYIvOGDScW6OwBbvfUZeMPGysv/4m2pUri3EdITLbrlrYh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GoS4l/ty; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850ACC19423;
	Tue, 31 Mar 2026 19:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774986730;
	bh=yDqHYQlphNi7NM7Fr9Z0F57GE+N/2wp/OlWZUNKCtFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GoS4l/tyGpgkmFwUGs4aAbnB1/BYsqPONwZgpACMtl6kEqKP+DAfcl8RvP1T8zwha
	 4q0mIhdzm5L84l9/QOKb1qs8zQw/vMoNicYpclxNEwoIUd9Fa4CyL5rIscq2G4oLDr
	 xC8LiQi9xCR+HHp26+Sfh9RoSrP6eu82EuykpIIwt0+5N5zudICUDTYLKU8QECw4zy
	 fFz4itvKaPgiJaSUKhqkKVdQW7ejg2YeCvQ6YrCY3ulZKEMkrj9Cmb84to6ppt3I5B
	 jF0nNbH0Pxw5H55bdqdJ7jEEMjoc/kESkP7rAb2bkqS97TUb7HWnF7W20X/D1Fj7Oc
	 o9WyB/1v1fIMg==
Date: Tue, 31 Mar 2026 12:52:10 -0700
From: Kees Cook <kees@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <202603311249.30B44C66@keescook>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
 <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12440-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,infradead.org,google.com,lwn.net,linuxfoundation.org,kernel.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[llvm.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D4D0B370DCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 10:09:33AM -0700, Justin Stitt wrote:
> Hi,
> 
> On Tue, Mar 31, 2026 at 10:02 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Tue, Mar 31, 2026 at 6:37 PM Kees Cook <kees@kernel.org> wrote:
> > >
> > > +/*
> > > + * Optional: only supported by Clang with -Xclang -experimental-foverflow-behavior-types
> > > + * passed via CONFIG_OVERFLOW_BEHAVIOR_TYPES. When not available, define empty macros for
> > > + * the trap/wrap annotations.
> > > + *
> > > + * clang: https://clang.llvm.org/docs/OverflowBehaviorTypes.html
> > > + */
> > > +#if !__has_attribute(overflow_behavior) || !defined(OVERFLOW_BEHAVIOR_TYPES)
> > > +# define __ob_trap
> > > +# define __ob_wrap
> > > +#endif
> >
> > Should that have `CONFIG_*`? i.e.
> >
> >      !defined(CONFIG_OVERFLOW_BEHAVIOR_TYPES)
> >
> > In addition, since this depends on a `CONFIG_`, with the current setup
> > we would put them elsewhere instead of `compiler_attributes.h` until
> > they are promoted to be "unconditional" (i.e. without the compiler
> > flag):
> >
> >      * Any other "attributes" (i.e. those that depend on a configuration option,
> >      * on a compiler, on an architecture, on plugins, on other attributes...)
> >      * should be defined elsewhere (e.g. compiler_types.h or compiler-*.h).
> >      * The intention is to keep this file as simple as possible, as well as
> >      * compiler- and version-agnostic (e.g. avoiding GCC_VERSION checks).
> >
> > However, thinking about it, why is the config needed?
> >
> > i.e. if the compiler is not passed that flag, shouldn't the
> > `__has_attribute` simply return false?
> >
> > Also, I am a bit confused -- does the compiler flag automatically
> > recognize the names like `__ob_trap`? i.e. I see the docs mention
> > using the attribute,
> >
> >     typedef unsigned int __attribute__((overflow_behavior(trap))) safe_uint;
> >     typedef unsigned int __attribute__((overflow_behavior(wrap))) wrapping_uint;
> >
> > But then we don't actually use it?
> 
> __ob_trap and __ob_wrap are defined by the compiler.
> 
> There are some examples within the documentation additions of this patch.
> 
> Kees, is it possible to make it more clear about what we expect of
> kernel developers in terms of style? Should they use keyword
> spellings? attribute spellings? only use custom types?

I think for this series, __ob_trap/__ob_wrap is what should be used.

And for other folks, the background here is that we originally wanted
to use macros for "__trap" and "__wrap", but the powerpc C compiler
(both Clang and GCC) have a builtin macro named "__trap" already. So
I switched to just using the Clang-native type qualifier. We can use
the attribute style too, but there was a lot of confusion during the
Clang development phases where people kept forgetting this was a type
qualifier, not an attribute (i.e. the attribute is an internal alias
for the qualifier, and the qualifier is a new type).

-- 
Kees Cook

