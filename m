Return-Path: <linux-kbuild+bounces-10677-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DFFD3A7E0
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 13:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27A393006623
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 12:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B693596E4;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVqG8f98"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0915314A62;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824317; cv=none; b=h9sbVghiISGRf2QTFDrlKQ41Lpnk+IGoGV/exAISDS7NcHL4x6Imvcm6XFa1Aq4n77QKjIIdEsS+aoIAevF9dakRnE8PGHymbaTWFSP29gSwdQrE3nOlII+cXLZ4uL/w0+CWw/nuzDRqpO++8k6PIe2nAfyuVYC8R1N477fY4Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824317; c=relaxed/simple;
	bh=x7rEGJPHMBLIdc7lqY3U1p+7lSYSCw4JvQMi+nq6oLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Type; b=ehb8de66PkPYX6+bOgUpDyCsV/qxJjy8uNN0TU23RFHgG9YNP/0qd0Tb6wgxoF2Tpaj/f06ywppxy4ifOp8xGM58mijYSrJkOGzy6ShwUJHePae2Fb1XrEV+Ba8LzCK1EN0mK8YUm8VGnjjW62Y4i69lnBlU/QCESOXVuVyIYYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVqG8f98; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CF2C116C6;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768824316;
	bh=x7rEGJPHMBLIdc7lqY3U1p+7lSYSCw4JvQMi+nq6oLE=;
	h=From:To:Cc:Subject:Date:From;
	b=qVqG8f98lfbmGT3DNofvd2SQdF704uDRKOCwOh95+ORICe/NG7/2feus3rQ7OpUId
	 c0fpsdLI/LI1Q0AF+cbzzud9MRoy87MgnxRpQfNl/bWE4ZIz02bIuE1fhgIykWyD5N
	 tC50meQIUnSccXvfjvjQTnnMgjfsU5hIlw316ftdnbB81MPwf0YPO7eCDVsNUo8vKJ
	 CqGW+qIV0IWbHs8v2ShvQZTwAsSovcxJmOl8Uny3gJOUYaX7A+0iJTswVDPTs4gM6n
	 CmD62/Moa5KInX+fVjrxq5yLIOEqlc0pX0y0MCCd+eGSehX6rucZL+wkpJiBtvn3jZ
	 bQSgQdv553N3w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vho0Q-00000001Zj7-350e;
	Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Yanteng Si <si.yanteng@linux.dev>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Chenguang Zhao <zhaochenguang@kylinos.cn>,
	David Disseldorp <ddiss@suse.de>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Gang Yan <yangang@kylinos.cn>,
	Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Vincent Mailhol <mailhol@kernel.org>,
	WangYuli <wanyl5933@chinaunicom.cn>
Subject: [PATCH 0/9] docs: Fix kernel-doc -Werror and moves it to tools/docs
Date: Mon, 19 Jan 2026 13:04:55 +0100
Message-ID: <cover.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

After a restful weekend and revisiting both yours and my series,
I'm opting to send a patch series merging both into one:

- The first 4 patches are from my series (no changes since v5):
    https://lore.kernel.org/linux-doc/cover.1768642102.git.mchehab+huawei@kernel.org/T/#m81211c0ff38bbaa82b8b0b6606f242ccc0c2a9ac

- It follows by the 2 patches from your renaming series:
    https://lore.kernel.org/linux-doc/20260119111745.4694546b@foz.lan/T/#m51099c31a99dccccdb4d17cbaadc818e9e4df8c4

  with the fix I proposed for kernel-doc to find its libraries

I added 3 patches afterwards:

  - patch 5: move possible return values from docstring to helper message;
  - patch 6: improve MsgFormatter description;
  - patch 7: moves kerneldoc_bin from conf.py to the sphinx/kerneldoc.py
    (this is now just a debugging message - no need to pick it from env)

IMO, this series is ready to be merged.

NOTE:
    I didn't rename kernel-doc to kernel_doc.py nor added any symlinks.
    If we want some day to use sphinx autoparse extension, we can do it
    later. I guess we can also revisit it during -rc period, if needed.

Regards,
Mauro

Jonathan Corbet (2):
  docs: kdoc: remove support for an external kernel-doc from sphinx
  docs: kdoc: move kernel-doc to tools/docs

Mauro Carvalho Chehab (7):
  docs: kdoc: fix logic to handle unissued warnings
  docs: kdoc: avoid error_count overflows
  docs: kdoc: ensure that comments are using our coding style
  docs: kdoc: some fixes to kernel-doc comments
  docs: kdoc: move the return values to the helper message
  docs: kdoc: improve description of MsgFormatter
  docs: conf.py: get rid of the now unused kerneldoc_bin env var

 Documentation/conf.py                         |  4 -
 Documentation/doc-guide/kernel-doc.rst        |  8 +-
 Documentation/kbuild/kbuild.rst               |  2 +-
 Documentation/process/coding-style.rst        |  2 +-
 Documentation/sphinx/kerneldoc.py             | 60 +++----------
 .../it_IT/doc-guide/kernel-doc.rst            |  8 +-
 .../sp_SP/process/coding-style.rst            |  2 +-
 .../zh_CN/doc-guide/kernel-doc.rst            | 10 +--
 .../translations/zh_CN/kbuild/kbuild.rst      |  2 +-
 .../zh_CN/process/coding-style.rst            |  2 +-
 .../zh_TW/process/coding-style.rst            |  2 +-
 MAINTAINERS                                   |  2 -
 Makefile                                      |  2 +-
 drivers/gpu/drm/i915/Makefile                 |  2 +-
 scripts/kernel-doc                            |  1 -
 tools/docs/find-unused-docs.sh                |  2 +-
 .../kernel-doc.py => tools/docs/kernel-doc    | 89 ++++++++++++-------
 tools/docs/sphinx-build-wrapper               |  2 +-
 tools/lib/python/kdoc/kdoc_parser.py          | 35 ++++++--
 19 files changed, 120 insertions(+), 117 deletions(-)
 delete mode 120000 scripts/kernel-doc
 rename scripts/kernel-doc.py => tools/docs/kernel-doc (88%)

-- 
2.52.0


