Return-Path: <linux-kbuild+bounces-11587-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBdlDYO1qWkZCwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11587-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:55:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97357215A2E
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 17:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37F2530DCE93
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 16:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C243DBD71;
	Thu,  5 Mar 2026 16:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sluHBj5J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B063DA5B2
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Mar 2026 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729672; cv=none; b=b7tMX70Hd6ekSwN2FzYMQ/MhRXVRhAA5brGgIMy3FdJu14m7EHd6/aBO5vRsSrF+GsYEBkd1zFtqWuO40WGFm8+V8+jcdaTXadZiuHR5GUhoFvKmVkZ2jK6H/aQZl2WEYnkWHAbNRVZqaVUeqXpirEMgdieug5HT2Eicf4AdA/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729672; c=relaxed/simple;
	bh=Bb1KMrLqycT1mJTEbsbAR/yPkfis88j4rK2phU3dd5U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DxfLik/DNbMV/cDtm65UYSi97aH+Y/tjPRcqKGbRw3TsNGgq5cRzbZuZcEKXvjRGAsGkL/4J+HAF6unH6sZAwZAu8LVDvG30TIKB4rsxQ7OjAzVdPGyZ9kGRXR3CDu0Z5E3wyrZCynKr2ZGWVdBtiAmgJ1UCtUmDkaszut0lUoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sluHBj5J; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836b7fbf4fso63501105e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772729669; x=1773334469; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dBYdKguW4OR7832WAjw0ax/pGR/ObsDBsVmddi7GUko=;
        b=sluHBj5JfAAw33DMwk5C0P7EoC2p68PVq8RIlHzHG68iPKFgypy4gCkU+ybrrSk/mR
         +T4SjJSSWUaJSOFm4/INlHG7cYUMj9WxW7/H+3Nl1LpMOeQLUmZgrRmvtkAFzBNdah12
         gS+n8yoY2V+rSh+zyKmbofIW/TYWQejCb+fQa2gp4pKtsGpNT34YmIgF9Xw+e70a16vJ
         O2mhpZERm/kgnJ/c67dnCwCdzTx0XKdFX/9k5OwGivtd5h8RiBsT/fARLO18LmHP+1po
         WQaSA4CQsyKZWJTH9Ef8qbx86eEvWCuDZ9r5qyBZkrGCRrMG/9ZWvdpXrqEOYKgt0YBy
         B2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729669; x=1773334469;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBYdKguW4OR7832WAjw0ax/pGR/ObsDBsVmddi7GUko=;
        b=onDijue8U0r69Ib4f3g3eGGV8n55mUy6Z/uRiL0l9QyDqufiohHfdGtvd56v0p4YIO
         gOyI5V3xsxlyinnmKxGGhjvxC6XulA0UAUjCXZ3P34CasOhA+8TLp7QcBxaiwsXtBUMw
         90aKpC3N7lBjeXd5X2LlA2/ejH6avlvLwYrO9Sk1UKMD5MC5o2jAyqnoWENju8BnCM+3
         NbNfSwuOTLkUJtyJMRyGxqmDqu8KR7K50/NEm3XGx3wVaUr8Nsk2mRTksIKJ24Ggxy6c
         JQzS50P3FKzliazsLX5IIuevZh9qJzqwmwlpsLM6SCGE8szKx1ivWJPhSyOvRKxWkhXe
         aeqg==
X-Forwarded-Encrypted: i=1; AJvYcCX4PYjM9m04h+seGZiJQ+H3fd1My9oGdgUeP46G+sQkhCVCWFsJUSOXlPdz8krLP1vdH6mdSu7GedLzx9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNKGbc+S39FLgwlSeqWUuaE/8tZhPE3xGE2ee+7OMtL6RSNrkq
	zn9GZVZd498YObPyQcvyOMvSUE/txYH+bluAIEUGvz4OvN8qfFnb+JyHkFwhf7CMt9y8bKfu+NM
	WGbZY46y2FUu2xRTnJw==
X-Received: from wmnf7.prod.google.com ([2002:a05:600c:43c7:b0:480:1bc3:e23c])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e88:b0:483:703e:4ad5 with SMTP id 5b1f17b1804b1-485198800afmr106818555e9.22.1772729668779;
 Thu, 05 Mar 2026 08:54:28 -0800 (PST)
Date: Thu, 05 Mar 2026 16:54:21 +0000
In-Reply-To: <20260305-kflagstab-v4-0-4fe6eea27e30@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260305-kflagstab-v4-0-4fe6eea27e30@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260305-kflagstab-v4-1-4fe6eea27e30@google.com>
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
X-Rspamd-Queue-Id: 97357215A2E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11587-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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


