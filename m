Return-Path: <linux-kbuild+bounces-12315-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FymNLxHxmmgIAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12315-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 10:02:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 950C73416E2
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 10:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4CB43008D61
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 09:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF013DA5A2;
	Fri, 27 Mar 2026 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="GVzqQY5n";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iExk1Qnj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from flow-a1-smtp.messagingengine.com (flow-a1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FF53DA5D5;
	Fri, 27 Mar 2026 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602163; cv=none; b=LLfXdbNAUtwub/hWQ/eWFIi/0UMKe+i1pruq93DSgksFdKx1X4SFr+c03etz/owGhI5OOgY7bHLaKODwVbLCfn7bJvPycEHMpRcLCeT7OKz8FthmGvAT2Ao/D/bHebrmdDPdNPpamnjKak9qjFsN7Q0N94LavYlXp0bfqS07iiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602163; c=relaxed/simple;
	bh=+dXAU2BVuB/qGRf5fclh0Kp4rQtTP3fcLN2jOD9b4f4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SsSyffbabhaGuUtdimuN7LzudxAbydWSTAk9ptE8QreMyI0aMNAgmIGI+2Af9Et2d6Itcx248lWjMOL2JIkXMHiiTRzIeOVlzjOCJGFhsBuEc+CdXXuc6rBG9BTfNC3mOt6Y233MiQ0iQqWi17T9OkLREYaQVzml2wz6QOBTkhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=GVzqQY5n; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iExk1Qnj; arc=none smtp.client-ip=103.168.172.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 4A6471380181;
	Fri, 27 Mar 2026 05:02:39 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Mar 2026 05:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774602159;
	 x=1774609359; bh=XlE8K29BcOci/GJeK99hdrRjgIObqUNFNRdsO2zBvLY=; b=
	GVzqQY5nceojm37M1XZpOPq3WUecXUQj9WVf3CfutP3dTobqmGMQjzRLgNhoVby6
	46aeZZINaK1f7YVuydM5TqNUI4j8vyRQzPpJA34i7ACZR1RSV4TO+hIb/Y1wlQAV
	e4naVPRom36f6nfcFXr2OjE1mhktO/8tDetlgDKx/ERP6X26MCzVLKwpghPIlA9u
	FgAZLJCBgZpz0FbarT4w54TicAqCn2qTr0Z2ZfdL6DznrwvGSdcVVRrirxDEue/H
	5fVwFvlMX5ysAAT1/mtv1Dd/8FtVIaDqWDOOvUgWKJ3vwJ4vCQKKNs+/aj1E6yt+
	+mz/Xbi/v8lcnLVbeJxZpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774602159; x=
	1774609359; bh=XlE8K29BcOci/GJeK99hdrRjgIObqUNFNRdsO2zBvLY=; b=i
	Exk1Qnjsvq2JnZ1+yT0ebsDIbgY2gqeRl0z1YUchEz9YmFAT5XKQHCu5+ZzfUzMA
	KUBEKUA267I42sL6kTGiC0o6muCrmy6qX1nLFaMFkw6x8TBMIldQ20mR85lgu/Dz
	dB2EG1eKMb571eSkAhGeN6NfTkTpx4Lu0/tgLzlYoDT4OZDwCv6fEL37252eYC4+
	1qR+fAEfE/kjUNCAyy4Q+SMie5NYypjDP+zkoB40j+zYPYlVZgSiYG+KFdyvrW7G
	OWPfc7ZhuIizFLxUKMgVQKKjnJY5rCQ68EF4nMVgcJw97GM4yWWv2nTfrHXCbuKd
	K8t0sfV8n6x5lC5qiobPQ==
X-ME-Sender: <xms:rUfGaePC1BrMnmTf9_OY6lvLvc1mUKp6M_A0RyuXLyRS-NOn6VKFDg>
    <xme:rUfGaXzAgfItBbTl9XynqmOmljqUaNK22QfAcW8j65Y-hka2CDyCF6HlPX-DBmYss
    eoR8l0vie_-ZAfZlP2omID4VIFPPLAESbv9Vf23rJ3uQmLsZXfiKPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdelkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepuefhhedvjedtudeiiefgvdeuuefhueehfefffeeutdeiudegleevleeivdefgfei
    necuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhnuhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdr
    uggvpdhnsggprhgtphhtthhopeeguddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epjhgrmhhivgdrtghunhhlihhffhgvsegrrhhmrdgtohhmpdhrtghpthhtoheptggrthgr
    lhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuth
    hlrghnugesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidr
    ohhrghdruhhkpdhrtghpthhtoheprghnthhonhdrihhvrghnohhvsegtrghmsghrihgugh
    gvghhrvgihshdrtghomhdprhgtphhtthhopegurghvihgusegurghvihgughhofidrnhgv
    thdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsoh
    hquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopegthhhrihhsihdrshgt
    hhhrvghflhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:rUfGaRCaBcqc7KdntZl0FsBnvOqvRVfnzmfBbmotVoydnvBrFXOcMg>
    <xmx:rUfGaZyWyK0ItY1fAukXgGQMxYnCWlJ_ttZ9LwB67jfvcP3jcgDiJg>
    <xmx:rUfGaeUWikKeRd3kQ5HcVz8AqFZRkLvV9rX5NscA0USMCL-N4mVGIQ>
    <xmx:rUfGaQXDnwGyrD4fd56NTxM2Fq_dVcdlQpFE1HUUfNw_jSb36M81IQ>
    <xmx:r0fGaasdsr7hoeyfiet3dxQz1PzdqR0Oy-FDo6Fl_eW5_GQ_HIxB6CTf>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 95B2C700069; Fri, 27 Mar 2026 05:02:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AUJnWW6OA6Vc
Date: Fri, 27 Mar 2026 10:02:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
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
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>
Message-Id: <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
 <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com>
 <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-12315-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,google.com,kernel.org,arm.com,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,linux.dev,infradead.org,nod.at,umich.edu,physik.fu-berlin.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-0.894];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,app.fastmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arndb.de:dkim]
X-Rspamd-Queue-Id: 950C73416E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026, at 08:56, Geert Uytterhoeven wrote:
>>
>> I noticed a similar issue with m68k-linux, which has a bitfield
>> alignment different from anything else on gcc, but uses the normal
>> behavior on clang.
>
> Ugh, I wasn't aware of that. Adrian, did you know?

To clarify, this illustrates what I mean here:

echo 'struct { short a : 3; short b :15; short c :14; } x; int y = sizeof(x);' | m68k-linux-gcc -xc - -S -o-

this produces '4' on m68k-linux-gcc, but '6' everywhere else. I originally
thought this was related to this 2009 change in both compilers

https://github.com/llvm/llvm-project/commit/830dfccfb2c06a1749938ce8cb78a1d6a295b942
https://gcc.gnu.org/cgit/gcc/commit/?id=2cd36c22d3d16e24f342829a989ac35f2f442656

but that only allowed bitfields to be marked as __attribute__((packed))
in order to get tightly packed fields and return '4' on all architectures,
while m68k-linux-gcc apparently has all bitfields implicitly packed unless they
are explicitly marked __attribute__((aligned(x))). This behavior is
independent of the -malign-int flag.

     Arnd

