Return-Path: <linux-kbuild+bounces-13936-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UCs7D5ObSmoeFAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13936-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Jul 2026 19:59:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE9E70AC1B
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Jul 2026 19:59:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DKSk83LV;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13936-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13936-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D8A4300E3D3
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jul 2026 17:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F892F8E9F;
	Sun,  5 Jul 2026 17:59:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E30D2FB969
	for <linux-kbuild@vger.kernel.org>; Sun,  5 Jul 2026 17:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783274384; cv=none; b=Q04tvSfW9MJwXOe01QVY+MJLnXTukP1Ds1wA0K11ueeYmsMbhjoclYfsdpZibvOB51ZevzmlC4A6D+1qvAfgwRUHhK04A11j1/uUfVdSPu29VnwLw2SAP4l+knIzalAfHgPNJHL1E4tZZ9cf5T/Kcmba+meOxKNUTjWcYX8ymMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783274384; c=relaxed/simple;
	bh=wxt1DZW7D4hVvbkLcQ+lyPgqvCFI9lv+zU8l4HAu82U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mv4uCdBhG0rXwDQh+Lo36vQ0uxpKLKLTKsHVFRiXa2382PZwH5+D8/Y5Qx3YY92HE0pbxIo8r1ADC1W8doUZ7C0rhwt9m+KjbqQoArTw/mn+L+gRZ9NOOoxQIU4GW8otGcjYCb9YGUigfmHu1xxaivl5FGG6SdMAyKWoUcTbkRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKSk83LV; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493d28b1930so14578915e9.0
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Jul 2026 10:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783274382; x=1783879182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tV5ibFxxEGFY5w9PuVHtNxk5YR5ShLb2875PXplyBGA=;
        b=DKSk83LVU13Pfw7gS84WHTdiKOHA/HV6RXnIYqQTzHwnYH3/MVhyT7GLmvmgPDNz0G
         0hGSSffVRLr5OZKulPQl7H0cFMNxLTP352Gj4rIvwuWTjvPn9TUZKrAYh4RoSN5Nt0GS
         JrqoGc0oKMSv86O7Nl//LzRqfw358gYiE+bq6xCNF2nEAD/H4x7bDQsQQsZ8SZab28qK
         TTb/7/hAbDi7r3wpt0hSEeRTvi5M8BUhlSpkt9cbU6RC2BFyj1ilZHCGKo88NTdf8Oj4
         3OQcvpsKHsgbfJ+zmK8LUG8a1MsAD8WuhbgfhT3BeJZoU0hNVe7gwvvqp/pq4Js6vWZ4
         2njQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783274382; x=1783879182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tV5ibFxxEGFY5w9PuVHtNxk5YR5ShLb2875PXplyBGA=;
        b=Hd1BwSiUAOg5YO2VpKV57AhY9l08CZtk3EDrcd+yO3SLe5xYfnzgb4axsBWe24Wi8E
         YgjsHYRLGPrtqPVcg030kxsKq9SEtX1kTJAf7Q1oD3tWw5yBAep/cLxvNbXiL77tzuO4
         3J5e8TnDdMSBqjYWa/71C/MdSwtZyA8u98n7RkFMteCF83BCP1AvDZqzx5+lrAUMtA4q
         iGO/v9jqiZAMjq4y8jmkQ4cplQ7DbP+h1DSnv5YVkVkThJLAfXcZORXw+JLRcyFXQzoV
         b6iQ0QDRJC6OI5rmBr3pTwZd5yuOOfQMDE4e9hq+IDXAScJUUSQM4pBZEx6vNjy3gf7j
         KqMw==
X-Forwarded-Encrypted: i=1; AHgh+RqEuL1l1Z059PKq5SShBlcK/yexJbwu087M57P1dt/Xqdy3M/qiCGCEGaIPIip6VHnWLb+Vrm5iLRVqJxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvj7wLFeysI3NLHxdaofH3k8jt+PTbzVzgwpOYKdkaM+jo59ed
	leUKuC9tb170NTLXQjRJ/9CjhmypNZE7ekJPvuYPyRKXeaTSBoVD6Pcc
X-Gm-Gg: AfdE7cnR2ef36+SudyHQ6EW74wRtvJbQEa6X+qCWJomcO8gPQSuTvrInPz8DFFmNRD+
	MV5lIB+2O82T0GNGDjr8TtySrq/OguEvm9/n+6IlDnr8lLfxwe2tHfdpvGsArct9Qx6wKhKmwZC
	57IcviXOLhH2UYb4dBWWAAkK+MrdA1xg/eoz5zGdsEeJv+LIEy93MYSkjynwhHyhC/Yzro9kp7a
	J0xshc1PRMXEJR+rx8sZoSfL7hUIWn1LK+6fD1yV3sACHfmNRQqColzF8nk2rFYnlUmrD+u6VVg
	pCv+VIzcx4yoEL+ReThl5s2ITSBKNOXybgowDp961GAZP5u5oeL7L3wWm+ljVPG2doQQR0NYl6A
	KpI5BZ67wq5bOvHL6YiWG8xSG4TE+7g3sfd978GGpj+AZD2tBAr8NLoZmjsGjLOmEAX5LUiGNAp
	GqKT/jLdg+rXPMyeXn7Cw=
X-Received: by 2002:a05:600d:8489:20b0:492:6447:7a7f with SMTP id 5b1f17b1804b1-493d11cf2b5mr62215445e9.6.1783274381659;
        Sun, 05 Jul 2026 10:59:41 -0700 (PDT)
Received: from localhost (a89-182-201-232.net-htp.de. [89.182.201.232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9b4d850dsm18636736f8f.0.2026.07.05.10.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 10:59:41 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: nsc@kernel.org
Cc: miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	ojeda@kernel.org,
	Sergei Litvin <litvindev@gmail.com>
Subject: [PATCH] scripts/tags.sh: Prevent binary files appearing in cscope.files
Date: Sun,  5 Jul 2026 19:59:36 +0200
Message-ID: <20260705175936.4653-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/>
References: <https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13936-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nsc@kernel.org,m:miguel.ojeda.sandonis@gmail.com,m:nathan@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ojeda@kernel.org,m:litvindev@gmail.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EE9E70AC1B

PROBLEM

When executing the command `make COMPILED_SOURCE=1 cscope`, the resulting
`cscope.files` file contains filenames with the extensions *.rlib, *.rmeta,
and *.so.

SOLUTION

Modify the regular expression in the `all_compiled_sources()` function so
that only files with the extensions *.h, *.c, *.S, and *.rs are accepted.

---

This is the first part of this patch:
https://lore.kernel.org/lkml/20260602121521.11650-1-litvindev@gmail.com/

which I have split into two parts, as suggested by Nicolas Schier here:
https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/

Signed-off-by: Sergei Litvin <litvindev@gmail.com>
---
 scripts/tags.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 243373683f98..c9dc2763a505 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -100,7 +100,7 @@ all_compiled_sources()
 	{
 		echo include/generated/autoconf.h
 		find $ignore -name "*.cmd" -exec \
-			grep -Poh '(?<=^  )\S+|(?<== )\S+[^\\](?=$)' {} \+ |
+			grep -Poh '(?<=^  )\S+\.([chS]|rs)(?=\s)|(?<== )\S+\.(?1)(?=$)' {} \+ |
 		awk '!a[$0]++'
 	} | xargs realpath -esq $([ -z "$KBUILD_ABS_SRCTREE" ] && echo --relative-to=.) |
 	sort -u
-- 
2.54.0


