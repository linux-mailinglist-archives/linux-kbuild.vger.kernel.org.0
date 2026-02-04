Return-Path: <linux-kbuild+bounces-11033-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEmvNTsqg2kxigMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11033-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 12:15:07 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 449E2E4F66
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 12:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F3B33054D15
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 11:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951D93E95A7;
	Wed,  4 Feb 2026 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHh0lm+T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CECA3D1CCC;
	Wed,  4 Feb 2026 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203572; cv=none; b=iD1dwrDyQAFhh2FIdXegq2JSAB08JqI4NpRvNx90Oj3lFcOp/M6V6V+XefIOg/KY7KSpifhhfEoZAMiCtuPrad/Frd5NhDTLaKoAT0bbJbST6lFCzlvpKzGUyAFST9uekfHpYaCNwLpewpVh7qz743KWeRoa/oDGs+bMlZUkEU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203572; c=relaxed/simple;
	bh=TKftG8kJFVas8V4VIQs0V1/DPoOwdE3BUWnQnjnqKQE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r28nKABt6i7wu4iQcAs8AedZebl2Z0gJnMONWeuypwoYv5/QzBft0Sntu6uwIl3wU7MrWoycSkoT6WsVvF9y6fBJHrKwO/KzVbMzhMU7YO0KHgziFHOOcl4YXmWNbRwlHDzFP0g9wUGiuUXWfEPDyPs+rq9kBT2VBg33dquMkf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHh0lm+T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46C9C16AAE;
	Wed,  4 Feb 2026 11:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770203572;
	bh=TKftG8kJFVas8V4VIQs0V1/DPoOwdE3BUWnQnjnqKQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MHh0lm+TNiO0Rq8Cxqdd8JorUylnEv0sN8bu6s6GONXydfg4mpEijgIKpNrHtD8Tl
	 zDcq/0xrk3UUvrJATxVQhHrd1GoauTwjQ2QbFFY/WdrVMwG7rfIfsf7VYJbAOTPkT3
	 1RGZhVwg6q0aPhFyOEmTbO1CdMPxTcOcAuomB5P15edWrEeaL/Uy4kjMuMFdLaBA2m
	 LP1QvV0iTze8L2nx7lZuad3nHlho2tQXVban72PdlfbGZs8Eana6Xfw1BIxgZ083kK
	 cqpD5sAg8NxhQBoS7FHLDx/mYNfBUfXWeHzYL+1xqDHp4ri8KAvv3u48N2O3sTchmj
	 WLy3cxRcX8mkA==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnaoT-00000004xiO-1f6f;
	Wed, 04 Feb 2026 12:12:49 +0100
Date: Wed, 4 Feb 2026 12:12:47 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rong Zhang
 <i@rong.moe>
Subject: Re: [PATCH] kbuild: Do not run kernel-doc when building external
 modules
Message-ID: <20260204121247.0ee0eac4@localhost>
In-Reply-To: <dc38c823832997bc5f15dd9020e2e80c526f1b8a@intel.com>
References: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
	<176987242178.1743608.5094531752561489739.b4-ty@kernel.org>
	<CAK7LNARR9bZQ9t9emcVzmL+P7xYemu=8s8v_LshQ0-m_zEE9mA@mail.gmail.com>
	<6387ba7b99fb952a59932c3a851dfd0ecc4dfb2c@intel.com>
	<aYMbVcNvJPlLPaaG@derry.ads.avm.de>
	<dc38c823832997bc5f15dd9020e2e80c526f1b8a@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11033-lists,linux-kbuild=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 449E2E4F66
X-Rspamd-Action: no action

On Wed, 04 Feb 2026 12:39:22 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Wed, 04 Feb 2026, Nicolas Schier <nsc@kernel.org> wrote:
> > Well, sounds straight forward at first, but where should we make the
> > cut between kbuild and non-kbuild?  
> 
> I'll reply hypothetically, just for the sake of discussion, because
> realistically, I don't think any of this is going to happen.
> 
> IMO the cut should be, "Is this required for configuring and building
> the kernel"?

Agreed. Going further, maybe the best would be to define it per make
target, placing them on 3 groups:

- kbuild - make targets related to actually build the kernel;
- docs-build - make targets related to build docs;
- non-kbuild - the remaining random stuff over there.

To properly define what should be there, maybe the best would be to
look at "make help" and define what belongs to each group:


Cleaning targets:
- mostly kbuild (documentation is also part of cleaning targets)

Configuration targets:
- kbuild

Configuration topic targets:
- kbuild (I guess)

Other generic targets:
- kbuild: all, vmlinux, modules, modules_install, vdso_install, dir/*
- There is a grey area here with targets like cscope, gtags, tags/TAGS.
  I would consider those as non-kbuild.

Static analysers, Tools, Kernel selftest:
- I would also consider those as no-kbuild

Rust targets:
- dir/*: kbuild
- the other ones seem ancillary tooling. Probably, non-kbuild

Userspace tools targets:
- for sure no-kbuild

Kernel packaging:
- no-kbuild

Documentation targets:
- docs-build

Architecture-specific targets:
- kbuild

> 
> scripts/ just sounds like a dumping ground for random scripts, and
> kbuild should be somewhere else. And let scripts/ be the dumping ground
> that it is. If kbuild was under kbuild/, nobody in their right mind
> would suggest adding random unrelated scripts there.
> 
> If kbuild depends on some things like objtool from somewhere else, so be
> it, but at least don't pollute kbuild with unrelated things.

Agreed. Yet, better to document it somewhere.

> 
> > I admit that there are some scripts below scripts/ that I'd rather
> > label as "contrib", but I don't think that these are too much.  
> 
> I've got to disagree there. I think there's so much that it's hard to
> follow what is and isn't actually required for build.
> 
> At a *very* quick glance, there are things like checkpatch.pl,
> get_maintainer.pl, anything coccinelle, bash-completion, Lindent,
> macro_checker.py, bloat-o-meter, bootgraph.pl, etc, etc.

So true. on its current state, scripts/ is a place where people
ended adding random stuff over time.

-- 
Thanks,
Mauro

