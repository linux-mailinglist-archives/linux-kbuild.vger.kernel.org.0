Return-Path: <linux-kbuild+bounces-3285-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ECF964795
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 16:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3EB0286DA3
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 14:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9571B0117;
	Thu, 29 Aug 2024 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cybernetics.com header.i=@cybernetics.com header.b="aqh0TVv8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.cybernetics.com (mail.cybernetics.com [72.215.153.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF01AED4B
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Aug 2024 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.215.153.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940339; cv=none; b=HevdLFVlMoIHjn3CoeWcPPPN3dC8YEjv1vu7D8o211stHyA/u0ugo1zhQ77ypdUECgEI09roIuhMOr3JM2U4gCMaDWF47HpkkzXg4Plso+dh7Lz17o3M7JaFXfjcWUD2YHXlQWy9uYCPoafamXlZEjoZ96WscPuEzJ1mfzBMxlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940339; c=relaxed/simple;
	bh=WS7AE2lZ80ktgxKFgI1HSIZKX9yTyxehsQ541Zemgss=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=qHDWnZ748+tWTNoaHeCwxKgZPuJTCkZb+wnm60xFOYm9LCPOApMJEGmnZedXUO6tjCP/+qfedcr0lg/NtIuGMH5ep6kymeAo+8UrCWctYt5+9eKmEMkZDNBZwj2UcQxz5rcDk2RMmi42WdFZiL9XDVNeKFRa4ZpjxQgDjjM0H0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cybernetics.com; spf=pass smtp.mailfrom=cybernetics.com; dkim=pass (1024-bit key) header.d=cybernetics.com header.i=@cybernetics.com header.b=aqh0TVv8; arc=none smtp.client-ip=72.215.153.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cybernetics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cybernetics.com
X-ASG-Debug-ID: 1724939577-1cf439709d530220001-Th18ZX
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id LgcrnbZSKlfGqkXR; Thu, 29 Aug 2024 09:53:19 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=Fn9M4a8qPT1jW0s9JHYJms7eiaAIoJs0KI1NmmFglss=;
	h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:Content-Language:
	MIME-Version:Date:Message-ID; b=aqh0TVv8DopVDHFyZSPRh8FeqaPijV5iAejsBrDE2c/+M
	zaCc5AiCQD5oRyyZod0ZrLb8RkACPAy3W25dMSPCQVQ1uprwoTxkW2Vqw7ZfVxz266AmF1qWoKWAK
	vbO5ZwxOnSwHp0uplHQqZ8IzzJ3PuxiBB5EHjMcU5Vng7vxbw=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 7.1.1)
  with ESMTPS id 13430318; Thu, 29 Aug 2024 09:51:25 -0400
Message-ID: <d65e598f-4d3e-4092-bc39-16b636181708@cybernetics.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
Date: Thu, 29 Aug 2024 09:51:25 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas@fjasle.eu>, Daniel Gomez <da.gomez@samsung.com>,
 linux-kbuild@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Tony Battersby <tonyb@cybernetics.com>
Subject: [PATCH] kbuild: remove recent dependency on "truncate" program
Content-Type: text/plain; charset=UTF-8
X-ASG-Orig-Subj: [PATCH] kbuild: remove recent dependency on "truncate" program
Content-Transfer-Encoding: 7bit
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1724939599
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 0
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 939

Remove the recently-added dependency on the truncate program for
building the kernel.  truncate is not available when building the kernel
under Yocto.  It could be added, but it would be better just to avoid
the unnecessary dependency.

Fixes: 1472464c6248 ("kbuild: avoid scripts/kallsyms parsing /dev/null")
Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
---
 scripts/link-vmlinux.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 070a319140e8..c27b4e969f20 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -215,7 +215,7 @@ kallsymso=
 strip_debug=
 
 if is_enabled CONFIG_KALLSYMS; then
-	truncate -s0 .tmp_vmlinux.kallsyms0.syms
+	true > .tmp_vmlinux.kallsyms0.syms
 	kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
 fi
 

base-commit: 3e9bff3bbe1355805de919f688bef4baefbfd436
-- 
2.25.1


