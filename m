Return-Path: <linux-kbuild+bounces-14018-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v6KkBj9RV2q7JAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-14018-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2026 11:22:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B96775C6AD
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2026 11:22:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cdW6QMex;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-14018-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-14018-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A5D932BC3EB
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2026 09:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED5741610E;
	Wed, 15 Jul 2026 09:13:06 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F364F4156DB;
	Wed, 15 Jul 2026 09:13:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106784; cv=none; b=TiOdrs++wH1urLyLMp6gojBmB2MlqiLfBUESLakgRWaN2Jn3IpMRhVBwJNae2yqp+wihu1FGkKDujRVZMDDU+WC7odVnIibNlbXKvGEncvk8DZmyY3ek6y62tLzVo/WEJbjsyFNxPNdu9Iaxk8vuj6jvoXJwjMYdPv3tUYYmquQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106784; c=relaxed/simple;
	bh=ZuI6c56qCbvtlQu9iW6eSgb7tuRCOSj5bRlR3Wi83aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkGi2B82JoNaK7/btP12IHTR6g40w+JFm3ZxNSYHiZadx+Tzd8OMVvyOhkkevFlDbZTPG3eyijcR9BPV+HrEveVggM39jiaeZEDuKJ4t+pY60RXw8Io4AX+nQ4d6/3+fEfwMu6wP8ILR3OIms9keZN68P7BFJYdE31HG7r0b0Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdW6QMex; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id DB95F1F000E9;
	Wed, 15 Jul 2026 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784106780;
	bh=bbsxyVWqOGFhtr4W+a8jv4bdeufYTgNlzVGO/0yDsl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cdW6QMexC3OBVbgSpjjXQqo42CJ0wcbnhev8oKN0bF56iq/0jgg/Vg1/a958vAFBk
	 /LnU9l+qWYidpPizZBb6d8ggzR9+6c36kCaxelGu3kq4p7t0x9uw4nWYYLbZa9COCD
	 OLqOw3mG+V/9IFz5aC7KiMakxWew3Q1jdZr9N8itGJjZkFzRJHmW5nlRIlVWBjen4f
	 8BVYdEyYoU5r3+ah9eERkcUoUPiqZizBHC5wherA8qCDm9+DJS2FBazI/uwFWNvvSH
	 qWKAM7WiilJhVxzcsfMNT4IR9QPgeHYJVlsq62kE7m9XfEU/Zptit6be5s3cPXseDV
	 qLufT9NBiQInw==
Date: Wed, 15 Jul 2026 11:12:04 +0200
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
Message-ID: <aldO5D9hHVSdcM_W@levanger>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714125259.78824-1-litvindev@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-14018-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,levanger:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B96775C6AD

On Tue, Jul 14, 2026 at 02:52:59PM +0200, Sergei Litvin wrote:
> When executing the command `make cscope`, the `cscope.files` file generated
> by it includes only filenames with the extensions *.h, *.c, *.S and not includes
> filenames with *.rs extensions.

With removed Cc trailers and adjusted line break in the commit message, applied
to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] scripts/tags.sh: Prevent binary files appearing in cscope.files
      https://git.kernel.org/kbuild/c/4859c0d5

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas

