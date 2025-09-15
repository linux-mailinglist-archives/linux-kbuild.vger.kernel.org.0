Return-Path: <linux-kbuild+bounces-8822-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 121E7B57964
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Sep 2025 13:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10795201F30
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Sep 2025 11:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B16830103D;
	Mon, 15 Sep 2025 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="HDz1Zwdc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [178.154.239.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBCC301465;
	Mon, 15 Sep 2025 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757937212; cv=none; b=h9lMRSzv6qAyycNJdmT/vKJ38ffa8jQ5l0vjHwvYvZMd7tjOvqjljnRbbp5MV0T9GAjfoDy7CYDtDplkcgi+cv4PbE8J2U/yNCr/AdRzphha522ENI/++ljwxWVR+DrJX5Zwb8Z1Hm+MeeEiiGJbTn0JV5d66fwoJ2tjebj2mqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757937212; c=relaxed/simple;
	bh=rw6JMwmCQedtBTQUSJzpJoxXe+FRZMS4boJtWfoG3rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LTKKEhtAOYwYSX3FLYXm96gak1Go93QxK+Jer453U2H3++193K7xJeTNSQ+uGa9pwgNRA8Dg8ZoYznMlVcbtdIYFbUFrzdu0kJMFTW7pzVhC1Xh1f1xbgT3an6tJwr1cgUI2vsUlclYFQkKZUzSPTbSsw5c7MVjxLCDaStPUMOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=HDz1Zwdc; arc=none smtp.client-ip=178.154.239.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:b002:0:640:910e:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id 2ECE2C006B;
	Mon, 15 Sep 2025 14:53:21 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id CrNrXmiMGa60-GXxRK6ue;
	Mon, 15 Sep 2025 14:53:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1757937200;
	bh=njiMJmDEfszF6H1476FNLp3VYoDINigreEW0u2XI6sc=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=HDz1ZwdcNVKPFGniPy1YUbvpKSMX82HQcsud4r1NUGKJBkj7MpMfK7IqCbMwNHOd0
	 MBhPYP9xGfc46JO4WzWJSocUtv2ySn3nYUAW2DD1OxcI/ptWwQWYfaENT+8UuaDIy/
	 4oNvqBHM23gg3RkyQPenNUUBuPiD184Gl9QDOEAA=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	masahiroy@kernel.org,
	aliceryhl@google.com,
	thomas.weissschuh@linutronix.de,
	tamird@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 0/1] rust: add `rustcheck` make target for check-only builds
Date: Mon, 15 Sep 2025 14:53:10 +0300
Message-ID: <20250915115311.3025-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v2:
  - Couple of indentation fixes in rust/Makefile.

Onur Özkan (1):
  rust: add `rustcheck` make target for check-only builds

 Makefile      |  7 +++++
 rust/Makefile | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

-- 
2.51.0


