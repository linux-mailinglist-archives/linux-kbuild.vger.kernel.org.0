Return-Path: <linux-kbuild+bounces-4617-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF389C342B
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 19:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 483011F20FF4
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 18:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDB5130E58;
	Sun, 10 Nov 2024 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vf0hsSyO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB15F17C91
	for <linux-kbuild@vger.kernel.org>; Sun, 10 Nov 2024 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731262910; cv=none; b=Wb57R1vTPkuM022apAmqLFW5kxzwN3u+qoDZznXtptQxUeBYHJBGJFOzr3CWnDvxNkVOvHGe/LZI4HvTs/1WnEUUrg98lj7eD1HJ2NDbN/7Fj+30lNK/V7NaNVa/Y61C8q1Q5gkVUTzH6t0M2QFb9mw4Gx1iiXF363iNyBsl7AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731262910; c=relaxed/simple;
	bh=cJyHpcUlrBm5Ej/LpH4NyeFYualzavzOjzWfLLLgmj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BTuUcJJ2OUeqevsVG/GbrfZtTZMRS/Nv2iajgomJdix8imK3o+y0OInPrLry8BjWcq3VYw5EFKO/PTl/klXEDIHUEuK5nsQ7EdUAkBt7sZOYzT2CqJupmRR3MZefDQ/uFuVtdaDXpGIi0+jFZe/llTHjzEQMPDBzxqpfncaoNQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vf0hsSyO; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a99cc265e0aso592795966b.3
        for <linux-kbuild@vger.kernel.org>; Sun, 10 Nov 2024 10:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731262907; x=1731867707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmmjQA+ERXj6rxaKuTWU/ppkKmWM8lBRUQwFc+IM3yQ=;
        b=Vf0hsSyOAvru6AhHtq3FxzLY4p5Zil3FuiWMMlM8cMKHAdlOpBccqvc3A3Xa6QaB8X
         dnbRn30ujMhjEhxCkz+m2gXgM3BEJaIsr3QKXBa80ibAFxo0uLVx8j4C9OJNZKn4DlCc
         JTgBH623rzYjdpydBKSvTrGkRT4orlJ45b7fh7NdUesh026wG7GPrjS7gMk6u+mAmY+o
         mGFNQB4TP2Hkqx2qQmNf+nH9VFyV/CB44L8O1ifaXgFPwN8C7GRahzmyVZWvAy72GkcQ
         Lw830cp7YIjSkyfDLdyVzKJPQ4pW6SPXL8il6U4RZPZx90SEFTPyYJzSbHYNAbvqjGBl
         07ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731262907; x=1731867707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmmjQA+ERXj6rxaKuTWU/ppkKmWM8lBRUQwFc+IM3yQ=;
        b=vg0Sor3hZU7YmY1ML/BGRREelerx+V1d8LtDuPijG0uP04Z+it7O+zlneXE4Lq2hwZ
         6U6FxwymVUbGcymRvU+sVgaLSSUzlHr261fPWI5OWfWPi5Y5SHuK8qCEqq0GpLVhfc7R
         wiWQ05msNTueqiswluqcx4ZT274Nqor+RIX3FaqgAHJOkNHxt84PTRyC0DNB1l/wxu5U
         TUVTVn/AwSaOB+s9h6R/+GzXZTke8qjiWdZUTkwQ7FDihWoC4hiDjfPUZXlL4s3F9fs7
         s8Kmxz2rpBwD2x/XPv/xXA9u2SGe5e5dgrx9UXWs1jJ1DXggPsNI+FF3kLKNScw2bL4z
         /vEQ==
X-Gm-Message-State: AOJu0Yy2Nw1DngUp1158AT5Z7FsgeD0Y7tb5GICNNLieDA3LMwVqSjIn
	CogiyrzTBaGm25tZmK6fekZFfad+u3V0OV84ieI/YZXiLcUYcIVpvVY1PA==
X-Google-Smtp-Source: AGHT+IGX40udy7iOW/hbNlGuKJUIB4kfVn5haSgfZWBsOzdtbSNP23Ce0od7ih7dHY1UH0QdUWlchQ==
X-Received: by 2002:a17:907:daa:b0:a9a:2afc:e4cd with SMTP id a640c23a62f3a-a9eefff1798mr945636466b.44.1731262906504;
        Sun, 10 Nov 2024 10:21:46 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:864b:8201:1677:ed83:8020:fb22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a17b64sm499569566b.39.2024.11.10.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 10:21:46 -0800 (PST)
From: Daan De Meyer <daan.j.demeyer@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: [PATCH] [PATCH] package: Add extra Provides to the kernel rpm package
Date: Sun, 10 Nov 2024 19:20:39 +0100
Message-ID: <20241110182132.810269-1-daan.j.demeyer@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's a useful property for kernel rpms produced from the kernel source
tree to behave somewhat as drop-in replacements for the kernel rpms
shipped by distributions. For example, when building Linux OS images,
this allows replacing the distribution kernel rpm packages with kernel
rpm packages produced from the kernel source tree without having to modify
the OS image recipes. Instead, by just adding an extra repository containing
the kernel rpms built from the kernel source tree, the OS image build process
will prefer these rpms over the distribution ones if they're of a newer version.

To make this work, let's add various extra Provides to the kernel
rpm spec so that it provides more of the common kernel rpm package names
used by the CentOS/Fedora distribution kernel rpm packages.
---
 scripts/package/kernel.spec | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 42447c5fd7ac..61a151026afc 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -17,6 +17,21 @@ Source0: linux.tar.gz
 Source1: config
 Source2: diff.patch
 Provides: kernel-%{KERNELRELEASE}
+Provides: kernel-%{_target_cpu}
+Provides: kernel-uname-r
+Provides: kernel-core
+Provides: kernel-modules
+Provides: kernel-modules-uname-r
+Provides: kernel-modules-%{_target_cpu}
+Provides: kernel-modules-internal
+Provides: kernel-modules-internal-uname-r
+Provides: kernel-modules-internal-%{_target_cpu}
+Provides: kernel-modules-extra
+Provides: kernel-modules-extra-uname-r
+Provides: kernel-modules-extra-%{_target_cpu}
+Provides: kernel-modules-core
+Provides: kernel-modules-core-uname-r
+Provides: kernel-modules-core-%{_target_cpu}
 BuildRequires: bc binutils bison dwarves
 BuildRequires: (elfutils-libelf-devel or libelf-devel) flex
 BuildRequires: gcc make openssl openssl-devel perl python3 rsync
-- 
2.47.0


