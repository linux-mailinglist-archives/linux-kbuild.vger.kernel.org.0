Return-Path: <linux-kbuild+bounces-13248-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFcqE3DHCmqf8AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13248-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 10:01:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C28D56851D
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 10:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 00EA6300D74F
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 07:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB163C3BFE;
	Mon, 18 May 2026 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="DCrjwSSn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XRwCoXAP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A6B346770;
	Mon, 18 May 2026 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090551; cv=none; b=TZh24yNHaz+TZKDdjA+VsJ9JGoKsiaKbZveZJQEkjLbDNEE5vjm/NSfgLIF2SN2bGoOnPV8j9s9fSA8tmaCBtjPUPXHilSY5EAJuNYSmb40iG8SPBu/iSkzi6gv0NwIv+m9ugvWLNuJENbK970ks0c4jiPvEpRIGOIJcXTL4O4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090551; c=relaxed/simple;
	bh=ni66H/HXr0umGNjhD/kth7RF0nubzm0rW6EGgyR/pus=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rRgN/O9D7vbue/GEXKW/cRv/ZJm5kde2Gub9RiA2SzS+O6FMPrds2aOpgzvyAIwXXJPVvvm2duemRZ4k+qA9HFx9t6vwxPmJKFVsQcHEGiQh220cnvZCFZ1TyOC1AaUKGYoguSpqbPE0M8qhkOWm/BRJSblJFsHNrFQOrmY5wLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=DCrjwSSn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XRwCoXAP; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5EDC77A007F;
	Mon, 18 May 2026 03:49:08 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 18 May 2026 03:49:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779090548;
	 x=1779176948; bh=825z3tcv64EKbJtcUvuJYFiBQTsyBbCrWpsHI1IqtBU=; b=
	DCrjwSSnV0LyndbKDWhyPXEj5Mivi7N+fm/SgL90OShNC8DrdxhfuaYGd4E4N6HJ
	qnWmCu4M7ymXMA0Dy0D5uo2idXRdaqJf2ime2N+6O6ZpX7CzoPytZhjUpzTFj7Ph
	uQTXHBhW4cyLx4CBweZGBoYNUlARevP5v3WOPrzoPe1Bty+GCfkmGjiEX/uhHvhx
	pKYoZLbtVIFFg8bngCKx3pCGLDsQGy8vBe7VtHSVEvNViUbMhpdEfirrWnV2h+8Z
	APOMgi+H9UlJeXiML+JQRhsvBaLMldlkO+Nu+05YmesPL6IFb+QyNFJ0hyHGeQaT
	k+8/mOq4USyS84I2QPQSRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779090548; x=
	1779176948; bh=825z3tcv64EKbJtcUvuJYFiBQTsyBbCrWpsHI1IqtBU=; b=X
	RwCoXAPA7CdW4xROBXsUBAdSKLtpuJa/QAAwS+2RuaIMc4RCKP4B9FzQIs7Ynf6V
	W/+7T4aWGbl8KjRspxqWXNd+bzXizsSdC9CZDPyFLwXwLySha1MDUojZ+m+onfUf
	oszAOVkWdMmO4tVPTHsxtCSu8JVBkec146Kxpz2f8hZxTvr7pUDoGQLjwa38Sael
	nZGxajb/8YyBt2FbtqUJAPjonnVgVPaZ54Y/f1xbvLVd5fCqq3rINUzQXYHbl522
	CWAcuMxjOu7LUDQfrHof7sEvhPrqhbo53BJpO5GtWkhyJdbOcHcz3M7w+HDZ7Tst
	lANnR43eikw4Wj/tdw6BQ==
X-ME-Sender: <xms:c8QKaqMAoWxoo8o-9AxCX0Gthh-Au_-TcFcovGPfgjXZSsUlSJWQ_Q>
    <xme:c8QKajyL8rIQdJ0tPu5nM4Z4Mhz2niL1vIlsI50p_lBQkbHreGsCMbayPfwnrk_Gh
    D2zNGvzTMeqjIqWbqfmnSqxbpkcJ6G_v9j0zwte-Hpvm1bpklHq6qo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeekfeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepgefgjedujedvieejgeelgfdthfduffeiteefudeghfffkeejfeehtdejfeejteef
    necuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhhitghkrdguvg
    hsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehjuhhs
    thhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmohhrsghosehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopehguhhsthgrvhhorghrsheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrg
    hthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpth
    htoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:c8QKaqBnNO3BoGYxlPneNMwHAA8KmnqJkIydaEJfJQe6CJPzxX2uCg>
    <xmx:c8QKahMrlGkcZezZwYXAnHw2o5Bu3tjGJ87EQIuf7j8n1x80MnV_kQ>
    <xmx:c8QKahdMO7xVG5TYUFPFMDxMEiWHFEy-x4j-f0PgFifTtnX0AcVoaA>
    <xmx:c8QKai4DliDZNhCHAHshyXQOAFymy_1AEJ8kSl4PF0JZXAToeoEk7w>
    <xmx:dMQKalOg9UkpuTBleAp0GqS41lGgIoeP-3KeLvMAv7dQbBl9w605fHJg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CBEFE182007A; Mon, 18 May 2026 03:49:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AEmuO4rsN4-N
Date: Mon, 18 May 2026 09:48:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, linux-security-module@vger.kernel.org
Message-Id: <55186588-0cff-4908-923a-d5611707a3b0@app.fastmail.com>
In-Reply-To: 
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-2-b3b8cda46bdd@kernel.org>
References: 
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-2-b3b8cda46bdd@kernel.org>
Subject: Re: [PATCH v2 02/16] security/Kconfig.hardening: Remove tautological condition
 from CC_HAS_ZERO_CALL_USED_REGS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6C28D56851D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-13248-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,arndb.de:dkim,messagingengine.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,app.fastmail.com:mid]
X-Rspamd-Action: no action

On Mon, May 18, 2026, at 01:05, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the '!Clang || Clang > 15.0.6' dependency for
> CONFIG_CC_HAS_ZERO_CALL_USED_REGS is always true, so it can be removed.
>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

>  config CC_HAS_ZERO_CALL_USED_REGS
>  	def_bool $(cc-option,-fzero-call-used-regs=used-gpr)
> -	# https://github.com/ClangBuiltLinux/linux/issues/1766
> -	# https://github.com/llvm/llvm-project/issues/59242
> -	depends on !CC_IS_CLANG || CLANG_VERSION > 150006
> 

Maybe add a comment to mention that this now requires gcc-11,
that way we have it easier to remove the check when that becomes
the minimum version.

       Arnd

