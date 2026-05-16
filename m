Return-Path: <linux-kbuild+bounces-13181-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBCbA7PnCGp4+gMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13181-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 23:54:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F97155DF96
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 23:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 826FB3022A96
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 21:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0748385D9F;
	Sat, 16 May 2026 21:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JshZZZGp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CC5384CD0
	for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778968449; cv=none; b=Ys9hYHH1afOue3g1Dmt8yIkIQcq9zVqcQ7JjRz9WEiEASO8KqMcwU3dfE3HN0DeUo2oclTaQ+U10d2UA8EHLgdDpQ0b8VE7YSChDQeV9ckmLVjgEwd6WsY+H9XX3++JveA72svmy/uwQ26n5zFhIF3OaclqqwJ25kNMKuaiZPwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778968449; c=relaxed/simple;
	bh=jz1nzUaADwE+K1cfDrDlEU5HkPkq87A/JGOsmNuUTl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4V20WPT867lyd1wHqPy3fy0E1sspHF7N+IbvhdNHYupF+qzeqZhGPDUcNBXIy+c3XsNaNTEMgsde3dP3EtH8vI3kmx8bfps0AG9RXpuyzpP6F1oIpo/czRRfCHKLMtWZCJIQFFB2JCD7G0KDQahCgQ2suAjEwv635padtD0Ssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JshZZZGp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso6115355e9.2
        for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 14:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778968446; x=1779573246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra4pEf8zZZm6HhF+DQ/toHqE83w/pN0bRu9e9oIN56Y=;
        b=JshZZZGpEBZAVzz6+EakEN3xOMEYQAOFnwucy7PU86hDls7D64gdM68+Ps1Opn5Uk+
         Sn3E0VMNI4de3jDzYdBbW/rpJbJAeLPLwV7LgXvyNp5HsNNuDjIzTpNK6B+v71jpsX0N
         Bo9u1hqhDZ6bpa1F8SpbE2sA/qIY2OiR+BExjbAg+bhs72LSokkNA8XAVZWFPKH11iaz
         X9Qa+m0LQrPL6uePlUXSdCfvmPCWea9mM11JjtoP6765UuS+BXTj8nxlbyhy3Al9kfjF
         9T6lkHKC2GVXUJLkhqgehB1JIpHEQjMr8OgZFZB1MG3uxSD0REpZUQz+jYR1iiKF19ff
         w2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778968446; x=1779573246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra4pEf8zZZm6HhF+DQ/toHqE83w/pN0bRu9e9oIN56Y=;
        b=bat90+wyjquh12LSY2QnHzpNJF55Edzr0WI0ndc791lwtAjROC4sxxoFbm/A+72x3f
         KJCOPW44YSrQ+ni1uctp0EK6+GnQksaBWGIRdYRsW+gqHaRMf4tIRvVUUE388M9wk9Tb
         p4q4aJUqAqBLyWhCzrbXzHR/pJmzbgkMJ6Nlz2dekhVTsZSWBm0myS1SqjXHI1D7kvnf
         nV4ZcUXb7K53FPiEVUVA6xQG+gHvy5uIU8MnOuyHxAM6QIVUKdyDu6J6iUEwRIyATJbr
         c89e+zjA1WeIPjqLekyBvL6+yO5XETzO1Fpsi+USVT0sdsJASBuWbxp5fO+W3B7cx1ja
         kOOw==
X-Forwarded-Encrypted: i=1; AFNElJ9B9HmLAabpV0YEyd5bYFzjeoU1Cc7nbffx6t7dg4Sm4fDrCI1IZ5cpCVUnAwvUj5l3w5HMW7yITiyOC2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvnX7R2z3fTs42J0FCkVrA74AmAFsE/gtknrITBAv+yI6JlUlr
	lfAWyhGV6HwcfOsg2wIRp8/fGI7cSpEYJ+9YNJkxPAETiLcLqj3a20Il
X-Gm-Gg: Acq92OG/g9AeQK2x6NLt2A8VuFn3uMz7TvguCUNalqTdjYGiTGp4OYy8KuheYnCsmqZ
	45BfynuqNH5Yru4fpIkc9TC9JP0+M1AcqHQLKsti14wMii+j57Aqd8kIyVQSOZgniB7BuAhx8wo
	kPnxE/GAKEpll4HF6ZOg4koXGs4QaOYP4Zc+Xncx9y1cLyXZ5kL0I4QpQsLwRwr4GK5GIAjhps0
	v0gVgzUa1B+RNIHWM/AFdDDYUWO2UcuDKQ+w+wKfdzSmEOofh03051m3YpjbYXG+rHFgRBRKVFf
	lN5EbbKCA1TQngS4+SH/ylP8E3jcVtjTM8NEynJzvGHD5kMv7/b92OOZggygFqPyNlcMK1uGsXl
	FlBFbc8RpSK99QXiV51sspW8IzquAdbXqO18r6eelRZDgmO/HlLved2BYhU3fMx0Wbg+LN+RqqR
	ZOt9lKGE6AtEf45ANJYbseGZkRzGz4/GWHVYunNdrjNinQL6pYQfgowL0=
X-Received: by 2002:a05:600c:a11c:b0:48f:a75e:c21 with SMTP id 5b1f17b1804b1-48fe5fcdee9mr93789275e9.6.1778968446077;
        Sat, 16 May 2026 14:54:06 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c90b27sm158383415e9.8.2026.05.16.14.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:54:05 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: jani.nikula@linux.intel.com,
	akpm@linux-foundation.org,
	gary@garyguo.net,
	ljs@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	yann.prono@telecomnancy.net,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH v3 3/3] MAINTAINERS: create entry for kconfirm
Date: Sat, 16 May 2026 22:53:54 +0100
Message-ID: <20260516215354.449807-4-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516215354.449807-1-julianbraha@gmail.com>
References: <20260516215354.449807-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9F97155DF96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,linux-foundation.org,garyguo.net,kernel.org,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,gmail.com,inai.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13181-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,osandov.com:email]
X-Rspamd-Action: no action

Add myself as maintainer of kconfirm.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2040011a386..8f4f5a009228 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13824,6 +13824,12 @@ F:	Documentation/kbuild/kconfig*
 F:	scripts/Kconfig.include
 F:	scripts/kconfig/
 
+KCONFIRM
+M:	Julian Braha <julianbraha@gmail.com>
+S:	Maintained
+F:	Documentation/dev-tools/kconfirm.rst
+F:	scripts/kconfirm/
+
 KCORE
 M:	Omar Sandoval <osandov@osandov.com>
 L:	linux-debuggers@vger.kernel.org
-- 
2.53.0


