Return-Path: <linux-kbuild+bounces-8616-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A81BB36EC0
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 17:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FDB87A2135
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 15:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10357370588;
	Tue, 26 Aug 2025 15:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dc1mMOUx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF73E36CC8A;
	Tue, 26 Aug 2025 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756223357; cv=none; b=RdIcjy7huBR9341KFkK3RhQTEYhGbdKg5vkSu/3d4mojF4fTvi11bYU9PyxdZle9n0W9frmq7ocKkmmhc6nlwAh3Ftr34fZgN6NKDed68b6tTTsqQF2odSsp3cuBMrh/wOV+hfPIa+Wdc2+uY43FR2YmYQfEUqmnx3FhZ2vU0gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756223357; c=relaxed/simple;
	bh=gkZ7ii19yZcYn9ZshX1OGyJQ9jLxaqXJW2dzsameUHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bj8Z4fJlFiakdmqdbeWRPz452xMDhRARTS7ksPCcLMxSDDswn3tZvse+NodUE4yN0cJHawRtv+EPn2QNHayMEJL6Vte6qFHXZnzX7TtC9yLqizlj5HtGeEUxJJLcl6hSnQsxEbqFsb1BfQ1h9esiE/5NZtfly+D21NRsNNUg0UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dc1mMOUx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F6BC113D0;
	Tue, 26 Aug 2025 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756223357;
	bh=gkZ7ii19yZcYn9ZshX1OGyJQ9jLxaqXJW2dzsameUHQ=;
	h=From:To:Cc:Subject:Date:From;
	b=dc1mMOUxFtbM5EdykpA/mjamh8EpPKVbYvOhk+EBMrPwVYOTuWrqRnZPzkuPev4Yz
	 l/WZi0Rc3fs0PhkmWAxZJG4AzASk1rUpg28/jMNZ/tD/b5Lval6EOY0a3VhMbTvNxP
	 dJedFAjTxBHIPDebL8/vzkc2+rTfjfqWloeCwQiNIeUXL1G72/ddB2ydSKN5GB7sqJ
	 03I7fxap71W6u5V6X6skIkdfqS6TMB9Zbcc/vABDZnxy7Z+qb+3OEc10QyD6rLfAFh
	 m99PkeCZwUp1zG/ZXLxbdeyu9q7ZPmtR+CSvifyqLl+HzPOJk6/Y7j0oFW+gcx+8Dz
	 rFl1g5/BniscA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uqvv9-00000000JRw-0V01;
	Tue, 26 Aug 2025 17:49:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 0/1] add a make target to generate man pages from kernel-doc
Date: Tue, 26 Aug 2025 17:49:01 +0200
Message-ID: <cover.1756222182.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

Please ingore the first version. It was done on the top of a past
implementation. That's the right one ;-)

Currently, generation of manpages is hacky: one needs to run
kernel-doc over c source files and then use an extra script to
split results.

The new kernel-doc tool supports multiple files and even dirs,
so there's no need to use git ls-files anymore.

Yet, it produces a single output. Change the logic to add, instead
a target to docs Makefile to produce them, moving the split
and build logic to sphinx-build-wrapper.

That allows honoring SPHINXDIRS when they point to a subdir,
while scanning all files by default.

This series comes after:
    https://lore.kernel.org/linux-doc/cover.1756138805.git.mchehab+huawei@kernel.org/T/#t

-

It should be noticed that, while Sphinx does have a man pages
builder, it requires a completely different set of ReST entries
that would need to be designed specially for that:

- for each man page, an entry at conf.py is required;
- the ReST page should be in a format closer to a real man page.

This is completely different from the approach we take where
we have, where kernel-doc direcly generates groff output
formated data.

So, yeah, this is still a little bit hackish, but to avoid
that we would need a completely different setup with, frankly,
would be a headache to setup and maintain.

With that in mind, there are a couple of possible alternatives:

1. change kernel-doc to produce one file per man page;
2. make sphinx-build-wrapper do that for us;
3. have a man pages Sphinx extension that would be filling
   man_pages and calling kernel-doc in the background.

(3) is probably doable, and could eventually bring some
    advantages, as we could have man pages for pages that
    are only in ReST format, but it will require some extra
    development. Not sure if it worth the efforts.

I opted for (2), as it means that ones needing to generate
docs can benefit from SPHINXDIRS. By doing that, we can later
improve the man pages logic without needing to touch anything
else.

There are two points to consider:

- when SPHINXDIRS=. (the default), it searches fror all files
  treewide, which is aligned with the procedure defined at the
  current documentation;

- when SHINXDIRS=subdirs, it searches only for the files that
  come just after kernel-doc, excluding the files and filter
  logic that could be just at the at the kernel-doc options.

---

v2:
- no actual changes, but it was rebased on the top of the actual
  pacth series, in order to apply cleanly.

Mauro Carvalho Chehab (1):
  docs: add support to build manpages from kerneldoc output

 Documentation/Makefile                 |  3 +-
 Documentation/doc-guide/kernel-doc.rst | 19 ++-----
 Makefile                               |  2 +-
 scripts/split-man.pl                   | 28 ---------
 tools/docs/sphinx-build-wrapper        | 78 ++++++++++++++++++++++++--
 5 files changed, 81 insertions(+), 49 deletions(-)
 delete mode 100755 scripts/split-man.pl

-- 
2.51.0


