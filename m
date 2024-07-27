Return-Path: <linux-kbuild+bounces-2680-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785A93DDB0
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 09:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFDD1283E75
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 07:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103AD24B4A;
	Sat, 27 Jul 2024 07:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3HVQr6x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FAC20B0F;
	Sat, 27 Jul 2024 07:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722066335; cv=none; b=XFzTcST0VBdp4bY4PVwlcPMrpXlOS+BNk5JHPeruOkGy8qyNCWxZ+WdNIrKurj6o4NzB0aFqTk9KJk+NSTdSALw3FG1wIApPryDUAhvSory8aJrfH5mGHxgrTNg+gjKsq38z1X1AW/MwFo+1pFwkrun004NtSICgt2cZsNBQzmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722066335; c=relaxed/simple;
	bh=atqhpQgieqR12n8JuZM+c2ZwAaiSuInW49HRgevi5JY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JSgPzvEnRspXsNmlIc1ZbVqPguyRjvvPkG2kvYH4k6mGk4A7z0HqtYXXsAucwKMJKNgFoghaLXxpcs3jCZ3/mqMz0WzCGC7IpvPN77mDA/4UGtxn8220i8IVAgcdBa/bIRUDRbxtFAsMUltgozkmxozZhvRUAjpGnToFNULC7No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3HVQr6x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68A7C32781;
	Sat, 27 Jul 2024 07:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722066334;
	bh=atqhpQgieqR12n8JuZM+c2ZwAaiSuInW49HRgevi5JY=;
	h=From:To:Cc:Subject:Date:From;
	b=B3HVQr6x2L4jelPTcGTjlaFzXma5OofaWAzpsrRtsyQS/a/pUobFbXri9cw2JxBjs
	 TtM9IEo3758c28I2OLsfS+puaBaNWfEcrS9bOCExhSk3jv7lQhH8FqsArUnwxUkyKO
	 AQDmm8nlr3YazsDHCy+yFv/J/WhG6o9DKU4S/8YrEbe1S5xWPorvIbsxJbMV17gOlv
	 Gg+9nR+t9Awwt7bog6fn/RMlH2ewwpCKbMP2JLdCE1V1SchGrKUVMSLXoAu448OYbo
	 nvOvETxc2QA9wkgcgOXUKQODJOo84UpjOIrbWQ1rT2tLpiwpH5k1OpxDASSqx2iRVk
	 EdFLKPTvsMHwg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ben Hutchings <ben@decadent.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 0/4] kbuild: cross-compile linux-headers package
Date: Sat, 27 Jul 2024 16:42:00 +0900
Message-ID: <20240727074526.1771247-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This series makes cross-built linux-headers package usable in the
installed system. Currently, host programs in it are built for the
build machine instead of the target architecture.

The first two patches refactors modpost. The endianness in modpost is
currently determined at compile-time, but the build machine cannot
execute scripts/mod/mk_elfconfig compiled for a forein architecture.

The last patch rebuilds scripts/ for the target architecture.



Masahiro Yamada (4):
  modpost: remove unused HOST_ELFCLASS
  modpost: detect endianness on run-time
  kbuild: slim down package for building external modules
  kbuild: cross-compile linux-headers package when possible

 scripts/mod/mk_elfconfig.c           | 25 -------------
 scripts/mod/modpost.c                | 36 +++++++++++++++++++
 scripts/mod/modpost.h                | 13 +++----
 scripts/package/install-extmod-build | 54 +++++++++++++++++++++++++---
 4 files changed, 89 insertions(+), 39 deletions(-)

-- 
2.43.0


