Return-Path: <linux-kbuild+bounces-11589-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FR6BNm1qWlEDAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11589-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:56:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FE1215AF8
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97D18313FE9B
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 16:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69783DBD5A;
	Thu,  5 Mar 2026 16:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4HMD/CGE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB003DEAEA
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Mar 2026 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729674; cv=none; b=X056drwEHIO0QnI88p4yTXDbqdoR55eZkAcKqsl5RetGgGMx7OA7/CPNboVkyljC/kl1y1HqnwHINi7GmJOZ6NN6/Fe1If7k4NC2p1VuQ4iRDfBkfxLN46s/85EtUO/LloHAcN1xw7dw7yRwEljfyOhJuVYPlGhL5jRb7XFl4jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729674; c=relaxed/simple;
	bh=A4U/FoOHtW+MFUPt0VllbbGZtdckI6pJiFlzK0SEzrc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U15ZsEeONqEHV20GH9z8y4hyHqcWh629G2CTlZ1QMW8kcqgbtPOhzQcii3AMRjOnYM6Rg3VpByzIEEA5VKiLqbd7aH1Um/E4oFc9Uv+63KXeTnKCnDdv6BIiGnnS2Kzne0oNpaj1rir5gd//wp9UMJqhOs1UY24mYTClY90MkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4HMD/CGE; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48079ae1001so61263445e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 08:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772729671; x=1773334471; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V+WoAPEi01xLPG9zvw+lWYQpkS4zZIu+aKoCdLedeNs=;
        b=4HMD/CGE6dbg/CK+yImdBeNbWOOeE2skBGvhrTrV+0Z2H8NvDeODh9DowVcyCKtywL
         mh8Kw7YXzusDb/8brKi+mGqX6BdWeJB2THRPDTf4/nXtCdvxXuIWdFRqR3i4493VPfu3
         3uP6GTgJWcbKPSJ47PM+HCEr7Co/PuMfqjtiuSXrfCvVyCXhVJoLpEGME/7YKXL3hPeK
         cusZ+CsT3CTDfbwgLgm7uXAI457I1N0mXH/2BB3cZ3NvQuLNXkADTCX+eCUsqNPbovWp
         EbneL3eu6P8TRCXUKXrgrR4xbatDPWc3Rq1JHMdRKRU8Jm/1H5zK51FNph/9TTa/gpdW
         aSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729671; x=1773334471;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+WoAPEi01xLPG9zvw+lWYQpkS4zZIu+aKoCdLedeNs=;
        b=qoHOjkWku7nQRz1GlEeRqpiKGXr4yHRWgGXFjuh+YcrSGpfpAORjcwndizT6xf6lqL
         PlkFragUvk6JAVmUekWhEpH/oIcz/WVnIVP+drsSkrF0/yC78ixO5Z4Kg6zf8sE2LV2I
         t97W+/FYufxCyfD9uhrBlTmLj93+KVTbj4aMqbCJ4u1YKMwtzc5lyUfjV471tuxSiX2M
         s2Lb6Nv0zVp9SWZYlEbn2xGSzMySc9ES/c819KVLGrNxGgaznKEW7IUW5H7nZp63ju+F
         ncI2tsNIJplA/XSGjasaQMsJWkRZcnL2egdzhqwGUlNMeoDU3ogCtI0HBWYBN6fYdNrE
         Y58A==
X-Forwarded-Encrypted: i=1; AJvYcCVcGM92a24Frr1u8WP6HO5DTR9YXYB3MCg1GQRdHo8cuiVe3Hhnkwk8D1Z9Rl/ObOzLI+fWZR/EiKlaZZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhAhMr9kHbrrUENhgvRUIItJxuzzekovjmdv66jJ4wIxDIQnQ2
	6eOXNCZoAcIMYF8ihbYN3dZ0PodhCb/wYihbkkZIVNf1c+t3w5hguCylVPCducMVTw/2t7EKna4
	qitysP++gfA47TpXTLQ==
X-Received: from wmbjv25.prod.google.com ([2002:a05:600c:5719:b0:480:6a27:9ec2])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:529b:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-485198840ddmr115115695e9.17.1772729671507;
 Thu, 05 Mar 2026 08:54:31 -0800 (PST)
Date: Thu, 05 Mar 2026 16:54:23 +0000
In-Reply-To: <20260305-kflagstab-v4-0-4fe6eea27e30@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260305-kflagstab-v4-0-4fe6eea27e30@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260305-kflagstab-v4-3-4fe6eea27e30@google.com>
Subject: [PATCH v4 3/8] modpost: populate kflagstab
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
X-Rspamd-Queue-Id: 74FE1215AF8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11589-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sidnayyar@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

This patch adds the ability to create entries for kernel symbol flag
bitsets in kflagstab. Modpost populates only the GPL-only flag for now.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 include/linux/export-internal.h | 7 +++++++
 scripts/mod/modpost.c           | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/export-internal.h b/include/linux/export-internal.h
index d445705ac13c..4123c7592404 100644
--- a/include/linux/export-internal.h
+++ b/include/linux/export-internal.h
@@ -69,4 +69,11 @@
 	    ".long " #crc					"\n" \
 	    ".previous"						"\n")
 
+#define SYMBOL_FLAGS(sym, flags)					\
+	asm("	.section \"___kflagstab+" #sym "\",\"a\""	"\n"	\
+	    "__flags_" #sym ":"					"\n"	\
+	    "	.byte " #flags					"\n"	\
+	    "	.previous"					"\n"	\
+	)
+
 #endif /* __LINUX_EXPORT_INTERNAL_H__ */
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0c25b5ad497b..1d721fe67caf 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -244,6 +244,11 @@ static struct symbol *alloc_symbol(const char *name)
 	return s;
 }
 
+static uint8_t get_symbol_flags(const struct symbol *sym)
+{
+	return sym->is_gpl_only ? KSYM_FLAG_GPL_ONLY : 0;
+}
+
 /* For the hash of exported symbols */
 static void hash_add_symbol(struct symbol *sym)
 {
@@ -1874,6 +1879,9 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 		buf_printf(buf, "KSYMTAB_%s(%s, \"%s\", \"%s\");\n",
 			   sym->is_func ? "FUNC" : "DATA", sym->name,
 			   sym->is_gpl_only ? "_gpl" : "", sym->namespace);
+
+		buf_printf(buf, "SYMBOL_FLAGS(%s, 0x%02x);\n",
+			   sym->name, get_symbol_flags(sym));
 	}
 
 	if (!modversions)

-- 
2.53.0.473.g4a7958ca14-goog


