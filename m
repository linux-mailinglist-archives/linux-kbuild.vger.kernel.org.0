Return-Path: <linux-kbuild+bounces-11754-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPJ/NxZ8r2kXZwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11754-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 03:04:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D36B243FD9
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 03:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F532317CDCD
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 01:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F0A318EDA;
	Tue, 10 Mar 2026 01:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnBzATsy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35FB31714E
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 01:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107668; cv=none; b=UV1XgJgeZGyLA8mK85Zl4BMO+5obzG3UGHBIO5XRNnNu4MKYjnKSglFPN4AVBKcmKArtAjxE3gx+c7ujec5bAnPgEf4csRrV3ChJUuPVqcRVuSFO6VmWBiCezLfE2ruRtmIFMH2npWLObEIbh5BJBxTsjzRRJMu2TqBHQOPPGJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107668; c=relaxed/simple;
	bh=JiETEsajY2aSPQIA6CVpS/JzAilENyoJQaOzHVOWMNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0vnG9qGyu7dIfFwY5r2vQ6BT6uKZ9F1t3kyE9iXlXRAtm3UZBM4/yl0w6ypoB49yVaBHcEpgHNbjZT58cn33+2oVuVl9565Heg8CBc5834+8/FpD+ddESVKzfLh/Yd7zKYPyDQ0GccJ0bVj4QRoeO0R+OVcCnmwr7QVQiEgnso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnBzATsy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-485345e1013so15161885e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 18:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773107661; x=1773712461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8PvsfWgjRSsjZCi0tfGLdGo7i4sauWopm90Y9TdNI8=;
        b=UnBzATsyo8opxQjGbYCWmzynoDWzwt9GyDrASgxqbghv1aDvUoIlMjFc+SynwzwI0i
         YnpmHIih+tUsLYGA4cyJsnSIKZDDxci2zouSbMDnxGNFv0jvkfj3zD8wWruNU7NzEeir
         roob3R00s8K1l9ZMBiq8pHEzzn3TLCWKEjFphXOF0fh6Hs0skZN8qx0YtyJg8PnxoDcd
         Nof9utZ2Lq+KIPRxleOaWG5F/EDTZsLhJc+Gh58RRhKPZ+GYJMVHk4wg5e8/HYqZCCkT
         tSqJ82WGmYTsLzgPsv1oeSd8HjsAZzSb/ihaH9BuZBlW4CCX0oCIHfUl2ulRk/nVo0k/
         fhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773107661; x=1773712461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M8PvsfWgjRSsjZCi0tfGLdGo7i4sauWopm90Y9TdNI8=;
        b=QCD7qvejv+BlShwvroEpncBzEwiUYhdXNmtQ0hR2szx86PDFmjMY3puRaCnYRL3zS8
         unjVeTvpXWsz2KqOPFpIgT9bIPfCY2pYFynb+9cqIx0i6n1nYDV4i5fxZ5Srzd5r2G+/
         ztoz06mFcS73ix048raahgC7AlJM/0P8kPP+gM6eiULSzfrvkyJ8UDqoMQN+qobAbCQg
         o8mkff+TXp2ILpKlKC2d8tO5tVr4LcYpCBHlbacRPJsfwHtu4Vxzmr+V8JUHsLA4HQai
         7dl88EYxMk+hexflp7w3t60u+gTztBCiiFCDIRKiIPKqRtQQvEZU5rHVFqqnyvIAPCj5
         IPzQ==
X-Gm-Message-State: AOJu0YyYErv9A1mYTp/T6JkeuZdjSRNNWFf7VcN6oYtnbquU6k0jsoZD
	8LHPgD9lYj/ISB4GI5TdyJVRHD5R/SIDkMvK9DGZ4qSgQxvFQD3entqC
X-Gm-Gg: ATEYQzwRVffGYpQEEKFSW/rnLteM0WMAamFwC2jcuOqTojspaiFlDzqEmxbVl7Hgzo2
	U/nhBxBHsTSYGLwmpTD3dUW5L8cD5SnZhcCyAL3ZaqKQdjIB50zSN6CvF8ftehwRWd7vQeBDYBi
	+ucEdNJTjz0c7WZCbnGC44u4Roibb/gccTixfInlgHw7tU+sjbzAXWSt+LoIct2v6HCW5JLuwna
	sVWOF6nO6aQy4W0thyd47oqGZJJjydW6N4cr/U8Abr3QcgzEr3/PhgaGq4EnUEqlUy+3Pzs6lv1
	LunaXwOsRQJNKzbFB9uccMb9niKdG0Jw8vpWAXlEC484xdh/g6MBN4xZVTuHM1En4eUjj8TKWZD
	KzH3TkGOGE51++lI2O4MpoGKdKNzTJYrgDXVMAvmD4MzuI16HjdlFEUgJ4ekGNOG8K0QyFY9Rce
	GiFSUKAYchnGxIDcM0v1A=
X-Received: by 2002:a05:6000:2dca:b0:439:b3bc:4608 with SMTP id ffacd0b85a97d-439eff2e3damr3060698f8f.7.1773107660352;
        Mon, 09 Mar 2026 18:54:20 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-439dad8d968sm30371936f8f.6.2026.03.09.18.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 18:54:19 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	safinaskar@gmail.com,
	Rob Landley <rob@landley.net>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 0/2] Move tool for generating initramfs cpio to scripts/
Date: Tue, 10 Mar 2026 04:54:16 +0300
Message-ID: <20260310015416.3034078-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org>
References: <20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4D36B243FD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,landley.net,zytor.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11754-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[safinaskar@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

I like this patchset.

Rob (CC'd), does this solve your problem?

Also, in [1] I said:
> command
> "make usr/gen_init_cpio" doesn't work in clean kernel tree even if
> config exists (I checked this)

Now I tested this again, and I see that "make usr/gen_init_cpio" indeed
doesn't work in current mainline in that scenario, but
"cd usr; make gen_init_cpio" works (how I supposed to know this?).
So, problems in [1] are not as big as I thought. You don't need to build
whole kernel two times in that scenario. But still I like this your
new patchset.

Also, I think that top-level "usr" directory exists as a placeholder for
klibc-init project (this is merely my hypothesis, I don't know for sure).
I. e. it was supposed to contain source for userspace init program, which
was supposed to be put into default initramfs.

But klibc-init project, unfortunately, seems to fail. So, I think we should
remove whole top level "usr" directory and move its contents to other places.

[1] https://lore.kernel.org/all/20260220191150.244006-1-safinaskar@gmail.com



-- 
Askar Safin

