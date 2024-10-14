Return-Path: <linux-kbuild+bounces-4081-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF6599CC76
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A46B11F22B56
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DDF1CAB8;
	Mon, 14 Oct 2024 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAgK2I6P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2004A24;
	Mon, 14 Oct 2024 14:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915240; cv=none; b=kiEz79ZKVucIU2lIext/z5mOlhs51mor6ePd+lyUDDbziS0YUzzNdEEtEt17RKNdf8L9dzA4Cy96qyFdF4O+uigExtO/7kVRDu45ND+dNV8mszoDsA0FB/iLpjvNUyynJ3O+YtzY2flFUaIfuWh/aL8ipplb/hoIzx0VQL949VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915240; c=relaxed/simple;
	bh=5/Z5dqyXg5jlFQ7ytpBrSMgGNpnlq04mCdJcYBztBPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBCGieEJgvDE72X860gmp6oZiCNkkw/EZGh7AIuenMfgmr1KtL7eheoTidySmIyPgAQhqNe43hmJrNKCzMtKMNOygtEa2XOE0VNK5VQMb1FtFC0N/7O+7rR/D5hcKly162pdTIW/nVT4HM3qrNa8XHxXerNNeF/tME9W2yeQzdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAgK2I6P; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e35f08e23eso18754207b3.2;
        Mon, 14 Oct 2024 07:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728915238; x=1729520038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ElJpmFDBIcg9p0cl22GstqdvIhCGOnOiusM5ikdJTOo=;
        b=mAgK2I6P7q/MTfIAriNFCQ69aaVbrUre3tp3oOjqS1N5wqZO3j/Mdg9W9zV8Tp2UrP
         vzvPSapUV1zuFGLIFycBeCHbpGOikPrpdRBOQF7oZErGeVJEyvcHvIYuz+fafBI3Bwvo
         gwaJQOpi9nyvUWq8N+0TqAIoAUqGseqvKtDe7aiQI2N5v26sGw7qQGDYyH2WiyHkRwRS
         xgO1/2PImh9eJQOi7FV67vrFzIF62A0ANz3WFTYQvvDgL+hB2FIZSAF8t0sUYiUh1eiF
         HFmRsKh+GQ0Ju/69NIzNxxZCvMElWxVhjTa6m+vOwNl/rOrhaalbsgIyvKN/K+OQlp/J
         Fakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915238; x=1729520038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElJpmFDBIcg9p0cl22GstqdvIhCGOnOiusM5ikdJTOo=;
        b=Fi/p60Z9zgIRRgt9M0nMuTAlhj8h0djjCufcsZ2rVWEEQRt1m/ig58MggxpCCEbyTH
         yXb/ok5sR6uDuDYboNtZ/mBZht9GNtFLnIVOxhL8oSk9hi93Ff/5NK5+Wuk2PSv05A4K
         lGA0nhgvnB6YbEnX4v2CPt7jdtYOWkxw0OMVk2gjlR2qv35HDY8A4PCj86s4oNylCN0x
         1Xne7JQatLm/KQwn6mqs6/lzLPwW7ukBhpSH0yFmDZgiFvGfMgHczhMAC3s4WaQoXRdG
         YclybmPDfExbzxov6jp5Pfa9O3OEugutfNebCycesMMdCOL7cMtozBVONckbfta2En3b
         AK/g==
X-Forwarded-Encrypted: i=1; AJvYcCVCstvJhKwtrvq3b7GOho5Q/i8Tl7dtbH6A8eDrLVQtUYh+teccT2iPJjH9jwH5vBF0RbrLI5ndXWyoyyk=@vger.kernel.org, AJvYcCWMYB5qxNvwQd9x104yn59QtpgC0nNUKepH80fkMGYk8d9GQocYsw2fn2bd6hxWHahbKgQIY/A/ZBoRteFG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2YbKr7q4HJ8GSfEZGilhtOqJeOKOI21SdjJh+Vna6VMbAr492
	AMa+A/VNNDDV50RfNFTbJpkpovt55Ha5QxXmmAyrfWkaMODse/A0E5nfkQ==
X-Google-Smtp-Source: AGHT+IH/nC4Ue/xZxNU3z9NFFzoJiHUphoW8a5/ow/otYBcWaLdrADrXXI8TLgrZgBDnQAPqTlCIrA==
X-Received: by 2002:a05:690c:d8a:b0:6e3:39c1:1692 with SMTP id 00721157ae682-6e3477bfb3emr80363407b3.6.1728915237720;
        Mon, 14 Oct 2024 07:13:57 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332cabeeesm15528337b3.131.2024.10.14.07.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:13:57 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v3 0/7] streamline_config.pl: fix: process configs set to "y"
Date: Mon, 14 Oct 2024 10:13:30 -0400
Message-ID: <20241014141345.5680-1-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An assumption made in this script is that the config options do not need
to be processed because they will simply be in the new config file. This
assumption is incorrect.

Process the config entries set to "y" because those config entries might
have dependencies set to "m". If a config entry is set to "m" and is not
loaded directly into the machine, the script will currently turn off
that config entry; however, if that turned off config entry is a
dependency for a "y" option. that means the config entry set to "y"
will also be turned off later when the conf executive file is called.

Here is a model of the problem (arrows show dependency):

Original config file
Config_1 (m) <-- Config_2 (y)

Config_1 is not loaded in this example, so it is turned off.
After scripts/kconfig/streamline_config.pl, but before scripts/kconfig/conf
Config_1 (n) <-- Config_2 (y)

After  scripts/kconfig/conf
Config_1 (n) <-- Config_2 (n)


It should also be noted that any module in the dependency chain will
also be turned off, even if that module is loaded directly onto the
computer. Here is an example:

Original config file
Config_1 (m) <-- Config_2 (y) <-- Config_3 (m)

Config_3 will be loaded in this example.
After scripts/kconfig/streamline_config.pl, but before scripts/kconfig/conf
Config_1 (n) <-- Config_2 (y) <-- Config_3 (m)

After scripts/kconfig/conf
Config_1 (n) <-- Config_2 (n) <-- Config_3 (n)


I discovered this problem when I ran "make localmodconfig" on a generic
Ubuntu config file. Many hardware devices were not recognized once the
kernel was installed and booted. Another way to reproduced the error I
had is to run "make localmodconfig" twice. The standard error might display
warnings that certain modules should be selected but no config files are
turned on that select that module.

With the changes in this series patch, all modules are loaded properly
and all of the hardware is loaded when the kernel is installed and
booted.


David Hunter (7):
  streamline_config.pl: fix missing variable operator in debug print
  streamline_config.pl: ensure all defaults are tracked
  streamline_config.pl: remove prompt warnings for configs with defaults
  streamline_config.pl: include tool to learn about a config option
  streamline_config.pl: fix: implement choice for kconfigs
  streamline_config.pl: process config options set to "y"
  streamline_config.pl: check prompt for bool

---
V1: https://lore.kernel.org/all/20240913171205.22126-1-david.hunter.linux@gmail.com/

V2: https://lore.kernel.org/all/20240916142939.754911-1-david.hunter.linux@gmail.com/
        - Put in subject.

V3: 
	- changed the order of patches 
	- removed a patch that was unneccessary
	- added a patch for a debugging tool  
---

 scripts/kconfig/streamline_config.pl | 130 ++++++++++++++++++++++++---
 1 file changed, 119 insertions(+), 11 deletions(-)

-- 
2.43.0


