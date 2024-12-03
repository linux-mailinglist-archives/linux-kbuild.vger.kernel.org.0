Return-Path: <linux-kbuild+bounces-4955-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31A79E1919
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 11:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 965E216027C
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 10:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DEC1E1A1D;
	Tue,  3 Dec 2024 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIAU130u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF91E1328;
	Tue,  3 Dec 2024 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733221299; cv=none; b=ZW+ZLfGR2MgnJzEJeZl5OB8fp2REkXZLBCtxlZVjVW+D6SW4dnVobL38p5Qij3+/4wU4ajfYJ0kC9TWr7xZ/1miJ+SZmyey06gdsRUPL7vbboa8fc2nszR6IFeZLr3L4rsDfj5qns4eLjssOR/8sFW03CuwNQWyp9YQ/4Y83B1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733221299; c=relaxed/simple;
	bh=HmexDTAhTdzA3gtIV5BlHnrmZ5pLGG7UdipNPwMrR40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PS1MmLE1Y58Q7QVGQNt+KzFUogdGeZ/qNsyApmXj4f3Z4hBmVKiGWEXnCX7DSHBVCWajf/uHjZFYXkzJo0+s5WazNl2cpYErvkVwLNcAovSSV4frvAzI33VnMXecU+dnLtBzPYYudZw1x8ruHbCqbLIgHMsYTiI0toN4Usx3nN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIAU130u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812CEC4CEDE;
	Tue,  3 Dec 2024 10:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733221299;
	bh=HmexDTAhTdzA3gtIV5BlHnrmZ5pLGG7UdipNPwMrR40=;
	h=From:To:Cc:Subject:Date:From;
	b=kIAU130us2FZIXRhquh2Gm//mz2L2lNatI0AtVVRpXHFuDj9Uq2tt6u+b2FWSelRX
	 0nmwVgvFIe+Q88B236IoylgU7Um1hCweNGn/t092YnfqbaIlxj+Wq8YmQM4nx2BlRt
	 jRqLKDrbkQMIfkn2w1Xa2dFfciEgNXukHg+iI3E4H2pU/7H5kQMV4ZFsYBz4J2WuFf
	 +oJT4fMyIkbXXJ4h/yGebwoauUNkR3xwP3DowCGdK2en31xwiftJr+VqBQzalL/i4/
	 65ZGuUkEgwosGC+0DqlyVpafSNlbLziAyRc/sP0jlVyGyPDnu2DpNuBh5cpjr6kTsV
	 ba9yuc1c9ytbw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Matthias Maennich <maennich@google.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 0/3] module: fixups after module namespace conversion
Date: Tue,  3 Dec 2024 19:21:04 +0900
Message-ID: <20241203102124.3147478-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


[1/3]
Commit cdd30ebb1b9f added double-quotes to enclose the variable in the
semantic patch, scripts/coccinelle/misc/add_namespace.cocci.
Since then, 'make nsdepds' always changes the missing import to silly code:
   MODULE_IMPORT_NS("ns");

[2/3]
MODULE_IMPORT_NS("") is misleading in the context of documentation
about MODULE_IMPORT_NS() tags in general.

[3/3]
Convert DEFAULT_SYMBOL_NAMESPACE from a macro expansion to a string
literal. There is no good reason to keep inconsistency in the default
case.



Masahiro Yamada (3):
  scripts/nsdeps: get 'make nsdeps' working again
  doc: module: revert misconversions for MODULE_IMPORT_NS()
  module: Convert default symbol namespace to string literal

 Documentation/core-api/symbol-namespaces.rst              | 8 ++++----
 .../translations/it_IT/core-api/symbol-namespaces.rst     | 8 ++++----
 .../translations/zh_CN/core-api/symbol-namespaces.rst     | 8 ++++----
 drivers/cdx/Makefile                                      | 2 +-
 drivers/crypto/intel/iaa/Makefile                         | 2 +-
 drivers/crypto/intel/qat/qat_common/Makefile              | 2 +-
 drivers/dma/idxd/Makefile                                 | 2 +-
 drivers/gpio/gpio-idio-16.c                               | 2 +-
 drivers/hwmon/nct6775-core.c                              | 2 +-
 drivers/i2c/busses/i2c-designware-common.c                | 2 +-
 drivers/i2c/busses/i2c-designware-master.c                | 2 +-
 drivers/i2c/busses/i2c-designware-slave.c                 | 2 +-
 drivers/pwm/core.c                                        | 2 +-
 drivers/pwm/pwm-dwc-core.c                                | 2 +-
 drivers/pwm/pwm-lpss.c                                    | 2 +-
 drivers/tty/serial/sc16is7xx.c                            | 2 +-
 drivers/usb/storage/Makefile                              | 2 +-
 include/linux/export.h                                    | 2 +-
 scripts/coccinelle/misc/add_namespace.cocci               | 4 ++--
 scripts/nsdeps                                            | 2 +-
 20 files changed, 30 insertions(+), 30 deletions(-)

-- 
2.43.0


