Return-Path: <linux-kbuild+bounces-8455-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FA5B2627D
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 12:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E126A26C85
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 10:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CC130D078;
	Thu, 14 Aug 2025 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nJqykU0N";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bMlnfvLf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7AA30C90D;
	Thu, 14 Aug 2025 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755166503; cv=none; b=DuTsFQ3DynANgxNrvPTph7KQamn/gLjLx3iGsK/W170FklZlygQ/NXepoTQjwKaUlZxibwi/JiHBGvzNXFgRyXj8zhtBS07kDuui5E9S8GdRe0I3CkYwCI44eIEZ8aWDh+VSUDohtYCGP8YocS588/r5VQFBenCu4xm012Vu4MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755166503; c=relaxed/simple;
	bh=p3sbqLdX8LT8DFirSBwzRa/TCL6qe+PJUwAWYSbA0ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lstcf9xwCu4C4RjWgNvNM1U42ZBlEjWiLbV/fKNK1Su1xiaNaHCoPnc6WpC43R+99oul0ryVSvkekhl2uumiofCEzHeyBY3MTGw/g9x0SyLamA/RQ1ftdaEvURlgZ0h25QSBD5vU+JDjmvZzMeY19+1c6Tu/KOrOlx/6h3W0u8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nJqykU0N; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bMlnfvLf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755166498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lCEDx2mv0kXmPcReBsWibYDiujq1S+i3BlZP/SBf9yY=;
	b=nJqykU0NKwKtaw4aAiigeiBiooDTM8r4OSQWW7+UDlQQgCB+qrieEzrObdtWcnAxOWOnzm
	1dmltkLvY464qqmotnkKYsFX/epn9nJtzbTcxQssf3dmqF1lSX5/ASOO3/fuPSF7Vg5x4A
	pEVFryUK0FUagAzzCju4Pyj24RQ+Iq0132cxvxSplfTkPB8T2mOy3bY2eVkHUUFfdn61AQ
	sBYLmeWjtCKkTWIYQFUthKxWvVOJyaamFCPquQ8iZRYu6dT+9Vs3aFHcEawSRKYn7OWDp3
	I3E4Rt5eff/tCCSn+fkLLjiQWU97aySVIQ9xcfpsxmVVW7MYiHmE/wN1Z1JF0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755166498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lCEDx2mv0kXmPcReBsWibYDiujq1S+i3BlZP/SBf9yY=;
	b=bMlnfvLf2knfO7lJepTPtsLqCX5ToeN4qMVZu3D2mIwCpf3dMB9XJCsGS8IyvM9+ZJcd56
	RPfH3uMK6OHzuzCQ==
Date: Thu, 14 Aug 2025 12:14:45 +0200
Subject: [PATCH v2 5/6] kbuild: respect CONFIG_WERROR for userprogs
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250814-kbuild-werror-v2-5-c01e596309d2@linutronix.de>
References: <20250814-kbuild-werror-v2-0-c01e596309d2@linutronix.de>
In-Reply-To: <20250814-kbuild-werror-v2-0-c01e596309d2@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755166493; l=854;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=p3sbqLdX8LT8DFirSBwzRa/TCL6qe+PJUwAWYSbA0ho=;
 b=FvGHxXjdXHnR/eOlc7JFvvKM0LrvW1vPyxl7GCynxlDgnbKS8FgoCNPb+xgJMurTBwW7qdydg
 aDST0WpYj7sDEK/NWvX5RzMEHmkvNY3qxxNDMkefoxPF5OpZMzQ6OCu
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The userprogs compiler and linker do not share the regular compiler flags.

Make sure they also fail on warnings with CONFIG_WERROR and W=e.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 scripts/Makefile.extrawarn | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 6efb9e5eeeed0696a061a17e029a92caba50826f..96ff3f5582d651f0016c8ccd49d46022cc6fe070 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -219,6 +219,8 @@ ifneq ($(findstring e, $(KBUILD_EXTRA_WARN))$(CONFIG_WERROR),)
 KBUILD_CPPFLAGS		+= -Werror
 KBUILD_AFLAGS		+= -Wa,--fatal-warnings
 KBUILD_LDFLAGS		+= --fatal-warnings
+KBUILD_USERCFLAGS	+= -Werror
+KBUILD_USERLDFLAGS	+= -Wl,--fatal-warnings
 KBUILD_RUSTFLAGS	+= -Dwarnings
 
 endif

-- 
2.50.1


