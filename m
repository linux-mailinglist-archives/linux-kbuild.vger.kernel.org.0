Return-Path: <linux-kbuild+bounces-12347-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFWIGKsdymmu5QUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12347-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 08:52:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BCB356186
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 08:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57B7430160E2
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 06:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35198396D35;
	Mon, 30 Mar 2026 06:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQf9sBS2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D8F396D1A
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774853393; cv=none; b=F6iIifSYDm74BnYuuY1j26md3ETLhqkmoqkwi5vKDZ1gpO592XSVaZgOcYY65Texfa9BamSE45a6Qqev5syc5kUZyBBABh+2n9EAjY75fsilKvx5SIRWBq5akqcZF7md8756Z9oUt/FNFgxqYJDNmzHELfoc/yhmTuXh9XCRB3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774853393; c=relaxed/simple;
	bh=IcI+m9ECDKqxJZ8kfZdOCb3RhA/RxC2TWzIlLpOMZRE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=IeKviyv4jAbZbQiwu+Z28GqMc+2I6DKsVHGVRAZuK+N+bG8Wl9Ap7M2P6S6yNtBrVowxBE9H3J3Qs4l9Nu9tYKjYq0aPlWY8fsO+RjuyWh2t2em5YnJItRYzr/BmvwcLylmaDGmhwKUqT/K5yWtw/WTXNFnWuqhDK08berMlBpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQf9sBS2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so1325112a12.0
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2026 23:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774853391; x=1775458191; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tulUJSN7MABRwEgvUtQdM4fFuvpVGNODzZ+gwA9Y1b8=;
        b=hQf9sBS2LV29cUnFzTilvTbMfIDi2A3Uv9PaF0UeQp/cfGAz3nAjBznf/0I5qtV5Km
         W48gfYHJu+zV1SE5opEEaJQ+7/QOTgBQzMCPDDgjLO+pK2QP5mRufISa9ZRQlFAlmI2h
         e8sQBgDt5yxbF7P5Zuyv5fEBbWyOBvzKvFeC4ujpDenVESvN4+33uBitkBbi7iYMJ6iI
         VViL3jhjdLSKUCDziMAX/Bi41j3LsXqBm0FgdSUbsHb3uw4lsYGPxh87hEe7CtEIkuGY
         tcPpvmuVDV7T1h5zgikvxwrWm2Kpnqb6nyCG5SchwmyaPpS3Z+YWE/a6iUw9PVJ5+euR
         bQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774853391; x=1775458191;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tulUJSN7MABRwEgvUtQdM4fFuvpVGNODzZ+gwA9Y1b8=;
        b=Iypvvkvr8e7rlQHRkJYGyEimW8nwnxfbVcndWjcbcML/7RymcPUt7ZL/uxiweSLhhQ
         rbWP3J4FSDGZJU5qOxmzUssy6O0zovDbvXyRDMQVhC52tnP36rtpsEAAcxcVpOb2Lp8I
         D6hzUFg9S4JP3IpaVVyFV/3mxffh42vlH2k5Tw4X0zycEcQL0PzrkszQaFWKcvXCC3Ii
         v5OZQl0SFehFroiVA226Q8OyrSO5VqpXyfoh71WHHrKmRUGqICjHE0GEN5asYgfXO8HG
         LM9vbroC8MvXMOAcVJoVILSM4Rr50MQezHqLLHCXB8zwNAzgUabjnJ2ETUdQGHiO4jkC
         dTmg==
X-Gm-Message-State: AOJu0YxqCsEIWXSENVxhQZrrrnNG1r5EXAxyxRhsBEenmXkfr336Ozgm
	FyPAzqwdXsKkypBPqHlhuwjwIAAnRJCv2+pBsAY82n6/LTZvhlMgctTf
X-Gm-Gg: ATEYQzy8o/LmeD01r3F7IwJ4etyEdoWkVBIm7cMojAGFmhGW1ZAsTd0mA6Y2a0L5dr+
	pFTJj+zyIqoULUPJ7sp/IOyrG4AEXvla9DhkCnUmtfnwmGUc6fS/WsHb06JOU3Du/1VaBxDyJSy
	U7SWtwrtG0TbhPn90CB4q7/Ln8fgUy+d6VVLFMGVU8EM9QGZpskAgCcIau7CWhf/Ysg5/frg0ok
	8Pk19NyVtC7W3+1mZJV3x7Y85TqhhHAUegjvUOPZ4mqrrVojHqE5hd9fI2gm0TM5jKz0Opz71oX
	iXw1X6o5Q3PaCcRTDPjXZve6nvlzztF/TsLVS+aGNDCXdws3AC4xyDn5bGNjfhl+CxNpI5oTR5l
	zPB5hZtQhY2h1FCW32aHKV5HeK2GBwNpKoyUqoNM44s6evYHq6Vg9SVu1rPagktW3aT2nnNx/jd
	lpqd/3zoqkiO9axvx4Byqwfg==
X-Received: by 2002:a17:90b:35cc:b0:35c:29ba:bf92 with SMTP id 98e67ed59e1d1-35c2ffa8af9mr10929498a91.5.1774853390700;
        Sun, 29 Mar 2026 23:49:50 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d8c500sm11522842a91.10.2026.03.29.23.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 23:49:50 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, arnd@arndb.de, chleroy@kernel.org, Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v3] char: nvram: Remove unused nvram_mutex to fix -Wunused-variable warning
In-Reply-To: <20260330062201.2581-1-venkat88@linux.ibm.com>
Date: Mon, 30 Mar 2026 12:12:28 +0530
Message-ID: <se9hn7hn.ritesh.list@gmail.com>
References: <20260330062201.2581-1-venkat88@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12347-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Queue-Id: B5BCB356186
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Venkat Rao Bagalkote <venkat88@linux.ibm.com> writes:

> drivers/char/nvram.c defines a static mutex 'nvram_mutex' which is never
> used. This results in a compiler warning on linux-next builds:
>
>   warning: 'nvram_mutex' defined but not used [-Wunused-variable]
>
> Remove the unused definition to avoid the warning.
>

That is not the only reason for removing the nvram_mutex. I think we
discussed in detail, why we think this can be removed here [1].
We should add those details in commit msg too. 

> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> ---
> v3:
>  - Removed global nvram_mutex entirely

We only removed the mutex definition and not the usage right. This does
not look correct. Maybe you can check sashiko review comments for
details -

https://sashiko.dev/#/patchset/20260330062201.2581-1-venkat88%40linux.ibm.com

-ritesh

>
>  drivers/char/nvram.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
> index 9eff426a9286..9ab2744cd375 100644
> --- a/drivers/char/nvram.c
> +++ b/drivers/char/nvram.c
> @@ -53,7 +53,6 @@
>  #include <asm/nvram.h>
>  #endif
>  
> -static DEFINE_MUTEX(nvram_mutex);
>  static DEFINE_SPINLOCK(nvram_state_lock);
>  static int nvram_open_cnt;	/* #times opened */
>  static int nvram_open_mode;	/* special open modes */
> -- 
> 2.45.2

