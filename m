Return-Path: <linux-kbuild+bounces-5653-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E458A2BC37
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 08:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC8743A60E7
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 07:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7391A23BC;
	Fri,  7 Feb 2025 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="m18ev+Aq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC561898F8;
	Fri,  7 Feb 2025 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738913190; cv=none; b=R2dMyjBEStCfL5n6kSO7ukhZYA0KEoClIjntZ+jXVU54pQaJelBv5+mSE8ObuR+5bO+xg2gRMCy7YGkIZZUHXgSGL+IJ6jPEx0aia4Z5sODvAXVIugM8yg6Zuo9wFcDshpU8MmfKt67WL/nbjfjFw59sTb0Y37OSFHMk4XCaLy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738913190; c=relaxed/simple;
	bh=GNBx8Hs4Tvp0WSNd2XqLEnLKn2B42fVjP3eTGupS1QM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ApI1qM/qcsuX1R4UWFPfjZAxvH6vPAv+/Dbr+1u7IY+TUr9vVXZVletN7TeTt3aCADbXZuk0+0tzSfSFto/jgfu3uSOLhlC+EnnNWg188y5Qyg4vr3lgNLGnMCuNQLVb7/afhpCEDATqMg8i1jlPgqc3MXCR4B5kPr9UFxBzPEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=none smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=m18ev+Aq; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738912157;
	bh=vExr/k4izXnEyMj5vAQFu6YLcOSxk2Bumi57aU79gNE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=m18ev+AqvzZXZl4UENn3SzRCHefmGlFdsVDMGfwFxpqHeImW16QtBscRGbWa+oVnO
	 7q+pC7Rw1GEFZourfYIkeqg2nVDDYvu6QJ7fmZFQWk4K4X+vlq3IO2AmjFuX7/njnP
	 m/woygW2gn2zYzyc1GIBaDxvLeQ3+K0dW63jJp8U=
X-QQ-mid: bizesmtpip2t1738912146t0d05bp
X-QQ-Originating-IP: KbPEmLI51H/AqPiTH2dKHqAitYt0x2kqm+pvVRQkeTg=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Feb 2025 15:09:03 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14445604798787441459
From: WangYuli <wangyuli@uniontech.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	jeffbai@aosc.io
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	revy@deepin.org,
	zhanjun@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] scripts: install-extmod-build: add missing quotation marks for CC variable
Date: Fri,  7 Feb 2025 15:08:55 +0800
Message-ID: <43AE9F470D835AD1+20250207070855.227283-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OMHTpzRlrft84jDKd48MkmOX6UG88xjq1eQb82+B+SWFgZ1RrijioPNu
	mwk3VGFDekorQZwOXGUIzEeAdGynA0PCs01wdVLTorqo6YMTi2a4QWqUnw6L62NEBmAlFNU
	7696gIn/aaweauy3HuJKqePE8mHkgF2E23SheLzweMR6wtwHu7d9MG8CWov30kh2T6+7F1w
	r2Hpmb/+4B4nIOuvlKTji6bZsy0+WYiG/ZufL3F9iCc5hvZElx3PRTU4uyVG7TfKEe3bCzS
	KRKvV0ubQZuprK7JZ81ly5eOj7kl6oBQUtumzlK0NGfz0pvrOVNzhbhSJmlvcYUtKI3CbRw
	b+Nk5vmXpKJN3UCTFCeiiPzziV5yi3tsdcbp4gxYEdF90B58dDfBnZ4SqTXVz7oLLnIEI0n
	McytGQ5eQTynxZSbHgIcwy7jmSaPpoxXkyD2iimPGjFlbhFAzZo63716NUDCPIGC4VD6rrx
	h/kSpmrDL7N8ynSr13wo6HCJQaY56vTFcqN6TSpGQyRGEZvfXwcMwz9JZgIpnejw1lZ/yDJ
	Mr5QtlQSCvSwihpD9tz2W2U0bJ6c2zfRVL9NSvhGVMXRGnu4jCHqe8PmN1BUL/0QtSv5ugA
	sAn4s+I4oj3kmB6GKLuImcos0Q9Zxu0g0lNFj0L3CkWu+Vj3dvwZBMj1EgIA9BWFNRJIepS
	ZXqfAsCP74q3Sz52l4+zNU6T8OTTJLA+1nT7J2EAWRkbvfHi93Fxth+5+9A6CB3vyXSJILR
	kERuzy+1aya7zxw6evjHhLqcDbf0idZY7RoJYrFs0xe3TEVuDSWDVrVWsHFx90UhwqPzVnS
	DCOjyPooqcrvpDQP2x+QcyyFDH5gpYGli2cAcssNBxX8ciQZv6r/4DZ8/OEQRJPf/hana1s
	HGMnwE+qjSzH9mQQL8UJHp+YANZXW4pl29QG9iklUV04f0qVKiqM52vLxGahDLm0Abxmxvt
	D4IBzv+ipkncKuTh8IrMekpHfTPrQ2kYytYw1agXiGKP224/lTxM5CZ/vnrbX3pzUtY/8i2
	+Ww4BxJ0EuLFsjMB2F
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

While attempting to build a Debian packages with CC="ccache gcc", I
saw the following error as builddeb builds linux-headers-$KERNELVERSION:

  make HOSTCC=ccache gcc VPATH= srcroot=. -f ./scripts/Makefile.build obj=debian/linux-headers-6.14.0-rc1/usr/src/linux-headers-6.14.0-rc1/scripts
  make[6]: *** No rule to make target 'gcc'.  Stop.

Upon investigation, it seems that one instance of $(CC) variable reference
in ./scripts/package/install-extmod-build was missing quotation marks,
causing the above error.

Add the missing quotation marks around $(CC) to fix build.

Fixes: 5f73e7d0386d ("kbuild: refactor cross-compiling linux-headers package")
Co-developed-by: Mingcong Bai <jeffbai@aosc.io>
Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
Tested-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 scripts/package/install-extmod-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index bb6e23c1174e..b724626ea0ca 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -63,7 +63,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
 	# Clear VPATH and srcroot because the source files reside in the output
 	# directory.
 	# shellcheck disable=SC2016 # $(MAKE), $(CC), and $(build) will be expanded by Make
-	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC=$(CC) VPATH= srcroot=. $(build)='"${destdir}"/scripts
+	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC="$(CC)" VPATH= srcroot=. $(build)='"${destdir}"/scripts
 
 	rm -f "${destdir}/scripts/Kbuild"
 fi
-- 
2.47.2


