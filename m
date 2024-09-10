Return-Path: <linux-kbuild+bounces-3490-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C86C9726AB
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 03:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F2B21C22D47
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 01:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DEA54662;
	Tue, 10 Sep 2024 01:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="eP/OTs/M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A855A37165
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Sep 2024 01:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725932658; cv=none; b=MdNgxI07qkZlj1M061gkaVFr0/932DElTqhDsevMIPb9o4T68xW6uH+DlzWRF96GJyPLIO/Z6edQZaLVw9rTm/BZ7EZuWsiSF/H0d/wHZ8Yd98mkqHEXwCEVRW4pzURHZGo1QKRloliOSlY3DWDlI1o2w/RaWWO9YjwWiVNnteY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725932658; c=relaxed/simple;
	bh=1hOveCR8t9y2jUKVIvD7AG+zq6W6tILgvLizJTUQuD4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eltwZAG9TiFKqwkVfLcepeImfwo4yZiz4QxpJwU/kaO6JJjBybLdsSXtejosQ0Oh2blQMvfSZZB7OEGh/xGqTzRcHs0qxIPhBZkdek6J7kLC4N1fySWeEPGt2beYND91kC5z6dcPFQpgjOXlsnCknbQLHG9CpuzYOxBTxFYDPgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=eP/OTs/M; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-6db67400db4so24062467b3.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Sep 2024 18:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1725932655; x=1726537455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oi38hx8ULqCM+ZDtSmCY3b4CYcxE6qQM5dfS+ag6LCc=;
        b=eP/OTs/M+T9PH7wy6FwGLbCRZkxbSdBOMVYcmet/t9AWxxu3NLqAElrG/aQlsPloYp
         Z9tOzvG0sFNip8Q48/aumugbyxlqJOUPGh9+Z7QCrd3Utb8Hu4ykcKAZaH8Ap6ECjO+V
         linsYZJtu+qjuBtgHX4egQ1Ys0uMTgfo8DWCbJlwY7XbNobNibIYuXoWwQTVrGgdnwG5
         vqNwuaPwGtWL2hPXXI3HciaGIR3xWjMVHMX4DYaesr+DplwA47y9/D6Jxg1dtjy8DUZq
         L1eCcBVCvr7rlBFhWJxViGVo2SxAxYIysSreHuv6QxuMYbP5xgdAg2zbp9crb1fEjVA+
         cAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725932655; x=1726537455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oi38hx8ULqCM+ZDtSmCY3b4CYcxE6qQM5dfS+ag6LCc=;
        b=oCH3ic2VEM4mn6Uzt6DpNSdLRTT/OFsTjUrYnLF/Wbn24oZ9FLLxmPKkinKXPXuP0w
         Mnt50I85QWc/zGP/KFEPXl/Hbu/jXzvAw61hK7foWMHnzSk7qtSl9Qp32s8g+KDQK+m1
         fYYS209MehYFddsP8nvwb4Es9DMNyi5wU/2izVkIHccC7T/dDYpZxdOLxPUKxCPcccgu
         2LKXkH8Wp9zK3PMY3jYegERQAU+I8BYbjTfePkRpqLUahceUL8lxJ0Ij3jIxV3wp5y1g
         QGB0DYSHrFNwTwfe2r9GwB31vnCtirRjm1Q0Tv/nf1G9bJJ5rK58u4bihfvpnWBmWNVZ
         gNzA==
X-Forwarded-Encrypted: i=1; AJvYcCXop72oDUYexXSaTXy28a63NT/KcnYdxcCmN/WSz4il/sJjR0rRvx/ndzxCgRz6HBeQW/Gd5/Dtl6bTO9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZBVtqP86eaqrD9vQAciEFrcujn/0P9n7KNx7ubBv6xCj7fkQP
	PMwRLBZglzDVq7TNvRPVXOSdMa9Mn4NYqwCJ0+foRCPtVi2OH1nPYOYXAdUwZI42ORDe7DdcP35
	gLzenYx8BiCnllZmNqYWA3ZjUtjfKxc4y3bchknuDezlXDK7p
X-Google-Smtp-Source: AGHT+IE/oc/HAm9IG5kgO6eR/a8fwts4cWo5GN9REx2rx0HLqhB+rySbI5V8ZFJo/ZXy8ADvGby0RlbyBDqx
X-Received: by 2002:a05:690c:4801:b0:6be:97e7:ff76 with SMTP id 00721157ae682-6db44d9fc2amr159966367b3.11.1725932655638;
        Mon, 09 Sep 2024 18:44:15 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-6db96501805sm236477b3.56.2024.09.09.18.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 18:44:15 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 9EF583402DF;
	Mon,  9 Sep 2024 19:44:11 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 8E2C3E413D7; Mon,  9 Sep 2024 19:44:11 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: rpm-pkg: include vmlinux debug symbols
Date: Mon,  9 Sep 2024 19:43:27 -0600
Message-Id: <20240910014327.1726214-1-ushankar@purestorage.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

None of the RPMs created by make rpm-pkg appear to contain vmlinux debug
symbols (though debug symbols for modules are left in the .ko files in
the kernel-%{KERNELRELEASE} package). This causes issues when trying to
run tools like systemtap against kernels produced via make rpm-pkg. Add
the vmlinux debug symbols to the kernel-%{KERNELRELEASE} package (at
/lib/modules/${KERNELRELEASE}/vmlinux.debug).

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 scripts/package/kernel.spec | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index ac3e5ac01d8a..f5d6ce95b4f0 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -60,6 +60,15 @@ cp $(%{make} %{makeflags} -s image_name) %{buildroot}/lib/modules/%{KERNELRELEAS
 # DEPMOD=true makes depmod no-op. We do not package depmod-generated files.
 %{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} DEPMOD=true modules_install
 %{make} %{makeflags} INSTALL_HDR_PATH=%{buildroot}/usr headers_install
+(
+	# eu-strip tries to truncate its output file, which does not end
+	# well with -o /dev/null. so output to a junk temp file instead
+	tmp=$(mktemp)
+	trap "rm -f $tmp" 0
+	eu-strip --remove-comment \
+		-f %{buildroot}/lib/modules/%{KERNELRELEASE}/vmlinux.debug \
+		-o $tmp vmlinux
+)
 cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
 if %{make} %{makeflags} run-command KBUILD_RUN_COMMAND='test -d ${srctree}/arch/${SRCARCH}/boot/dts' 2>/dev/null; then

base-commit: e3bf4ec9d54ed96fb3eb7dd53edcc9452897604d
-- 
2.34.1


