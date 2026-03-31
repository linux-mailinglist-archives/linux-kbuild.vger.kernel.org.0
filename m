Return-Path: <linux-kbuild+bounces-12400-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM/6LsHvy2m5MgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12400-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:01:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B0A36C472
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22D643089E46
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 15:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6294219E2;
	Tue, 31 Mar 2026 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AGSPNlfD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FFA41C31A
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972116; cv=none; b=MuaSFqycMFmmVGfMcDAS2KEJg7Prwt58BEN8kjogTkas0oLkHLZ/w8Fln0aLHDltDEzLWctuI6SON9+vdItYOmF90qCAuqh7EuopTCSU9yfn065Oqrz8Z6SBgr8Bi9nede3uFz1InP1DfqHJdYRm8RkGgbdgtTbfhWdJptjch7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972116; c=relaxed/simple;
	bh=UpKPz3IcNnfUkaxE5x6u5xnlGmGCoHd3YYjcBNDqq2g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=etF19JjtWLJgkgzwKIYZnP7ou6h77P1Ova5P0sEBb6hloyHnyXk/W9MXU90RYt8L99Vh0CdKWxyYa2GbAkuKCLeuQa9TS80HBnLVzHKz7VNTNDyvet4SnCnTSUf5HEb19/02H1CQv8RcCxlL5T0Hl87nyUli1jdKViRdsZTqBEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AGSPNlfD; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-128d0b690feso12304764c88.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 08:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774972111; x=1775576911; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zrYcoA4JUlYO01gPXAFDA8Ve6v7akx2/ICM68YRF2tQ=;
        b=AGSPNlfDDszyjhVH0yqUdvcFoP5iZMhIfIF9MHj7kUBHf6iks3VgNpIU/P7xBBKNAd
         2SAJG/sEtARgn0pJ49Daz7YVuoRkkEBZ/dPVp95cR/zz9yOJ6IuBwHY85tY71dZ5N0MO
         k2CDe1LqYuNMVi6aCC8OtolbQJkrzVwMqGSUwA9O+6Z+HDQud650VkQx7ZdFncBi8ksm
         DfB8xwyc8yHb34tLvF3eDPjQICiOmiF7bMKARFSlQJNJgbPlLl/IGc3ZeNq9AMHlujRM
         uIoiVY6PC2i5RHkW0z3UStRcwOFl33MaVTN5rIx5hpJz39GVoVnudnKJG8e7nHkvdCDr
         kmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972111; x=1775576911;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrYcoA4JUlYO01gPXAFDA8Ve6v7akx2/ICM68YRF2tQ=;
        b=EVQYGJAsh/qme1MKrb7JruweJrV7QZjkf5h8lj7S/3MoIJk0SgmEf+7VEF+LVCXMNL
         vLn5NhAb84DjXYRGkHZptSJvRkx6mIM1pKq/oxzLTgSldrX40db6NXJdLiEAzoT2FmPE
         yb5QY30PQbpvj7KarkmLMpn1YJu5Qm14XVfUhj/z3zzerUVAEod1f+D70vuuNN0Dvos5
         MlgSIBB9dlk5SDCHZm1fLZEtenOmQ5HW+q6RNWoNmwX5ggMRjUzzg1o2uxHJ8RcyDfkm
         YmKwAIhG5pNPHx+w8JpCR6C9YYExqLg1ZgF8BplawCSNBiXw3aR2kDy4YxfTCPsR+5jW
         r6AA==
X-Forwarded-Encrypted: i=1; AJvYcCUGRi/VczxLUQPi1OcrL/KfwBML229RfhoEydxMHLsuew95WkZTiIt96iMiGzFYqwpz1n+pievIcdALU68=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBqEcr466xsuWsJNy00zxrmUK5jxuwb6JxDjcrc4ilAz0F22p3
	v2HKXCyGgkIcp+UVi0Q651WqlFd4IWC9GDT8+rXiCJKF/EJDlgdDWFLZPMWIp5HgBstxKQ==
X-Received: from dlbqj17.prod.google.com ([2002:a05:7022:ec11:b0:12a:7349:f4f6])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2608:b0:12a:796b:7cf1
 with SMTP id a92af1059eb24-12ab28d8cb9mr11052469c88.23.1774972110850; Tue, 31
 Mar 2026 08:48:30 -0700 (PDT)
Date: Tue, 31 Mar 2026 15:48:24 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331154827.2793269-1-xur@google.com>
Subject: [PATCH v9 0/3] kbuild: distributed build support for Clang ThinLTO
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-12400-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 79B0A36C472
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rong Xu <xur@google.com>

ChangeLog:

V9:  Fix minor build error.
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


