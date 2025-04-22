Return-Path: <linux-kbuild+bounces-6721-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B079A96687
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Apr 2025 12:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCAE63A6727
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Apr 2025 10:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BEF20E306;
	Tue, 22 Apr 2025 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="lWPThEFE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EB21E1E06;
	Tue, 22 Apr 2025 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319076; cv=none; b=fhiPV2/olFpm3ea46tsyOM7LSAthx6BsnSnZwUqj+e1zd681VX+UynUFolVc0KsqhS5s1vO+/ml9poIED7+z6QTRlHBJXK5ZH+CvuTFzR3w9yp9mkryeGeJFMkKaSh/WGWZgJ5N9tiFv7/HTPs0nMmzL7szlPMeV+Er9PSNA2w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319076; c=relaxed/simple;
	bh=nbBbF0Jg4cZ5Sn6fjGW6ZGEG+8/S6TbzRWXfA3yIJ2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VhxkkMT3hkrd4N+Te8T/A2G3nRHOYH0GPYU2fZQLSYO+yfq2BHyrR5yQiyR7js5wUMJcxXWao0aukdIFU1NxBBUsDP7DlUOjAgQ0ifLsWPY6OgHlIMgRBAirwuSe1W6XpKzxGukYYKrfUW1bmthyOfaRIcbFcDNd3U0QMomPQEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=lWPThEFE; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745319017;
	bh=Exa51jfDHbvKVso57ILq4/BOFn87BMtt+Gf94W+Yzlk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lWPThEFE6S0tUoZCCbOc3LFdt/yEegN5FBYojMAlSN43cXeiIX9vuG3j6rN5MUZUI
	 AM4TNMy39OWQk2nlPJ+PRmcrJMuEXJENaKfjphVbmtq9F6YVGzG7ORJGX2dVDpMiB2
	 hrvBCr4xgLL3YGvuD7EUS7Y6jycN6lkbyJMZtki8=
X-QQ-mid: zesmtpip4t1745318973t8805d772
X-QQ-Originating-IP: 88cgF5eAqW2bJeVoCIsbNo9saB5M7Jx6BvND+lWGGVI=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 18:49:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2096148517215923259
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
Subject: [PATCH v3 0/2] kbuild: Support gendwarfksyms
Date: Tue, 22 Apr 2025 18:49:27 +0800
Message-ID: <79C925DCE2E963FF+20250422104927.144252-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OJo/U4CJ+9g1zljg5EdhZRXMkwThYw6jHYTkXlFAAMkxtByQ+p1EnzxI
	5Z9nzGYFLoEAVBhmCcAI8Lni1kdytgFEvwAmmbFV6d9PNCbFFjBDU91qUJ73mtmzrRsZ+fL
	wyA4rRodFD0fsVMEe/nGj+xA6jnz/9h883gnUo9CrW4cP8b+ceLkqpymENb0++6KRgFfTQs
	oPECSsJXUoEhX1ZAmERnJQF5wW2epMR12CqAiYaMP+oJvSlppBYQBksegSq7LOeILKaKch2
	5pLBA1RZ6Ljg+iGq6esRYMuK998t/80OU0oqSHkf+NC9CD1NASmc/k5s4U75798Gz530jfK
	uGO07AwS/SFcbsnkQl4eZ6/Uo3vtnbsHVD1sZJ7I02jlCSUGzeV+zLUUHvQzD1MacXGrL+/
	W3jAvIYnFuZDuPxIa5J/GfS5Lwi5pRZZ8Y8/a819suLaSvhm075i7qL7HIe8+Iy5+Ib06uT
	jvKfjlu/ImevlG5kmr7a4S8COVkyjQb7TDSec4mehrG3J3m133H6NTyJTmUKesIKauk+mTV
	Iz+iBZkUadJ1znYyPT03a65lJm85mxM0QURdntR4/og97/6+1g+WksTX/Y1jovCHgTIR+1f
	7lxBjNn5qlrL2LKFAipvQcVcNxk9CM5T1O0OE/QN4634NYvmer4pHhu9gI9b1Krk1Z42BJS
	pLsTRaHHW0mHZMQyhPxiqe29OYgtuFRik3LdrRfDWb4lfedL5ZoTkfnOcFJxZ+DMBwurE7u
	bkPzOTGdsJj2FacGHOdxdc6OhuMGFiFysfxMsrvaXodUYdJow5fSkogVgWuHFoDmnlZIKjf
	aHWn3wQMf3hFdVS4BWJfJYJdTtXsp4IAbll/bBIi8Fs2Zpkk9g7Q0scWSZBAHIB+cfI5rmz
	USu3zrYojQTS6A+9rKINXGQFvYJfp0Qr0uVB+RhlyvfXUALkxgkc0ogkWlEORITpEWw5oD8
	haa4N2lDxhpYCtlNDJjvFbRwMT5O6QcF9J+wT6zKqGcNowuuotLd4JM27YIPspzQoBU/qkq
	3ci4Ca3EEod+QrJ7Vhxp75x75C9dchk58oWTfA3fRblaCWQAXDmAT+H7tUloZ/wsFk8T9BN
	KRUmTA//ZydXt+wYH2ULy4=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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
  kbuild: rpm-pkg: Add (elfutils-devel or libdw-devel) to BuildRequires

 scripts/package/kernel.spec | 1 +
 scripts/package/mkdebian    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.49.0


