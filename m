Return-Path: <linux-kbuild+bounces-1939-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0368D198D
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 13:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A46C22887E0
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 11:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA5D16ABC1;
	Tue, 28 May 2024 11:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ErXr+ajk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE13C13AA3E
	for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2024 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716896016; cv=none; b=AFhnhfSFeAM8In1XxAu/8JHsFpRlederPca9hg6X/+SKdrvd7UeIcdOT09tKWaUG4dJKQ5/j8f99vRvO2L3PeBIzJqA6295kIq+tDBy7gCOWY6VBpqK6DChCW9UN1DnfO+HQfkVrUdAqpndc8O9wtOHLrQ6kF9ETkouMR4HMZ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716896016; c=relaxed/simple;
	bh=pVkfCfXwvpGITqeArgg8XorBGEqsQIg7EkQ5urfJgbQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cfa/3Z4PbVLTg3nKDeBVR6N10bM26Vh57kXn7KxXhx526joRqqShtpYPa7f3CuueXeuOE5o1A2zEWdUurYauhCw9zyFv+GL7lLlff8BHGsjndwQh13jhUBCTRk50SJ7BjObdqaGKrk0sSdM4DsZJEGLpZAJwtCLYMbVb++6jCjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--maennich.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ErXr+ajk; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--maennich.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-41fda32e6c0so3871285e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2024 04:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716896013; x=1717500813; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pTOxhoHq0Nkxf/74IFjzbYdMxemeJfpZA9XvBTvTfc4=;
        b=ErXr+ajkwW8QC39Mej+rxdrFeYUwVnx/x0bXfsBYisomxuLsZpmRb8iBz6j+fd1Wzp
         omwdzrak9vItrH6+cW+YktjF0vAmUUmG1XS1XR25aLRpYq/hHFCnUoy7At3g5EVgZp5Y
         8zSj0Uz40Ztpbv0TaV7ljrJ8WgqXb3HnRhUWoVYesIvoQsUGC0DYkaGb563A+vXYyIIW
         y8ej/2RESLsXc1B6bz2EPbldrQJeJ4Y9UYZt0e3loev6KU/jvHBfmkU78qmlMVF4wWc4
         Md030pqFfjorYLkp2UFfkCx1Wsv+gsdOoib+EOCpfUgoUduH3Dt3mGUn7Ns/q9zYguCr
         mizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716896013; x=1717500813;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pTOxhoHq0Nkxf/74IFjzbYdMxemeJfpZA9XvBTvTfc4=;
        b=frYg2WDE/UcnJfs2cT2p5TPWJLtcQY2KYXgJWICEc3qBrgfXHnFOVUmf/7cloiMrsf
         f1SM8o6q6VjrGlXz5IUUbK1TVMHc9CRfVTC6C2t+X2taXvF6PmG3X9+YHxMyZr3PkpNw
         DHTU8bZV5l3hyqVMFi0YSjWVNfhcXk19CCUugqrgaPn+bxzEdG9G6g9NEzAWvOzffzc/
         EayHfFGZRRrsbntVmyTENWVZ/xk2M6OtR6hA3Buuso3HCXIei1lKsvbtNUIipnErempJ
         NVoiC3N87s8+VKD2tjYZxQKt0heHVLTxzt+0vQ50/yEis02K0rZy6qg7OKSPKkuBhh5b
         J9Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVTDA/doipaaixHtzjMl2eZ01niLCMuJKWMkIHMZwyHkcQxOJqRW/QBzN3Z0oyc9ze/UtJo+K1Kwmuc0alRTG+pbIzLK94kvPVVVvd3
X-Gm-Message-State: AOJu0YzkAn2Q3VsU9NUAoVqWacFOzSj1gcWd7qmE8hieAYwUDY/lN8Qc
	ljUdt6gYNbiZIgUoURADRdZDyULSMpc9kkGPeYRv/ydO9bxfog5ME9CGwC+v5NLYuAPeiiusQxG
	lwc0cDQ27/g==
X-Google-Smtp-Source: AGHT+IEZuPpg1yO7fn0IEIKwi0X1YijuMLbkk9FqYxMx51RJlFRj8VX6O6wgo1ofZTORDUJHHcMrL76AmO0uAA==
X-Received: from licht.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:f9c])
 (user=maennich job=sendgmr) by 2002:a05:600c:4704:b0:41f:41fc:318b with SMTP
 id 5b1f17b1804b1-42108205095mr2453645e9.4.1716896013057; Tue, 28 May 2024
 04:33:33 -0700 (PDT)
Date: Tue, 28 May 2024 11:32:43 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240528113243.827490-2-maennich@google.com>
Subject: [PATCH] kheaders: explicitly define file modes for archived headers
From: "=?UTF-8?q?Matthias=20M=C3=A4nnich?=" <maennich@google.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@android.com, maennich@google.com, gprocida@google.com, 
	stable@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Joel Fernandes <joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"

From: Matthias Maennich <maennich@google.com>

Build environments might be running with different umask settings
resulting in indeterministic file modes for the files contained in
kheaders.tar.xz. The file itself is served with 444, i.e. world
readable. Archive the files explicitly with 744,a+X to improve
reproducibility across build environments.

--mode=0444 is not suitable as directories need to be executable. Also,
444 makes it hard to delete all the readonly files after extraction.

Cc: stable@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Joel Fernandes <joel@joelfernandes.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 kernel/gen_kheaders.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 6d443ea22bb7..8b6e0c2bc0df 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -84,7 +84,7 @@ find $cpio_dir -type f -print0 |
 
 # Create archive and try to normalize metadata for reproducibility.
 tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
-    --owner=0 --group=0 --sort=name --numeric-owner \
+    --owner=0 --group=0 --sort=name --numeric-owner --mode=u=rw,go=r,a+X \
     -I $XZ -cf $tarfile -C $cpio_dir/ . > /dev/null
 
 echo $headers_md5 > kernel/kheaders.md5
-- 
2.45.1.288.g0e0cd299f1-goog


