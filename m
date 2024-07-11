Return-Path: <linux-kbuild+bounces-2472-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D04F292ED0A
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2024 18:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53B5AB20EC4
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2024 16:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF1216D4DA;
	Thu, 11 Jul 2024 16:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OLak3lki"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFDA16D4DE
	for <linux-kbuild@vger.kernel.org>; Thu, 11 Jul 2024 16:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720716587; cv=none; b=Hxm4lPyKzi/f4k/2jN7/XukyjH1K5d/UEKPrhRzmoGw1ku+I98APFNsqqhGbdty5zcg8M1zM4NpNKJdHud/wCSarJa41OlO6mMjbcH4Av5PuPE3l1ZR64Efcq9M/BxOjbfasLaD/uOql/kBVEGktwuXlqhaKNue3WqiGwB0zW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720716587; c=relaxed/simple;
	bh=NWmqohwIRZylHC7WbPfEjileGYkGE1Y+HwAj07nPRRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s+JYD43MVJCLt2Dw5WcFSQmYWMzLhhhj9DM8B258F2yuD0Z2FRdLN1gKmLQNiIqun8r7+oVMbIPiuRIGSXHgHftwdKRFI8XO2bhAuGsTOwcqMsCzADxKtGmXOqZG5jCu4nYF4/Bd35/MQby/KlfdUeyX4p+IY4TrsYAPj9BeAok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OLak3lki; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720716583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yq+YuLYbn69og6JbDHnp1cGThbzz3E+7herJsur4YRc=;
	b=OLak3lkihgvOnYDMja0i01Vd+t/OQAOPCvkJYtL6Kovssg96RqLq9cuc8VujjqLxGqPieg
	jiVEuWSFd9c6TYyVndzm4Wfma6Co6DsoHfS/R0wuoibAvWEHO8p3nhRcD1rJQaXiqB7lOR
	YrTSkSx4L+uKfW9m98uUfBdhfSVN2Yg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-192-VnloZP8iOHSDZP49RfrR7g-1; Thu,
 11 Jul 2024 12:49:42 -0400
X-MC-Unique: VnloZP8iOHSDZP49RfrR7g-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7EAD51935863;
	Thu, 11 Jul 2024 16:49:40 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.131])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6342219560AA;
	Thu, 11 Jul 2024 16:49:37 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH] kbuild: rpm-pkg: avoid the warnings with dtb's listed twice
Date: Thu, 11 Jul 2024 18:49:19 +0200
Message-ID: <20240711164935.1369686-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

After 8d1001f7bdd0 (kbuild: rpm-pkg: fix build error with CONFIG_MODULES=n),
the following warning "warning: File listed twice: *.dtb" is appearing for
every dtb file that is included.
The reason is that the commented commit already adds the folder
/lib/modules/%{KERNELRELEASE} in kernel.list file so the folder
/lib/modules/%{KERNELRELEASE}/dtb is no longer necessary, just remove it.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 scripts/package/kernel.spec | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 4b7df76076c4..74355ff0e106 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -83,7 +83,6 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
 	done
 
 	if [ -d "%{buildroot}/lib/modules/%{KERNELRELEASE}/dtb" ];then
-		echo "/lib/modules/%{KERNELRELEASE}/dtb"
 		find "%{buildroot}/lib/modules/%{KERNELRELEASE}/dtb" -printf "%%%ghost /boot/dtb-%{KERNELRELEASE}/%%P\n"
 	fi
 
-- 
2.45.2


