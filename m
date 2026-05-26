Return-Path: <linux-kbuild+bounces-13340-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JOYNs3YFWpYdAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13340-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 19:30:53 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 985095DAB3B
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 19:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C93743022DFF
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 17:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D65540802E;
	Tue, 26 May 2026 17:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oZi+L4Nd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE231405C40
	for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 17:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816573; cv=none; b=VPjDBe1BCy002QElny2ulGMaCpIIpFJVZyhA7ZueyzYd/qOAXcabO1PA6Bnnow4yVGub919slXO4AgGnbRwwYXIBgJ0eFtQZIPInMkTz4BmYsgauj76a6U4iTEwKzfdg4YL+zNFEMYLWTmVZ4dXTYGWM6lxfQhqecuUst7JEtUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816573; c=relaxed/simple;
	bh=NM1hox/nmIStFDjJctyTRdY4mjSysbTeC8x06nBRPwY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pOGf2EGH+psf+A9Zm33R4ieWpnjxEqc8Knt07IFoMKVCZnokYBh87NGr0oCgHV6kw+K2Utf0gpW+AFPUjRQcFV1C865UMtIbEVabtXTLBPljrW4umK1NWuGQZnFbFHGAYKxHprbZEhbwEpi8PXU1d36gZyOWF30LujavRdKY7wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oZi+L4Nd; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-13709ab38a8so1973977c88.0
        for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779816571; x=1780421371; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qz4h094dWujd+s1IC1j9THDXhh+xEyMYGMcHMzAmczM=;
        b=oZi+L4Nd9OVQX4HUDprZO/Yiu50/Z71RX4oNO5JuLBPS6JnBs9M5eC6afkIP+vWF8i
         GxEI7VuM747dJ6je3vbiAolorTO7KxDUMgN7HD3VERnZmjJ4Z47o1PWfukIq0ac6wuxK
         D+gjcIeDkh+G0aYuS/2ATGlmN2Pj+Fdyhk4T/elRedl1yBapI2S+HUwatRPnDjQI9Vy7
         59WOydoEOSt6UDgcDLdp8vTziQQ8xpmrZSDbOK7L3Seh0W/MK/6UGP1auyc10846YHGR
         eXxPrcWg3ZtJCHhimPvQf98eYJRAivN03RpiG3zgYy6b5DAL1trunJKHHPnh7Oj3o2E/
         FO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816571; x=1780421371;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qz4h094dWujd+s1IC1j9THDXhh+xEyMYGMcHMzAmczM=;
        b=CtssbRo+8bBY0qOyxckyV4wdXYKR4rxovkgrRYEE/4nRymK5v8KC9OEXHDZQ79R3Eh
         xjPNaFYVIgGgb/3+4pRD7u5Ek3fd7iYLQrRdQMZOrbKi7SLt6om2Rk6Ftl6fRCSFeq5X
         m6V/V+UYKDKHoUlVwaGy9LoO6Rqf52wh7hEXLBl1NmhHRcxIMdAtFgyAHlBsEIjitTAv
         I9hiQmTjngAr4+clb2z3sNlTQXZ1MFqP7UKihaM4AtAlSNs/KpViMMOSQyNIFoVjmgcK
         qKPy4+lYCuMOvgV2vSBYRctQP5vxQtTj3ipQDTGa1BPg2wongocHuF/hc9R/49tuhzK2
         5m1A==
X-Forwarded-Encrypted: i=1; AFNElJ8jjSGfxy5qjHJAXdRgxMO6VhOLeGfHDr+dUIsBk6E6LFuBCHw/N2W6nqYRm7EyTkcX6QOSmBlUAHFryXo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxa+X6+cE4ARUvo09x0QFfGV8J8hCMmxIoPdWNDHku9N3Z/FJx
	H7cILmViTjZPdT+Yat+gQq9g11+cNjSjQo+bAgwiDLfzvLmOE3K9qeqUIWVWjLqzdLwp4A==
X-Received: from dlbpv3.prod.google.com ([2002:a05:7023:903:b0:132:8d92:4d6e])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:69a7:b0:136:e639:9c05
 with SMTP id a92af1059eb24-136e6399e34mr3410554c88.31.1779816570333; Tue, 26
 May 2026 10:29:30 -0700 (PDT)
Date: Tue, 26 May 2026 10:29:23 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526172926.2717929-1-xur@google.com>
Subject: [PATCH v10 0/3] kbuild: distributed build support for Clang ThinLTO
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13340-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.772];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 985095DAB3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rong Xu <xur@google.com>

ChangeLog:

V10:  Fixed a minor build error in v9 and added comments.
V9:  Fixed a minor build error.
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
 Makefile                   | 30 +++++++-------
 arch/Kconfig               | 19 +++++++++
 scripts/Makefile.lib       |  7 ++++
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 179 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: 2c31897a17e55a6da529b4e797e98c6febc60fd2
-- 
2.54.0.746.g67dd491aae-goog

