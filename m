Return-Path: <linux-kbuild+bounces-7188-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8A5ABEC79
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 08:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54DA93BF8CE
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 06:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6A32356A9;
	Wed, 21 May 2025 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mE0FMeF/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5773C23372E;
	Wed, 21 May 2025 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810268; cv=none; b=kiq/QEbGvhicIbH92VeovgF7nuusIWFudXE74i2r13A/484xvF8NH2jPZkhoESbdVThYLQUAWt74HuzvFOQU7JiTxd8gpLm1iqZryXMQp6pOAtXDqH0GzOXwto1t79p4jZiFfWOoDsdVz1QEW8STkbF0nZe8qfVflJipJ9Y8SU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810268; c=relaxed/simple;
	bh=4ADat4IQ5an+qDRoLocRLtrya7ApemL7FrI5ZBw7Jqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1nCB0O9GBxiaxi21NsBZNcwNpGmrV6+kDb4Mi25vcgLhyGN8Hc9rL8lkMk2Da7/XayK4Q0OKWF0uw1mbCivf60qlD8VaZZG3KQBlpedfnTgO9Ag1ubZFQGpuz2Tn1HDirtTyTIKENUr4q5V7IyqCxAlyXzPJLSa0KjRRMBq1p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mE0FMeF/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0CEC4CEED;
	Wed, 21 May 2025 06:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747810268;
	bh=4ADat4IQ5an+qDRoLocRLtrya7ApemL7FrI5ZBw7Jqo=;
	h=From:To:Cc:Subject:Date:From;
	b=mE0FMeF/Ec1M9vDUlmJ99R4PG+HkggV9QNZ9q8bZxtvZigJn8P+Ltrq8FGOtbvGgI
	 5k5ST7Df+7Jz8iMGJqV2EfEFdyqupmqcbgHfQemMFOicC5j9pQqvqSW8vyalTG57bh
	 1VbQ6K04C/x9Rc+iVyQDPcoOsVGymTBIX0HTdrhouFnrYyqm9YtPFGRIExd9/EN/LT
	 bDGuYrYd5IvFVR2uPhKGvzk87uvqkQuD3RX1Pzs35JjSlrLDG2A/1ofG02IgF4UUEu
	 3OjD+jKrGKraEvBV9PtKrsEO6Z+1evAUutRnlOLVlImZFfwuWViu1JetEJgiEupgGo
	 xeCfNP5gxwwCg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHdI9-00000006HuB-3dFG;
	Wed, 21 May 2025 08:51:05 +0200
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
Subject: [PATCH v2 0/1] Some kernel-doc fixes
Date: Wed, 21 May 2025 08:50:25 +0200
Message-ID: <cover.1747809627.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

That's the second version of the kernel-doc fixup patch series.

I discovered the root cause why Sphinx logger was not working: there
was a call there for logger.verbose(). According with:

	https://www.sphinx-doc.org/en/master/extdev/logging.html

This is a valid call, but it doesn't verbose messages. Instead, it is
crashing with modern Sphinx versions, causing the log to not work.

I got rid of it, replacing by logger.info().  I took the time to also
address an issue pointed by Andy: not having the same log message
placed everywhere. With such change, we can keep using Sphinx
logger (which produces colored messages) inside kernel-doc
classes.

With that, we have:

Patch 1:	cleanup try/except logic and get rid of logger.verbose();
Patch 2:	fix a KeyError when trying to acess data from non-existing files;
Patch 3:	makes Lore and kernel-doc ML receive patches related
	to kernel-doc.py and get_abi.py.

If you test just patch 1 on the top of next-20250516, you'll see the
keyerror message (in red):

	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
	WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno -export ./drivers/gpio/gpiolib-acpi.c' processing failed with: KeyError('./drivers/gpio/gpiolib-acpi.c')

And the script doesn't crash anymore. After patch 2, the try/except
warning gets replaced by a proper message:

	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
	WARNING: No kernel-doc for file ./drivers/gpio/gpiolib-acpi.c

Please apply it to solve the issues that are reported by Stephen and Akira.

Regards,
Mauro

Mauro Carvalho Chehab (1):
  MAINTAINERS: update linux-doc entry to cover new Python scripts

 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.49.0



