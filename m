Return-Path: <linux-kbuild+bounces-5881-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21204A42BE0
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 19:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BEE317ABD0
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 18:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912D9233709;
	Mon, 24 Feb 2025 18:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="N+vSeZe7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48FD265CC9;
	Mon, 24 Feb 2025 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422637; cv=none; b=aytIphbHdRpciYNgUrZ4nmqphfBRu4N5xvP7FkMdneoo/uIwF8QN7a6GaTPuRctmYu65DAJIbPZudydLwsHbn9Fje9DAJvEqfW4jIgXPhc1q2hB0uhE+JZreuzgzrEChW5umQQCZ04ggeuPcg91ZXMIaNh/apyAAZkItjjBj87I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422637; c=relaxed/simple;
	bh=OAk+L/m7x/cv0UJhgKlMAM86FPmhXcJlx0x+6YlYuSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZrxCd1IHa64gAkKHGTvi8fP9DQScPQFtQyJVGXnavyHq+WiZCZbnYWWOxXSpw4oe70nHVd6C00IuldIGFLjmbctSgHTAoVXlTrX8ReiXzLyY2GTcCRpkjv55MYdM7bXaWqAvasxb+h/f8utTIazACyMdCxAk9lIIhbVoxot1Wpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=N+vSeZe7; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1740421602;
	bh=1sX2eNn3l5oEvnLc1+fi+CI5BMXl1Ff+USd9YlIlS+s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=N+vSeZe7k9zK7o7LYSEp/ZdnXfUWZgziuxpBZUA79ug57lRtNBcy8knZ/6KJI8r6j
	 CFchJaXCerHQ3IvW9zf6F42ECyT+avc5HbPvt0FDZ8oq2DitEbzdb24FfccUMrOy2G
	 i2Gv5PQE+rM3Wjn07uv/bEKk5GH1oRqpFCIa4DOY=
X-QQ-mid: bizesmtpip2t1740421588tidkldu
X-QQ-Originating-IP: O6Ik0ahvFrkWILBE+jZrq4jmedga7AVIgaWuSR78YVE=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 25 Feb 2025 02:26:26 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 52011159772379626
From: WangYuli <wangyuli@uniontech.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@loongson.cn,
	kernel@xen0n.name,
	revy@deepin.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com,
	WangYuli <wangyuli@uniontech.com>,
	Shiwei Liu <liushiwei@anheng.com.cn>
Subject: [PATCH] kbuild: deb-pkg: add debarch for ARCH=loongarch64
Date: Tue, 25 Feb 2025 02:26:19 +0800
Message-ID: <DB8BF02DB314013F+20250224182619.1557027-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: ODcDgdcDagQKd5vojsbs1QK7Qnv72QLp3+VphTZwn9zd2O7s5J33OY05
	Movph5YfADliSfaib5ivzfueH9YtcI3GR6JJ4UCkM+6VMAd1B2zyx+gfjFi/K0J2HqCg29b
	8yCsb3q9Byet6y0C7pYXKu/luSETKLUdBzr415JLj9qXa9s2VEYwiVJXWWs/8LUxwpnrADy
	npDKWgVF009zCOPFLtDA4WNwA/OyMoSWA4oiWGeXazD/aXkxblNzf8gacFdSnYUVDEY3vzi
	XwZj0nxy7BLLT+Y3Nj6+K9MNpOUDwUMPD23jsrBipwjHcRvyP2qWTqFGfkKeOMvw4QGMQrA
	mwXTF3StdqQk7D2IschychvMjWQf63gcHsS/Ess0s/ifmWE53yNnJyGVYCp4f9a7+Lrx71m
	PEMzRHDecF+POVCr5M1sKksh3rJtYUjtvIR0PaOSvWHSN38dNjbD5cY7HpYCS+QGqVKP6Ln
	Wu5KifoW1sC8+RIClVZzmBdA819FWVhmt3dr7GoUClZmQrAkgMLgJxiuQHHVP5BpjoKdeOL
	I9hYU9dD1Vd18e6NvC801TP9nhIE7PpRi/AHHoYsK27siOGaUDjsn8FzmE+0ePq5QoCMtA1
	jXM0dIw0WcJrXm3Ww5jNjYB2gZizPT6XHfYDXzAm1u7XdG5G1MQgacU/bPs8kD2OulHOMvn
	iTlDT5oyoUzZ+FVh6WdbVWoM/n9S/pk3cxpIhNJFwydNL1JLtCRtRJbEBGh53LrD0k3Fkt6
	t/Z9uDokqBawU5TeiFWvabpUK4g45bY6/sYAx0siy45pjLyJyjMZg58nGeTy6TdfSRbjevN
	xs9phHqwoopHCHqUFRR147yL2JoIM7jMx7vlMeAtzVZRvQ05tV+r/ZUryvvtw9V/YhQVNZr
	7p5Z43qtSEZP0Vr8+Hp3BnnqL7gSIg5qBiR3gZAEzg7gxLCt1tUJL5QoW0UZIzsICjypHZ0
	pGTMdCOgTRqVnKTAQzy9DlBW7jW/vUPIJNsFpRzXu2NNLDuWqwatsW7TEMNofY16h6c0g/s
	UU+VWFEsEJ86fd211O
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Fix follow warning when 'make ARCH=loongarch64 bindeb-pkg':

  ** ** **  WARNING  ** ** **

  Your architecture doesn't have its equivalent
  Debian userspace architecture defined!
  Falling back to the current host architecture (loong64).
  Please add support for loongarch64 to ./scripts/package/mkdebian ...

Reported-by: Shiwei Liu <liushiwei@anheng.com.cn>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 scripts/package/mkdebian | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index b6dd98ca860b..0178000197fe 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -77,6 +77,8 @@ set_debarch() {
 			debarch=i386
 		fi
 		;;
+	loongarch64)
+		debarch=loong64 ;;
 	esac
 	if [ -z "$debarch" ]; then
 		debarch=$(dpkg-architecture -qDEB_HOST_ARCH)
-- 
2.47.2


