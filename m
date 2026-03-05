Return-Path: <linux-kbuild+bounces-11596-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOwPHoC1qWkZCwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11596-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:55:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A45215A1F
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17E7F3038031
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 16:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8BD3DBD53;
	Thu,  5 Mar 2026 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GeTWH3E5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6C73D7D9F
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Mar 2026 16:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729723; cv=none; b=KRq95+5zSQW0UwSGVYi0vaCu4JxjFHcOJOYFzlC7sUMr4rquPv/q1u9i309SgHf2gf7bA0atCXNLJcaS6Pd0UOpd2pn6Du55Q5uk7my9zTI9ltptxUq3U09U+/u9Lvhc78OLGY/6blf/Y7AuKR3LsItHGo2v16+kYVjfhtc0it8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729723; c=relaxed/simple;
	bh=Bb1KMrLqycT1mJTEbsbAR/yPkfis88j4rK2phU3dd5U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SkES4xoFVpsN2Rr66pXb5FLfrThggz22i8Gh2uP7OXPu5rwBl7jtYnB+9wegGgrxxNAihAuA8eG/6SIIwv8n1Y63KUvid0jI8/WatP+0x2jIbErshtD3FTrK/hc5myPBpQms4WTsERL+7jfp0n2T1kmedcLXc4CpI7CIpYfuYig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GeTWH3E5; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48378df3469so57387585e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 08:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772729720; x=1773334520; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dBYdKguW4OR7832WAjw0ax/pGR/ObsDBsVmddi7GUko=;
        b=GeTWH3E58TZXYykT+YTk2W0CvHwg+oB/gc7GKfkDBBtS23oyRdK68pKoGKN0Z+mlx0
         msULwJ/u6BQitz9M3oru+4V3K241i3+M7Pv2fNELKKS0lYR3ZwL13CVHivLAN5dfXkNh
         MXzdKB5arkDjyHB8aDApNS1eKVacpaJphSO/Yfd3Lxc/MlWfispc+4Hv0YrLOntkcTnB
         rrBRTIXqNH0LbpvU6KiqoEF/nlSijgjABuMX2f1pcV9hIrPS+v5szMCYhMz5FKXgk4Yc
         pqyjf482QCLyICY4AjbvaYxuaHQi6ZHNDxo+KnhI0x92IAfKl6pcFKppG3EVelLvn+ud
         AFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729720; x=1773334520;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBYdKguW4OR7832WAjw0ax/pGR/ObsDBsVmddi7GUko=;
        b=RIInWXp9TORCrIHAbHCLleFgqne5vFHcKhQEE1Dg+eOhvuieACnYGAR8TWpPcygQX7
         Rs5+M11ZmUzmywvmFmvnQoZxul2ydmtbZMFIv1/eV5aclmiNfucQb5Ejh+QS+UFadlNn
         UjUrR19g3jJpRSVnM5nsxNf0wnDeShVapDT+li6RHjW2VJTZUEI0G2qT7lSIZErTIIk7
         0/Qmeum74LbvBDqr1LpoXMZ4AOABow3GMDLMZM+7Up+WkDkWXM1j1ZjNJISiTRSaph16
         EN+zqTzg/OQRpSNeuBoylQTkUPyjXOaNVfIHGlK/ALJJIhRlOOuPBPNyCXf3BM43zNtb
         VlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFm++d1+2ljSuWmouGt7hDASFhISWPneyG6UxSQQrXeaKu45ki1QheQo+wLTYQ2OUKEmGsRo1IaBT+cpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdvs9B+L1GZqCoX+iL1oMB0JIf/KDNHiyOgeWPbL+MHn2kAHOG
	t0wu4nbRcZ59D+nRbjMgrP6h+4O5y8oIFmi3IT9kles3S3cn62mGTQqUyGQNLwDs5gq3cY3m+tD
	XMExnTGkkWPtzhvxEBw==
X-Received: from wmbd24.prod.google.com ([2002:a05:600c:58d8:b0:483:248b:3e95])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6814:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-4851ee9c2admr52391175e9.13.1772729720453;
 Thu, 05 Mar 2026 08:55:20 -0800 (PST)
Date: Thu, 05 Mar 2026 16:55:17 +0000
In-Reply-To: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260305-kflagstab-v4-1-6a76bf8b83c7@google.com>
Subject: [PATCH v4 1/8] define ksym_flags enumeration to represent kernel
 symbol flags
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 23A45215A1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11596-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sidnayyar@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Symbol flags is an enumeration used to represent flags as a bitset, for
example a flag to tell if a symbol is GPL only.

The said bitset is introduced in subsequent patches and will contain
values of kernel symbol flags. These bitset will then be used to infer
flag values rather than fragmenting ksymtab for separating symbols with
different flag values, thereby eliminating the need to fragment the
ksymtab.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
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
2.53.0.473.g4a7958ca14-goog


