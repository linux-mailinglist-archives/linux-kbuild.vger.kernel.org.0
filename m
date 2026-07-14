Return-Path: <linux-kbuild+bounces-14011-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rRkbK6xFVmqG2gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-14011-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 16:20:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C8F755B6A
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 16:20:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="l/PQUjVb";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-14011-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-14011-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2493532D1690
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 14:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1A847DFBA;
	Tue, 14 Jul 2026 14:11:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37A743F8C1;
	Tue, 14 Jul 2026 14:11:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038267; cv=none; b=Ke65fNKShunZFOYp70aam2mYvf/Vtobo10M27anAnlQV/KazRkOiTxNnFVzBRJ8spbIb0tKKba35Apxv2MdGIGc5Tof+dIANLZAQ8r2ZiqXMJQifr/yMKwQcKTjOedYygqfQ7etdUVS1DcvWtglK/4ieEUUIru5LiRic9WNA050=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038267; c=relaxed/simple;
	bh=dcW3cE/hf1kJ9qjd8UMyUI+ViIp+bc438j1ReqR2QMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2W68xMzJAKJehGx27pP88YHTNlyxVkB34wUmtkk4seWV4oFUMh2J+rZSPDu7esgzHahmKTPLzWcXAs5u32K47hW+OVziiZPWGWXXObQdrb+TT0psrxt51JtL49sgdXw/LX0//5azigRUi6g/B7u3TtyV6mUFhvd1O1V1rKo4Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/PQUjVb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EE6821F00A3D;
	Tue, 14 Jul 2026 14:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784038263;
	bh=q2BraDXQ6vRiKOdM+Y/8dY3JbsOVKeBr4Q5jDnH6B84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l/PQUjVbsadM2pmHnve5IhmoQgHo9kk8wTU+WcAJbVrMs/Yl3fLyvHk4wmIkFRlC8
	 DZZ/SQ2pAYfIAzZamDG9WBKKI+rATTPPDEfUDIkBozn9M2TkVzM0c1uHhW2Xb8mx5K
	 C7NmE4+TxOsLpg+1jv+gOdPRyqrfTLm5Y+tjgIBp5ne2/Jbc39ka2pICPEkk7//4qG
	 yPhdunzoSKSiK+S+xA/vvwUywffFmPiHPoDZTJRBAmbONSxJIHtnMSF1xKnKclr4hm
	 7r4zMcY40eiIkcrIH0je8JHZX25sF8I9YCv6n/u5dHwaHAD/UUQ2Df3NIVAxBEnvlv
	 MTnAvc4CqZVrA==
Date: Tue, 14 Jul 2026 16:10:48 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Sergei Litvin <litvindev@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	nathan@kernel.org
Subject: Re: [PATCH v4] scripts/tags.sh: Add support for rust source files
Message-ID: <alZDaH0CN-GBLKPj@levanger>
Mail-Followup-To: Sergei Litvin <litvindev@gmail.com>,
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	nathan@kernel.org
References: <20260714122441.78158-1-litvindev@gmail.com>
 <20260714125259.78824-1-litvindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714125259.78824-1-litvindev@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:litvindev@gmail.com,m:miguel.ojeda.sandonis@gmail.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:nathan@kernel.org,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14011-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45C8F755B6A

On Tue, Jul 14, 2026 at 02:52:59PM +0200, Sergei Litvin wrote:
> When executing the command `make cscope`, the `cscope.files` file generated
> by it includes only filenames with the extensions *.h, *.c, *.S and not includes
> filenames with *.rs extensions.
> 
> To fix this, modify the functions `find_arch_sources()`,
> `find_arch_include_sources()`, `find_include_sources()`, and
> `find_other_sources()` so that they can accept an unlimited number of filename
> patterns as parameters for the search. Add the `setup_name_pattern()` function
> to convert these filename pattern parameters into a list of parameters that can
> be passed to the `find` utility via the new `pattern` variable.
> 
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Boqun Feng <boqun@kernel.org>
> Cc: Gary Guo <gary@garyguo.net>
> Cc: Björn Roy Baron <bjorn3_gh@protonmail.com>
> Cc: Benno Lossin <lossin@kernel.org>
> Cc: Andreas Hindborg <a.hindborg@kernel.org>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Trevor Gross <tmgross@umich.edu>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Cc: Tamir Duberstein <tamird@kernel.org>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Onur Özkan <work@onurozkan.dev>
> Cc: nsc@kernel.org
> Cc: nathan@kernel.org
> Signed-off-by: Sergei Litvin <litvindev@gmail.com>
> 
> ---
> 
> This is the second part of this patch:
> https://lore.kernel.org/lkml/20260602121521.11650-1-litvindev@gmail.com/
> 
> which I have split into two parts, as suggested by Nicolas Schier here:
> https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/
> 
> Changes since V3:
> https://lore.kernel.org/lkml/20260714122441.78158-1-litvindev@gmail.com/
> 
> - Fixed list of "Cc:" tags
> 
> Changes since V2:
> https://lore.kernel.org/lkml/20260714083709.69517-1-litvindev@gmail.com/
> 
> as suggested by Miguel Ojeda here:
> https://lore.kernel.org/lkml/CANiq72k0RbkWk=8hiNzHUmFWr=6OA2DBHAUew4OfZb_Umb=6hA@mail.gmail.com/
> 
> - Remove "Cc: stable@vger.kernel.org" tag, because this commit introduces a new
> feature.
> 
> Changes since V1:
> https://lore.kernel.org/lkml/20260705175957.4672-1-litvindev@gmail.com/
> 
> as suggested by Miguel Ojeda here:
> https://lore.kernel.org/lkml/CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com/
> 
> - Add "Cc: stable@vger.kernel.org" tag
> - Add missed "Signed-off-by:" tag
> ---
>  scripts/tags.sh | 40 +++++++++++++++++++++++++++++++---------
>  1 file changed, 31 insertions(+), 9 deletions(-)
> 

Tested-by: Nicolas Schier <n.schier@fritz.com>
Reviewed-by: Nicolas Schier <n.schier@fritz.com>


-- 
Nicolas

