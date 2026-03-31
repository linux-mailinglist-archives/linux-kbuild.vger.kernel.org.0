Return-Path: <linux-kbuild+bounces-12388-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFwPIqW1y2kpKAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12388-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 13:53:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1932369232
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 13:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9078030763DF
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 11:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB393DC4D0;
	Tue, 31 Mar 2026 11:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Jxap8/9S";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kuLyiPMo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A582C3D6CBE;
	Tue, 31 Mar 2026 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774957468; cv=none; b=SZt/JPl9zxVYgyS4nMFfY/ErneeIhhRJihsMXlR+qTbCQdnMF/arVpeicr0N2m25NO8GmuoXrfhMMrCR0Q4IU78aev/fOUSUj5c9g8uMD1+kKVBeOIublVrSBBjI6XjHM5sa2iKKw7eBV1NLZs1aZTzJwyAkNgjoYK+1qr1DoOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774957468; c=relaxed/simple;
	bh=ewKWjW7SNxzqzOKPNVgjZWb4tDIEBpbPs++wZjMYHKg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=orrTI1Ud1V9lC8IP889PeBMjlqSkOiqkMoe+/YxTgxUj5BX8z/dpFg2vCFGgqkgoWaB7JWAdYsGKD7pHlX8v6tYhWdYOI8uHKmx3gd9oQwY5OpuOlp3evDWEwzLbfarZOuswHU35Q8n0OqgbLBu4jbm07FmteG0+4TKu0GkqOm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Jxap8/9S; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kuLyiPMo; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 062CAEC0235;
	Tue, 31 Mar 2026 07:44:27 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 07:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774957467;
	 x=1775043867; bh=45JgVcq0EgVfNtDgS04MgTxf5U+SjaNRaHQGB6s03l8=; b=
	Jxap8/9S4qYqMwrKvG6LkL4qmDzEcuGMGDJ3Cz2bZ0vxUUfbPt7c1qTw+rKEDpy+
	H96GkWp6u3KcKGr2qct0JUN/2X9EmZCHETETy4o/MQnOwTCKCxywAKErWV01t/tS
	AoB2WNCyADBh/I9ydKmyNcfSk8ifT5ztBoh/vqUAviwELJGFfA0crVeDB4mK11WL
	ahkiAwGQbh1GkVlIRlDvp2kBiECEdrZZ9pCtAZL7MoOKBwYlnwTHGMo5EVr3xqyk
	bkBC7R4FFB5K20KVin1XLG6iOgUZ4X6ut43zPKpdCsTq4lcYKZLpTsWfI9o1mQ45
	GxMWe28tebPtm8H9rPSwPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774957467; x=
	1775043867; bh=45JgVcq0EgVfNtDgS04MgTxf5U+SjaNRaHQGB6s03l8=; b=k
	uLyiPMoH1o8hur4JjSJuRWTEfIETsH7xtk6oTrvGkWtl/WpnqWZdsuVd4dFow7CJ
	t+EYzO1ktwqkE+meCgWhVgE0SUn45Sx6RnyYx7a5iqlTvHIrhneDetOw102WDFrn
	tHoOlJFw1F4AQROF04cLDYAraPS84KvCc3xdral9L9YKzdr540GQnAUdmYLN9qMU
	smmRyd0iv77Vr4+N8sj8wYfQMhws9jKeyqvdga6in+0k1BsP5d042X5ThI3t95oK
	2SeiZr3KvLiL1X8b8C/UbrsQoECRWzBT0Au56Ghgdk8zvRuOf+vArZ4A2c0rdx8k
	ITZ0Aq5KQmVCecXlXCtyw==
X-ME-Sender: <xms:mbPLaafs0nlOk9Q4g9puvZHHMG2cSvGX_65TGc17KWG9rifVmyVbAg>
    <xme:mbPLafCg7zZEDtKSpnR3PPX8iUEmuKvzcvuZ-KilZn-zxuKNxNjbUVlrscqT1UKdy
    5ehLghXHQayIclsu-xXgnbc_PNokmr2xsbYb9aMGM3Phjf5uTlVm-4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcuuegv
    rhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpe
    dvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrg
    hrnhgusgdruggvpdhnsggprhgtphhtthhopeefledpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepjhgrmhhivgdrtghunhhlihhffhgvsegrrhhmrdgtohhmpdhrtghpthhtoh
    eptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehmrghr
    khdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlh
    hinhhugidrohhrghdruhhkpdhrtghpthhtoheprghnthhonhdrihhvrghnohhvsegtrghm
    sghrihgughgvghhrvgihshdrtghomhdprhgtphhtthhopegurghvihgusegurghvihgugh
    hofidrnhgvthdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphht
    thhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopegthhhrih
    hsihdrshgthhhrvghflhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:mbPLaXWL4_RbtfLfnHQs8C4tG0ngXTCPv9euc-VB1lto6tqFQyGNcw>
    <xmx:mbPLaU_cG1WcSE-QSkVD9ElI1dukFUPpc53IiCbdiAif50XEkb-z1Q>
    <xmx:mbPLaf3Jw7KAvwSkj2NhSKaJwucaNeK5yqjANIhVWRFTYuRZjmC46w>
    <xmx:mbPLaXfgUsSfpDNbiUxt6RT2rhVcYFtkTJ_DCYi6UKM2ewPiID8SDQ>
    <xmx:m7PLaYahyRZ4gPZWSFwm_OyhnRUM4xeu34i4uTLr4s-lisp1T7JlXocj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 31988700065; Tue, 31 Mar 2026 07:44:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AUJnWW6OA6Vc
Date: Tue, 31 Mar 2026 13:44:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "Alice Ryhl" <aliceryhl@google.com>
Cc: "Ard Biesheuvel" <ardb@kernel.org>,
 "Jamie Cunliffe" <Jamie.Cunliffe@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Miguel Ojeda" <ojeda@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, acourbot@nvidia.com,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Gow" <david@davidgow.net>,
 "Gary Guo" <gary@garyguo.net>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Justin Stitt" <justinstitt@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-um@lists.infradead.org, llvm@lists.linux.dev,
 "Benno Lossin" <lossin@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, mmaurer@google.com,
 "Bill Wendling" <morbo@google.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Nicolas Schier" <nicolas.schier@linux.dev>,
 "Nicolas Schier" <nsc@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Richard Weinberger" <richard@nod.at>, rust-for-linux@vger.kernel.org,
 "Trevor Gross" <tmgross@umich.edu>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Message-Id: <a2c18fec-8ca2-490b-bd9f-bac79672c2f4@app.fastmail.com>
In-Reply-To: <f159850d-5fe6-4329-9703-b355305fd106@gmail.com>
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
 <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
 <f159850d-5fe6-4329-9703-b355305fd106@gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-12388-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,armlinux.org.uk,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,google.com,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,linux.dev,infradead.org,nod.at,umich.edu];
	NEURAL_HAM(-0.00)[-0.693];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:dkim,armlinux.org.uk:email,app.fastmail.com:mid]
X-Rspamd-Queue-Id: E1932369232
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026, at 23:09, Christian Schrefl wrote:
> On 3/26/26 6:30 PM, Miguel Ojeda wrote:
>> On Thu, Mar 26, 2026 at 4:18=E2=80=AFPM Russell King (Oracle)
>> <linux@armlinux.org.uk> wrote:
>>>
>>> I'm not sure if this is still true, but I believe it used to be the =
case
>>> that the -linux-gnueabi target has one behaviour for enums (fixed si=
ze)
>>> whereas -none-eabi, the size of the type depends on the range of val=
ues
>>> included in the enum.
>>>
>>> Certianly, when Arm Ltd were proposing EABI, EABI had the latter
>>> behaviour, and I think there were cases where Linux used "enum" in
>>> its UAPI.
>>=20
>> Short enums? I see `c-enum-min-bits` in the armv7a-none-eabi built-in
>> `rustc` target, and indeed:
>>=20
>>     #![no_std]
>>=20
>>     #[repr(C)]
>>     enum T {
>>         A,
>>         B,
>>     }
>>=20
>>     pub static S: usize =3D core::mem::size_of::<T>();
>>=20
>> is 1 for that one, and 4 for the other.
>
> I guess we could use a custom target spec, but I'm not
> sure if that is worth the hassle of adding another one.

The kernel Makefile forces the Linux enum behavior using

arch/arm/Makefile:CFLAGS_ABI    :=3D-mabi=3Daapcs-linux -mfpu=3Dvfp
ifeq ($(CONFIG_CC_IS_CLANG),y)
CFLAGS_ABI      +=3D -meabi gnu
endif
KBUILD_RUSTFLAGS +=3D --target=3Darm-unknown-linux-gnueabi

regardless of the compiler. I think this should be safe
for any combination of C and rust compilers.

     Arnd

