Return-Path: <linux-kbuild+bounces-13735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NL9CIyP1K2pDIgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13735-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 14:01:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 26029679365
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 14:01:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Uns2iOpZ;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13735-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13735-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ACDEB3017E59
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 12:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DF53ECBC7;
	Fri, 12 Jun 2026 12:00:00 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ECB3F1AA2;
	Fri, 12 Jun 2026 11:59:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265600; cv=none; b=Pz/12L/rOeaYZccrqyAagGXHymB5B/d+Q3MhNOgBhr5EMXHo2Ek6m98Uj29tqWHVO4Dh4dKuXtPUDjTHqUq6SANBy7P49EHQKAxiN2Xdn2RySdl9wMzapoi1sKSgfrgX+K1GeYDlr5ZDLlgwp/Gins77E4/YVFYT6TaKWeC2p1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265600; c=relaxed/simple;
	bh=uzBaaCaOKS7K/Ou5KJQ1XcJririLDT7rc0FJe5wuFew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMAfEus7ClPSI4gxbbLl1S1Z6qbTu6gOeA60+f8JBY1MBHnIaFkZYdHZy/HP9W1TfzrfaxLG/WgGNVIa4H4ouLIsrDmSEajsp0CW5pCoV6P6oe/g8ELcyPD0BqIC5MwV8GxVoDSdP0OCS28kNgwfhjMjc0bjjKLN15H94lzcnVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Uns2iOpZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A431F000E9;
	Fri, 12 Jun 2026 11:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781265593;
	bh=lfRYVrHnH3zSyY1OtShDbjM++EfIKtacmWq2ECCh8Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uns2iOpZdTYtElT4AJsXNE4b5m7C8mkgW6N6xnw727SZDGI2fnM9AC5OVQ8j0SGpi
	 eYVWgcMVXd/LnjZViCee8aErJlK6PL7mg1wPgZ4tEAyrG7Hf98rIJZnAHCmG19dpZA
	 91FsYpYmqmVNkqm/rE25Gt4uoQ1KfJj0YWT+NTas=
Date: Fri, 12 Jun 2026 13:58:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@google.com>
Subject: Re: [PATCH v2 00/19] `zerocopy` support
Message-ID: <2026061250-negligent-bagging-9ed8@gregkh>
References: <20260608141439.182634-1-ojeda@kernel.org>
 <aigFQcq3JHtdpsIn@google.com>
 <aigKVysaNhloK9bS@google.com>
 <CANiq72=vsePio3EBdzbHA+kTHfPQyHyYmPGnkm1r8ktsCuPrqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=vsePio3EBdzbHA+kTHfPQyHyYmPGnkm1r8ktsCuPrqQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:aliceryhl@google.com,m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-13735-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linuxfoundation.org:dkim,linuxfoundation.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,gregkh:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26029679365

On Tue, Jun 09, 2026 at 03:08:20PM +0200, Miguel Ojeda wrote:
> On Tue, Jun 9, 2026 at 2:43 PM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > > It's not clear to me if changing the uapi headers like this is even
> > > allowed to begin with. It's a somewhat non-trivial change.
> 
> After our call I recalled the tool I was thinking about:
> 
>   scripts/check-uapi.sh
>   Documentation/dev-tools/checkuapi.rst
> 
> It turns out it uses `abidiff` (abigail).
> 
> >From a quick look, it seems to complain if I add explicit padding
> where implicit padding was there before, i.e. as a "data member
> insertion", even if the types etc. are the same.
> 
> However, for this change, i.e. when inside the `union`, it doesn't
> seem to complain.

check-uapi is there just to determine if we actually change the
user/kernel api, by adding explicit padding you didn't change the size
or location of anything, so all is good.

Ideally yes, we should have explicit padding everywhere, so we know to
catch this, but for older structures sometimes we didn't :(

thanks,

greg k-h

