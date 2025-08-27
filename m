Return-Path: <linux-kbuild+bounces-8630-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC880B37DC9
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 10:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC12E460A46
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 08:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076AB343D75;
	Wed, 27 Aug 2025 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBZrlHe0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF1033CEAF;
	Wed, 27 Aug 2025 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756283222; cv=none; b=tPdnidb+JE4V7CSLd/gzblkTH9FwC4YY8AWKccFZ25Oit1bsGQSn0BuwnjGcSDqTjCPx79GreseHmChIBoyhYcljZdYMYTeOOwIEH/w7p4dU8/YVFeXZqKJTttwo/BwMkHCfr52ILqlAdbbt7cG0gHZ8CUQeDWSRvdRPFcmNZVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756283222; c=relaxed/simple;
	bh=v9nXVPhu9broUm4T0PyzvwkNKRP92mUelTXaRHG66Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lVE1EeTtDp9e6G3hCHIyiSaIimx1HCnCTSfQV05IaG5myocgNAyyaNWSTaD354hdz2TevySrlCW9YlJ9sGwFXuP1/rIzfMVg/wIOjatln8jQ6iuMZK7N74IE+sG39mCBRf/Pojlvf3vwdWuDEUYOsLBhrcuaXvlB7RQW7g2x69I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBZrlHe0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FBCC16AAE;
	Wed, 27 Aug 2025 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756283222;
	bh=v9nXVPhu9broUm4T0PyzvwkNKRP92mUelTXaRHG66Zc=;
	h=From:To:Cc:Subject:Date:From;
	b=oBZrlHe09mvVXSYObYDEiKVoxoAsWRv+rqEyHRHt+tfG8f1DX/MqhvC22ZWmMfZxm
	 2dnaoGxWdgVN0DjAsoilLIlL4aClxEZvDWQctxFTOk59mMmRD+UtThQWbVSJyCM+8s
	 yqVkiVNdeDHYuKOZD1Vc0b7wAq5p/cpNfyTuMYXfIIdvaTc/Oa7I/yCeUHNY4KM35g
	 bEanalrrMAKgE2SBweAHh+Tq9cUTrtEXzz9omiz5t/N0CKAKKefqAnhLq7rNvFVm5A
	 bydCIigyipgoSu29h0rUUFrz86HUnudbLutL5i39CLiDrspuN6UrdoKXP4GCdRnPb4
	 wUk2r8THJ5rPQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1urBUi-00000000uUP-0neC;
	Wed, 27 Aug 2025 10:27:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v3 0/2] add a make target to generate man pages from kernel-doc
Date: Wed, 27 Aug 2025 10:26:36 +0200
Message-ID: <cover.1756282370.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

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
- the ReST page should be in a format closer to a real man page;
- exactly one .rst file for each man page.

This is completely different than the approach we take where
we have, where kernel-doc direcly generates groff output
formated data.

So, yeah, this is still a little bit hackish, but to avoid
that we would need a completely different setup with, frankly,
would be a headache to setup and maintain.

With that in mind, there are a couple of possible alternatives:

1. change kernel-doc to produce one file per man page.
   A change like that would require adding file directory
   parameter for output, and/or teaching it about
   Documentation/output and O=;
2. make sphinx-build-wrapper do that for us. That's IMO
   the best alternative, which is what I actually implemented;
3. add a man pages Sphinx extension that would be tricking
   sphinx, making it produce one man page .rst file for each
   kernel-doc markup entry.
   This is probably doable, and could eventually bring some
   advantages, as we could also have man pages for pages 
   that are only in ReST format, but it will require some extra
   development, and likely require several changes at the
   existing .rst files. Also, generating extra output files out of
   the blue is something that Sphinx doesn't like to do, as it
   likes to have a 1:1 mapping between source files and output
   ones.
   Not sure if it worth the efforts, and will still be hackish.

I opted for (2), as it means that ones needing to generate
docs can benefit from SPHINXDIRS, and we don't need anything
extra at docs Makefile. By doing that, we can later improve the 
man pages logic without needing to touch anything else but
kernel-doc and/or the wrapper tool.

There are two points to consider:

- when SPHINXDIRS=. (the default), it searches fror all files
  treewide, even the ones without kernel-doc entries at docs,
  which is aligned with the procedure used by the current
  documentation about how to generate man pages;

- when SHINXDIRS=subdirs, it searches only for the files that
  come just after kernel-doc markups. It doesn't take into
  account any kernel-doc markup parameters to filter out
  internal/external functions or to point to an extra header
  file.

---

v3:
- fixed a badly-solved conflict on v2;
- improved documentation about manpages generation;
- added SEE ALSO at the man pages.

v2:
- no actual changes, but it was rebased on the top of the actual
  pacth series, in order to apply cleanly.
*** BLURB HERE ***

Mauro Carvalho Chehab (2):
  docs: add support to build manpages from kerneldoc output
  tools: kernel-doc: add a see also section at man pages

 Documentation/Makefile                 |  3 +-
 Documentation/doc-guide/kernel-doc.rst | 29 +++++----
 Makefile                               |  2 +-
 scripts/lib/kdoc/kdoc_files.py         |  5 +-
 scripts/lib/kdoc/kdoc_output.py        | 84 ++++++++++++++++++++++++--
 scripts/split-man.pl                   | 28 ---------
 tools/docs/sphinx-build-wrapper        | 81 +++++++++++++++++++++++--
 7 files changed, 178 insertions(+), 54 deletions(-)
 delete mode 100755 scripts/split-man.pl

-- 
2.51.0

