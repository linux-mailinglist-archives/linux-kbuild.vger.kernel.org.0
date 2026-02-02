Return-Path: <linux-kbuild+bounces-10977-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFOvIAYwgWkMEwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10977-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 00:15:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CBFD29DC
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 00:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FB92300877E
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Feb 2026 23:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E1E2147E6;
	Mon,  2 Feb 2026 23:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acfQ42a8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5092F1FFC;
	Mon,  2 Feb 2026 23:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770074116; cv=none; b=Wk7SD2oqwBexmuy4tqdNi0NtkCW/p5Rg58stI5WFWMMbM30hoa8zC09ZifM2b/okwFqJV/SGMF1b8rvrxng8+wJNPNOORjTOEXQirKqWMuKoyDKt2hltfbxs6WSoVlSV5C23yG0KNqszRmzaq+IiOzZz3SHqeQK2C95JxV8a5J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770074116; c=relaxed/simple;
	bh=1XwHPN4AupLXvP+bN6kH/Ou8DAfIc/Ke4SzidTUEdR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5vPZ2YHrt0olgIZS+6z0Y7QWo9yr6OkEwvDNGYh+SW2N/9fsj0BlHs9hFLPIQrSOr/7tV+dismDJybXVl03com86+eWveix9unHVlIXdVf24i3AiOLV/jEIBBAreOtyJEGrZOFaHSSyWmS/C8qnrswoxBwgrnWqBc/crNXOSCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acfQ42a8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA2DC116C6;
	Mon,  2 Feb 2026 23:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770074115;
	bh=1XwHPN4AupLXvP+bN6kH/Ou8DAfIc/Ke4SzidTUEdR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acfQ42a8kNzQpUvKE3nNJtuaqyG9amvuJG30UTwrzTlbtNbQEGu43n7K4ukBgExnR
	 fJEVD2y9wCADtuQYLA0md/3egtYljsk83cj+VnaEjhcPrNfXypxALKrWQ1g+Pcltuj
	 U5AGuhaw7lLkR6wmXrZqn+C/Io5/B4jjnZh9K9ge8bSew/OweBx5TR6NlEW1SiXy+b
	 TottQoB9xPLK5jvysSnZ/js5cXxQU8u8jsULAsFeiJFzfceV1YFhxS4m5kAwxOspny
	 1Be+K49shZdkgkHFKasAAD4qeW5YJo8ucGy9+MLpMpEHgKImdd98b6Zwe2F0QGDeHP
	 QIembv1zbS5Tg==
Date: Mon, 2 Feb 2026 16:15:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Naman Jain <namjain@linux.microsoft.com>,
	Nicolas Schier <nsc@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Subject: Re: [RFC PATCH] kbuild: Make --build-id linker flag configurable
Message-ID: <20260202231508.GB2319189@ax162>
References: <20260202110631.978412-1-namjain@linux.microsoft.com>
 <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10977-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.microsoft.com,kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,goodmis.org,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7CBFD29DC
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:15:30PM +0100, Thomas Weißschuh wrote:
> On Mon, Feb 02, 2026 at 11:06:31AM +0000, Naman Jain wrote:
> > I am trying to implement reproducible builds for one of my product
> > kernel. I referred https://reproducible-builds.org/docs/build-path/
> > and tried to use both -fdebug-prefix-map=OLD=NEW and
> > -fmacro-prefix-map=OLD=NEW, but still could not achieve bit by bit
> > binary reproducibility without overwriting build-id to none. 
> > If I move the kernel to same path in other setup, I was able to create
> > same binary hash, however, without it, there is some difference in
> > build-id hash values.
> 
> Can you force the same build path during package building?
> That should avoid this issue.

Yeah, I think that it would be better to document this in
Documentation/kbuild/reproducible-builds.rst, as opposed to adding a
hack to disable the build ID altogether. It seems easy enough to make
the paths consistent between machines and environments by using a
container or such. The new scripts/container in -next could help there.

Cheers,
Nathan

