Return-Path: <linux-kbuild+bounces-13087-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJqyIboG/2lg1QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13087-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 12:04:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1AE4FF156
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 12:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B41AC300CFDF
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 May 2026 10:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079C437AA8E;
	Sat,  9 May 2026 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="W/XTWuJz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.ms.icloud.com (ms-2001k-snip4-6.eps.apple.com [57.103.73.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F1A208D0
	for <linux-kbuild@vger.kernel.org>; Sat,  9 May 2026 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.73.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778321078; cv=none; b=QFdI1acYVHj0OjIoRUE7X+7Vz6o8IlH/yvuSnA+XNy4wmCWbiNA3zvBMdhftRHDQzwI8s8MWQcHjQnEj7WvDOb+MdgF2FK6fzIzW62zG7ajm62SdC6iWgl23df/fVci95Vqtn1g1yVhNos4NjSDQunVszAUarGXDtvSaFkXZsjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778321078; c=relaxed/simple;
	bh=I3OoFkMZCnmH9nH8zzOnhFiF1KtaOt2m1An+AWSgBDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhzX4wKKqfEn+aH87tkJdqjsp2/kARwIcX7ZioTSv/LEtKyJZe0nHnRMU+W53kADmLPrpJADao98rsueeh4FJGCn3gBAI3aQAmFunZRjpvyK4A7VelUQzSmpNLQF/TWHxlwxy4gFZ7xvCkAQXpJrlAyFiEuK8gYbKKedhGYbaXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=W/XTWuJz; arc=none smtp.client-ip=57.103.73.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-7 (Postfix) with ESMTPS id 70F9A18000B5;
	Sat, 09 May 2026 10:04:34 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQxWAlsERQNGDFYBXwFLVxQEFVwtRA9aHhcbUE1RDw8dVjhACV8FHBNaWEEOCloHUFEdXwIKBEcEWxdGA1NFXwMXEVABWB5WXloXXk1HH0BNYkkBWhlbHEAXSm5NUw8PA10QXUNUCBIdUBwOUQMbWhsKAEQIQhxABE0cSgpOBkQDDxNFF1oaBwhaDF8aUlxcFAwUUFpfXEtHDR9FC1EScgZRFFUbRw5IRw4KRlMXH0sAXEVQGEQfXR1mHFwAVgJc
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1778321077; x=1780913077; bh=afbuHVTVwe28Ix9dg1FYsBJUJ+gQVnSTousb1ddkuWE=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=W/XTWuJzzT2nbYnVFSeLEzj6kZEzo4XShS57U08uM5jcVZJVsJcFjyQkYeeVqDZ/Muc/w5v9fRuwQG1qYpi/f0It1UZL1WIibhw/3bi67/1JvQ9hkNe1N3NJDg7LyFywlb0xwmjgNurRcNDTZp/cltJvMylBCi//x/T1x91aw8vC83CtcwRo45IN0QNfj/vXQH05CUueqx7277+fYXcuQwipjAy++kc0g/c0T0oVVBPN+ZOPrzWzYzgj2HJGyvWaLzXEOquSbfLT5JX2Yikp6+mjGHUCEU1BYMzyKwy99ydBPt10CnbFR2fa5SAadhhwQOX1cCyLMRyDKdVEzzndkw==
mail-alias-created-date: 1772007648188
Received: from sdhn.cc (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-7 (Postfix) with ESMTPSA id CE0491800126;
	Sat, 09 May 2026 10:04:29 +0000 (UTC)
Date: Sat, 9 May 2026 13:04:26 +0300
From: Mohamad Alsadhan <mo@sdhn.cc>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Yoann Congal <yoann.congal@smile.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <4phk3xweuwrttdygymvs6kvzmq5xctlwe7nd5lc7h7y74gvffy@vhlfvpez77ru>
References: <20260416211525.13847-1-mo@sdhn.cc>
 <177751087668.2042162.14581501251680231924.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177751087668.2042162.14581501251680231924.b4-review@b4>
X-Authority-Info-Out: v=2.4 cv=bfFmkePB c=1 sm=1 tr=0 ts=69ff06b3
 cx=c_apl:c_pps:t_out a=qkKslKyYc0ctBTeLUVfTFg==:117 a=kj9zAlcOel0A:10
 a=MKtGQD3n3ToA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tIL9hLv6XyjG5xfdGEkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 4Hb0_gDMUfuRol-Ju46z7_r9DnSxsBri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDEwNyBTYWx0ZWRfX662VFiNmSR0W
 71NeiXANCSVR94xyJLCl2p4tHmPu2CITmEYUKZA4QR45zyyv7Gff4JHinVK0XT1Np1gUPzq3wEG
 q/RUFdMnSqXgds9JQoIkDKd7yKGj+opE70cZJpNiP+/GwVFCA3zpI5wJKPoQCMtDdx2AeeDNjKJ
 FDKBxrIAhUAKmSdIjaLYa9JwTo8Ye8ENpTC5thC3IBWNGJrsCvCzf79czvzrXKdKFNfzy3TtCqA
 lBpf2dPTNFsDsayL6pGWWYPU1z3a/oOoPJgp04Hhi1XP+ZEztbWm4pQhNEGLvu/NLPClSPBvhIG
 wsr0wzCXbaFQ7lqAAYtXMlB1+1pge9UMhl43ISe2IyZnXhSv6aiVd2ywzLk68Y=
X-Proofpoint-GUID: 4Hb0_gDMUfuRol-Ju46z7_r9DnSxsBri
X-Rspamd-Queue-Id: 2F1AE4FF156
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13087-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sdhn.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,smile.fr,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mo@sdhn.cc,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Thanks for your input, good points.

On 26/04/29 06:01pm, Nathan Chancellor wrote:
> > -		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
> > +		-Clinker-flavor=gcc -Clinker=scripts/rustc-wrapper \
> 
> I think this should use an explicit $(objtree)/ prefix to make it an
> absolute path.
> 

I changed the rustc-facing path to `$(objtree)/scripts/rustc-wrapper`
in v8 for clarity. However, the make prerequisites stay as
`scripts/rustc-wrapper`, because the rule is defined for that
target name; using `$(objtree)/...` there breaks make dependency
resolution.

> I have not been following this series too closely but it feels weird
> that multiple rustc-wrapper files would be generated when their contents
> should be the exact same. Would other host programs have to copy the
> changes you made to .gitignore and Makefile under samples/rust/hostprogs?
> What was the issue with attempting to unify these?

I agree; per-directory wrappers were the wrong end state.

I have reworked v8 to use a single global wrapper under `scripts/`
for both `rust/Makefile` and generic host Rust builds. 

The missing piece before was making sure that wrapper is always
generated when Rust is enabled, even if no Rust hostprog in `scripts/`
would otherwise build it. With that fixed, the local ignore/clean
changes are dropped.

v8 should follow soon. Apologies for this taking longer than needed,
it was my first kbuild patch. The feedback and patience are very much
appreciated.

--
Best,
mo

