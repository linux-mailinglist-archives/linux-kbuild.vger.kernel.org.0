Return-Path: <linux-kbuild+bounces-11928-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCjSIXiutGmbrwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11928-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 01:40:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA47728B025
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 01:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFD8B3089555
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 00:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF432264D3;
	Sat, 14 Mar 2026 00:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SymjV1g9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0BA3FFD;
	Sat, 14 Mar 2026 00:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773448820; cv=none; b=TOU7/uFpih32Lna0/v3N0owEE9MTZJNPGxXyqsXlxMn6aTD7LjP0WJE2XfWJcO/fQvTgU89esCHDVsGeqPWUVViO036Z6sqqOZ8sGMuyc1RFNLtiog3Uo2JBx7rTbYMfuiWz5aKNKzAitgm6TcVpYFCVL1XraMwbvM3ZVepXq7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773448820; c=relaxed/simple;
	bh=0gr9KSxldAsVL37ewdEm7gS+QwXkMqtMYEStjECI/A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHvbDkvPo2TSgPfMuqtL1M02DO2Z2v7wqIBpcvKIdY/ZT1XhPsaOxoeIZ1KcJGss+DYPsA0hQKwcREJ8HbWDcjh7QUDHlPGZ6fcmVDloNBxjW9sLej3MU+XtRfhOXfvIlkQt4mfevf6SOn0Y41BKdF5W3oMZJo35WWnw24xwpCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SymjV1g9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F20C19421;
	Sat, 14 Mar 2026 00:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773448819;
	bh=0gr9KSxldAsVL37ewdEm7gS+QwXkMqtMYEStjECI/A0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SymjV1g9y9ackIFgNet5bLgMQiyOi+sQJ3HWOAAavOgS556/ugt+dfQ6Wl/j1jzc8
	 Tm87cle8BQTjx1hOok2oZek/8PSILyrU8EaUm1CDgBGexy+w3hbhdYxgLYFBXlJcGm
	 xQ4/vGTpHXi1lLJMWPqrir6QkVZVjMYdp3R7oZrrV3TRfd5O3bouY9utN6q2p3OrH9
	 bA1J3HOjBlmxaSdTsY6Y6uOerD+hwaRY93rHxGCzwWuvk4Jt6cMQAPBPlLRnpATnUv
	 zDFR7eI4UJ5e+bfXP5qKuS0ptUR2JKTATZ1bd54cYt3Ow1OSpnduBdc9czgQHEr4ig
	 M7Xtxnz3uxMjg==
Date: Fri, 13 Mar 2026 17:40:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH v2 3/3] build: rust: provide an option to inline C
 helpers into Rust
Message-ID: <20260314004012.GD534169@ax162>
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-3-beb8547a03c9@google.com>
 <aasPsbMEsX6iGUl8@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aasPsbMEsX6iGUl8@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11928-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,infradead.org,arm.com,google.com,linux.dev,linux-foundation.org,vger.kernel.org,lists.linux.dev,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA47728B025
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 06, 2026 at 05:32:33PM +0000, Alice Ryhl wrote:
> On Tue, Feb 03, 2026 at 11:34:10AM +0000, Alice Ryhl wrote:
> >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
> >  	$(call if_changed_dep,bindgen)
> >  
> > +quiet_cmd_rust_helper = HELPER  $@
> > +      cmd_rust_helper = \
> > +	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) \
> > +		-c -g0 $< $(if $(filter %_module.bc,$@),-DMODULE) -emit-llvm -o $@
> > +
> > +$(obj)/helpers/helpers.bc $(obj)/helpers/helpers_module.bc: $(src)/helpers/helpers.c FORCE
> > +	+$(call if_changed_dep,rust_helper)
> 
> I think this needs:
> 
> $(obj)/helpers/helpers.bc: private part-of-builtin := y
> $(obj)/helpers/helpers_module.bc: private part-of-module := y
> 
> at least it seems to make a difference for AutoFDO.

Would

  $(obj)/helpers/helpers.bc $(obj)/helpers/helpers_module.bc: private is-kernel-object := y

work as well? Presumably, this is because c_flags only has the AutoFDO
flags when is-kernel-object is set, which is only true when
helpers/helpers.o is a part of obj-y.

Cheers,
Nathan

