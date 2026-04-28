Return-Path: <linux-kbuild+bounces-12907-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMHvNdEg8WkhdwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12907-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 23:04:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB7648C2F7
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 23:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF12F30166F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 20:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EE42C15AC;
	Tue, 28 Apr 2026 20:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Oea0eOfH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qvDvYf1S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E825FA05;
	Tue, 28 Apr 2026 20:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409824; cv=none; b=h5MT2idvkIMHNgCcZIuLaqfpEx2CK2AXZ+Te+XgwHYBMoZZOC8iZTrYiWVPK69UPSbNvPN91PG2FElRizLqShDFLYebjPSfHnnoJn3vYYv/+HVfHj06vsAaqknz0vncaLDjqGGEFfKKAjEbGQkXQswC79Nldyu+R7yVKs/pxXRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409824; c=relaxed/simple;
	bh=ZO+pe/vR2d9sM2YtLIugIcsURjg6r4XdoFnRIbLk6wA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=V7+smmahVUj5j6uivuozQffzrfSP/LrcW3y3cMrzw+FJyjIiubjdeE33ByNLJykn93T1Dv8KtpAFmjl3HAnCd73dUFdKugiASJDw8sjno7jIXqFH78iZ6RmBg8HaPiJrv6UfcuCAnp95W2skhguGsmQ6oxPO6+pG2xuzA4IsQb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Oea0eOfH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qvDvYf1S; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 6595F1D0013B;
	Tue, 28 Apr 2026 16:57:01 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 28 Apr 2026 16:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777409821;
	 x=1777496221; bh=2XHgVOwLCqPffoj8p77el6PoNp/FAeABORd90VlbFnI=; b=
	Oea0eOfHMxcrnqmWixfewnqtg95URjz2+voW+QuLI7hYH/Qf1KjS0Svjji57XTCs
	VcRoUFGy1ov6bGQHkEHI5IZrpq2H0dqc4sFyKj4bw1bfViqkvaz+/XnqOz+WfD5R
	Id3MmhIdwMrF+IiOvxPu9Y8YGUQOR5ASNwp+bJrY+Y/HuaDjM7t9i9X4boR+sJ+l
	aALK3pSOmBAuz1PYUI6wKSrkfZR+rfcU5WpGx01ey3SV6LfVkLjldWtZwwhHVToV
	3iQ4OX46y7E4CiGBwEjCYzncHtDA+R+x937alM9msUyig2IpCsi19z23k4UoHTmb
	FuBqVUYjtZY+4d9VvR1srg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777409821; x=
	1777496221; bh=2XHgVOwLCqPffoj8p77el6PoNp/FAeABORd90VlbFnI=; b=q
	vDvYf1SCYfzP18JmKlfolYb6XMWQnh/Z+GdtK6u26qJpbDO8itbVeMf2uR8DyWBU
	yvoZhJTwaQYIkJJMmRx+vwLJbquPDMrjviW/Ja60p+ai6l8A2xogbQzplrOD53xd
	kwBEvb+gxJicGsx0nGkQFlgq9ZecF1gELv5F9bbuXt0nAyVLW6s+DC3mQ4+0MoYb
	1tl7DnkLg/bac8RlFouL7MWzIM0oqGdxZkCc4us5IhRAqAz4AyJqLl+AK3K9ROVg
	MfhMh82H1oWWAg7o+sFfcVmOnLcx/2QQWWT68UrtW9eLxX3Dd2LJGGgLvOLOJ/2G
	JTfwpV8IoawTa/DIUEHWQ==
X-ME-Sender: <xms:HB_xaQLh66T_DnERU9ahh8gv8c7mf8kAe7fdfjfUbU6aUODzwg4a-A>
    <xme:HB_xaa9t_Skm8YjKiDskYHYBXksI3NNA3_Lf2XI4c4mqoDEOcDwOkR9Zc47g4S45a
    V116KID9WQd67RKJAY5gA-gHg8UFDnCKy-UEO-tb2A-oizLSzAmrcI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekvdehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnshgtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehosggvrhhprghrsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtohepiigrshhl
    ohhnkhhosehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgsuh
    hilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhhohhrvghnkh
    hosehvihhrthhuohiiiihordgtohhm
X-ME-Proxy: <xmx:HB_xaSYZChdsdUE-JzEvpQFdjJq7RpFXP4e3L1c9BLlnK6bHur79Yg>
    <xmx:HB_xab54WmqiiVTZgCCTtT_pL6W40uJNY0tBUw46GBzDOv6_RJFYqA>
    <xmx:HB_xaa8nEj2d2BdNBf6I2Vbe0vq3p343L9oA9xFh-aDQvk6BvzqKXg>
    <xmx:HB_xaXZrYLXJFb3hS8yDVQhw7rfRC8xFYLfEP0uPOaZXOgTpekuk1g>
    <xmx:HR_xaQ1Y7MceIQLid-r9K0i6Sp-snSjlWZ1_A2MXmE5snDgiaCKm_uOv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7AB89700065; Tue, 28 Apr 2026 16:57:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A6WLQDAqktbJ
Date: Tue, 28 Apr 2026 22:56:38 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Konstantin Khorenko" <khorenko@virtuozzo.com>,
 "Peter Oberparleiter" <oberpar@linux.ibm.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: "Mikhail Zaslonko" <zaslonko@linux.ibm.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Pavel Tikhomirov" <ptikhomirov@virtuozzo.com>,
 "Vasileios Almpanis" <vasileios.almpanis@virtuozzo.com>
Message-Id: <3786062b-ce93-47e0-8eb1-125bac5dbb2a@app.fastmail.com>
In-Reply-To: <20260422125112.3583649-2-khorenko@virtuozzo.com>
References: <20260422125112.3583649-1-khorenko@virtuozzo.com>
 <20260422125112.3583649-2-khorenko@virtuozzo.com>
Subject: Re: [PATCH v2] gcov: use atomic counter updates to fix concurrent access
 crashes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DFB7648C2F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12907-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,messagingengine.com:dkim,arndb.de:dkim,app.fastmail.com:mid]

On Wed, Apr 22, 2026, at 14:51, Konstantin Khorenko wrote:
> @@ -824,7 +824,7 @@ all: vmlinux
> 
>  CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
>  ifdef CONFIG_CC_IS_GCC
> -CFLAGS_GCOV	+= -fno-tree-loop-im
> +CFLAGS_GCOV	+= -fno-tree-loop-im -fprofile-update=prefer-atomic
>  endif
>  export CFLAGS_GCOV

Unfortunately, this causes link failures in a few files that
end up trying to use the libgcc atomic function calls. From
my randconfig builds with gcc-16, I have so far seen:

x86_64-linux-ld: io_uring/io_uring.o: in function `io_uring_fill_params':
io_uring.c:(.text+0x40): undefined reference to `__atomic_fetch_add_8'

aarch64-linux-ld: io_uring/io_uring.o: in function `io_req_sqe_copy':
io_uring.c:(.text+0x2c): undefined reference to `__aarch64_ldadd8_relax'

aarch64-linux-ld: kernel/trace/trace_selftest_dynamic.o: in function `trace_selftest_dynamic_test_func':
trace_selftest_dynamic.c:(.text.trace_selftest_dynamic_test_func+0x24): undefined reference to `__aarch64_ldadd8_relax'

aarch64-linux-ld: trace_clock.c:(.text.trace_clock_global+0x3c): undefined reference to `__aarch64_ldadd8_relax'

ERROR: modpost: "__atomic_fetch_add_8" [kernel/trace/ring_buffer_benchmark.ko] undefined!
ERROR: modpost: "__aarch64_ldadd8_relax" [kernel/trace/preemptirq_delay_test.ko] undefined!
ERROR: modpost: "__aarch64_ldadd8_relax" [kernel/trace/synth_event_gen_test.ko] undefined!
ERROR: modpost: "__aarch64_ldadd8_relax" [kernel/trace/remote_test.ko] undefined!

ERROR: modpost: "__aarch64_ldadd8_relax" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

Since I build only with CONFIG_COMPILE_TEST=y, it looks like these
are the files that explictly enable GCOV, and likely all others
would run into the same issue.

      Arnd

