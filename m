Return-Path: <linux-kbuild+bounces-11983-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHbMBjp4uGn5dgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11983-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 22:38:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 749C62A10C5
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 22:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AE5930C39AF
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 21:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A552D8379;
	Mon, 16 Mar 2026 21:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0p7TT1q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5B618D636;
	Mon, 16 Mar 2026 21:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773696888; cv=none; b=KYOugzdLTUcRJsXciB/zOnQ4rGrGG6nlzDkUh/ZHXA4VNEGk9a9NjJjeYBI5z8wC7sHs6BX+NdrcGBdEpull43WsDKo/9M/b0h0dLYO0XV6ZPlvcFKV+T8h59iQc3TyFhOrhxG9J4pNEcqQfojUf3p5ixQYChgdDmvhOBQZ+hgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773696888; c=relaxed/simple;
	bh=L40tdksrN1YZ5CgQIu1l+Y9mS/QU8B6BSrvIBIK2t6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5YXFPic5nsHFD4GFdewmkmJAYoRD8zJE+oqacFtcPjA/yaJixR5uSblcg/NGi3sy1sLClrsEdCg7B4W/9MBacZEfN+HlGD9JM42PqnPbLRtnPYiXWF4BfyZgBw9KIrUIetRS2uz9Wi0ka3RVwcbpFld3IE6bJliOC/pleDqnAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0p7TT1q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99E3C19421;
	Mon, 16 Mar 2026 21:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773696888;
	bh=L40tdksrN1YZ5CgQIu1l+Y9mS/QU8B6BSrvIBIK2t6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0p7TT1qUbZLWBdRbihT+dDRmijQhxCcwKQ2s+MQGH3d1CLBmTadAETV3GfeExwBB
	 0yZz7LNpCcZT1gLjX5H8P5H6HPlcBVgbGnrP7l0DFqY5NqzBb6s1GMYAZWedY7yYFE
	 WaJUN4WGR9Fc6BQLXQZ+gRG1y2qOPh/qANXDADZoLVHcGjvmCTksznSAaAawEFKn3M
	 Xt9SNOrIp/mBUOktVJ82kR6/M5e9iWt/EsA82JYxGM9BX1v8+kPcpvnHlcFLrO1ukR
	 4i4+Ly7w6H1DxNTo6LbkdvjBLSMM7oWMIsP4nWMpaP+1c1EG5iRDO8eur0UbFodXcX
	 XQF0TBjpzSbhA==
Date: Mon, 16 Mar 2026 14:34:40 -0700
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
Message-ID: <20260316213440.GB1329928@ax162>
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-3-beb8547a03c9@google.com>
 <aasPsbMEsX6iGUl8@google.com>
 <20260314004012.GD534169@ax162>
 <abVE6VWCzZfyMEsu@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abVE6VWCzZfyMEsu@google.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11983-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,infradead.org,arm.com,google.com,linux.dev,linux-foundation.org,vger.kernel.org,lists.linux.dev,kvack.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 749C62A10C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 11:22:17AM +0000, Alice Ryhl wrote:
> On Fri, Mar 13, 2026 at 05:40:12PM -0700, Nathan Chancellor wrote:
> > On Fri, Mar 06, 2026 at 05:32:33PM +0000, Alice Ryhl wrote:
> > > On Tue, Feb 03, 2026 at 11:34:10AM +0000, Alice Ryhl wrote:
> > > >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
> > > >  	$(call if_changed_dep,bindgen)
> > > >  
> > > > +quiet_cmd_rust_helper = HELPER  $@
> > > > +      cmd_rust_helper = \
> > > > +	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) \
> > > > +		-c -g0 $< $(if $(filter %_module.bc,$@),-DMODULE) -emit-llvm -o $@
> > > > +
> > > > +$(obj)/helpers/helpers.bc $(obj)/helpers/helpers_module.bc: $(src)/helpers/helpers.c FORCE
> > > > +	+$(call if_changed_dep,rust_helper)
> > > 
> > > I think this needs:
> > > 
> > > $(obj)/helpers/helpers.bc: private part-of-builtin := y
> > > $(obj)/helpers/helpers_module.bc: private part-of-module := y
> > > 
> > > at least it seems to make a difference for AutoFDO.
> > 
> > Would
> > 
> >   $(obj)/helpers/helpers.bc $(obj)/helpers/helpers_module.bc: private is-kernel-object := y
> > 
> > work as well? Presumably, this is because c_flags only has the AutoFDO
> > flags when is-kernel-object is set, which is only true when
> > helpers/helpers.o is a part of obj-y.
> 
> I assume so, but isn't it more correct to set part-of-builtin and
> part-of-module? I don't see any make rules making use of those directly
> (instead of is-kernel-object) right now, but if someone adds such uses,
> then this could become wrong, right?

Hmmm, yeah, I suppose so. Actually, adding those would allow you to drop
the manual inclusion of -DMODULE in cmd_rust_helper because it will be
included via modkern_cflags.

Cheers,
Nathan

