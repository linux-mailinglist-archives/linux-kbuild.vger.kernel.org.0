Return-Path: <linux-kbuild+bounces-1905-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F17B08CA82B
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 May 2024 08:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96C411F2233E
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 May 2024 06:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCFC4F898;
	Tue, 21 May 2024 06:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="famkuEae"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1482647A7C
	for <linux-kbuild@vger.kernel.org>; Tue, 21 May 2024 06:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716274277; cv=none; b=sgWPWkduUbHZ587+YdSTK40eSGGH4moOnX/l+LFZV0O+vV0ouh0tn9nGFnUk3cFr3+CqmLeKE2HXZ1fIvebsKU1Xd6YEN73KY2AvpHY3grH2HoYFa4j+LLB7/fUiYvPNB7si3iug9wFfmukyCwERWGkIVYcmNvbm0gnbBjebHDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716274277; c=relaxed/simple;
	bh=FPAN5JneroMF+17jT/HJqgQ12pCIyCdlzPvjpoqycpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DTNyLGKpgJlXfRKDFcozJF3r5aJI8aBGH9BYkEJ/JOmyZ3bYJkxTPnSF/uOFuFORnE/fk4W9MuT5K/hbI1TVls53EFdueOXqra1PuoidYR6BEl5W2D+ahpMwQmrrdvz/CViH5BwAKFC/07HQki1QEt6mvqPP9vrwif1hhoDy9dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=famkuEae; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1eca195a7c8so96782275ad.2
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2024 23:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716274274; x=1716879074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+6svnync0RfC0DOTaEmb8czwD+Bve7L6N10o2QQ8WLQ=;
        b=famkuEae7iOT3yjztIAyhrPElIPyxrF7YXH9vPyYbGfXYGe7/7tTx395UXYNcc/XP+
         CfL1rIn7ReDxIPNvmP3tC1XY9MxE4P567f+VBf2BfRhEEXLtwphFeGKY1Zz8DvAUdphg
         sird7fsq8jevwWCruytlEmZfb8qkLGtaTmCr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716274274; x=1716879074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6svnync0RfC0DOTaEmb8czwD+Bve7L6N10o2QQ8WLQ=;
        b=LZ8YhBI++k893KKYJGinSjC2q+ZKwD9RNBcklrt3yZJravncJ2TjtF9R3/Y+F1MIud
         ZR76xcScexiIlXaQAut9gUXaWSuqeJxPdHI1ryBFdgtjPE/ahD5B22F8Fcmcc80nZhDN
         Fia+pY2ePCYJSBKutQzc35ippeD8VdXz23VltcdetCVd3UMOVA1vNKoiTs6tIwD23OKe
         gmkkjPb1z6DJCD9UIxcRlWrxDPBCEA8WcWC9QeOUGl1/ArWdsyRmi9CmwN6sc6KwTIDy
         nqQNeBO+eqHeEBTMCC8aChtk6+N7abC6YDaDfhPMi+aBjIbbiN4Aoylrn0hjA06BjjC5
         vqWw==
X-Forwarded-Encrypted: i=1; AJvYcCUeZ0SvMs5K9V58jLtm4TTw29gHiu7kVVnSZ66pzxB6AUPecMzCs9XkVvwRweIsfpGEuwdiF1f7O2DWtaaA/lUzoTHZxCm5UVVQkhS4
X-Gm-Message-State: AOJu0YxXGYyLrZR0DlWLx+Ez4otx6pQERDVwPSeMtEE0N/2S0YLI3458
	iDRl2KoPn0/E+zIGrAC/o5gou/aHRnQhMNSVN+VF+GI9uohw2cBxNwHw2hbc8A==
X-Google-Smtp-Source: AGHT+IGBntgad+pBk71BTXd9vec3SRY2vdF7WUbaODGmZHm0TI1Oy4GbDTX3v072D8870aHsVC4znQ==
X-Received: by 2002:a05:6a21:3391:b0:1af:59b9:e3ed with SMTP id adf61e73a8af0-1afde0a8d75mr33093129637.5.1716274274376;
        Mon, 20 May 2024 23:51:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f8a5:77aa:5a0d:e30c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f30644ad48sm23100985ad.169.2024.05.20.23.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 23:51:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Simon Glass <sjg@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 0/2] scripts/make_fit fix and disabled compression for DTBs
Date: Tue, 21 May 2024 14:51:03 +0800
Message-ID: <20240521065107.30371-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Here are a couple changes for the FIT image packing script. While
unreleated, they are sent together because the change context overlaps.

The first patch drops the compatible string property from the fdt image
nodes. According to the FIT image spec, the compatible string in the
(fdt/kernel) image node is used to specify special loading mechanisms,
and is _not_ for identifying the DTB.

The second patch adds an option that disables compression for _just_ the
included DTBs. This is needed for RK3399 and MT8173 based Chromebooks,
whose firmware does not support decompressing DTBs, but does need kernel
image compression to fit the image within their relatively small image
size of 32 MiB.

Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (2):
  scripts/make_fit: Drop fdt image entry compatible string
  scripts/make_fit: Add option to disable compression for DTBs

 scripts/Makefile.lib |  1 +
 scripts/make_fit.py  | 14 +++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.45.0.215.g3402c0e53f-goog


