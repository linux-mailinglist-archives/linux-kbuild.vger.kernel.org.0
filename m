Return-Path: <linux-kbuild+bounces-2233-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A6891186F
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Jun 2024 04:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B203E1F22B6F
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Jun 2024 02:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9483D84047;
	Fri, 21 Jun 2024 02:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="IVd2TsfR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5D083CD4
	for <linux-kbuild@vger.kernel.org>; Fri, 21 Jun 2024 02:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718936777; cv=none; b=S5kvCuJGdEAYr6sPojzPM9Yih+/+NuIBkVtjiloTxyqqvnqKIrX+3dmlZPZSZY6nQzDfxN8j1hdvsAmy0c0nggJZxUPEUeMAU9MzHfHVMkhFOlz0fqe2078SF9LwyJ9SYaS62Ql9U5Tenu83rlKv7Ui5Ex9dwzfajXeFM/e/gHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718936777; c=relaxed/simple;
	bh=Z9KMADyVh0mQcX2BDjXHtJuSjrpaFdPxZVpM+ZPe7w4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TVrPWzXXk95Plm98bXPtqj7PeCrlB0SJC5pyfmoZWfnfP9w9BrypwC1VfBRzPORTbtQPbfPPCNy+6VFt5R1d0ZEHVC53YsNbyLKxtZiJMUByoFa0zBysfEcCEmL8Pt0+J5HfRdS/9j4rjuVd4QPPbc/GuUd0ij71cLFa6ZxXV8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=IVd2TsfR; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-6c53be088b1so68203a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Jun 2024 19:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1718936775; x=1719541575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gU/GXfDYissHQA31wolSfkKE1r7btzOAHUHtzGx9jJ0=;
        b=IVd2TsfRQcZsR8vj+68kgD9MezF1lUR57eE22DMKuC2BxzZCDVZHc/xco61cmZqUkm
         YekZUDVfc7XAvpQtXog4i+j9oZ3WLsZ56r5z/jchczJhqCxrqYWg5ly2QZgwYSuJijWy
         B2D9MY45YLnfV6G9x7bGfT3nL7MKcWKoqt755XnFp+4lDJQ9Rag5fJDuMY4/38q5Jxgz
         OabypTaj028NvmOMNUme+QrmU3vpinb+4zFNZdoqq6uQGmR6fXbV0eSG6XwQ97UDW2Xj
         XIpMSxdsJF2CFfx+vCmJg4gYwtP9fmkcZQWbYvEYfDeO16xngoSqQYJ3wwBQAEtf4R2R
         HvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718936775; x=1719541575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gU/GXfDYissHQA31wolSfkKE1r7btzOAHUHtzGx9jJ0=;
        b=Wf1bfEHdvJVkbTr1tHmivvHvYZ7jukq1u5lKdxC/8nZLRKooVRTvUeM4VVK7eJcSSk
         dtOdY4a69yopBEEjMYsBWwGNxgkYRLA8ooj6+rf+4vL8k/585Ivtyv8RF5TPGNiSYZ0w
         uVbt+QhErlXvXAjnCNU1u+roa+pReESwyDMCKbEzP1Hk4H6B/r26vZ2uOaEnj2VMIA3W
         gBImgq8I8+Yxvm7IaMtPxYPBcA944UBKqKa+pAjmhX+0w9q8r7FvVacD8uhCiibf3jAA
         Ri8SrYEbdun6WSORTFm9cidy6i7pWCa61rj1CfVH4z0P2EKt0OF3luNXWvnacixiZrmM
         UzqQ==
X-Gm-Message-State: AOJu0Ywq0dRlTfqS09z+j92QRnoS/mPwVKFGXhkrgZjnY2Jeb0adogXJ
	vlt9xoBkWrFVA5tp/O3sAB6gXXv4ZVmUV2i0x9+a7Ek2EOAS3ZffwMBLRDm9rrr/zZVyswCmkxx
	d8wM=
X-Google-Smtp-Source: AGHT+IF88NkQTHvqVRk5v5bIhOu9r7lYOFwiOKiZa6lIqLpLL/qsCwPaq41QpJjUF1Lr1yIjG8PNrA==
X-Received: by 2002:a05:6a00:c90:b0:705:d88f:4a94 with SMTP id d2e1a72fcca58-70629c6c508mr7473065b3a.1.1718936774542;
        Thu, 20 Jun 2024 19:26:14 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.166.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7065119d734sm331516b3a.59.2024.06.20.19.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 19:26:13 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Calvin Owens <calvin@wbinvd.org>
Subject: [RESEND PATCH v2] kbuild: buildtar: Add explicit 32-bit arm support
Date: Thu, 20 Jun 2024 19:25:59 -0700
Message-Id: <6bc61e82eaae9e614cbd50a322322173f593c90c.1718936424.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZhmKzqxHXaSZmXee@mozart.vkv.me>
References: <ZhmKzqxHXaSZmXee@mozart.vkv.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement buildtar for 32-bit arm, so the zImage (or xipimage) appears
at boot/vmlinuz-$foo, rather than at boot/vmlinux-kbuild-$foo, matching
the structure of the tar-pkg on arm64 and other architectures.

Link: https://lore.kernel.org/all/ZhmKzqxHXaSZmXee@mozart.vkv.me/
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/package/buildtar | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index eb67787f8673..23d7ff675396 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -104,6 +104,9 @@ case "${ARCH}" in
 				cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}";;
 		esac
 		;;
+	arm)
+		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+		;;
 	*)
 		cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 		;;
-- 
2.39.2


