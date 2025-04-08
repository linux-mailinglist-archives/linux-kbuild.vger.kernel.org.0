Return-Path: <linux-kbuild+bounces-6508-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29AA7F795
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 10:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB2D418950CF
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 08:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15B4221546;
	Tue,  8 Apr 2025 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="fbfgajkn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B5E212B1E;
	Tue,  8 Apr 2025 08:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100198; cv=none; b=hg2YA2h8ItHYb1Rnrz55qBRIzqnqkWR19EZV7nau5kCYDyhLhZTkmRtC/fpd4u+Q4nMsbKOrByGKEuchkptfLOELPQEoGrZTA1RsaWxqJPiTjta1SvnxT2PHUKCyqj4iTuRT4uP8EN5lxJruF3llC31MSq6XT7NmjA8EMpLfapo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100198; c=relaxed/simple;
	bh=gGX6UMUGnQ2Av7O9kFgjOas/NIxooQ2MtNkrVcn8x9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=awJ8uwd3zfQhFP+/LD/wb/7BNKsDR3axT14AlMppdNjDB4X1BNqNICdQ7iApZH61zPIa9Qc37Nyx1AiiDE0vA9mrfVwWCMbrj67Da2645tUF7hx/l+sIPza1yAtnDfZ6Rx7PjFNAjyi5DXhr2nQ0JJl4LjjSN+akaot8qv3IGDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=fbfgajkn; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744100131;
	bh=UXyiqpnsI36hihBNFzdtwvD8db5+Ldya1XbcBW6k468=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fbfgajkn7kV6f9N5EXQux0yrMAtKUWEy5HZA7ntUNc6xP5F5SmrFEPaGzh5mf1BJC
	 Bwei13ZFHqSd5lc6wAB33ym6T6bA3G+xiAf87hSXkDvM4sxXEL+lY0Yyc+Y6mXUALD
	 PuiajRk9ACt+a9MUSQcKwOXPqLYvdQIlfbW+uraA=
X-QQ-mid: bizesmtpip3t1744100088t83c1f1
X-QQ-Originating-IP: hsUu7WyaKWQDhq6vANxm2D6GHbiN77lhE6Ao2GFxXx4=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Apr 2025 16:14:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1393141986018351372
EX-QQ-RecipientCnt: 11
From: WangYuli <wangyuli@uniontech.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	samitolvanen@google.com,
	petr.pavlu@suse.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH v2 0/2] kbuild: Support gendwarfksyms
Date: Tue,  8 Apr 2025 16:14:41 +0800
Message-ID: <215802BA292C2DF6+20250408081441.61776-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NzSDQCFWCzVTYSs1+un13MRhHyR/C+NvHv8GbF1YjNnHpTVjnIAU0R1X
	qXHqQnnMxQk2wXbNUvjrLK73ZAHeRmTER0ooWnfJdlYZ3n14LOqcX1sCkM7HxeXxq2XDpCp
	7h44mav9FMkuHTyUoTTyt7VfDj6rqja7IDPQqW3UojkE3Nqs6W1Yf1xhvwi6Rir9vtVy5TO
	FuySxSYyzNHCEcqpiaClWQs06ryLYpoYJ95Eyy+TeVxK2fa5ljRNbpju7NDDJi41oYh83rd
	4YF6f/TDyp+16ttGD4/a2hq4Q1OERF6CsI5EQ+XxJP/2nqg+nyO8vMfjbkBqC6mtzZQn4Yj
	LnYOraR698YUltWjzM8FCrjgfb/31eUo7v8n6sIwGUp1F59MxFehTvnSoXPG4v/wcT0ApFW
	PufYyFN8f58XN2mi4sqFL1/pp1LnXOzgWzBcudrRToIhleoe5dVjzJJY+GbP5iAcIOuyZ9Z
	thSg8jrnN0EsII/i2qQoI6ebSQvU7wp63t/PB2olRs05PoKd6NWMvCRPUNDoBb72v4TyorN
	i5UtmLhSyHiY+LRiDzv2M1jCV5LO0h3UUsoGWxaaP6BYGFaWjtDVWuIrL2oarhCo1lsSZyf
	HjrdoVEBRhF2/FHK77kNmPWBby+iPINcgnnz5EZDDmTJrzVOAF3CyW7mci3QIE4uoaRTkFr
	sjf2Jmou2R/70gugTxqaXoqyzOmPemR3rmNSe0p1jV1LGazqdLBA3DwOyyQ0GIHi8xBuv8G
	+q7uNP2Pb5O9CYlv9NrSoGcWPYMGwTsivaC9yRe8vwnRryH4FUf9qKNMTeWkDg949YYQ2Jr
	bowSXU0Redxs2DaCUvX26SU80n0Zesd2VF20/0oIwm/dvMlh4i2OghSxfIhHGZGtq91Wuve
	0RAoJHpJrKUGKT5jOPcaU7c4OqWYuZaCpEDFqIW9FwrqfxZZGTTQPDp6OmbabFg7sFUktvT
	agOr34t20rGjtdHTmvZ+nGBmksWSdDzIDYRwIM72HctZUrQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Commit f28568841ae0 ("tools: Add gendwarfksyms") adds a
gendwarfksyms tool but did not add build depends for kbuild.

Add the package who provides the dwarf.h header.

NOTE:
There is no need to alter scripts/package/PKGBUILD as the
libelf package, which provides dwarf.h for Arch Linux, is
already listed in makedepends.

WangYuli (2):
  kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arch
  kbuild: rpm-pkg: Add elfutils-devel to BuildRequires

 scripts/package/kernel.spec | 1 +
 scripts/package/mkdebian    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.49.0


