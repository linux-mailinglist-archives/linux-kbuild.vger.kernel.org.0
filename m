Return-Path: <linux-kbuild+bounces-11929-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bH+9JfFEtWmZygAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11929-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 12:22:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E87B628CDAD
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 12:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4C8C3024A60
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 11:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADAB239E63;
	Sat, 14 Mar 2026 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mTTXe8vh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A447F1DC198
	for <linux-kbuild@vger.kernel.org>; Sat, 14 Mar 2026 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773487341; cv=none; b=oGZ6CJ3CIT9oyJdiZkuFdN+y0ZQPNLN5neGMnektpQtfP8SYBAbd5865zMqG4coCsVEd8qqzUrAotIwXmktd2VRIOMC+ephH2biw+cAiRAE0NmzbHCR21EKj+45KOKZuG4S9QVl70n/Vxivyxw79c1Z8V9j+efrIKs20xCLZi/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773487341; c=relaxed/simple;
	bh=BDwSY6PmY+B4N3iSEla5L8ypZc2hwAaBOubZVOaCrxA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aDljpTD9mWFEpRLaA36f1aw6xcywOZmC+h0/Zb030Kuqvpj9g1D9QoLS0d7LlvqKTb50YB3WCucqi+tV1tgP8Nh4dw/XIe2KfGergl8Zj8TceAZagMCh/NctIvUvKwNz1zA9to+0GTzLDqA3XqX8OEFhW7jNimZ2IQlkKEXtVmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mTTXe8vh; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-439ae2cba40so2967501f8f.1
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Mar 2026 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773487339; x=1774092139; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AIiENy5+TBc+Tmxykx8gjxVXJVl5L84CJZwFGK8GrzA=;
        b=mTTXe8vhROoRd5LxakO/ILsOkglbY8QQcEe3OVdgMAYSW/ZNO2wMS/DE2WUhfFJRgb
         D5/QiUQ8KkPV7yKmt71KRMGz+Hqf6E3oUbYYlPZA3F+6GS2m8BGYxZvBLi/z/e/xBqqV
         dZnPYkwtq2LeGrBW26IrWpVvCD462Nia+HNiEV7hQDoNPtMdA0+YXflVTFoTL2yPVRSh
         WI8FFY/37h3XDJQPmPxOuXAfblohxh5hGDknSFjS7zk0BqRGglBfLnrO1uJo1MNdbMG5
         Z6ALpef+mmHcbAtIHDWjRBgdNmQGJvfwtPyIAnzp6QmFYWVIwhihefBgbuePMwGk9R+W
         ZTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773487339; x=1774092139;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AIiENy5+TBc+Tmxykx8gjxVXJVl5L84CJZwFGK8GrzA=;
        b=nQSaaw4PFdYHDbJ5h8wmtDaw7MW8qJwE2GCXliLvT14dg26EgRbeNLC9qW7b0yvknD
         +c7OINSTRhkUZ1FbXUdX1A4I9j+keTAIkCjkR/wN2+m/G27WlmSoUCN7P0cn9bIHjIv8
         hYyjjMpBpDo00OvFLPo2oJ7uT9uCBgOPEjBy5f1zO6+wTQ56Y3SgCisCR/fA/pinSg9M
         tfPkg34UF6gKX4cuEua2SiFkAqWw7eLaZe9mymr3BXvjGUB8/YWKGMTPJDbUnC0y2Vx6
         atTP11b/31ZeihlaJHYZMZ+ttloTg3pd1anqImdFdhkB47i1pDp1TIuJAYXYYs2msGiA
         o0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Nu9rzj3OKSjJh7BIHuWrAboh7kwlGTso1QqQQ6pM5L3OiqHFimYTzuStp02KV+9XDjb4J591xGVBz/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk50MerkH57B/yCm2/TcrFEu/BWiT9Mpy6Yvc2hke5VYCy/hYM
	4QkbMPfRZVIZk8YTFP5So+1g4LMoNjhcC5PHOamzz9GZlQTH5Yv6hvYtFTRxV5r1LRJBmbm37vu
	7x7FP927Y26LNT6GwIw==
X-Received: from wrwo17.prod.google.com ([2002:a5d:6851:0:b0:439:cce8:91c8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1787:b0:439:c6d9:7fc with SMTP id ffacd0b85a97d-43a04d95261mr12535461f8f.25.1773487338756;
 Sat, 14 Mar 2026 04:22:18 -0700 (PDT)
Date: Sat, 14 Mar 2026 11:22:17 +0000
In-Reply-To: <20260314004012.GD534169@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-3-beb8547a03c9@google.com> <aasPsbMEsX6iGUl8@google.com>
 <20260314004012.GD534169@ax162>
Message-ID: <abVE6VWCzZfyMEsu@google.com>
Subject: Re: [PATCH v2 3/3] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11929-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,infradead.org,arm.com,google.com,linux.dev,linux-foundation.org,vger.kernel.org,lists.linux.dev,kvack.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E87B628CDAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 05:40:12PM -0700, Nathan Chancellor wrote:
> On Fri, Mar 06, 2026 at 05:32:33PM +0000, Alice Ryhl wrote:
> > On Tue, Feb 03, 2026 at 11:34:10AM +0000, Alice Ryhl wrote:
> > >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
> > >  	$(call if_changed_dep,bindgen)
> > >  
> > > +quiet_cmd_rust_helper = HELPER  $@
> > > +      cmd_rust_helper = \
> > > +	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) \
> > > +		-c -g0 $< $(if $(filter %_module.bc,$@),-DMODULE) -emit-llvm -o $@
> > > +
> > > +$(obj)/helpers/helpers.bc $(obj)/helpers/helpers_module.bc: $(src)/helpers/helpers.c FORCE
> > > +	+$(call if_changed_dep,rust_helper)
> > 
> > I think this needs:
> > 
> > $(obj)/helpers/helpers.bc: private part-of-builtin := y
> > $(obj)/helpers/helpers_module.bc: private part-of-module := y
> > 
> > at least it seems to make a difference for AutoFDO.
> 
> Would
> 
>   $(obj)/helpers/helpers.bc $(obj)/helpers/helpers_module.bc: private is-kernel-object := y
> 
> work as well? Presumably, this is because c_flags only has the AutoFDO
> flags when is-kernel-object is set, which is only true when
> helpers/helpers.o is a part of obj-y.

I assume so, but isn't it more correct to set part-of-builtin and
part-of-module? I don't see any make rules making use of those directly
(instead of is-kernel-object) right now, but if someone adds such uses,
then this could become wrong, right?

Alice

