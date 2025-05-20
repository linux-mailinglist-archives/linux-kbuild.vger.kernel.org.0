Return-Path: <linux-kbuild+bounces-7159-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A43DEABCEBC
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 07:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 276593BFF09
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 05:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97194258CC5;
	Tue, 20 May 2025 05:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5k4rXbG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FDDA94F;
	Tue, 20 May 2025 05:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747720076; cv=none; b=uFvuTB7bh7hHZ3iILePoa6SCEVgtbfBG7l/G6qO/Dw4IQ2dkT0ed+4+cPYp7aU20yiVq5xfl56L/Qc+m4legEYgrvWUWjAWFbyTXsDeqkMIWS47G1DDCMtCIlNMP7+qzHtJVy41GgXltN4RgmfU7IOMC5qDzjMR/9/8NsryCges=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747720076; c=relaxed/simple;
	bh=cGkO944WICoB6nKSoSYfKOcpvk1XE/JpCHluP26oNPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X9zyML9t8+kSjnKXkRB76XpBEZEOAJ0mH0ZiB+hecu1GiWRQ2rbzSA0cXDZgjXkKUsBFsJh2LoHMEsm+ljJSe7K1swIho4kU5cNFb1JUwO489qwySIBEAMQkykeUPW41DBQkfAVR+o3GAwKZXObBD0YJZuarMp4QPR6ltOlxhMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5k4rXbG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A27C4CEEA;
	Tue, 20 May 2025 05:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747720075;
	bh=cGkO944WICoB6nKSoSYfKOcpvk1XE/JpCHluP26oNPg=;
	h=From:To:Cc:Subject:Date:From;
	b=L5k4rXbGSSK59JGl7RKL8NLhXMnR6PylTxYigWsepeM7GFHK+LOigdmPbT16TIBp7
	 sEOr/CoVaz6snsbuk5Cff2FSIKU0h5ziQpP208RX2I6fo7F6dAXJaTaCDP/BWcgbkI
	 ZpAuBfa1xX4B/nm9Au3/zr0clMSsaGCCyJDFebsBnG1GnhTLLZB8tBepbBKR5fAZmd
	 LdhusfDsy/fXLDx/OSyGBWyQQUIn9K3gJnOKD2vC79ilheFpACUPFUp2+q67XMQ1Y6
	 7rCgxnFCQSSJ57rvyv6tlJZUUFetDMWjwzy8bXcezkplpF5/1iNjE4wHvr2CP+nxtI
	 aG7j48jZ3iTfA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHFpS-000000056IQ-05FV;
	Tue, 20 May 2025 07:47:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	linux-doc@vger.kernel.org,
	Masahiro Yamada <mchehab+huawei@kernel.org>,
	Nathan Chancellor <mchehab+huawei@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] docs: kernel-doc: doesn't suppress error/warnings
Date: Tue, 20 May 2025 07:47:44 +0200
Message-ID: <cover.1747719873.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As discussed at:
   https://lore.kernel.org/all/20250516200350.63be46cd@canb.auug.org.au/

Sphinx logger is set in a way that errors/warnings from kernel-doc are
suppressed, except when V=1.

Finding the root cause is not trivial, as we need to go into the Sphinx
overlays on the top of Python's default logger class. Instead, let's take
the trivial approach: use logger class directly. As we can later revisit
such decision, let's add a comment at the code.

Mauro Carvalho Chehab (1):
  docs: kerneldoc.py: don't use Sphinx logger

 Documentation/sphinx/kerneldoc.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.49.0



