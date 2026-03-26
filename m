Return-Path: <linux-kbuild+bounces-12308-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFcnA3ynxWlUAQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12308-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:39:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8C933C060
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DD60303B7F0
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 21:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D7B37756B;
	Thu, 26 Mar 2026 21:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="IqMDVtdy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LLg61lWU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E707B3A6B86;
	Thu, 26 Mar 2026 21:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560836; cv=none; b=KHBTt7JgNDnDYy95F0Uxcsx/prjOSdl2iniBgM64/yWiFR8Ki45hQYDCMwvlSL3BAEiVp36TufENzl2lqL89LOh29Xuyxtwmwpcl+wpxXI0crJUjeGdEsCmZPl2XPSS6aiQjuPB7W86ZDGmPHlhZWOlupNyimT8SH0ir1/jLCrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560836; c=relaxed/simple;
	bh=afwrlPd7MaCwxA4fobLo9hCa54yAt++rPaITRSedqKo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iS7IonyhgHm6+y/Fz+4meZwHKGz9tBPSJAA2PFfDKuPd1/ZCy3EjL2Y7r1wiOQNLnAsDHD39R/bjDVmcA0izL06hUG/1ljvEBU9aPv1PNTtnu0tcY4yPosKO0ifc1M6XFEQTzqpuqWGBGjR2aapeBIV3CZNvcRFH61rEcwxhqeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=IqMDVtdy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LLg61lWU; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 539C31D00217;
	Thu, 26 Mar 2026 17:33:52 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 26 Mar 2026 17:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774560832;
	 x=1774647232; bh=/RfNIxQKYIUQw14uhGh95D145k5nMWsOXW6Q5/pdSXY=; b=
	IqMDVtdy9g3dNXgBMcJk+Fp8v+OY7nMFAksZR5I3dKQs/pgnaPLGfcCyGhi4aVyc
	s89Zcud45a2CiZ9yyMK4PuF1EOB8yUb3WVnIvT4GofP2S47gqvcYCpFmJOfaK5Y+
	KOc+agOMOn6DJ2PfKjMqOMaLTktYz8TexeDDdslrrZ3Y5yiTURS/f35oGGD+09Y6
	sXrfaZKwKn7C5lupvsFmk0x81toqerRu418G0pUGq6hC1uP/9jYxwWbyZf+bazou
	6XnYpjG6S0tQVQAdhhBFbX8WBzAqxLBnZAjvxsLffwRfy/BTApMN9h5uREDwD0zQ
	m1wi5i+tYDinsj7+okztaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774560832; x=
	1774647232; bh=/RfNIxQKYIUQw14uhGh95D145k5nMWsOXW6Q5/pdSXY=; b=L
	Lg61lWUQRpa5QRAliKcb5POX6yAcwUI0CN1HB0waBRaDhO0KKDghAxEPcbdyiiY9
	fXZn41nDBH8tNiGNBBJ5Mxk2Wl4Zgozj9uQK/7Si3ail04diJxgnNwqD1f16bx1N
	KA4N7tNulPLr1ULFKid2JB+H3cj5O9FBHHin6MNDLmC6AuDl9ZMFuZPbqt+J5mAS
	xc5d44SI0INI9Q4j+2/a27p/4WC8ylhPqB2qiVdtXSqzyVNHQt46QjNRHTLM3wDw
	gZtHREbrzp1lm4wQ9ROzSksT8ZUVo1lNiKxBBMO98KVE1JjBSkCG8SQSvO8h0Vje
	vY3hn/uAhrdrVmoZMWaTQ==
X-ME-Sender: <xms:P6bFaZLAEEBV3bwCDeAZPmOSFJwnzpkHCftpSnS8W1WdOa0CTq6GQw>
    <xme:P6bFaf_9S1JQLWU0MdN0d9J9bDLLmp1dF-WUzWA4LusG4x5Pn1IejQHX74hxqxXZY
    bTc6bEPtn7nGWANqBVfLEHUSFUZyNR5skKizikSigPJc2R8Qfd_bW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeelpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjrghmihgvrdgtuhhnlhhifhhfvgesrghrmhdrtghomhdprhgtph
    htthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohep
    mhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrg
    hrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrnhhtohhnrdhivhgrnhhovhes
    tggrmhgsrhhiughgvghgrhgvhihsrdgtohhmpdhrtghpthhtohepuggrvhhiugesuggrvh
    hiughgohifrdhnvghtpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
    tghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptg
    hhrhhishhirdhstghhrhgvfhhlsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:P6bFabzGQvj2wxAZfO7oFq_v1ja8RKR7HYucMtfA26YKLazWNFrATQ>
    <xmx:P6bFaYrjXYtdlUeYWsmgjMA4oDcGRCKW-jMdtK9pnhtU3nqkJuf8Wg>
    <xmx:P6bFaRzgw_OcbHg_6LazXrPsPveaVBX5aOIxtPlylfA7b7UQRUcdjw>
    <xmx:P6bFaaol0MvBm8Edvwg7LeY9Kw5WWM57FN7B_4SvuL6j84f9MqF_Ug>
    <xmx:QKbFaY2XZ5RWYMQAUukqG2sMMwP8B1UHXdInUhfkcbGuv_wfeoAAs7Wj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6AE92700065; Thu, 26 Mar 2026 17:33:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AUJnWW6OA6Vc
Date: Thu, 26 Mar 2026 22:33:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Russell King" <linux@armlinux.org.uk>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "Ard Biesheuvel" <ardb@kernel.org>,
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
Message-Id: <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com>
In-Reply-To: <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
 <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-12308-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[armlinux.org.uk,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,google.com,kernel.org,arm.com,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,linux.dev,infradead.org,nod.at,umich.edu];
	NEURAL_HAM(-0.00)[-0.887];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:dkim]
X-Rspamd-Queue-Id: 6C8C933C060
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026, at 16:18, Russell King (Oracle) wrote:
> On Thu, Mar 26, 2026 at 03:31:26PM +0100, Christian Schrefl wrote:
>> On 3/26/26 2:47 PM, Miguel Ojeda wrote:
>> > On Thu, Mar 26, 2026 at 11:10=E2=80=AFAM Alice Ryhl <aliceryhl@goog=
le.com> wrote:
>
> I'm not sure if this is still true, but I believe it used to be the ca=
se
> that the -linux-gnueabi target has one behaviour for enums (fixed size)
> whereas -none-eabi, the size of the type depends on the range of values
> included in the enum.

I checked Debian's arm-none-eabi-gcc, which indeed still has this behavi=
or:

$ echo 'enum { A, B } x =3D sizeof(x);' | arm-none-eabi-gcc -xc - -O2 -o=
- -S | grep -A1 x:
x:
	.byte	1

and I see the same thing for the hexagon target in clang, but none
of the other targets that Linux runs on. In particular, clang always
behaves like linux-gnueabi even when targeting plain eabi.

$ echo 'enum { A, B } x =3D sizeof(x);' | clang --target=3Darm-none-eabi=
 -xc - -O2 -o- -S | grep -A1 x:
x:
	.long	4

I noticed a similar issue with m68k-linux, which has a bitfield
alignment different from anything else on gcc, but uses the normal
behavior on clang.

        Arnd

