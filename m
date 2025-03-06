Return-Path: <linux-kbuild+bounces-5976-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C9DA542E2
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 07:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C301D16C6F7
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 06:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3281A5B8B;
	Thu,  6 Mar 2025 06:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CujDZUYV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4E11A2547;
	Thu,  6 Mar 2025 06:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741243238; cv=none; b=HelsnZTCAFWaI9J4+r9I07GokEQD4VPB+r8sMbAReGBa2Y7stAniPjXwcV2V8ZR7JPVTiYl+twtJxb29ILlxhFWcwuIo9C8BmcBv5pwEwYeAZZ0d0zB5YXRaerZHW4zDn65/3EMYu+uuxWnkmv3apF7ooaESu4fggERlNr+k+ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741243238; c=relaxed/simple;
	bh=ozb3Ntewz5dAoim3t2E0N9mnusqlzcbMV6JJK/J8TYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Evi1eeoHpzLd334s+5jTtZeoaxAT6CuhU8Iul06eGoFe2clWukqXUwFARYazHEIW8mZcUkoU/IzJ9FpAQv131PX1HXwv/w6ETUettn0ug0fvPfKeyjmdUx1SL/dX7993y1fHw1W4h/5i/nQjox26ZI7idORB8frG13RzbEpzxzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CujDZUYV; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8efefec89so2930036d6.3;
        Wed, 05 Mar 2025 22:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741243235; x=1741848035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oXBqS8+oem4RcRZbOve/5nJddFZ+ymMHAxAunop9ZKE=;
        b=CujDZUYVhWTS611lexOXJOw0XK3A8X65pGS0w2HKLBWC+g44D2CqcPchq0neWigrmk
         qPDU8YZgD8y3gEp5nv/4ziq6dX411UaUeiREgZKJHCIofqB2tS5Mdv6O3yTbeyR7b5oS
         tSPQe/0BMh1gfMCpSYS9W+PKwMXr+1WMXnfPnaOmTnm0gj19ItszUJUosuaQp857Jk+W
         1yJcEvisxRfAsIrIk4INw/OyV5knaeoYR9DJRs72SFaWbzIiCk6g4w9dGozYF6/7rdtA
         2Q3vzhQfw4GqMvSzHDGirKwDeuDZ7Y+m1mqut1l2aYusC8mvHITt//1jgZdfMBsPQRuj
         BBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741243235; x=1741848035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXBqS8+oem4RcRZbOve/5nJddFZ+ymMHAxAunop9ZKE=;
        b=J+2sZziQNdunl+hCM7XFqyR7RhwOA3j35hP9FXa8MoGvoGF/LRKM2VxGX4YTkeAw68
         uBf1YQkB+P2hP+UCgeKZYSXTmFOdiWV9hQPylceosgYR+NDlNK5RyUscaAYp19Z5VDpW
         rjCHv5Y+edkplsWGkWe2pgFflYX7br+dGLaOo0FwJdFkYMZ5DVQ2s+gnR+3b9/v8ExLt
         uIQ71osWIucxiQM7a7zl9BwF3DqOtHyc3fvCFIfpWHNzYsYjCS7ZmzxMohkQkYoa+TCA
         lUIvBXehZy6gXwJL5dvX2jxw37GwGkidxlTVPib2RGuAinsTFCvRtTcVCLL0tTh+aFps
         fsGg==
X-Forwarded-Encrypted: i=1; AJvYcCU73bssD7VCO5VpNuPu+61FrzuKeXNXYW4d0VpZul1e6mQQ3yoOybidtG1ZoExCAcgJypUpJ9QA5NeEczQP@vger.kernel.org, AJvYcCXzS7KBfOZ+DMUjLdjGGAYYODvr8jyyqMkKKWkORV3JXTfJgEcK8baoM+LHHrXgBkP/VNZTkFK7HjnfuUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEeZi91OAnkzRp/gBSEWOEUZE15XEGVYI1ESRIL6HTG5jLkh5A
	Fvyg1KfWpF8SboT6/w+7ZHgaP0z+329l7+iaXSeLeYEjMbryqxIY
X-Gm-Gg: ASbGncsq+8uYhpio7BKKRybmxJB26IeEq+kHYwKcmR5zO+BGGiI81vjKktBGOjRXMkR
	tdVPafvbXuPEGCJBbDa2qv61QTH0zjVPX0Y9RQI8VyNvSY2OdjS1LntNvTCo01f8o2eaDEnUGOG
	3qlYeFJ141xvqymMQlGiy7JZgYau/SO1kFhN+j63uzXGQR0ZiUbQdc/Xscr6qcxuYnBGvWM7pd7
	SLHm78qaAABfaoyw+5aCDpZs9RTmc+Zh9dU26cVWkr2nM8tp95Lk+Ahj8UGL6BHZqaXTCZcJ1jV
	drv/wL4BhS5RhVbs2tS2
X-Google-Smtp-Source: AGHT+IEV4wyXNsRwBaIEnM0bIbHwpKMM8in5Vt2e5y8psSg1abcly+Gh+xRUJwLh+HevnzU4h8+8fg==
X-Received: by 2002:a05:6214:212a:b0:6e8:fac2:2ea4 with SMTP id 6a1803df08f44-6e8fac231f5mr2770806d6.14.1741243235282;
        Wed, 05 Mar 2025 22:40:35 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8f707c5dcsm3909616d6.3.2025.03.05.22.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 22:40:34 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2] kbuild: install-extmod-build: Fix build when specifying KBUILD_OUTPUT
Date: Thu,  6 Mar 2025 14:39:51 +0800
Message-ID: <20250306063952.1029900-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 5f73e7d0386d ("kbuild: refactor cross-compiling
linux-headers package"), the linux-headers pacman package fails
to build when "O=" is set. The build system complains:

/mnt/chroot/linux/scripts/Makefile.build:41: mnt/chroots/linux-mainline/pacman/linux-upstream/pkg/linux-upstream-headers/usr//lib/modules/6.14.0-rc3-00350-g771dba31fffc/build/scripts/Makefile: No such file or directory

This is because the "srcroot" variable is set to "." and the
"build" variable is set to the absolute path. This makes the
"src" variables point to wrong directory.

Change the "build" variable to a relative path to "." to
fix build.

Fixes: 5f73e7d0386d ("kbuild: refactor cross-compiling linux-headers package")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
Changed from v1:
- https://lore.kernel.org/all/20250223011944.902904-1-inochiama@gmail.com/
1. fix shellcheck warning C2086
---
 scripts/package/install-extmod-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 2966473b4660..b96538787f3d 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -63,7 +63,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
 	# Clear VPATH and srcroot because the source files reside in the output
 	# directory.
 	# shellcheck disable=SC2016 # $(MAKE) and $(build) will be expanded by Make
-	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='"${CC}"' VPATH= srcroot=. $(build)='"${destdir}"/scripts
+	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='"${CC}"' VPATH= srcroot=. $(build)='"$(realpath --relative-base=. "${destdir}")"/scripts

 	rm -f "${destdir}/scripts/Kbuild"
 fi
--
2.48.1


