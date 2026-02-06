Return-Path: <linux-kbuild+bounces-11057-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBWEH3vdhWn4HQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11057-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 13:24:27 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F90FD940
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 13:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D3B5300AC3B
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Feb 2026 12:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B233D3A7844;
	Fri,  6 Feb 2026 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="NmHEMIco"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512482EE5FD
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Feb 2026 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770380663; cv=none; b=p4EjvWIlKuYsti0KEh5TQl/L86tHWhsLYqqw3JXioKkbKd7bk86wGYl3xLmC0LTw4MDoVaNGZnViVB+UqjbnFR8BlKwQ4TbNpfOM3YuxAa2J9Oo00RDrzMkxALFdiYKw0M97CnkLY2e8oC7hEcyh8aIxjIkBTuDvPSsSFWhqh20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770380663; c=relaxed/simple;
	bh=xihRajkhxSN0LzS6oaE2l+KPnSf/jZpWp5DiMy2CGUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DIunD6fNx8cuuL5I1bAlA7Paqk2eStIQxCdxFNE9Cu9yr7xhjiUonuac/+j+qjO3NGdlieIHGk2UVl1IhZtZfqO2piBv8YgSVMKsJdYteuzLAErzHqBQZewNiidrnKZX/HL/g1gqc+k3RDrLdYa2/2OKT3mZGD1Ryg59FNntuvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=NmHEMIco; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 4EE24240028
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Feb 2026 13:24:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1770380656; bh=U+Pf4h9M3YEQg0wRE4TDVLhds2dAi1ljJ/3l0LMHbzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=NmHEMIcoerHjzuD4tJMyvxsXu9zwDiXUTVm/LEGhC8+I9Ssm8IEcX3p/fpIQqzDhI
	 +hGqZvk61EpnBPX45I4KE0MQAENUK3bA1RmGtJLEtlekWDwWOqyERmJlHDFIaRY2DS
	 Lccl46s+Tc1RjhTQayH+mTu39OlRxE2bdHlqE/Gjjjm/6J3o8xEjxZzqD+nhGBxGdh
	 D9MBSNchx+HlNaM4jNlh3H3dQRolnzWG9e/IjZypcEAJK911ajBH/QSF0EJKENjDVh
	 5EBI3kinb27Nmh9rgH13fXL2Q539V0/vxhKn7V/cfMwYj65vHOUctzBW7YVjY6u2Dk
	 mPbITL76tJr7g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f6tYh12xGz9rxF;
	Fri,  6 Feb 2026 13:24:08 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
Cc: Nathan Chancellor <nathan@kernel.org>,  Nicolas Schier <nsc@kernel.org>,
  Miguel Ojeda <ojeda@kernel.org>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <lossin@kernel.org>,  Andreas Hindborg
 <a.hindborg@kernel.org>,  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross
 <tmgross@umich.edu>,  Danilo Krummrich <dakr@kernel.org>,  Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>,  Bill Wendling
 <morbo@google.com>,  Justin Stitt <justinstitt@google.com>,  Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Jonathan
 Corbet <corbet@lwn.net>,  Conor Dooley <conor@kernel.org>,  Mingcong Bai
 <jeffbai@aosc.io>,  Han Gao <rabenda.cn@gmail.com>,  Vivian Wang
 <wangruikang@iscas.ac.cn>,  Jason Montleon <jmontleo@redhat.com>,
  linux-kbuild@vger.kernel.org,  linux-kernel@vger.kernel.org,
  rust-for-linux@vger.kernel.org,  llvm@lists.linux.dev,
  linux-riscv@lists.infradead.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 4/4] RISC-V: handle extension configs for bindgen,
 re-enable gcc + rust builds
In-Reply-To: <9323714a-b15f-4616-a525-780accf33b52@isrc.iscas.ac.cn>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
	<20251230-gcc-rust-v5-v6-4-2ac86ba728c8@isrc.iscas.ac.cn>
	<87v7gk8r5x.fsf@posteo.net>
	<9323714a-b15f-4616-a525-780accf33b52@isrc.iscas.ac.cn>
Date: Fri, 06 Feb 2026 12:24:15 +0000
Message-ID: <874inucb6g.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[posteo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[posteo.net:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lwn.net,aosc.io,iscas.ac.cn,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[posteo.net:+];
	RCPT_COUNT_TWELVE(0.00)[31];
	TAGGED_FROM(0.00)[bounces-11057-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charmitro@posteo.net,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.net:mid,posteo.net:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Queue-Id: C8F90FD940
X-Rspamd-Action: no action

Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn> writes:

> On 1/29/26 21:49, Charalampos Mitrodimas wrote:
>
>> I'm under the impression that the `!RUST ||` guard here doesn't
>> actually prevent the `$(bindgen-backend-option,...)` call from being
>> executed. `$(...)` shell expansions should happen during the textual
>> substitution phase, before symbol dependency evaluation occurs, check
>> documentation at kconfig-macro-language.rst lines 228-229.
>
> I suppose this is unavoidable if we decide to probe options rather
> than rely on version numbers.
>
> Similar issue also occurs in `cc-option`, for example:
>
> 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imv)
> 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
>
> For 64-bit builds, `-march=rv32imv` will still be probed; for 32-bit
> builds, `-march=rv64imv` will still be probed.
>
> I agree with Nathan that this trivial waste is worth it for the sake
> of simplicity.

Understood. Seems not worth it at all.

>
> Best regards,
> Asuna

