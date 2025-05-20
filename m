Return-Path: <linux-kbuild+bounces-7155-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 733DBABCBE8
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 02:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C499160389
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 00:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A341B78F3;
	Tue, 20 May 2025 00:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnO8P6ZZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66130B644;
	Tue, 20 May 2025 00:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747699737; cv=none; b=ZcUwjf+e8OlUUjvcfWy00hwBhnOQBngAOHmxf4cMhnrSo62OtUYVB+yIN0PeV+H4o2JrKR+pHMRnjYFrlzpwap5TccWQ2OB+fPob4N7Q+KX/d8UkQMtrhfXCVoTadVfStBbW0RFoE8kezwI9tUPjMQT4QlHLN4NdsOLiFDYeCS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747699737; c=relaxed/simple;
	bh=rQJND3zRGI/bhZQWN9vYbpanxR/d2/v+qroESA4G6EQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=U4dD8tekkul+b30iwGe/3KJQX/zz+t6Pd0gQNTgyr8hvcpA4Aod6B6t2QrxPT1fNTQ6kG95bOPxJnT6vkGg2uzxgwALwGUZOmLWXE6HguOZqT99J4oIyP69ynhii+a6cKPRD413+2Q7a/n4e6FbMLo5YIraNGR8nheYS/91HKNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnO8P6ZZ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74068f95d9fso4560162b3a.0;
        Mon, 19 May 2025 17:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747699735; x=1748304535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+I/XtX5UL4QjFc3rQ1Mg+38x+bvcwlpWsXePaJ4Tl0=;
        b=nnO8P6ZZHV4cgg9XDq4HN5phomdxsAzEP00s4G7NXPasA04EEGeTble86bVy9Bs8Pe
         CRhmzVXUtkcWZ6xDXZXaKcbEWlBXnym0zo89pSxnGWb2pgIjBQIHU0SF2eVUbMbTfP6Q
         r+Azupm2S5RNziaPZ3xRHvD7YoteylHQsevpo72dqhvsKMqZScEcdKBBjGRC+KYw/CJE
         BI1tFsVMCMSqXb8NypDbzl78wINBIRWS6CSivgjdMBBx6k3R4oAWtK4wqMUt7gdmUgvO
         yI8l2mXq8YP4/BlU1NToWBPfbaZg1iDFLmxXATcWG/hQBeWcJvEkcu4GF3ZykkE700/C
         0P7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747699735; x=1748304535;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g+I/XtX5UL4QjFc3rQ1Mg+38x+bvcwlpWsXePaJ4Tl0=;
        b=Gy+8lCXvxRHaqYmUrgS4/AJKU963DgWaKYtNgFsgnADwBDQlyScgWMaiYGbvU36n+F
         X+ofD521TF8rJOU0284FwwjHrMUZq1erXtwjBhRpkuLg53kby+wruGAyQhxNoAN/0AvZ
         /Wda/I+hKKCpBTmz0wvQn2oKm06TTgKQgRRxGjLzsQNb5mUxCZ/CRP5XGP3V5lnNRY4w
         j98Qu/SID5TTr7TBQ+FNHrSdZV27r2K8pjbCPaHMssc7u80b06cTSaA7l4aUMXOQetgj
         QlwtyJ/MwYLgPnx1AWOWfZHKHTYA3d/PcKeBhMsyyYOIOnpQl1hvMQqGrZpawAgYu1rb
         k4gg==
X-Forwarded-Encrypted: i=1; AJvYcCVFJEN+fhp8mf4OdkrjILhQkVexuyX6k5psG2OZqZqLWGcjtKK2NAHpr8Io8FGyDBsG69MTbI5d9PI4vhTP@vger.kernel.org, AJvYcCVHd9K4pcbSEhWMxfSaNtv6vkHIljWbpkcYcP3aieMcNfvS9eDpepFQApQ3/YKFMpKYhBycqvo7zWg=@vger.kernel.org, AJvYcCWTowBh3ayLf5PHgUWzWXzmDMP5abQ2dMlMins0mhMWRL/xXT6nSEsMiQjonivRZSz9Dyao7bVzZqDf9G/h@vger.kernel.org
X-Gm-Message-State: AOJu0YxS2MvBNqCyjwgEsp3reR7qTBnrxs4SphiO1tXf0pIMk3s5n2SG
	h3eKHnNLDpQxOVdEJGT0m04ueFeQ7zEPAD1s5Ldv7mmrLlwVR/yJWZ8V
X-Gm-Gg: ASbGncuazji+rN6FAZ5Tk125hvoAyjDxzUnxaxAMcYM1G7KuxMPM6peLrLTX3i6e6tB
	UHdqDq7Rltc5P+13utUjc+axEexJigeeqMx19Zn3JmvO0IPdZqNzxwN2DjbvDkwiWMXQbd2x/Gb
	iNgIFYMUCnvfUrgzKIRocE4W03ZsOFTBxAkz2qqJNQnHT34/hTc7/Wai54C114QS3WnOZQO0dWz
	xaXGWRWiMpi76Hr3k6Ayprw3ICFVBznzaBZALno3nix8ddgeAnrYZBz2iFgri3S7lMcycK/UMO+
	fMm5B1bTeIKkoMSXl71rhh5aLZIqZKwIzBsvGx/U00OhVyvS1pR+HC8Hi/P6YcEfNF9cBi+nEMS
	pZwLViUiv/je/L2p37+iz7g==
X-Google-Smtp-Source: AGHT+IHlTR91hd6ZzG26vEXQSvwMiQD8RFbYpAkHs1v0OVNua0WTHI4LzdtzC330roI18jGKppfCJg==
X-Received: by 2002:a05:6a00:990:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-742acc8e959mr19480802b3a.2.1747699735481;
        Mon, 19 May 2025 17:08:55 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfafbsm6798967b3a.4.2025.05.19.17.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 17:08:55 -0700 (PDT)
Message-ID: <d9d0ff79-a243-456e-a7ed-eaca69d2eca7@gmail.com>
Date: Tue, 20 May 2025 09:08:51 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Makefile: Get back to kernel-doc.pl as KERNELDOC default
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Recent conversion of kernel-doc into python has resulted in a couple of
glitches in "make htmldocs" [1, 2, 3].

This is because the python version has not gone through extensive tests
such as fault-injection of erroneous kernel-doc comments and/or
kernel-doc:: directives.

Python kernel-doc as it is does not meet the usual expectation of
backward-compatibility with its perl predecessor.

Get back to the perl version as KENRELDOC default for now.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/20250508182504.418552ef@canb.auug.org.au/ [1]
Link: https://lore.kernel.org/20250516193436.09bdf8cc@canb.auug.org.au/ [2]
Link: https://lore.kernel.org/20250516200350.63be46cd@canb.auug.org.au/ [3]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
This one-liner is just a workaround, hence no Fixes: or Closes: tags.

Jon, it looks like we are running out of time for the upcoming merge window.
Let's take another development cycle for stabilizing kernel-doc in python.

Additional notes on glitches reported so far.

* Depending on the version of Sphinx, the crashing message can be useless
  for finding out what is going on [1, 2].
  With up-to-date Sphinx, the message even suggests a *bug* somewhere in
  Sphinx and includes a traceback to be reported as an issue at upstream
  Sphinx [4].

* The python version of kernel-doc fails to produce warnings on innocuous
  issues under Sphinx runs [3], which have been available with the perl
  version.

[4]: https://lore.kernel.org/879b49f5-7350-48e8-a84e-2c580a5b0ca8@gmail.com/
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2a05988740a9..c2c9f5af4986 100644
--- a/Makefile
+++ b/Makefile
@@ -460,7 +460,7 @@ HOSTPKG_CONFIG	= pkg-config
 
 # the KERNELDOC macro needs to be exported, as scripts/Makefile.build
 # has a logic to call it
-KERNELDOC       = $(srctree)/scripts/kernel-doc.py
+KERNELDOC       = $(srctree)/scripts/kernel-doc.pl
 export KERNELDOC
 
 KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \

base-commit: a556bd882b9482f1b7ea00fcf07f9bc169f404c8
-- 
2.43.0


