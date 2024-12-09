Return-Path: <linux-kbuild+bounces-5043-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EB69E8D72
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 09:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0E2918852D8
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 08:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D2D136357;
	Mon,  9 Dec 2024 08:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=limbasan.ro header.i=@limbasan.ro header.b="dYQ+itOD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC0B22C6E8
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Dec 2024 08:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733733107; cv=none; b=mPo7cpNBIwFcXLo96puNXWA4dJ02AAfJC+YKCnSAiK1wpPiqmu2O7rfFUulolMfif9VVDucLf4mXhNHYQY5ryahH56DSwc66yAs4edn4g2fPGdzzNqTtacVSnQq/2aadOXe2D7OEq7bDn6AskUWeBF2omTpN7EvIJFoGYyJRbTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733733107; c=relaxed/simple;
	bh=7JumrFZPjiuAajyzyI3QUHbt42fwE5hgHfqtVgixtXw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=vCgPG3LpHOvIg+eKQTa1UCnds1+eMsnvslXqUYFCbSyk7bGTv0VqH93gTUafbK438YwNHPb3W6ifINoAHr3yhDg3jJ5oKCsnqdmcwbwcWG+fk7ZHzZA4VDxJH8ztWvmc3VL2SlFa3oMgrjsuJGvqAlYTZV0r025nDFE9Xw/WyC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=limbasan.ro; spf=pass smtp.mailfrom=limbasan.ro; dkim=pass (2048-bit key) header.d=limbasan.ro header.i=@limbasan.ro header.b=dYQ+itOD; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=limbasan.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=limbasan.ro
Message-ID: <b7bb8d16-2d05-43b5-95fc-7d303b925f44@limbasan.ro>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=limbasan.ro; s=key1;
	t=1733733100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hYiIB6sZ7uNO1d062xzX1A3B+xh/nFMYFJ8Tnp58nnk=;
	b=dYQ+itODe1YozlQBfpO0R+ZfXw0JA61Fx7W691N8inye8QsOtHAvRBiLO9Imb5hvq39SCD
	nxw/7D2rhk8ZVd0gpwzQsYcZVaXfZaoHSPmLCucZXrfY9Qt3acwwcS7brmLmSfBotIAzPb
	T08HFhUDQIpjizZiV169ILTVCn/E/0LBhw7Z/ZojhQkVqWXV1BbtpmLi9aK3b2+qhnZOLt
	JCOUfY3JoI0Eoqau64aN6UMq3R2OR9oSbntJYxlqaFDccLLexK+L6oz9Ed3BJY+beUD2BV
	DVMx8dByePRUz2IXXIiD33YI22I6Bb3ml9u2CUKjJSniT07h439p51SLGXU5Rg==
Date: Mon, 9 Dec 2024 10:31:31 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?UTF-8?Q?Mihai_Limb=C4=83=C8=99an?= <mihai@limbasan.ro>
Subject: [Bug] 6.12+ DKMS modsign breakage due to missing .config in Debian
 headers package
To: linux-kbuild@vger.kernel.org
Content-Language: en-US, ro, de-DE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi!

Would like to report a DKMS build system impacting bug with kernel 6.12+ 
introduced in commit aaed5c7739be81ebdd6008aedc8befd98c88e67a . Hope I'm 
addressing this following proper protocol by mailing linux-kbuild, tried 
mailing the maintainer directly on 2024-11-20 but received no feedback; 
my apologies otherwise, it's my first kernel bug report.

Specifically, the commit changes scripts/package/install-extmod-build to 
remove the shipped copy of the kernel configuration as .config in the 
generated package. Unfortunately, this breaks DKMS when secure boot is 
being used and any locally compiled the modules need to be signed. DKMS 
needs it to extract various characteristics of the built kernel, among 
which CONFIG_MODULE_SIG_HASH so that it can sign the .ko files it 
creates. It's likely that it also uses various other symbols from the 
kernel config, e.g. clang-related stuff, but I didn't test that.

The removal of the other formerly shipped files doesn't appear to cause 
any problems, at least not in this scenario.

In detail:

DKMS sets its path to the kernel config into the kernel_config var in 
this function: 
https://github.com/dell/dkms/blob/93bf2bd79704c0a8a39b240a52b001610cdc419b/dkms.in#L274
DKMS then uses it to extract CONFIG_MODULE_SIG_HASH in this function: 
https://github.com/dell/dkms/blob/93bf2bd79704c0a8a39b240a52b001610cdc419b/dkms.in#L1021
If kernel_config isn't set, the build process issues "Kernel config 
${kernel_config} not found, modules won't be signed" and skips signing 
the built .ko files, subsequently resulting in a runtime failure to load 
the corresponding module with "Loading of unsigned module is rejected" 
when secure boot is being used.

While it's possible to supply the path to the kernel config manually 
when invoking DKMS, it would need manual intervention after every kernel 
header package installation. This would be rather clumsy and 
inconvenient compared to the current set-and-forget approach where a 
kernel headers package install hook auto-builds and installs modules. 
Unfortunately there's no viable workaround via a config snippet or any 
sort of build hook, DKMS would need to be patched to somehow figure out 
the relationships between the installed packages and the various kernel 
config file placement conventions across distros.

Is there any chance for .config to be shipped again when generating the 
headers package? This would be a simple two-line change, restoring the 
shipped copy of the kernel config. I.e. something like the below. Have 
tested that patch and can confirm it restores proper modsign functionality.

Thank you very much!
Mihai Limbasan

diff -Naur linux.orig/scripts/package/install-extmod-build 
linux/scripts/package/install-extmod-build
--- linux.orig/scripts/package/install-extmod-build    2024-12-09 
10:28:03.000000000 +0200
+++ linux/scripts/package/install-extmod-build    2024-12-09 
10:30:28.871498366 +0200
@@ -76,4 +76,6 @@
      rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
  fi

+# copy .config manually to be where it's expected to be
+cp "${KCONFIG_CONFIG}" "${destdir}/.config"
  find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete


