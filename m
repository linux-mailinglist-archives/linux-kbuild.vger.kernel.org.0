Return-Path: <linux-kbuild+bounces-12353-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KnAGvJqymnG8gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12353-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 14:22:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA935AF43
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 14:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66E2C3057490
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 12:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6743CAE60;
	Mon, 30 Mar 2026 12:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="P7DKvh6S";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CSeh2nn2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A453C8702;
	Mon, 30 Mar 2026 12:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872855; cv=none; b=XX+/hMvFr5yLcUTIxJoA/OqaNNsVG8/FiUE6bAe/ssK6F3RO6cQMYXPc+h9P24tKDgy9K5PnSn8+MzZ9JGHWFBpuc65TRsImgRdJngHrqEfvNjq0aHcNtVHMyK4YOhtfGITiv/pkZhbCrL/D80m0yV5+yWVjGFvtXUJFSSn3F8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872855; c=relaxed/simple;
	bh=CAJSu5ZRK+rJRAb/RO4Om7wfZ1iop17YwUEs1+VlH7g=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=btmhO2NWhngveXYho0lv3e1eMV/zMI0tgZ7DFWot9VWV7tKWtxZjNrN3md/ucHXfCl1biX4S9WqgJSCvghu5lYJReHJTih96ENBu1Z+I7NnXPQgeIidcEuzQOuwF/Zzn+/qfHRQgJzzK3pfJj9C/VRy/svWRNZ+/MHLWZhORUzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=P7DKvh6S; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CSeh2nn2; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 4980C138039D;
	Mon, 30 Mar 2026 08:14:13 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 30 Mar 2026 08:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774872853;
	 x=1774880053; bh=vdwlRbDywCj3yrAkJeO/0XtIpUCTfBtP5P3/vuBUn5I=; b=
	P7DKvh6SIP+yQ8R66Ax+mey6RCWMDGbu4urWvNvvCMjfcDeHvP0YiffH8SShmDkd
	4SxSv1o1EbjRGHmRrlm0eWr328vgn2tjR6V+Gej8mrtW8KMitkpBhH7fKQTqMUBq
	UnpYAWvx4osHofaLhzhsIRepEi1nUvMMzNgVSk0sD/Ei6cDVlA11wm4Rub3AAKCc
	1tzDxf7l7ufNkT+LumZKXu6VRm+ToFvfRYajH65x7pzc7sWSWSPkMhv9ZK/Qy3rp
	/uzHTYvtAjIYYdhWcpAQxxPhQ3Jxz8kr3ZhX8NzwI5ZeG1VGwSKCgw3bOaza0kko
	dfZ0O+egx6t9Pv2p7yHV9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774872853; x=
	1774880053; bh=vdwlRbDywCj3yrAkJeO/0XtIpUCTfBtP5P3/vuBUn5I=; b=C
	Seh2nn2JXXwZUw8f8LJddm9InB6NsowQA5aApYI3XFBOHhdPH2YMshSxql9GNxcv
	epUWGITb/aiXA9dXvDZKu2tQmXvp6kzG+Q0VFvADjnjyi/jWmVSLl7fdsDwQbjNE
	EE0kp//9EBPsRdCUqZjPzUnE53xY2oLaQYKHskst0s3L6xM3xCOskJaFRsHNaMwv
	KyVn9G9r8jNTv8cPTbukA4AXrspuzyS5l3edvXr/ABm/zV/ViwiiLSWVR5cK0Eq0
	CXOUAhpyf2PRQfa3aZ/yMCiA7G0lFNvlYGXsegzIKFPBrqzJYWe78jbFsBA7FdP8
	yJ4OV4ahzrQ9XRxoNJgWA==
X-ME-Sender: <xms:E2nKabkroe3a5G2UbwtgU0aJJZxIjO_sahUT_vNLUVJ9HMVoObLKlw>
    <xme:E2nKaZqnApNKJMOR735waJCJFmHKcEfK-IOTp8HUkeqX5fTx-OKK24blL4I5izmpL
    FgMug7sKNW-PkGiFVgHuALXZp7bU-29m4LSvF4Kj_RPu7ptDDdUZEY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffeekleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjrghmihgvrdgtuhhnlhhifhhfvgesrghrmhdrtghomhdprhgtph
    htthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohep
    mhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrg
    hrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrnhhtohhnrdhivhgrnhhovhes
    tggrmhgsrhhiughgvghgrhgvhihsrdgtohhmpdhrtghpthhtohepuggrvhhiugesuggrvh
    hiughgohifrdhnvghtpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
    tghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptg
    hhrhhishhirdhstghhrhgvfhhlsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:E2nKaVfqgC86F1-tw7SQimSjM9h5w44kWMVWMmkp2XFwLlqMNtkq0w>
    <xmx:E2nKae4-pRskTOWQlcLYnnB_E1YHAl1UlHT3b33r4Du5WsAwbmYy1g>
    <xmx:E2nKaSI9iV1Bh8Plx_WxBMHuy6_XLKjaE6QEcH_uToa4wP009fZ3xQ>
    <xmx:E2nKafNhteTnhLOg4mEmIUirggGoqlz7QRKVQR0zQRFQ3aml_DeG7g>
    <xmx:FWnKaR42JfWJ4JAPzDCCKyua_hvgCsmYAbcAMoMF7LicLihX8k5J_tPx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7D351700065; Mon, 30 Mar 2026 08:14:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AUJnWW6OA6Vc
Date: Mon, 30 Mar 2026 14:13:49 +0200
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
Message-Id: <26d690ab-d68f-401f-ae2d-7aa4de081bce@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
 <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com>
 <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
 <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com>
 <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-12353-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.957];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:dkim,arndb.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7FFA935AF43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026, at 14:03, Geert Uytterhoeven wrote:
> On Fri, 27 Mar 2026 at 10:02, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> echo 'struct { short a : 3; short b :15; short c :14; } x; int y = sizeof(x);' | m68k-linux-gcc -xc - -S -o-
>>
>> this produces '4' on m68k-linux-gcc, but '6' everywhere else. I originally
>> thought this was related to this 2009 change in both compilers
>
> Oh, now I remember.  AFAIK (holding wood and a rabbit leg) we don't
> have any bitfield members spanning multiple base type instances in
> the kernel.

There are certainly very few of those, but two example I found in
UAPI are

struct dvd_layer {
        __u8 book_version       : 4;
        __u8 book_type          : 4;

        __u8 min_rate           : 4;
        __u8 disc_size          : 4;

        __u8 layer_type         : 4;
        __u8 track_path         : 1;
        __u8 nlayers            : 2;

        __u8 track_density      : 4; // crosses u8 boundary
        __u8 linear_density     : 4;
        __u8 bca                : 1;
        __u32 start_sector;
        __u32 end_sector;
        __u32 end_sector_l0;
};

struct usb_raw_ep_caps {
        __u32   type_control    : 1;
        __u32   type_iso        : 1;
        __u32   type_bulk       : 1;
        __u32   type_int        : 1;
        __u32   dir_in          : 1;
        __u32   dir_out         : 1;
       // 2 bit padding on m68k, 26 bits elsewhere
};

    Arnd

