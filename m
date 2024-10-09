Return-Path: <linux-kbuild+bounces-3986-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEE1995E02
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 05:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62F341C22014
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 03:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1928143888;
	Wed,  9 Oct 2024 03:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=illinois-edu.20230601.gappssmtp.com header.i=@illinois-edu.20230601.gappssmtp.com header.b="wa69CmdS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648C376C61
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Oct 2024 03:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728443882; cv=none; b=aLhALWH4hZNlrKIEbJ87Xt8S8AXMNeYUR9TZGhowr/nQxcB+5EeA9r6T/TqvDdWfHC8YNifMvXQtE2sgV/01W7QSnkQDiyqMVB+LAvnwKCr6po1OyTXCOAg3DziiokeUajBgOXwFv6Dd4ShXzdgpGFLT432Vj838wQ68+YkbmxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728443882; c=relaxed/simple;
	bh=qeTeiqxFgtHkrwd4+T1jN4x/0VgEwAW/vhJtPYAJgZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjIYi9/lLewWW82SfQV5/SRlABvrBO1OaKqM+EusNpkPSc67xQmcmtrZAXxXfdjcP2Hp+q6ikOjz3j9dQT2hbsR4GtSbTi5TeKSOYmmV7x4S1lOzTIjF/8w22lM0AfCq1/2/ekM6mou0GQMzbG5cCWtybSpJVSDr4nzgP0cS0a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=illinois.edu; spf=pass smtp.mailfrom=illinois.edu; dkim=pass (2048-bit key) header.d=illinois-edu.20230601.gappssmtp.com header.i=@illinois-edu.20230601.gappssmtp.com header.b=wa69CmdS; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=illinois.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=illinois.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6cbc28f8e1bso7907626d6.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 20:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=illinois-edu.20230601.gappssmtp.com; s=20230601; t=1728443879; x=1729048679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thDgyfP+u4RJkN9ygN4eA5i7zuNDmPDTp6v1MVROO00=;
        b=wa69CmdS+fP1ESd5aPOx58BtaPjiJwFfHFffIKMyKxRf6muMjFyvOT6wRLP7JrQhPt
         CNBkCsBvWbIK5lKoaT0Y3WafBCiTSC9ihiRDkZ3Qr7tfFSx9c6V6aOQwfYqcR1POLgVw
         zKxWJAQPg5TM059dkeD7wA07AY3flsS+9ul6EetWV7be71gLebJ6MRAVJAI56qAdvDR5
         y7mL7cSOrpuXSPnMbYLEPyh/w5gDGeL99tBXMYrqZjBuhxjKAsCK3g08OMJbgnGZBdzj
         JmQauic/fZsSng8X/qQDsYRg0uD0YprcGCvnjyLS2FPC01cfKPLbltwolbXEluxyq7Kl
         JIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728443879; x=1729048679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thDgyfP+u4RJkN9ygN4eA5i7zuNDmPDTp6v1MVROO00=;
        b=g8o/7/yhkXYLJCKN2DSQU1VBTkdZI2QTLUS7sVRT+KqICC/7NS1nQ3UkUYbnY9KKe3
         y7qfGyNY4CEJ+GjviFbOp06tCshzUdh0it1cG4DNJblhrdbPWx+8qoQmGUQnbFQr/amr
         kdDEojTJcDYQtn54dOLyzrnoojcFBZ7zx5WCHVE9/CuyvQ4ifgk8eWe1BJFRKcliQxSy
         ayg7enlkG5rw/TN0cjJZkHLm8/4xvxNVxH+roM+Pjm/Y6bWVzy4i7kTsiNRXTc+nOoRH
         avngaPj39+XuEvraPt/6I2Q0zWBn6FdG8KycHcYna+qsSnsQHO8V1TMWGl32xlrFoGWL
         Ba7g==
X-Forwarded-Encrypted: i=1; AJvYcCXKkb6OmDtnWihgZhM/bpfEeBaq3R9u2zDeuCZxaz5Etlr4vwKBhjjgFKFOV1oTLDdfzfBoZ+M6TI0uCNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6kjQIigBJ8sF8qr3cAvqL5bKGoSlXFKZxi6yrlbBrliXSRvDi
	pX5xHL4pq0Ds9xPWPJlzkDThVb0gu9UIla2+mgJVIaJqXUN9pWRktYUSkFVj+w==
X-Google-Smtp-Source: AGHT+IEhn9w/MP0oB2WKldelhVAKmKiL1d/EbmMPMKgnT2doMp+iZMaSHOVIOpO2jisfYNBEVmkdXg==
X-Received: by 2002:a05:6214:5a04:b0:6cb:99db:bdbf with SMTP id 6a1803df08f44-6cbc95d4684mr18380106d6.43.1728443879197;
        Tue, 08 Oct 2024 20:17:59 -0700 (PDT)
Received: from node0.small1.linux-mcdc-pg0.clemson.cloudlab.us ([130.127.134.91])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbcaad37f5sm1820886d6.130.2024.10.08.20.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 20:17:58 -0700 (PDT)
From: Wentao Zhang <wentaoz5@illinois.edu>
To: nathan@kernel.org
Cc: Matt.Kelly2@boeing.com,
	akpm@linux-foundation.org,
	andrew.j.oppelt@boeing.com,
	anton.ivanov@cambridgegreys.com,
	ardb@kernel.org,
	arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	chuck.wolber@boeing.com,
	dave.hansen@linux.intel.com,
	dvyukov@google.com,
	hpa@zytor.com,
	jinghao7@illinois.edu,
	johannes@sipsolutions.net,
	jpoimboe@kernel.org,
	justinstitt@google.com,
	kees@kernel.org,
	kent.overstreet@linux.dev,
	linux-arch@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	llvm@lists.linux.dev,
	luto@kernel.org,
	marinov@illinois.edu,
	masahiroy@kernel.org,
	maskray@google.com,
	mathieu.desnoyers@efficios.com,
	matthew.l.weber3@boeing.com,
	mhiramat@kernel.org,
	mingo@redhat.com,
	morbo@google.com,
	ndesaulniers@google.com,
	oberpar@linux.ibm.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	richard@nod.at,
	rostedt@goodmis.org,
	samitolvanen@google.com,
	samuel.sarkisian@boeing.com,
	steven.h.vanderleest@boeing.com,
	tglx@linutronix.de,
	tingxur@illinois.edu,
	tyxu@illinois.edu,
	wentaoz5@illinois.edu,
	x86@kernel.org,
	chuckwolber@gmail.com
Subject: Re: [PATCH v2 0/4] Enable measuring the kernel's Source-based Code Coverage and MC/DC with Clang
Date: Tue,  8 Oct 2024 22:17:38 -0500
Message-ID: <20241009031738.2851980-1-wentaoz5@illinois.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003232938.GA1663252@thelio-3990X>
References: <20241003232938.GA1663252@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2024-10-03 18:29, Nathan Chancellor wrote:
> ...
>>> I was able to successfully build that same configuration and setup with
>>> my primary workstation, which is much beefier. Unfortunately, the
>>> resulting kernel did not boot with my usual VM testing setup. I will see
>>> if I can narrow down a particular configuration option that causes this
>>> tomorrow because I did a test with defconfig +
>>> CONFIG_LLVM_COV_PROFILE_ALL and it booted fine. Perhaps some other
>>> option that is not compatible with this? I'll follow up with more
>>> information as I have it.
>>
>> Good to hear that you've run it and thanks for reporting the booting issue.
>> You may send me the config if appropriate and I'll also take a look.
> 
> I seem to have narrowed down it to a few different configurations on top
> of x86_64_defconfig but I will include the full bad configuration as an
> attachment just in case anything else is relevant.
> 
> $ echo 'CONFIG_LLVM_COV_KERNEL=y
> CONFIG_LLVM_COV_PROFILE_ALL=y' >kernel/configs/llvm_cov.config
> 
> $ echo CONFIG_FORTIFY_SOURCE=y >kernel/configs/fortify_source.config
> 
> $ echo CONFIG_AMD_MEM_ENCRYPT=y >arch/x86/configs/amd_mem_encrypt.config
> 

Chuck and I can confirm the issue is reproducible these options, and we
are still looking into it. Thanks for catching this!

> ...
> 
> Another thing I noticed with this series is there is no entries added to
> MAINTAINERS. Who is going to be responsible for maintaining this code?
> 

We are going to add the following as the fifth patch in v3:

diff --git a/MAINTAINERS b/MAINTAINERS
index a097afd76..55438cb90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13262,6 +13262,12 @@ F:	include/net/llc*
 F:	include/uapi/linux/llc.h
 F:	net/llc/

+LLVM-COV BASED KERNEL PROFILING
+M:	Wentao Zhang <wentaoz5@illinois.edu>
+M:	Chuck Wolber <chuck.wolber@boeing.com>
+S:	Maintained
+F:	kernel/llvm-cov/
+
 LM73 HARDWARE MONITOR DRIVER
 M:	Guillaume Ligneul <guillaume.ligneul@gmail.com>
 L:	linux-hwmon@vger.kernel.org

Other than the booting issue, v3 is ready and being tested locally.

Thanks,
Wentao

> Cheers,
> Nathan

