Return-Path: <linux-kbuild+bounces-12359-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOYjK6ewymkX/QUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12359-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 19:19:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE5235F3C1
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 19:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF9F03029262
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 17:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C853DC4A3;
	Mon, 30 Mar 2026 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wPC4uOjI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4278537AA77
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891167; cv=none; b=gjUv3PWWUL/yHxxRM5c1GYD2Hk6QxaEgxRgMvzqWdOCPSgapgutYNZ8D7/7hF9CUPNdFYYNbia66ANxB3HI0YLH01b06O3iZJcMO2Tm6pB/eTDA1W0zTfpW0jDltGeYam9+hb3X0NSfTapxQmXE3vMt20/tIgSgv81dRwW4Qcgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891167; c=relaxed/simple;
	bh=5ck/FR28yMeqziHcX6QP2KCqS3TT49rCLIznZg7DIaQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NINDhpCcyVrvJipY27B8PeEJtc6xWb86ETVpFWVGcOs9jZfLmupp+kcfMAvEYJOaFNmxVK0K07D0YJvOp3tayqMT3e0uY8B9PttncUH9/JCPXFEu/RCrNU27fpuFmr4jxSQ3Bk0+3HI/y5zGAlXNFu5wMK8Rpoc+qXB2vblxy5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wPC4uOjI; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso4874072eec.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 10:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774891164; x=1775495964; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G05DSpbW2+WuvU/zQwgPs9wiMjlPCBEOvZkM0+puVoU=;
        b=wPC4uOjI33zPccxAiRR2ruVLEyqD7dtKzidNJ3UBUmGvQhTIWUVlwS/nq3tgQo4sSF
         rIMfcnmkSkI+WdR2qGvmQTONFMCfm38qzWwegwcWA7w/Z0ieeWOT7RSRoiQJdLLXtTMU
         +2dAN03TPAnadYv4kPjPw0PwoZqhWY+E1zQlNYY18c5GB6SGajQrF4yXzWS+E0Lc24hW
         /ALfvWYIn78MASPkfnFhxgFOjUmGXu2dSmH7JgpdLP2ZwW2alfQYMcUp9DZWH5LBAM0P
         klqmaJWtbj9CQy5B3VhKBdEhVKjD67zgN0k2aG5LMfyZTeBGR+YVupRgQBi2L/LS6q/+
         zK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774891164; x=1775495964;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G05DSpbW2+WuvU/zQwgPs9wiMjlPCBEOvZkM0+puVoU=;
        b=NA+e9eNZsIiHsxsdyUS4rH4eQ2ZmEv/c2EMl1Yegv+l7QJ72Vkr+GFh3zYm0/6ck+t
         5tUHObyyU2drsimWGMfKJQhSFFV5ayQBvathaWWKV/DwROMEVsM3U1g819eovAriGe8Q
         iL9VnbhKaRuplhJEH7EaiAuX0oJlZa9nTybgxMFPmgTrTWR53lZ+VV8F9b/iZsfhPtVI
         8SLUmfX3nlSiVPMI1byqttqgbgaMQq8rag6K6Q8E29bYXhB1/rfpTSjue/NtEyaajUmr
         1fA7dnSogOKtSn4j7EjN3kwNZ+Tnae4gi39AEUB2Cce2vNJ41u/kJOF73jCqhbKWUFWG
         6Xzg==
X-Forwarded-Encrypted: i=1; AJvYcCWnxuss3rxG5jbK0n2qyCjzkeknhwkrvQv/rFCXRCrtsxGjdBA8fd30XSXsCWASo+hbVn4UX0UidvS5IsU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Wz46pAwnI6PBTGZ45iHz1I30h9lA/ZgJzeaEe6xFsDfq8F2h
	m/s54TPZWNqkBz9d/0gRhD4/dLnL1fQwNm8dBR8VP2PfjdPDV5R13ItrdX5aSxNqD2HVHA==
X-Received: from dybmt4.prod.google.com ([2002:a05:7300:d584:b0:2c0:b626:c453])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d512:b0:2b7:2664:ae9f
 with SMTP id 5a478bee46e88-2c185cdd05fmr7275474eec.1.1774891163845; Mon, 30
 Mar 2026 10:19:23 -0700 (PDT)
Date: Mon, 30 Mar 2026 17:19:16 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260330171920.2026779-1-xur@google.com>
Subject: [PATCH v8 0/3] kbuild: distributed build support for Clang ThinLTO
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12359-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4DE5235F3C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rong Xu <xur@google.com>

ChangeLog:

V8:  Disabled -always-rename-promoted-locals=false for the distrubute
     mode, based on Yonghong and Nathan's comments.
V7: (1) Resolved a conflict by rebasing to kbuild/kbuild-next-unstable.
    (2) Separated the '--thin' to 'T' change into its own patch to
        preserve Masahiro's original version.
V6: Change '--thin' back to 'T' in Makefile.vmlinux_a to fix
    reported the build error from old ar.
V5: Handle single quote escaping in echo _c_flags to fix
    Piotr Gorski's reported error.
V4: This is based on the reimplementation provided by Masahiro Yamada
on May 26. The difference is that this version now saves the compiler
flags (_c_flags) from the Front-End (FE) compilation and re-uses them
for the subsequent Back-End (BE) compilation.

Rong Xu (3):
  kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
  kbuild: change --thin back to 'T' in $(AR)
  kbuild: distributed build support for Clang ThinLTO

 .gitignore                 |  2 +
 Makefile                   | 27 ++++++-------
 arch/Kconfig               | 19 +++++++++
 scripts/Makefile.lib       |  7 ++++
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 176 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: dcc99abebfa1e9ca70f8af8695b6682ad7597bf2
-- 
2.53.0.1018.g2bb0e51243-goog


