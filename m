Return-Path: <linux-kbuild+bounces-11622-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEKDLREFq2nDZQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11622-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 17:47:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFA322551E
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 17:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E9FB3008787
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2026 16:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1831630146C;
	Fri,  6 Mar 2026 16:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ZTK1AuNF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jond5MkC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0346336A012
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Mar 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815562; cv=none; b=rwG23bf95cxkITIR0kGnKieTaFI3zqW0TGN83CTdEZ7xBCZpmF67GxHeGHG6uqVHADB4SsihvQH10eivs8r7Y07sX6ERGHjf6rec4UfjtIwWFAnwqmH0/ueWupqN27qVLNJFd57doaAxJXATSC0KKIDlZjk4ii+92ft0JIFNuVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815562; c=relaxed/simple;
	bh=+6s2p9mmBJkX9YADfEc5EUJsiILQDtlIlvIk1hqTjsc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=R96bZBrI6kJiKiFZweK4hZT5kpV0ZCBs+z3qm7a+7WwHNHQ1hyv3TN75vYdG2tOe74CRjK/piMKlOf/S8/cY2PVjBu63vQBlH/WH7JC3gpsP8CxLcr+o6F8SfJIMBrhi2Xel8g99kKTPpNUUi8pGpbNKZA9kXKPQHnOKN8bBG4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ZTK1AuNF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jond5MkC; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AC2877A0150;
	Fri,  6 Mar 2026 11:45:58 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 06 Mar 2026 11:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772815558;
	 x=1772901958; bh=tKTRbSZGFnHFLlaj1rJ/ldbQGnwiGsir9XWRQcKktLY=; b=
	ZTK1AuNFhB7SziVA8aVzrT6YppQ1YHgfeZBseHsj71kKyGrGB5fp2P4mMo8Eg7N5
	oEOp55dcNOW2wKwiHulPt2Dfx7QNq2xo88kByzRxlz5vnVumr5ZjD9LWi29Kxmzf
	7ekBzS4kstYaVcq8XlAAP/+K2Mbq744Xae2wvX+xVkRwzX8HVuvqj823U7AWv9g4
	wWZWbTbYj5hadJfk1TsrT1fj6x3mzmDLfeGn+1+oxZWc0g/NzalLM64SKV0GZryU
	s3PM5rNZy2HvoN8H1r5WeoZUomfrYQRz/llU5k1IFiqJSNWZ5vXWDfmW18K/ugvz
	BU9DZWQSduJADkiS3hFTkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772815558; x=
	1772901958; bh=tKTRbSZGFnHFLlaj1rJ/ldbQGnwiGsir9XWRQcKktLY=; b=J
	ond5MkCr3FvJPoe1/Tksm3KYFeg5J/wf/hU8QpTWHEySbqa34j96XaAH/u6jNJtn
	kyBjC+9YbbmHy9Xt3Uu6i25/E5vjXSVv9XJ7zo6bixD1EHNIB3ToQsSzImkABrp+
	wiSDutqi7nEoU4N2eIfBzwQ0IM7UuAkiKPK+CvSwFMeEq7HO3QYFo/XLnThpQpk5
	2H1nW7O5ks/6UwjsXcYqtvA31F8t/0X4T1QSX0MkMBanJ0T7UqYCahOvzu/O84pD
	HwlSVFY8QtzG2jVlpp/seT3hnbL6DRHXzrKkdRhq4okmWLKJ1rsM7l+hfX7uz792
	87lelwqD5O9XulyovCx9w==
X-ME-Sender: <xms:xQSraQ4ZzI6FGgrius9Z-gEG6aGUt8FV_kl5AQ_xU3kMYNLAE_k6Yg>
    <xme:xQSracsS4ENdUl5Tqc8uqWcPwXB6kGWlzOnpCibVLAPor4ooZ4-WIJbK2R-ep3CeP
    ivWqEBS5t2tp-sMZmOYK30oHhmahJZujdxt0st4Grn9fATgweQSKWcL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieelkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhhohhhnsehjmhhoohhnrdguvghvpdhrtghpthhtoheprghrnhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughoughjih
    esshgvkhgvthgvlhhirdhorhhgpdhrtghpthhtoheplhhisggrsghighgrihhlsehsohhu
    rhgtvgifrghrvgdrohhrghdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigseifvghishhsshgthhhu
    hhdrnhgvth
X-ME-Proxy: <xmx:xQSraZP0gDuEcdMub4Ao8hzA0Z8uXmrbc0sSOWjKYNza6MrrUPlXZQ>
    <xmx:xQSraV9SEZjwDlyeAxnjtyp3KoLNp8kw7WaJX-oIjm7ZLjiC8rhi7Q>
    <xmx:xQSrae76M8nGNZGFgglhErczB93_viJl_zUQzLtdjvoFcXfUj_Mqdg>
    <xmx:xQSraT6ps_Z40Uq3zobEOStH9xVQ2P7mq6U37xgkj8Tfpr9RmUa6LA>
    <xmx:xgSraYkLGYz_z_N2USX0Cg99qnrFPy2u-4W-BTDWZOTeh3s9pSk64NP0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D4544700065; Fri,  6 Mar 2026 11:45:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ALu5HFvgRY8g
Date: Fri, 06 Mar 2026 17:45:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, "Dodji Seketeli" <dodji@seketeli.org>,
 "John Moon" <john@jmoon.dev>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, libabigail@sourceware.org
Message-Id: <05fdccd7-4027-4c97-a701-a1d3019a4420@app.fastmail.com>
In-Reply-To: <6a93d709-2d69-4cd5-9854-18910fa69af2@t-8ch.de>
References: <20260306163309.2015837-1-arnd@kernel.org>
 <20260306163309.2015837-4-arnd@kernel.org>
 <6a93d709-2d69-4cd5-9854-18910fa69af2@t-8ch.de>
Subject: Re: [PATCH 3/3] check-uapi: use dummy libc includes
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DBFA322551E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11622-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:dkim,messagingengine.com:dkim]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026, at 17:39, Thomas Wei=C3=9Fschuh wrote:
> On 2026-03-06 17:33:09+0100, Arnd Bergmann wrote:
>>  		  -g \
>>  		  "-I${inc_dir}" \
>> +		  "-Iusr/dummy-include" \
>
> What about also using -nostdinc?

I just removed it from my version after I found it made no difference,
and I wanted to keep the changes shorter. I agree it's slightly cleaner.

> I have a similar (unfinished) patch flying around which also
> uses usr/dummy-include from the different kernel versions
> to avoid mismatches in case something gets removed there.
> Not sure if it is worth it.

Agreed, I certainly don't mind having your version either if
anyone cares enough. I suppose it would add a very small build time
overhead for the extra copy, but if it does help catch bugs it
would be worth the time.

    Arnd

