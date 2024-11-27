Return-Path: <linux-kbuild+bounces-4892-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3249DA68E
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 12:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32C9E281CB6
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 11:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625081E0DFC;
	Wed, 27 Nov 2024 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b="frO8oO+z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mister-muffin.de (mister-muffin.de [144.76.155.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16EB189F20
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Nov 2024 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.155.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705761; cv=none; b=AWCUhwjBWYrOq26hZHBdLBAuFNhCiXdT3CCfK/PZWN76tkmH7dXroD7aUW9XXyNFBk766aMiLZpEGtuXL0pVQptngaK/ax5eXRfZ36ntHpuLxPWVXJOQItOoHJkpNumTqWmYCxeUHA7psSulqQqQiPgHkigWdUpfOQQX/qVdxTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705761; c=relaxed/simple;
	bh=HCN14egdlzdxCGqAM8yey9tpB3ai50kbGJT8y/HKeVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tyS+LRSkO+wJIGIcjTb9t3xEn8EHpaA+cbwL9De0wWhWHn7DSXj4t2Oyplk7Zvtv+5ZcgpKc2a7TbGVqZn6copqhS961lFCzM2iGMZ1NeHyW0C8iaR7sGDqiywUMamhTcd6u11c8RVDtX9nFB3zHTkQ3IcC/0VEZzPCF5G0AyEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de; spf=pass smtp.mailfrom=mister-muffin.de; dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b=frO8oO+z; arc=none smtp.client-ip=144.76.155.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mister-muffin.de
Received: from localhost (ipb218f8ac.dynamic.kabel-deutschland.de [178.24.248.172])
	by mister-muffin.de (Postfix) with ESMTPSA id 15DF7328;
	Wed, 27 Nov 2024 11:59:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mister-muffin.de;
	s=mail; t=1732705168;
	bh=HCN14egdlzdxCGqAM8yey9tpB3ai50kbGJT8y/HKeVg=;
	h=From:To:Cc:Subject:Date:From;
	b=frO8oO+zr5PEBCj4OlMBaSmNe114ziRsgwktU46JraGNSXmaeZ7lWRHWJW1ayFTzS
	 ukIEpA3miha0EI+TGl6jKDfL3X4JRWa8VcDnHYviJJqOcGjCDmxmcKcfh7QvqYVUtZ
	 xyLNlzNeLuplMlE8MZx3f7TWKMnKvRVMs1ylExaI=
From: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Subject: [PATCH 0/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
Date: Wed, 27 Nov 2024 11:58:50 +0100
Message-Id: <20241127105851.1590405-1-josch@mister-muffin.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

TLDR: allow packages in Debian and derivatives to install kernel hooks into
/usr/share/kernel instead of using /etc/kernel. In a nutshell, it calls
run-parts like this:

    run-parts /etc/kernel/postinst.d /usr/lib/kernel/postinst.d

When Debian packages install files (including kernel maintainer script hooks)
into /etc, they will be marked as a conffile. This has undesirable side-effects
like the file will not be removed upon package removal (unless purged) and if
the user changes the file, then deploying fixes is not straight forward
anymore. This patch allows distributions to to install their kernel hooks into
/usr/share/kernel from where they are then picked up by run-parts. If the admin
wants to either disable or change the hooks, they can do so by placing a file
into /etc/kernel. Files placed in /etc/kernel will override files of the same
name in /usr/share/kernel. This mechanism might be known from how systemd and
related software organizes configuration files in /etc and /usr. The mechanism
is documented in as the UAPI Configuration Files Specification:
https://uapi-group.org/specifications/specs/configuration_files_specification/

This functionality relies on run-parts 5.21 or later. If run-parts is lacking
support, only scripts in /etc/kernel will be considered. It is the
responsibility of packages installing hooks into /usr/share/kernel to also
declare a Depends: debianutils (>= 5.21). The logic I implemented tries hard to
not require this new functionality by checking whether either of the
directories exists and is empty or not. Only when both directories exist and
contain files is run-parts executed with both directories as arguments. Since
this will fail if run-parts is too old, a check is added to test the run-parts
version. Unfortunately the run-parts --version output is not quite machine
readable, so I agreed with the debianutils maintainer to use the --help output
instead. Should run-parts be too old, then only the /etc directory is passed
to run-parts and thus files in /usr will be ignored. It is the responsibility
of distribution packages to declare a dependency on debianutils (>= 5.21) once
they start placing files into /usr/share/kernel.

The if/else tree can be considerably simplified, once this new functionality
of run-parts 5.21 has been in a few Debian stable releases. Until then, I think
it makes sense to try and be conservative and try to execute run-parts with
only a single directory if possible.

What do you think?

Thanks!

cheers, josch



Johannes Schauer Marin Rodrigues (1):
  scripts/package/builddeb: allow hooks also in /usr/share/kernel

 scripts/package/builddeb | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

-- 
2.39.2


