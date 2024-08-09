Return-Path: <linux-kbuild+bounces-2919-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2594D003
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 14:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 700DC1C219A0
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 12:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421DC193093;
	Fri,  9 Aug 2024 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5BnH0BB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA023398E;
	Fri,  9 Aug 2024 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723206019; cv=none; b=uHdrN54HJz4+TfDxtm7mrCnzjE6NoZZQPR5+uz8LCQsaC0OJ9tI1bAKD8BwCqKeLsYVH7dOJ+fJdkl8pOTzRg85LOUOvFVk/WISYEHmAgNk8u+xL0xne9KfXz9jsuVXYaFdbB52wiR1xUNIZLmqlA4DZHeBaY0Qqo8018+q6BfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723206019; c=relaxed/simple;
	bh=P2DKBdtfYHTCnBXWFSUf26mihAWLJ0wbNQ05PP5AwQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RR88V46kfWmXsck6QOVI3rzw6NU2UiVCwMS69DjMkJ3wghh1PrDzReZgkUEPKx8Mo4Xq4hbMczzXkF51F+opebBOIVRPYHGKgDxf70Cy+j+tBQqE2SOkSgPHI0LEl/Xm42i7aMe/NxJbWmzuOKcI5eVHWl8xijGDttqMyn+yoho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5BnH0BB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4AFC4AF0B;
	Fri,  9 Aug 2024 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723206018;
	bh=P2DKBdtfYHTCnBXWFSUf26mihAWLJ0wbNQ05PP5AwQ8=;
	h=From:To:Cc:Subject:Date:From;
	b=K5BnH0BBk3f2AZ5+Ua/JmspU3NbZtCmxGoxQ4mWhyeAMPz/yDhAsE4DWzm2lwWc3Y
	 1pf9+ggDBC1wjaogVxAoUnJwkf3JftxFlOQ30IKdl4DMT6yp9MIZ/hoXikNFSj/EmT
	 efl6qOD206sTo59HeAqC4xems/S5nnjSkib4hBmPp1Ys0ok3nivHMV41Mw2N97gLCP
	 VNF4/nfacsX+L+xE2UFUfz1DNC307F67foU9/76WpqJu0eCtf7Y2YnRXKRxIzh05dx
	 8I56BMaFU6V2klxymMGw0EeJZmNujKxBsTONGMOtPDnLaeLZrlDUptKXiOjfh/ViNs
	 rdnOVD2YREV9Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Moore <paul@paul-moore.com>,
	linux-security-module@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	selinux@vger.kernel.org
Subject: [PATCH 0/2] selinux: Do not include <linux/*.h> from host programs (+ extra clean-up)
Date: Fri,  9 Aug 2024 21:19:00 +0900
Message-ID: <20240809122007.1220219-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This is a small patch set to refactor selinux Makefile code.
(1/2 is the main motivation here)

1/2 is intended to replace the following shenonigans:
  - [PATCH 02/12] kbuild: add header_install dependency to scripts
  - [PATCH 06/12] selinux/genheaders: include bitsperlong and posix_types headers
  - [PATCH 07/12] selinux/mdp: include bitsperlong and posix_types headers
    https://lore.kernel.org/linux-kbuild/20240807-macos-build-support-v1-7-4cd1ded85694@samsung.com/T/#m1231a27dc83f86c283c4abf480c3d3312955fbb7

2/2 is just an extra work while I am here.



Masahiro Yamada (2):
  selinux: do not include <linux/*.h> headers from host programs
  selinux: move genheaders to security/selinux/

 scripts/remove-stale-files                    |  3 +++
 scripts/selinux/Makefile                      |  2 +-
 scripts/selinux/genheaders/.gitignore         |  2 --
 scripts/selinux/genheaders/Makefile           |  5 -----
 scripts/selinux/mdp/Makefile                  |  2 +-
 scripts/selinux/mdp/mdp.c                     |  4 ----
 security/selinux/.gitignore                   |  1 +
 security/selinux/Makefile                     |  7 +++++--
 .../selinux}/genheaders.c                     |  3 ---
 security/selinux/include/classmap.h           | 19 ++++++++++++-------
 .../selinux/include/initial_sid_to_string.h   |  2 --
 11 files changed, 23 insertions(+), 27 deletions(-)
 delete mode 100644 scripts/selinux/genheaders/.gitignore
 delete mode 100644 scripts/selinux/genheaders/Makefile
 rename {scripts/selinux/genheaders => security/selinux}/genheaders.c (97%)

-- 
2.43.0


