Return-Path: <linux-kbuild+bounces-12391-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBRiHYHiy2n0MAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12391-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:04:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F8A36B57F
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53E39303FF20
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 15:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E6B3FFADE;
	Tue, 31 Mar 2026 15:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="LGOmmPu7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lLAAeJUw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F34336655B;
	Tue, 31 Mar 2026 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969304; cv=none; b=PS4IxlYQQo+zJh1A78+DOUFMSTqHtkC42Q7i5xtY56lC1MQHhYFkqGlUuuEVZ+D9/L/qCK4ETldLtTofQ9x8jq4MmWuSJuYLpk+NkybXV0ej1hn6bRV1Chv+JfASW8hFlLLboLSjti986NbXA2DByKHOxZHzhiBjqnjWuJqk4RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969304; c=relaxed/simple;
	bh=yrwMSUHOryma5/74uJKl9Rn6jrmJX7SxqIBtu5Rqip4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Uc0WuKvmzhNH0AjVo27i7rLpT3K6td9wM5cGMYGQol0XRzMOyHMBuK2hXvkzOzpfP4dR9ojTeEcYKAIBWOaOgAf+KwW6M003FOdyMDs0GjsWGABtison9IKPB500byJQilBssbkzMSdyMzGQ7fxxjv6OnVhJfHv2sVsV9FOUUjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=LGOmmPu7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lLAAeJUw; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C6ED01D000FD;
	Tue, 31 Mar 2026 11:01:41 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 11:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774969301;
	 x=1775055701; bh=HjRQ0GKWJ4cglYWFXtwhDZ+tIyJ99T1ll9QJyDSJnJQ=; b=
	LGOmmPu7Jf68yMSLApt6zmFBptmxapJlD9YmpPSL7pLeqUD3Q6BN/E5lev1xvYZc
	iSouSJ+YyO1MGvKQBoLxZW53PTYd5T5pniVN8X2iSVaLCtHyml0uGlC1bzWysk4u
	38mlvSe+MaRgH+lMRRE9aiPSa908PMj93ZBSWwSWsbqh7V2ReEpiTkrqmtZA+Scb
	YZ6YguyvPGKXuvgoF5t+ep7zS1ka1WsVKi7UgoO6BL6Z1Z0hNIbr68w2a5xsQXe+
	8LTyRCs5cVWv4iuD883AxZpgkkSSfr4Wjyl2YCV92e2NeRdulSuwebtUE169zWNe
	eBkCjPJqVGsMrA3IvZNiPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774969301; x=
	1775055701; bh=HjRQ0GKWJ4cglYWFXtwhDZ+tIyJ99T1ll9QJyDSJnJQ=; b=l
	LAAeJUwdY0RMJeFI+bXDtarpb4PvHh07PtTfZnpE5QtnvHjPFkKWmH7240gfkFnf
	iZYBISVAktNuP7dX2CWn8HQ8suCWcshwtUn0wsbDrfjQ9t7C5N/BCT66dJ4LW0yH
	mCb6KuDfKxc4YNZSigbnlaUu6ybGvuGfOXOA2QY0PS6KQDy2DmPhD55bzb3XFGk7
	Y7cwe9NA1bfDdpKFbnWYNtd/Crd86jB7lIUrk6YDkLUehACnNT+tt2AFEK+YKyXZ
	VlIl8qr5dpZK52S5xwDspLrItBSwc5CapUqfV0eAjhQ93IQtFfYy8QaXFfdm+uG0
	TzoTFNQA26YhrlIVNPd0w==
X-ME-Sender: <xms:1eHLadSxvMQnK7RYVIuEMtyWPHfaHH8HFW5fgG6hZjJJIYdZpTmSVQ>
    <xme:1eHLaRkDG--TGOffoCncDf6vMw7j_w-LMYaCPnKnbMP8Wy3oZgpRkBuIJMFeDVKPr
    QuzdJeHiSsLAvI4W-POwpjJMbKybYPNuvHpmuluxuirovYeJQE7eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegv
    rhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpe
    fhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrg
    hrnhgusgdruggvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheprghtohhmlhhinhesrghtohhmlhhinhdrtghomhdprhgtphhtthhopegumh
    hithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvghlvhgv
    rhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepshgrmhhithholhhvrghnvghnsehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrrd
    hgohhmvgiisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjphhoihhmsghovgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:1eHLaRTQPvFXT1HUtsEivRJPRgXEPTWWT0LRODMsmt20vAQ3HVNzeg>
    <xmx:1eHLaaDI1nX3YBV8Rj_WDcyGPFBi_HmMRdHo8iMQkoxEfdTLrwjboQ>
    <xmx:1eHLaZogkvKIYrTYSt9Wzu6wHfkmNgYO-zaak1bczkFDFG5FhuGucA>
    <xmx:1eHLaQgVTKgJtSO-jHP2RL7vMM6LifRtLbHgxxyss8ZDo22zD0qfAA>
    <xmx:1eHLaYH1B9XjnJXy34c86tiO_N0SP6R0-POX1PaH1Ae7CG6nbmw9321H>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 398DA700065; Tue, 31 Mar 2026 11:01:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AE3wFc71suKg
Date: Tue, 31 Mar 2026 17:01:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Petr Mladek" <pmladek@suse.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Kees Cook" <kees@kernel.org>,
 "Marco Elver" <elver@google.com>, "Peter Zijlstra" <peterz@infradead.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>,
 "Daniel Gomez" <da.gomez@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Aaron Tomlin" <atomlin@atomlin.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <82bc9a6f-2184-41fa-af8a-5cf50ac04f44@app.fastmail.com>
In-Reply-To: <acvghO4glmZamFSZ@pathway.suse.cz>
References: <20260331142846.3187706-1-arnd@kernel.org>
 <acvghO4glmZamFSZ@pathway.suse.cz>
Subject: Re: [PATCH] init.h: discard exitcall symbols early
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-12391-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,vger.kernel.org,linux.intel.com,gmail.com,google.com,infradead.org,suse.com,atomlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.940];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,app.fastmail.com:mid,arndb.de:dkim,arndb.de:email]
X-Rspamd-Queue-Id: 85F8A36B57F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026, at 16:56, Petr Mladek wrote:
> Adding module loader maintainers into Cc to make them aware of this
> change.
>
> On Tue 2026-03-31 16:28:38, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> Any __exitcall() and built-in module_exit() handler is marked as __used,
>> which leads to the code being included in the object file and later
>> discarded at link time.
>
> Is this safe for dynamically loaded modules?
>
> Honestly, I am not sure what is the exact efect of this change.
> The dynamically loadded modules just came to my mind...

In a loadable module, using __exitcall() directly already discards
the function at link time, so there is no difference from built-in
code. Actually using __exitcall() here is a mistake regardless
of my patch.

Using module_exit() in a loadable module still behaves as before,
this uses a different macro, which already has __maybe_unused:

#define module_exit(exitfn)                                     \
        static inline exitcall_t __maybe_unused __exittest(void)                \
        { return exitfn; }                                      \
        void cleanup_module(void) __copy(exitfn)                \
                __attribute__((alias(#exitfn)));                \
        ___ADDRESSABLE(cleanup_module, __exitdata);

so this is also unchanged.

      Arnd

