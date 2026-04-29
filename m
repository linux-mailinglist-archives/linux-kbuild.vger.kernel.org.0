Return-Path: <linux-kbuild+bounces-12926-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPlrLS+v8WmwjgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12926-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 09:11:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B763B490434
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 09:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C583D30131F0
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 07:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258A43A3813;
	Wed, 29 Apr 2026 07:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLhV/SSY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F613596F8;
	Wed, 29 Apr 2026 07:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446662; cv=none; b=EjQ4wp6Xl44dOQprUoBNwvmVk32v19i230twy2FlZR3YJUVM4RekqhZdMvwQht87Knt5K1nVD7xm9e4P9nhqxJmyeNQTXHzghprpkhCAbaUBda4QhNwKVos5ovWxOTqoPuEyQV6rxtHt2NbYLZIQaDPbb8pUW57n6bpiMvn4tgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446662; c=relaxed/simple;
	bh=vgTKPi91ydquf4THtwCY3jKGdkghf/1QRqHyJugk684=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MXvvhuRb9R6bGExET2EkaNTwOIOE1jRvFWwdDubuIpjSjAj4BynEbJDjNwWfkBkIuwd+FMGRSKUAd1/hikY20qJ3+ETS9LNfqZbrU2oKn2z0/5C/iNDI928P/zFkGNUyhq06hBTQ6yc2NLN6uupVw0TolNKSmOQPCvWCl31k0GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLhV/SSY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21CAC2BCC4;
	Wed, 29 Apr 2026 07:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777446662;
	bh=vgTKPi91ydquf4THtwCY3jKGdkghf/1QRqHyJugk684=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ZLhV/SSYrplYwUFSPsbt9P5pz/R1WfgGrHIHZFXFLEGEyHngGcwdRZjxXodSqv5lm
	 /njOgU7Tzz5IbdpXhJEBIeLxnKAo3KwXX7sCkOtGO5W9viRZ+rIo3I+NbuTBTby4hM
	 n6lVP2onNeyecWdLqRX2giIkp6R5weSvfSoBvpfqdQXN2LjOQw8cANAXaiDMIWSupo
	 RGCRbFAilI33/7Nau21uHcldqjzDXxNk9D0edMpyHtcggQvRqMcIWpNQwFiHTiAzrz
	 quvOXvfaS7s7NVBvqXt4M45CCNOQJyEIVh96VvkxFwrhWJsSt8md5A633gCeWzF4Md
	 RTxRalwOQkdlA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id BD7D4F40073;
	Wed, 29 Apr 2026 03:11:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 29 Apr 2026 03:11:00 -0400
X-ME-Sender: <xms:BK_xabEs3CLjyMv3JDN7gzsO0l-HuThd0BpkzctwXA58YBDjhrzRqQ>
    <xme:BK_xaTLhoDTjO4QTABZD3sDJzLWJgbQqJUcZL3FawS7HCRIL5YC7sxgFpU2Hyy49s
    Nr-ijPW-uRPXyQbfriAccJv2G6q0zUp9QHjlQGWFtvK15ywur3tBGs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekfeektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepvdeuheeitdevtdelkeduudetgffftdelteefteevjeevjeeiheefhfejieej
    fedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehnihgtkhdruggvshgruhhlnh
    hivghrshdolhhkmhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhushhtihhnshht
    ihhtthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnshgtsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepgiekieeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:BK_xabTGIESLo2jXcjF0ZdFmaTn6k2nL1OrtsZWsz1j0yu13RBSi7w>
    <xmx:BK_xaUpdFdUBup2gxR6GRgUadgOHw3onrKYPso9Z9dNADJSWmj5VbA>
    <xmx:BK_xaQOU1MvdidLF5fiYR5Sh-76LzOtNXV5lOBGcAtW4k3qDrr3omg>
    <xmx:BK_xaSw_k-fyNCjCIFmI61HDvEyD2SGDdPNGHcCm7CR_Cl4CK4K89g>
    <xmx:BK_xacyriSh5l4wYA9tOTrZsDnvxjJnb4p7M1KusbgNwPKU89GkjjWKI>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9B347700065; Wed, 29 Apr 2026 03:11:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 29 Apr 2026 09:10:40 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Peter Zijlstra" <peterz@infradead.org>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>
Message-Id: <e4dfd1f7-67fe-4690-8c2c-0f9d5a3ffed0@app.fastmail.com>
In-Reply-To: 
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-12-81d9b2e8ee75@kernel.org>
References: 
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-12-81d9b2e8ee75@kernel.org>
Subject: Re: [PATCH 12/14] x86/module: Revert "Deal with GOT based stack cookie load on
 Clang < 17"
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B763B490434
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12926-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,app.fastmail.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ardb@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]


On Wed, 29 Apr 2026, at 04:59, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the workaround added by
>
>   78c4374ef8b8 ("x86/module: Deal with GOT based stack cookie load on 
> Clang < 17")
>
> will never be included, as the final clause in the preprocessor
> conditional is always false. Revert the change to clean up the dead
> code.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

