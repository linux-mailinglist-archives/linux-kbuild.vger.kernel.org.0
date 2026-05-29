Return-Path: <linux-kbuild+bounces-13412-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAlgCq7jGWpmzggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13412-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 21:06:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DF9607B14
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 21:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 955E730DA091
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 18:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF413921E9;
	Fri, 29 May 2026 18:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qx3CuErx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6954219FE
	for <linux-kbuild@vger.kernel.org>; Fri, 29 May 2026 18:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780080836; cv=none; b=dmTz/aqF8M7EW123OfoZ9iYNr19llnjFaxXV9vQO/YN2VHkIYAS7GaNnuKycZKZpX9TUDj1r2d7as518HyPf9S6XamJkD+FQ5rM8EmtqxVOqhP1cXB69xlETJxssaobJIo60qqcvEr/1kpcJZHjHDrqOLz0L8IWeXB/Q2+jjc7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780080836; c=relaxed/simple;
	bh=/lNacLdW9sEOoTS/HBDmtkyIRf4qRh3MXKPb+7r4ATI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CrpHkhAWyctgz3BkJRvUBgO4RCjbHgUWjUt0wJyAFT0RBLDDsy/FMIz9RnDB+aug5oSl2UzO0qVqz/YFSrkmBqiXy4dPLLbCqLrZqIJZO21XQghgI1ypLorBA0FuqxmhZeTiqTRejMd2Rb+fYEvudZOzJQCVTJtzllndMeL5NuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qx3CuErx; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-304ee7d1368so775775eec.0
        for <linux-kbuild@vger.kernel.org>; Fri, 29 May 2026 11:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780080830; x=1780685630; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=81SwLsYV+fPUwbYdTwTcJ7io6v2ZR/O+UY0W6GoVbVk=;
        b=qx3CuErx9L9OsiXJ8CZc3sHsPyqI7CFMtdxuk5M213/1WzNXPY+6w8kDe36L5B7ieY
         fjsemuHDmKijqq1a48tOcz/OCNbEXVUPQ1/Nqi9VSsRLVRqfJWFMQDuUllqfwzMeg9sX
         e2MeDTCb6v0B734vWYQTOKFIqcTNg3DrfmgLkaF50UgUHmvOxVsUfF42ySVAIoTW0HSJ
         uNuK7fRiZFNDbwld+HBqcSA4eEkAHkIwCT9Y42Rolur5btKJe3ZtsaR928B8kyWWSirE
         wrHFWu5g++SxEwTHhfsLlol+H6BpveDVAUh6nmJKvTQfJp+DlAFCBLR/AUwcaP4tKi0j
         /33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780080830; x=1780685630;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81SwLsYV+fPUwbYdTwTcJ7io6v2ZR/O+UY0W6GoVbVk=;
        b=lbrOcs8OtG5+4xEjz8IHHa4a44EbsjuCSGN1vN6K7QuK3gWN5/dm0aol+y9ehIes0z
         dbOlwoBUqv1y86ND3QxLg2J2rfvDUfb2EtPeKF0yoREkWn6XTkBKBhQPtz1mkWgqq5Co
         CTLxRiUP6PSwATxxkqhGA9kn/YcsdaFIrhrpZ01NGSRmduhgX/gUJsbMye3tdKslKAfw
         Uzt5DeJcssC3qd9pXMAGSWO7EhBgNuoiQiq+esqRtn/XEanxDU/Jz3fGwBuJjqG0JVcl
         5FbRAmQa77ETsW8/vciYCHns4KesAFhcUoK/zgsrfTB9HLQ7Q2C1U3jbVsyBR+yD5ILC
         zAMg==
X-Forwarded-Encrypted: i=1; AFNElJ9qryXJpGYWRz+mtEuxSmtx+0cRkDHjQKG9J0x/hPnF7PVg8ZRMB6WQkyNqcG6w3aEv4hBSaVBjmGsPj4U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6RCDIC47FfG7VjyQJZtLqeXuAW7JFltXLU1W+JpsD5b3yf3QL
	sgEa2TJYNFecGeCqsbPpUh873JXGBdg3nP7EB2W72kkhadkl4ZSThhUx4kUzMPOKujntTQ==
X-Received: from dlbcf5.prod.google.com ([2002:a05:7022:4585:b0:136:8b77:210a])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f96:b0:136:5c88:d928
 with SMTP id a92af1059eb24-137d426d0e5mr388314c88.19.1780080829713; Fri, 29
 May 2026 11:53:49 -0700 (PDT)
Date: Fri, 29 May 2026 11:53:43 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529185347.2418373-1-xur@google.com>
Subject: [PATCH v12 0/3] kbuild: distributed build support for Clang ThinLTO
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-13412-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C0DF9607B14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rong Xu <xur@google.com>

ChangeLog:

V12: Fixed an build error reported by Nathan Chancellor:
     Reverted to v10 shell script based approach to get saved_c_flags.
V11: Integrated feedback from Sashiko (Nathan Chancellor):
     (1) Included modkern_cflags within the saved _c_flags.
     (2) Replaced the shell command with $(saved_c_flags_$(<)).
     (3) Refined the file matching for ar_vmlinux.a.
V10: Fixed a minor build error in v9 and added comments.
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
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 180 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: 2c31897a17e55a6da529b4e797e98c6febc60fd2
-- 
2.54.0.823.g6e5bcc1fc9-goog


