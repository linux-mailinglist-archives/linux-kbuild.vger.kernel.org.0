Return-Path: <linux-kbuild+bounces-12324-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGUAKs4sx2nlTwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12324-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 02:20:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA6734CE02
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 02:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF7143038522
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 01:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D4332D452;
	Sat, 28 Mar 2026 01:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o/8UFSyE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7DD322C67
	for <linux-kbuild@vger.kernel.org>; Sat, 28 Mar 2026 01:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774660775; cv=none; b=A6rhyVu5ph9j3Jnb4cT5rhy0y3GqePiA00kCiuqg+d6a/w6QGyQfy2OFrIXxKVw6GnzydkCab3FpxzvTGO9MSwWaNIHYqAOhAbYTTy8D9gmdQKRWBOehfiTcyksO5bkNIiaDqeERe1U1Ly+nwmv2SM/L1CKnDcH68GxMBZBcWpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774660775; c=relaxed/simple;
	bh=HDqV0Py005zQIsbLeQfUi8Qe3O2XbyV3pJb2YvqFjZ8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lxrcEzW8Uqe4+nzMpsY+96ru2TPAnrrvNRK48YB/9GGh/0YaXK6YZzX0//sMbmE82H4MjMQ+x2GozsJbaeoBZjj4Hmuun930IWOyF8Gr1bghrMktpnqpRBS0gp+8JXKwyBs6XByDrAqOp/sn670xgWrJ4ij4VQAPFtowlL+GhXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o/8UFSyE; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2c17c6b6711so819713eec.1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 18:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774660771; x=1775265571; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Y8qoX2i2pgK07/S9R6C/ITZShbzZ0BOZvH25QidFt8=;
        b=o/8UFSyEi3MgmsVaGIFkcKF9Xb624CDp/Bg3DWhpbSxRFxmA1Xwsir8GpZ9lNCci5z
         1clkpPKFXUTNebADFcrWTfeULasQEzC+UtsEGvlrKuRIQ5HABTXKTCDeDrwsS1qR1S2o
         +TEXaPtqTguMwfpEk263IHGFDPChy6iPgk294MemmFYGSfa16U3kuARcn3cBwFjtEdCu
         uyz6Ha6YaQgvRuNivZ/Upcgqh2DNWonFGj5pZywm3YRZfW+Tkr9awymm8CPlx7p2V3MV
         9o5+MUKEcMw/0YQMuJcXbwNmmHoq55l+ZwlGHIJXTiatgXrAaKVzWYeFMh17RaF1iJC7
         cT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774660771; x=1775265571;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Y8qoX2i2pgK07/S9R6C/ITZShbzZ0BOZvH25QidFt8=;
        b=HHuJAlfdRSxkQmPLEjLs4roHX0T2Y7oCwCfBB5efEZH/8R18tqDPMde5IwcBb9PYqS
         ga8i/0ovbKdzZnP9ik9gRi1EELvYtptcJpEU8GWVlua8xVpV1MrpYIw+viqPy/faKw4x
         UKTK3tctSCryebZ/EL9yr2DVIV6iEne0BmDvDMpEalTtbBKyUL2eoInSvaM4duYRktSo
         WmzhGbutBZJvcNcj7EmGkOShhxJJtSV89sKf8q5TSlqo8AvefavGg4GSR1OKxa07ymdM
         6C3e/usO20FZvOo+/gRWC/I3oZ5Bocz69fHcF/30iFjK0ny9dBVbB2Na0KKDDC1qNOi8
         Flow==
X-Forwarded-Encrypted: i=1; AJvYcCW8JJJZYWRwpZHz1oNLg42lEOW4Zz1bk5WRL2i6WcAsTmnslgQrPslazZCiQn3jw1uDinbv8GGV9b0lerA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUHpUDhAsJbKHs9oog8Q9YhMCSfI7A4g6np1o6E0zpVPFHd0Mc
	ctVJiquTlnlxxg8oExl5aHqcOoqIb/d3/HBD8dOnb0ofiHpIRVRH7cWcOxRBuP+gmKck7Q==
X-Received: from dlbsj11.prod.google.com ([2002:a05:7022:f90b:b0:128:dfaf:10ac])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:670d:b0:128:cdb7:76e1
 with SMTP id a92af1059eb24-12ab3029ebfmr1892234c88.13.1774660770853; Fri, 27
 Mar 2026 18:19:30 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:19:24 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260328011927.3569802-1-xur@google.com>
Subject: [PATCH v7 0/3] kbuild: distributed build support for Clang ThinLTO
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12324-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0FA6734CE02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rong Xu <xur@google.com>

ChangeLog:

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
 Makefile                   | 25 +++++-------
 arch/Kconfig               | 19 +++++++++
 scripts/Makefile.lib       |  7 ++++
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 174 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: dcc99abebfa1e9ca70f8af8695b6682ad7597bf2
-- 
2.53.0.1018.g2bb0e51243-goog


