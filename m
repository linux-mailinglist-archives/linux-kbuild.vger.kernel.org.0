Return-Path: <linux-kbuild+bounces-12773-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBnNOhcR3WkOZQkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12773-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 17:51:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1413EE325
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 17:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D915F3006832
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 15:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7337D3B6345;
	Mon, 13 Apr 2026 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CTGl5Ana";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fab+xdUH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF83318EF4;
	Mon, 13 Apr 2026 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095506; cv=none; b=l5mYBvgP81uzqmpASIbDkdorsFeua/wHGwHAW0jpODsvzw3+xyyz3f/00ZsBHauOavYqwulUtce6h7mKuXY2OD3gxmlP6cDSd/AubuPatmc8lAU6VQsI7pmNtSbx2cGxUZzzaLN1XbmZUmapu9FxmDygQR9uI6d4Ynk++KCGxOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095506; c=relaxed/simple;
	bh=2pbCPsk1uAkNQ4bG4zTzChkfbTvx/nF1aRk6yx3549o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=N02a2k2nenjfargnr9ytllgco7WJ9o4uaLnhK8pPLal8F/D8yVIzeNzALyiUfrQ6PNGMgjxYvGtpNa/yOfukwNqNRu6ggTLdMwtoWiDBCJl2cwd+PLdndF0c0eqOJCOtn88MJNxJjybAAcQe3+qqhRde/rmw1XcIxNQo7P8Rt2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CTGl5Ana; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fab+xdUH; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 4D0651D00168;
	Mon, 13 Apr 2026 11:51:44 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 11:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776095504;
	 x=1776181904; bh=Mi1t5yTJ7BSsNOtqiw5PO/Gvmm+5EbskAhnRecllWew=; b=
	CTGl5AnaNsPhlrIqsen0iiQcVJseNBgvfWI00At3ST102r0Uhf0o67h1a1g7B5Bz
	Diaw8VbTx69vW1k3zsph6B8qeXBmCJOpgJ2htWQ+0zq/cE4hGRVGzD5zLwb2xlMD
	Zo/nme0Oc723rGwFHVXn3XlRjK6wSQMr2EsIwgoH1J4LALRzGRi37R5pJkLee/51
	yZHgByazW2Ws1zfvZCh5lQn/MoWqhmldujZOXNJpbi5WqiohFfKo1owkWsxPAVHv
	TWxsOJ342FPPTNfeIyv0PDp/Oqq/MHdkLMclE6QEzwcFvZaM47fqqUxC9AVZQYD0
	N12Y50C59YORmqUgUcsP8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776095504; x=
	1776181904; bh=Mi1t5yTJ7BSsNOtqiw5PO/Gvmm+5EbskAhnRecllWew=; b=f
	ab+xdUHXtn8qe+soKJoxxEksK6YpF19w8XLcxmu5DAFsMgITWQn4LkAFiABHwrWc
	pQivcpTbbE8r9BI0Mjq3gydIkwXhcv+U6Dx5ucgpfNYG1qLh/7LDIivvzRGYuGGy
	CCjcZcWzoAi6GbpN8NqtZmTLMY9q8Ob39nZ4e4/eYeBPNYlsnKg9hHckB6xBc26T
	yt7nXHtQhBo/jMj8fHVtIR+K33ZwK5CaeHDddcWKnCyUtJL1KJLZbcTnLv62omCb
	TX1hqrcd42FdT8b02mGfGiEgdZEpR1kjY8anCrNPPNGpiXWkGCuYe0rTxz7CCshQ
	ABhQDT1Ya0q9Ec8OBTeDg==
X-ME-Sender: <xms:DxHdaaic1MhpoOffJVqS-EEnJQNlqt58euKvGJbtLtyigA0W87QS8g>
    <xme:DxHdaV13tH0GYG0lwsRmwYifZELqjsrLMYJjSsC176p1K1EQx2cKt6Wod0lvoe2MW
    SCZ86JptRD5IrE_TD5Vx_JIAe6QSBrUN4uXVe05uBW-osyRsrta-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefkeeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehrihhtvghshhdrlhhishhtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eptghhlhgvrhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrugguhieslhhi
    nhhugidrihgsmhdrtghomhdprhgtphhtthhopehvvghnkhgrthekkeeslhhinhhugidrih
    gsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohii
    lhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DxHdaTglPYtYdHMyXTUIuwsDeqflRHGCzizIlsKhDfslAUHTtr7UTA>
    <xmx:DxHdacAm0fjplbrcVt6c2Uai-D01m_as4jOhJs7D95tD6JqscYxESg>
    <xmx:DxHdaVRQoZXQ0Ge7PZJBP-ybE3S13bU-E7ttfrJD-trk27WYAfMQdg>
    <xmx:DxHdaRWM_rvKnRgD6Ek60Sak1MxfKiBkX0D8Q83owc9Va65g7NqERA>
    <xmx:EBHdaYzKVBAfRKqc43g40qw9CdCtayuAMM8mpgtktC1UNDguKt-phLDj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9227D700065; Mon, 13 Apr 2026 11:51:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ab6DPzpUApkg
Date: Mon, 13 Apr 2026 17:51:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Venkat Rao Bagalkote" <venkat88@linux.ibm.com>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>
Message-Id: <929a3612-5d0f-4298-bb0f-b6cb0c215e85@app.fastmail.com>
In-Reply-To: <E92E66BE-165B-4289-99B1-3F4E6B84CAAD@linux.ibm.com>
References: <20260330103530.6873-1-venkat88@linux.ibm.com>
 <68e9ca6a-c53b-4f15-85b3-7ae9639f9528@linux.ibm.com>
 <6c00b695-9e84-4dd8-abbb-306fd67d6f97@linux.ibm.com>
 <E92E66BE-165B-4289-99B1-3F4E6B84CAAD@linux.ibm.com>
Subject: Re: [PATCH v4] char/nvram: Remove redundant nvram_mutex
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12773-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,arndb.de:dkim,arndb.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,app.fastmail.com:mid]
X-Rspamd-Queue-Id: EC1413EE325
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026, at 11:02, Venkat wrote:
>> On 7 Apr 2026, at 12:11=E2=80=AFPM, Tellakula Yeswanth Krishna <yeswa=
nth@linux.ibm.com> wrote:
>>=20
>> Tested-by: yeswanth <yeswanth@linux.ibm.com>
>>=20
>> On 02/04/26 9:33 pm, Tellakula Yeswanth Krishna wrote:
>>>=20
>>> On 30/03/26 4:05 pm, Venkat Rao Bagalkote wrote:
>>>> The global nvram_mutex in drivers/char/nvram.c is redundant and unu=
sed,
>>>> and this triggers compiler warnings on some configurations.
>>>>=20
>>>> All platform-specific nvram operations already provide their own in=
ternal
>>>> synchronization, meaning the wrapper-level mutex does not provide a=
ny
>>>> additional safety.
>>>>=20
>>>> Remove the nvram_mutex definition along with all remaining lock/unl=
ock
>>>> users across PPC32, x86, and m68k code paths, and rely entirely on =
the
>>>> per-architecture nvram implementations for locking.
>>>>=20
>>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>>> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> Thanks for the earlier review and suggestion on this change.
>
> I=E2=80=99m not entirely sure which tree would be the best home for th=
is patch,=20
> given that the change touches common NVRAM code used across multiple=20
> architectures (PPC32, x86, and m68k).=20
>
> If there are no further comments or objections from others, would you=20
> be able to pick this up through your tree?
>
> Please let me know if this should instead go via some other tree or ma=
intainer.

Greg manages the char-misc.git tree, while I mainly do reviews. Please
resend the patch once 7.1-rc1 is out, with Greg as the recipient,
and keeping the rest of the Cc list.

       Arnd

