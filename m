Return-Path: <linux-kbuild+bounces-12292-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN1KDGqjxWlUAQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12292-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:21:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AFF33BC4E
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C97C030157E3
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 21:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A383A7824;
	Thu, 26 Mar 2026 21:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AZgEaMAL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01FE40DFBA
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560097; cv=none; b=LX8cuxwJUfC2MLApE9lUyFYHGDHSUoUZJm8eGP8NtjEQeF8D5C22R3cFr/bW8WyieCrWRL8OKz8RTnLqDV30HTgCr3KgUE3sWA6XTplyForCsjRVFC12tQd3Oncz04dj005Ltx21Ej5BRwtld0pWNNvTc5lAklKKmxBC+PBm/oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560097; c=relaxed/simple;
	bh=yxWFKfFkKHmuOpsxGuTO4vPY99a8JR43U1hClfLdqBk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=frb25ManR+Pih0QkRtMTvYzxE0jfxzpfpM1Y4Xgc3A0oZnbrsZpyXn/53i5rfAC2mFjQLd2De6sG4SUxZdrCIoHWP54it06HjODEYewRkasnyo7ue2fuCYWtptU3C1QUrLgMScbD2Guup2OEaV9Oh31NmFHF3YlSZgJbmgyFin4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AZgEaMAL; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b982051b914so190184966b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560094; x=1775164894; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWI54gUN+/1z0II7jAJ2ytcdqsD5FtTzHZqzZAkbnP4=;
        b=AZgEaMALaVhgtjYEYzEr4p+GPO+hdQGklRorUAej8OyW1QByEiuxNiIzQjNmSBSCH5
         KBNvcJS86tX0zAKxocwgyzZ9H7I/cTgrmgS5QiLLCooq9H+N4pgURNw88nWozqIBbCAH
         VKsaSBESVQeJ+MegD8aJbnFrAxYGwRriCohKUEX4WxgtnF05p3rN968wYD51AzeyqFCQ
         d7/IcFyQYYlnHDpl0F5jnVWhmoFy21kJpw8YUGxJUXS4J770beaB+iZXNlHL1PKc+oaf
         az1la2pLdGkjEatIoXHOfcVnmEAzyiMJEfI2UvYACTVQGQtD5TGWvIcADsugE56Ul3E1
         Q3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560094; x=1775164894;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWI54gUN+/1z0II7jAJ2ytcdqsD5FtTzHZqzZAkbnP4=;
        b=OLgTjJg83qT7Z8tKxYVlJ0Zl1N4VTKeoMwjYOA+ag0pggBnWwbCx8fF1NrST6YSlun
         KLmUHxf8S4caHbOc4F6DjsQABo8r3pKS5up9y4aaI4OHJa9+2mS8winEbIVMZP/XD3dC
         sN0KnNuV/jjaR0YJjKNko7xDjVGXiCfEX2DzzpSzGDkEBlX1jEV1b5BHwpEzKTVZuKf6
         Pz1vIBNK3J20tIIu/U+yUHU/dkwKvbaloV02tMWzbj+wLuj5CUIr06V9mCc3588h41cv
         1/AeOTd9vIprjBWIAxocuJfJ4KnQrljd9eTgjJfTDIsD8Xdl9nEYkXxXhDnK3syjCI7W
         AJ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoPXAvLoTedP9pHyWRNqPtBz8zYT2tdCGkturJreB3uXTMEQUZuR2QgliJ6Zpb1NOBlaXBdk5X35b7idI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSBOjfHRtFokA27z6uo6piFUtuTTXnPWU9D+pzuYdKEDfmB+MD
	wsUHgb1EGZDNIJxuTQqbiqCUW0t7CAgR0kgLSq18mMu0+3k4r98RAaeN4z0mERCaaba9BfDzgjN
	43ccf6G72+nvAMwfW5g==
X-Received: from ejcdp19.prod.google.com ([2002:a17:906:c153:b0:b94:96:8ae4])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:598e:b0:b98:7e20:b25 with SMTP id a640c23a62f3a-b9b502ed0a8mr954766b.20.1774560093907;
 Thu, 26 Mar 2026 14:21:33 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:21:29 +0000
In-Reply-To: <20260326-kflagstab-v5-0-455cd723dddf@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-455cd723dddf@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-1-455cd723dddf@google.com>
Subject: [PATCH v5 1/7] module: define ksym_flags enumeration to represent
 kernel symbol flags
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, gprocida@google.com
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12292-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sidnayyar@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0AFF33BC4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Symbol flags is an enumeration used to represent flags as a bitset, for
example a flag to tell if a symbol is GPL only.

The said bitset is introduced in subsequent patches and will contain
values of kernel symbol flags. These bitset will then be used to infer
flag values rather than fragmenting ksymtab for separating symbols with
different flag values, thereby eliminating the need to fragment the
ksymtab.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module_symbol.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/module_symbol.h b/include/linux/module_symbol.h
index 77c9895b9ddb..574609aced99 100644
--- a/include/linux/module_symbol.h
+++ b/include/linux/module_symbol.h
@@ -2,6 +2,11 @@
 #ifndef _LINUX_MODULE_SYMBOL_H
 #define _LINUX_MODULE_SYMBOL_H
 
+/* Kernel symbol flags bitset. */
+enum ksym_flags {
+	KSYM_FLAG_GPL_ONLY	= 1 << 0,
+};
+
 /* This ignores the intensely annoying "mapping symbols" found in ELF files. */
 static inline bool is_mapping_symbol(const char *str)
 {

-- 
2.53.0.1018.g2bb0e51243-goog


