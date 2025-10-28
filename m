Return-Path: <linux-kbuild+bounces-9298-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F39A0C167CE
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 19:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE1803B3E49
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 18:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE0B34DB59;
	Tue, 28 Oct 2025 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QVqNRb2t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f74.google.com (mail-yx1-f74.google.com [74.125.224.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34002D0611
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Oct 2025 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761676110; cv=none; b=SA8TUgKYUHDB+1zQVimZSlgx+i3HDzrLak7QwEwNV2jnVPhSes2NW0bsgFkD3zcjnoRr7xNJWIap1tyi5Nog6SG8KjC56RCIuIqzaE48PPHsGt/pARNCqP2tK5hLILX/AzIAUwBsBfe6ngMtuQiKWvodhAtdx6I/atDVrR81SSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761676110; c=relaxed/simple;
	bh=fX7XbLSp971rMTg0UpwRdyUHxI4708ybuHhCpWAllo8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bFBhsUrl0y55VYYU3fEdAhPAUi8ouTUiJ8Nxp1EKLibz9xwldm/VGQG+k/kSDJVQP8jo4TidguA5rqAcxKWDEuRxveVIpH5wPahct+LK2vjMRPQ4xRhRfumF9ZhzlqmiVyMlDoxHIEuOOl71GlaHAj4KIJEoFa0Sb7REiT8sOaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QVqNRb2t; arc=none smtp.client-ip=74.125.224.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yx1-f74.google.com with SMTP id 956f58d0204a3-63d34257de6so7405536d50.1
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Oct 2025 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761676108; x=1762280908; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J/B5eNcHD/N3E3+kFhoRC2kLmuGEBa6rnxq3ZrWjw6Q=;
        b=QVqNRb2tffJLZ+8SRCvfiosa5+FYEvqOtdhvAuwhMFCJUlAwRbuvce3nxWfSMyyMqA
         fvoMtY/U4/VqtlilhD5F0++IWbxXddnrQIa2n3M9xI31fHtZ81iH9sq9OUDwkDz+4m9a
         mVHveltL8nbGnn4pj8BIt0O8/wCbkl0bhc7uo6RLuEvq796kfPmzbYTEfcAGRCnUS+2Y
         VDEvFmKFoS9rcEbQLGVABsj4JL/ZV2RQ14We7YjQcb67KOFq4macUpvohNcZbT54m5DC
         3+h65ACSNoRH5YfYRJiusrQgr3Gn1W3hH1W/Oxyy0ObjcaTa359IA66APB5H/7/IilE8
         rULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761676108; x=1762280908;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/B5eNcHD/N3E3+kFhoRC2kLmuGEBa6rnxq3ZrWjw6Q=;
        b=rQ2MoJ17JtMd7DP/+UP7ivuK7700AV7OLbodLauGoc1daJd5a5OeqRjOqLRjEvudPf
         J0l1nkx3tQPweTVKTYAOtOsVwhUSkyGPeSZVkm/zu7xBqctI2inRS3wLsZRl9hMdXclR
         fZ8KqjUbjw9CEKUX7G8+refyrioisDSWpGwHuHqOnoCZp5fkGmt6AKzMdNRMwECibpGr
         9lCdSVTQIH7yao1xGn73ckclHUj89GayxS3N8TOK4Ohvd47U1qN3sVNExTlGfrrCWFDh
         8DhShKEIdqvI6T3Vvzcv4VPGTD/pQPq6nKxfrnf6f68tj8GN/0nOKgqLz/SkTpSN2ZTp
         Yp3w==
X-Forwarded-Encrypted: i=1; AJvYcCWjsRLbqRCJNfxFMJ7jAZI4owj3CCXepHclkty0fu+tU3bem4nwCEglixTSiHa25mqr3bAjYVZA6FleWRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyRGmB+ltWxK6nYpFZI5fYEA5CO4gWkiAuadqx1Av3Vhkx4XDw
	ICr5OQHz1iug2/o2QO0zIy1sUrGuoO1jQS8hmAQliQU8Uh3WL8HChqMjBMHErATUZhQ5dQ==
X-Google-Smtp-Source: AGHT+IHKgweEeaLJqEq+LQTEeKUy21GxhN+HXb+lwE/+WPniFQggWEwGckSmcOi3srPPaBPmXdnrZsY=
X-Received: from ybsa8.prod.google.com ([2002:a5b:ec8:0:b0:eb6:c177:51d8])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:9985:b0:784:a119:e71b
 with SMTP id 00721157ae682-78628f87d9cmr2297817b3.42.1761676107702; Tue, 28
 Oct 2025 11:28:27 -0700 (PDT)
Date: Tue, 28 Oct 2025 18:28:20 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251028182822.3210436-1-xur@google.com>
Subject: [PATCH v5 0/2] kbuild: distributed build support for Clang ThinLTO
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
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

ChangeLog:

V5: Handle single quote escaping in echo _c_flags to fix
    Piotr Gorski's reported error.

V4: This is based on the reimplementation provided by Masahiro Yamada
on May 26. The difference is that this version now saves the compiler
flags (_c_flags) from the Front-End (FE) compilation and re-uses them
for the subsequent Back-End (BE) compilation.
 
Rong Xu (2):
  kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
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


base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
-- 
2.51.1.851.g4ebd6896fd-goog


