Return-Path: <linux-kbuild+bounces-5707-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC9AA2FFF4
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 02:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18A2418831DF
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 01:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1D93597B;
	Tue, 11 Feb 2025 01:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="TRWPi7RS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f232.google.com (mail-yb1-f232.google.com [209.85.219.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17AB4206B
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Feb 2025 01:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739236322; cv=none; b=oSCqYDHnuXVvQRwOsCG209vvofqFPVYTKxzOxWCP8/caDfvD0leCSoncntIU5Dsg7NPuqkRFnjeTp7XMxR+UpgksWYLT9Ejieg5LdFpNmYgkbx0tqFFohwTf2KRWup57wsnpJmNdNKAFkfFKLG7hKvofJ9qNmeo797wjmw5zFqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739236322; c=relaxed/simple;
	bh=oU9Vjn3evzRPUU1ySr2p52/QBxUL2dgFlJRN4hhi2OA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bvS91EK3Jqj0ACuPz52GChNkOd5JwmLuMOF1KSzqe3DsGrs3KVErWxP1Da6IDtDtffcfZ5IzBnz67p70x0bsmgTOuIL+JIntB569Qeb0T/occozBcDHqT315DTgzNyulHT0Heqmqtvsg1oe1m7FT8q3rvAV7Xbrwmc6MmzWHV+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=TRWPi7RS; arc=none smtp.client-ip=209.85.219.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-yb1-f232.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so4451261276.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Feb 2025 17:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1739236319; x=1739841119; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3iAwoF64/JM2pIwpdGlzRcSNqotxPNvi07pp5nAGXxQ=;
        b=TRWPi7RSYTUYaLIN/vGFb6NOdidXEOdiJc3Fb0cvvxLBvZWm0q2qPG0ydkR4ODC5K0
         aq3o2SrVOs4SDbf0w9pucatFNUZ3QyqFndyLsX56yRr3bNxfE1AAXYRQMqfa5Y3jiZV7
         6BhFnDGRHWo7lcOtmL3pCI+ntToUb2P9gyrwV8thYdIteX636HzygXkbTUDUF08b+RhL
         mnXerdnnwrBtv2VzACZrrikUZEZ/2ZVEw2wRMDW9Jvs/bnj3i3bmC45OPAX8Xj9k0uO1
         O7DXDItWrOJFtApEXLmwxD5OPzFkZWUU7YViRapHGzDtXrJrqL/uDGPYjPf0Mw2Ng4KJ
         MEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739236319; x=1739841119;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iAwoF64/JM2pIwpdGlzRcSNqotxPNvi07pp5nAGXxQ=;
        b=sqBUXW2iLMMHGl+r45BweG5mPNKbzNzA9UVlYTd5vvrgeCXy7ZHyrpLTX+cwZc04xf
         ZX8hyVxsTz3Q0SQD8KeGc6AQHVG1sVbaDWuZYQjI1MIaa8ZREppDH7uOT+Mo36JhcW3D
         T+mUSzoCE3qkefGndri0tMivGREM62V00l7pqXrDKi2a/4vLCKdH2T/KcpNsx3cGp78A
         Mpt5SiKF1yxqq2bS0kt7hguuMD5Vn30gTDjEyr8hfeiXxIYnVRo0CacPixBKy89Ns7Tm
         WLe34FSTTUdXP8lH0Q/KXJhF/0wEm7//0VQRjvKOiMjXl9sWup4DJYL6xQR/LE5Rw/qt
         GQdw==
X-Forwarded-Encrypted: i=1; AJvYcCWo20fnzwUQ0WfIjWOOL0qDzS57dEvvak34+r4/iXg/mFxd6/fSEQP4HxY6TqdNQhGnEX5TzGgLUON7HNo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3cNiLwrcwd7TsXizrbmFiuT9fZFDv6IBl3Rvo5YD3iV8yrMI4
	ywh86Mux7ru/acr2kCFBCENgIZqU5aMXPy4dNDouvypKYwBV2ME3gKPztVg3oK8vxcHCx1ioy+9
	9szyYuB9OZlIAEmRTHx7OaxZSrSNgR24VajEoEgzMLXn6P0ox
X-Gm-Gg: ASbGncsTQ8fmi+Ebbip0Jk5MUbdr/noJJxsgoPVOLlS0jQ6yztpMGXeacQ6HLWg6ZPE
	DSn2Cgj1BCYtVyNz7nvwcGyP/Uaa6VJ2oLm4Mur1Q6B/VFPOcB6Exw/Iq97yn0+xjCqPdggm5dF
	87EjOFJIwm80VH9fVO7n+5O+MhgfZwWyRBhA/uWPtp3ib2aQjlkpzRtmcXWj529k/xtEsP048Ty
	VpKMI+qKSlsOP42pCGrMbE+gYprZW6IeWjCUVqAUumbSk1KbTnpgjaPEBP6+2185LU1HulcPZtp
	hPr52wsS/k2ghFpISoZQnmTz
X-Google-Smtp-Source: AGHT+IHDqPaAL1oOpE9xog6VFP5KqOBuXpBE/UI8ohiqN1xWDezpBCEIb/+T6ncDTp6f/vCO9VGHG3+5hg6a
X-Received: by 2002:a05:6902:1684:b0:e57:6644:ea3f with SMTP id 3f1490d57ef6-e5b4618d4edmr15451390276.15.1739236319502;
        Mon, 10 Feb 2025 17:11:59 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 3f1490d57ef6-e5b42316cf8sm541504276.14.2025.02.10.17.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 17:11:59 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 5DB67340283;
	Mon, 10 Feb 2025 18:11:58 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 61FC0E41340; Mon, 10 Feb 2025 18:11:58 -0700 (MST)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH 0/2] kbuild: rpm-pkg: improve debuggability
Date: Mon, 10 Feb 2025 18:11:53 -0700
Message-Id: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANqjqmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNL3ZTUpNL0zLy0fN3kFOMUSxND88Q0I0MloPqCotS0zAqwWdGxtbU
 AC8nod1sAAAA=
X-Change-ID: 20250209-debuginfo-cd3d9417af21
To: Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

This patch set aims to improve debuggability of kernels packaged using
the rpm-pkg target by producing debuginfo and debugsource RPMs that
contain a full set of debugging information for the kernel. The
preexisting kernel-%{KERNELRELEASE} RPM is also shrunk by moving all
debuginfo out of it into the new debuginfo RPM.

The first patch is just a bit of cleanup to keep rpmbuild happy, and the
second patch contains the main work.

This is technically a v2 for the following patch, but since it's been a
while I didn't mark it as such

https://lore.kernel.org/linux-kbuild/20240910014327.1726214-1-ushankar@purestorage.com/

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Uday Shankar (2):
      scripts: make python shebangs specific about desired version
      kbuild: rpm-pkg: build debuginfo and debugsource RPMs

 scripts/package/kernel.spec       | 31 +++++++++++++++++++++++++++++--
 scripts/package/mkspec            |  3 +++
 scripts/show_delta                |  2 +-
 scripts/tracing/draw_functrace.py |  2 +-
 4 files changed, 34 insertions(+), 4 deletions(-)
---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250209-debuginfo-cd3d9417af21

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>


