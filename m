Return-Path: <linux-kbuild+bounces-11767-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMIrJuH3r2mmdwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11767-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:52:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A164249B7F
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DB3B300C54C
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 10:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AB636E47E;
	Tue, 10 Mar 2026 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImE07ine"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C005F37F8A0
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139916; cv=none; b=SqdHcXeTWWjUlqogpdgs/8IZBaBRCPS5ethLyWD/vOwbvXszsm0XTp7xK87h+RUW86R4p8xk9aEG7453jQ67el4ZYPR0fEZEOYvXMSUwAV+VEp5feoGtNkHqiI5yKAW4coyeVU8ROTp7zTalbVwoAYBPkCORtnMnY/HqPAf27u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139916; c=relaxed/simple;
	bh=8ukm5sGLjmYd3ifnubgD0uhek7vuI4fiv/pruVMCiD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XFePXIsh8BwI7Maf2YqVbHI9p1KKinMBhVbGBZfvzBffgXM0D5DGRkB9m2WEAGD/iAvDuGv0HWSP2qp6xWyBK8ig3kXDm4Hu9VkdxPJjN1f5o4eB0O44A+I8yQ9xqcV0CGrQkqBJmoNSwDLfHN+B6TTQbbQqS5k8p1PUSDAb+zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ImE07ine; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so5588131e87.2
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 03:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773139913; x=1773744713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ckep3/Ff8pmxjzv94dN3ytmwsqfqv1NIwzU75IerNDs=;
        b=ImE07ineweKKWSRud56rsJE9SR4iCrb4tY6FqoH04+wGdijH96JLxGWKIP7P3gtF5N
         t6U1kO9YYkdZewdGqLs6fFtCqvMN2vVZTZivL26lHdnOiEHjboQNozHm/JS5H9y3GMxp
         Zbx0A4+GaIWK+XI0kY8Te3DRHpwIu1y92OWYvi8tCyLvjMtjUUs+pYEzf3vK1WenYTjB
         NFxfKgKAmaGS7ZRHPPvsSdKg5n9bA9Z+rPPbX1+lo/2EfEJwWAdJdfnN6rORNt+P0mzP
         nHuVEbMgX/m3WaN1UEScteVf5akxaIQIC1it53Kyztu55dRl1GBnl8ev8ZXmgTMS9BjF
         q5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139913; x=1773744713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ckep3/Ff8pmxjzv94dN3ytmwsqfqv1NIwzU75IerNDs=;
        b=bXO3KOE+HemLVXuZteLEyuPoiViRfF4NnpXK4ES3gCEkd1EXChOYaJSfFDF1oO4lxc
         lq/Ztq+sRShjjk3lMJYGgzli7IP7wIr2Mjz8Sut4nBcLV3nJsTnQ25sECgdvOs9alJM1
         OELjeJo6IcqLtTFAV90x+Q5JarPuZXtvY0FqDJPeyzBd3Pwb/KVRkBSIHMve/TUfYJ31
         CyH1R6pZyjPjX8sG5TsW/iT8YGsR/VNMFPL8XOplG2eY5oMUDQVhQmnSDOxGdR4+h8QS
         zCMhQlK4k4BibxlfIvZlIydmmgNWhq2A+L1KR4fVMT7M6/injNv7LluKEPqZD8doBTHr
         EWDw==
X-Gm-Message-State: AOJu0YyVMsFKSRCH9ct7K6PKX8JUepynkG58A1katimZ6UINQKsm+BSt
	E9/+emPzFP+OgybEUNj7px3spY/Slno2bBQ8jIPfdFAsyNI/Ux17G2sU5x3r4KktHadYIZGp+50
	slpsNfj4=
X-Gm-Gg: ATEYQzzwsRTLG9/isxvaTXvA5DweE924/Zn/oVcTuze7AJTlsybnm/aGf9tLPFFZtgf
	b7IHksO9bxkuBC76x56Gv7DujFs43xS7e5fiIYWtoWdcu4kHvgQjO/63aUrfJ3TmvPw6LQpyn+t
	FR7YJWMt7uSuHktOMysljzXS8iWSlVSXGhUaEE9xb3Fgzb7EGNbM3wy4GZbTF4lqi/pn2tMRkmm
	iIv87NTK1nsNgJU4VheYdK4IbLb8jsnTlXaJWHghW2sps1HNkG3uSvnO0HYt5TWge2zw0AjkPUz
	ohl/8Q5ZEuS33TW3jivfp8yBpc5pd9FSSoiHac+F9cIjRAiIhZ4e4o+AHgjTa1IXMqnlaUu5iqN
	RUYgUpIYjwnpzs1sGPXqW1ltYer82pDEsDJICK5ni8LXticH9bXUHFDS/KwbfKNr+EyS+iqhIJI
	BpXWB6Yz2RM6wLksdfb8BBjU8CCEaGDWxT5zwMDmvkXRbnIyASx/xT7Gnk
X-Received: by 2002:a05:6512:68a:b0:5a1:4473:bb26 with SMTP id 2adb3069b0e04-5a14473bc27mr3566335e87.40.1773139912847;
        Tue, 10 Mar 2026 03:51:52 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d057437sm3697541fa.30.2026.03.10.03.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:51:52 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Daniel Gomez <da.gomez@samsung.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Larsson <andreas@gaisler.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] scripts: kconfig: merge_config.sh: create tmp file for awk
Date: Tue, 10 Mar 2026 12:51:14 +0200
Message-ID: <20260310105114.192327-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9A164249B7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11767-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikko.rapeli@linaro.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,gaisler.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Nathan Chancellor <nathan@kernel.org>

For some reason some awk versions/configurations fail to create
this output file. Create it in the shell script part before
providing it to awk.

Reported-by: Andreas Larsson <andreas@gaisler.com>
Closes: https://lore.kernel.org/linux-kbuild/acb36651-449a-43e4-afe2-ba42a435cbb0@gaisler.com/
Fixes: 5fa9b82cbcfc ("scripts: kconfig: merge_config.sh: refactor from shell/sed/grep to awk")
Tested-by: Andreas Larsson <andreas@gaisler.com>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/kconfig/merge_config.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 735e1de450c6..070ecae87a1c 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -123,6 +123,7 @@ fi
 MERGE_LIST=$*
 
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+touch "$TMP_FILE.new"
 
 echo "Using $INITFILE as base"
 
-- 
2.34.1


