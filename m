Return-Path: <linux-kbuild+bounces-13675-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 91bUNRD/J2qx6wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13675-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 13:54:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4776E65FB8A
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 13:54:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=fritz.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13675-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13675-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 089D23037BBB
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 11:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DF43EBF04;
	Tue,  9 Jun 2026 11:50:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0337A3911C5;
	Tue,  9 Jun 2026 11:50:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005808; cv=none; b=cGd6ZeKgRD24wTFDOWgPZTMx2jt8MQzYK8RxzYc0F2PloxZu36c0B5udb5ZnNClyRU5olbM07v/HtCT0a51hLmjKiF5iw4ajuZkN+PTmEHK26dIcS3BVzKNt1NBMVCftBp1OAkhaDUn+JEIheOIpi0U9BR1iKKITnkix4inER+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005808; c=relaxed/simple;
	bh=j5lcrehjy3YZRC7ObybiUdgrUhBAZijdwkSsZmPZr/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cg/To5nbUyh24AeqB6+79zHKY6iLNWuQCgoXb3FSk7GjEmpLrINqAsGkJpSUHIKnG5DlbPjuIvnEfeYlzgN+gMd4aeID3Z2IQ0/4L+WWJmsKVi/2DJL8hNGbkY0EnRKtcazyXnVVATIC5vfMgksu0OO+t/GOqarB1FoS9V8IyDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; arc=none smtp.client-ip=212.42.244.120
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a27fb9e-044e-7f0000032729-7f0000019e16-1
	for <multiple-recipients>; Tue, 09 Jun 2026 13:40:14 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue,  9 Jun 2026 13:40:14 +0200 (CEST)
Date: Tue, 9 Jun 2026 13:40:14 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@amazon.com>
Subject: Re: [PATCH 05/18] rust: kbuild: define `procmacro-extension` variable
Message-ID: <20260609-hungry-rigorous-moth-e9f5ab@l-nschier-z2>
References: <20260602172920.30342-1-ojeda@kernel.org>
 <20260602172920.30342-6-ojeda@kernel.org>
 <aibUgUSlz-p2oxvX@derry.ads.avm.de>
 <CANiq72nWBSTXz8VBkMuf_Bcs2MgZ31nocL3o_s7HYv=HbVK_-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nWBSTXz8VBkMuf_Bcs2MgZ31nocL3o_s7HYv=HbVK_-g@mail.gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1781005214-D57F0962-6745A6D6/0/0
X-purgate-type: clean
X-purgate-size: 1313
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[fritz.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13675-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:nsc@kernel.org,m:tamird@kernel.org,m:ojeda@kernel.org,m:nathan@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[n.schier@fritz.com,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n.schier@fritz.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,l-nschier-z2:mid,fritz.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4776E65FB8A

On Mon, Jun 08, 2026 at 05:40:02PM +0200, Miguel Ojeda wrote:
> On Mon, Jun 8, 2026 at 5:10 PM Nicolas Schier <nsc@kernel.org> wrote:
> >
> > Where does the 'libname.%' pattern come from?  Looking at the current
> > users of cmd_rustc_procmacro I'd expect a 'lib%' pattern instead.
> 
> Here, we want to extract the extension the operating system uses --
> this was originally added for macOS build support (Cc Tamir), and is
> `.so` in Linux but `.dylib` there (and if I recall correctly, we
> couldn't force `rustc` in macOS to use a file with `.so` as the
> extension, sadly).
> 
> In the commands, however, what we are trying to extract is the name of
> the crate instead. So that is why one is `lib%` and the other
> `libname.%` (a dummy library name).
> 
> Or do you mean something else?

Ah thanks!  If only that filename extension ('so' or 'dylib') is wanted, 
I'd rather expected the use of the '$(suffix)' function instead, as it 
may be easier to understand w/o knowing the name conversion rustc does:

  procmacro-extension := $(suffix $(call procmacro-name,dummy-crate-name))

but that's bike-shedding.

> Thanks a lot for the reviews! By the way, I sent a bit ago v2 (it
> doesn't change much, so I will pick your tags from here :)

Thanks.

Kind regards,
Nicolas

