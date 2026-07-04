Return-Path: <linux-kbuild+bounces-13934-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V3HRFNknSWpDywAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13934-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Jul 2026 17:33:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A3A707DA2
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Jul 2026 17:33:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b=K9MoXXuF;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="O ylzCyJ";
	dmarc=pass (policy=none) header.from=arndb.de;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13934-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13934-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 350D03011F2E
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jul 2026 15:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED7528B4FA;
	Sat,  4 Jul 2026 15:33:39 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C6125AA;
	Sat,  4 Jul 2026 15:33:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783179219; cv=none; b=Ii/E17T9cCZ83tRGbhe4nZvykVguO9jk2wM1Xti5lPuYRGeoclZg93wKjNSB1xcy3evlOKlFja2PhhHTAeG0eXTrcliRcY1swV9vGm+cEaY3IDDnfDDHguHNA7k7BYJzlINuLwUGo5edx0cBRXeha6tR9hZELeez01bMZK46csU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783179219; c=relaxed/simple;
	bh=lI1QUf5G9gQ5g4fDbzEfRZNx6dOW7LvG0o+2OHs0fi8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VkuDnY7NxdpK8Zyd2+EJpPZ3p4JmT1xZnwfeIhO5ufsL1z1dEVlyVsTwfTTf6aZ9MT8p3sjouYcWfF9PN84tCrb5i9gu314uRHoVF6mbhRYLmAJe8zfAPPwbKPuhA3EiypsIdyzHBlY6+imtJqTp4ikYLnwQ8Kjz5sbWjmCN/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=K9MoXXuF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OylzCyJO; arc=none smtp.client-ip=103.168.172.147
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 1BA1AEC00C3;
	Sat,  4 Jul 2026 11:33:37 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sat, 04 Jul 2026 11:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783179217;
	 x=1783265617; bh=uPBcmQ7I7zLfv95W/1qWAhEVcr4g0zsJVDHUIOLjI7U=; b=
	K9MoXXuFtrRE7D6e5fnq28wvQOX2RBx3PbtHMA36S9dZscAQETQumqyWQZ4A5ubu
	vyjPIkJLiNBWHCHzqJMwI/vf3TzlwiG8399wt2aJz4kL5DFl3pzzrZsQEpqvlB6H
	2BuK54ypHee7XPjoh9uO8qKeiEl6VRufIt5vRAMjPHVk9vv24JTdVrTnp9IjSVFn
	J0QrzDkS8+TFjRZI9k/ZgruUB+J2exxdF/B1CSeMQYs9DPbFYHgOctsw7yFaNCCC
	wPK1hquIlJMyilIOhkub5l/4A+Q2beymwxtcKk8gQ5b5gzKMdDsWSEbh7F8bG52f
	Gx4t81N/nu1s+QmKboL83w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783179217; x=
	1783265617; bh=uPBcmQ7I7zLfv95W/1qWAhEVcr4g0zsJVDHUIOLjI7U=; b=O
	ylzCyJO2f7VbOqh5w1cdSELOe48KUKoioJTHOjJMVnqs/eCtOFItkACvf7nFHqUI
	TS5ACHc7f6HNHkkyV/KogNQtSU3dL7q95h/esZVuNNzqFEhgQHPPTMKW+fixb0nx
	WOyfVlLLyk14pK9umsOyLYdLQjKCLnGDU+LqdnMQZ36UEL+h87+nhkpv6eEquH+c
	7sLDsjg8YCBiGXCFN5d1eHfg1Lroa2LeyVzWyi+35xjcGbpo1pBJW66O1ehswL7K
	kJxWmSt024QbkuFo0sLbR2Xv49NrKVkyD1X6xvVJuIxEs6kVoH7xswjDx71T4b22
	h1QRYdV4wFQ3tYuhqDCVQ==
X-ME-Sender: <xms:0CdJairJWbqw9nI6Qr8HRQOb8PB7g2-I96vTUf5q_9PJip1Xzw8cdw>
    <xme:0CdJarc2Pb2LF2MiPMbsUtCQctq1OwZpC1gSFFzmCSHGNE-2j8bURBDazkWENdlf_
    prmMZrYi9h4UaZ466UzxoDlszK9dUb5JmHV5IdfVPbCNYXxfYblva-P>
X-ME-Proxy-Cause: dmFkZTGaElNDQi6X7nPC4W9lwkhgMlLiCavmJuYqptH4fqjvalU6Rpzhr5vVBIQwUEGy30
    aeTYF9SMa7EOH328ATjT3shQ+T5C6SLoT1nGpbwmYmuiEvsmi3h6bsC7bEgsQY4QADWNJs
    gcvil/lc1HAb8MgS51o13roIoG0AvXOCEY3srui8Yz4m8oXvEMIqO404chhYgvE3/PUcLO
    q9Qk/GXpIRnAYU22dodAOCrrlDn2Ao1FHotcGfbER1rqfknRh0D/TvTcY5wsMUElTw3xwg
    VMKSnKowufzS0B1+ql06OXSz5DovpReTfZODQLR8uwEB+8njLYO0LXdT/L7AH8FGd8YoJf
    B197ps46F6ERWz2bwQ4hRDV6sPabhuZ9xrEeRJ/4OQJL8DOZK5GTLO1/TOA1EXZpyf1DYR
    QNFObfav2XN17M0s9F7VdBw4PE3m27rd8WHCXA1hY+vTXZ1FmgJgYDfSLTyN+9Inqp68au
    l4K+mUE6htC/Nmrfc1VCjaIGVsWtK+SmuliOAT4ZZBy3B7c3c8EsV8Gx6IC7L1BDwg/6Si
    +IkHkS6ymc/Bh65xT1eLdyTNz/D0XipwJM7SGOJbtSKBH92ywc9ATW6W8mEV+UxKPUO3Jz
    MDuuBzhXLKiya2smopTU3mCpZl+web6S9WKUfWa1uo+eZ9d0d4szqPkwSQXw
X-ME-Proxy: <xmx:0CdJavi-PLDwWK_a_DfuwN1I3wTFkX8viqYcg7FKkcIzYuxFGj2U0g>
    <xmx:0CdJakLxDuUqWIIY1SQ-I6cDHJzBDnME26l3mWBHgRT4fkLSUavr5w>
    <xmx:0CdJaukSj2Ls8ZVopo9Ws3jnMkkPNjR9vJXRhGNkTqtZKtmU1uKJAw>
    <xmx:0CdJasPhHlEozv-ONi3sC7jzXAtLocj_VXDhr7wiqmObajCNxVB6XA>
    <xmx:0SdJan_82gwoay7vQu3w63XrJSgEflGlv4eVTfqXA6s6F7-wtyyXwzqe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7E4ED182007E; Sat,  4 Jul 2026 11:33:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A3VKvziydYFc
Date: Sat, 04 Jul 2026 17:33:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Graham Roff" <grahamr@qti.qualcomm.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Nicolas Pitre" <nico@fluxnic.net>,
 "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>
Message-Id: <7e20408b-3a0d-46ff-ab6c-2b0d86f74adc@app.fastmail.com>
In-Reply-To: <955bf67f-309d-45d4-ac0d-2f53577aa18e@gmail.com>
References: 
 <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>
 <955bf67f-309d-45d4-ac0d-2f53577aa18e@gmail.com>
Subject: Re: [PATCH v3] kconfig: Support conditional deps using "depends on X if Y"
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:grahamr@qti.qualcomm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:corbet@lwn.net,m:linux-kbuild@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nico@fluxnic.net,m:jani.nikula@linux.intel.com,m:masahiroy@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com,qti.qualcomm.com,kernel.org,lwn.net];
	TAGGED_FROM(0.00)[bounces-13934-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4A3A707DA2

On Sat, Jul 4, 2026, at 15:23, Julian Braha wrote:
> On 12/15/25 23:06, Graham Roff wrote:
>> Previously such optional dependencies had to be expressed as
>> the counterintuitive "depends on X || !X", now this can be
>> represented as "depends on X if X".
>
> I have always found both of these:
> 'depends on X || !X'
> and:
> 'depends on X if X'
>
> to be unintuitive and confusing to read.
>
> Yes, I understand from the docs that the purpose is to disallow
> FOO=Y with BAR=M, like in this example from the official kconfig docs:
> ```
> config FOO
>       tristate "Support for foo hardware"
>       depends on BAR if BAR
> ```
>
> However, in my testing, neither of these constructs are necessary to
> achieve that.
>
> A very standard 'depends on BAR' also disallows FOO=Y with BAR=M.

The difference is that a plain 'depends on BAR' does not
allow FOO=m with BAR=n. The idea of the construct is that
BAR is optional, but whenever BAR is enabled (m or y) it is
a dependency.

Specifically we need to allow all of

  BAR=n FOO=n
  BAR=n FOO=m
  BAR=n FOO=y
  BAR=m FOO=n
  BAR=m FOO=m
  BAR=y FOO=n
  BAR=y FOO=m
  BAR=y FOO=y

just not BAR=m FOO=y.

     Arnd

