Return-Path: <linux-kbuild+bounces-13394-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDYqMSKqGGpolwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13394-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 22:48:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 899705F9970
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 22:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D7AD3133F52
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 20:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9919232AAD6;
	Thu, 28 May 2026 20:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gxCz1E+N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7FD2EF652
	for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 20:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000749; cv=none; b=gH8/rherdBhtyzVDIoAvQOrgUxSw5SBeMYR679s+gKKiDc5utSmVK9vmyJBEsBoqlXWfv56brsyG/QTcjaluoatL81OHpQqyl0Fuzn1QdutobVWCXy//zktqd+iTUv+cOrK2xXyDnv6p5WdVU/yhp8vSaW41c/nhd3fuOz3yKCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000749; c=relaxed/simple;
	bh=VPtm4KyGA2rNPcyT372mZgGPQ6VKzDlSiQWaFrEG3/8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BFC/Ww91MzUTf9yrfZXI4gvTGzVfIwhlMe7jG7bgNDpY3EQnkc3HuVFnGkxOz3sVF3xnA03KdymBj3DQf9OXxOplkEsU78DGUtMaXS2j2EtgvvgDT+64eEc/P1FsiKlTZVktQAGUB3ykTgDxYbb1M10tcBoVRk+QIM+LxU6ys4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gxCz1E+N; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1365060ac82so5511190c88.1
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780000747; x=1780605547; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oimbIklD2oW7RQ9Kb+qSzXj17yQYOv/MDfmOJ3+h/TE=;
        b=gxCz1E+NWVKqEOwW//9vZ90Derrizy/TvJqyDdacNbu8m1SsmKbcmRSOrslLMsdUme
         hU/UXaxrmYmv6VvulRkH/luT51zex166WfNFIQpOpTn4t9xoTxVudwuig64ROBMjVJO+
         zXnITrpgWtFtraF2jSaoJfj9HIB59+NZrxofE5J2a2RoJhhYC7YIlVC7Ez97X6i7ZYss
         NWtR+2lXj4vKgi2V7g2JOdo1DHgIsg77MIBbwTaANqwe7PEKgXQbQy5fRX4aeVmvg4/v
         JnX3YwG8pm4J4qno9jJeoIykx15AACi4uHek23omUDtoneAvzbpoSVlnDkM1mlv+TaVj
         7o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780000747; x=1780605547;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oimbIklD2oW7RQ9Kb+qSzXj17yQYOv/MDfmOJ3+h/TE=;
        b=LXBtH2IVSeobuCLiyCczbB0x89+sitfUYQ/wZRKS//SbTuW70ZTTfSvUOshLWdi7BP
         JcceBiikCUfewwVRFs01Ku/EB/dsqAxfm3aEgC6zEpW0Z9+WZJwPrjY3155pnGm6Y129
         3TI3xb82tvu4dhfS3DcQA2Wvf8G4dBJbGSB0g91yKJMXLO3EXCVQgZR56UptFL1T8zOn
         BUmfrZLast6hIEM4V77EWpLwY6zd5ObooADCHYlL7zrfltJz+9DRfT6sgjJAROM9OYZW
         HK1GJ6hTheREBQ/9lFP+2jcYSnsXBMJlqGlj5pGkt5rHoJEVIArQyvWSmgsaBxGBJP4J
         5ztw==
X-Forwarded-Encrypted: i=1; AFNElJ9OjyuVqLVkkqQOpuNnoTXCoXHzpqlCkXoUizhkl0GrWsjS9iRlHhpqp/b7syv5KewlJ5Pspo6dgkFkEgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsuuXKq6EpVbuIZrGdWdoa3sSTMSIoOm2WefNloI62xHL5YvMF
	CsR19c8PebSwwfmcSDG71rJA2iStS/Nqolou8rnXNIsDYc3DHUnqZAp9fzV3VinQxwI70g==
X-Received: from dlbvs1.prod.google.com ([2002:a05:7022:3f01:b0:135:1edf:c813])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:250e:b0:12d:31cb:b806
 with SMTP id a92af1059eb24-137ac20c3abmr88958c88.26.1780000747087; Thu, 28
 May 2026 13:39:07 -0700 (PDT)
Date: Thu, 28 May 2026 13:39:02 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260528203905.687687-1-xur@google.com>
Subject: [PATCH v11 0/3] kbuild: distributed build support for Clang ThinLTO
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13394-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 899705F9970
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rong Xu <xur@google.com>

ChangeLog:

V11: Integrated feedback from Sashiko (Nathan Chancellor):
     (1) Included modkern_cflags within the saved _c_flags.
     (2) Replaced the shell command with $(saved_c_flags_$(<)).
     (3) Refined the file matching for ar_vmlinux.a.
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
 scripts/Makefile.lib       |  8 ++++
 scripts/Makefile.thinlto   | 41 +++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 181 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: 2c31897a17e55a6da529b4e797e98c6febc60fd2
-- 
2.54.0.823.g6e5bcc1fc9-goog


