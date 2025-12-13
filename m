Return-Path: <linux-kbuild+bounces-10091-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A587BCBB055
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Dec 2025 15:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 579853001BC8
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Dec 2025 14:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A772FFDF8;
	Sat, 13 Dec 2025 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejnh3FEE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3921942AB7
	for <linux-kbuild@vger.kernel.org>; Sat, 13 Dec 2025 14:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765634970; cv=none; b=t37LuwmbMUjIckxJVBr/vd7mk4dfWTLl08i63AI/1fgyc3quyYPGoCq/xqyTO/wWQr5p6Y0ZuGLG2t2DchVAK+ZPkG+kdnmJmfe3qkVjsEQk3Idf0KLqex/51j19yGd75kFjgKN/VwYu1f7wYDBWT5jPbxCycCGVxm5EHPZtjx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765634970; c=relaxed/simple;
	bh=wxU+pZ1SQMAvOOUNDxytX9hTksCcyvQLVHAYow6z1HA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OurQPGiIsxbV8hxBlWNyKoaqyQF+YJjp1+7QLSxie8L77KYKir4dUiPLw2KYGKOEPWYJ+ukGYglLoJfUTE3PZPCbBg+Ay8HdHWE5RgjXTV/o5YcOcWA9aMXmVxVJACyafzSUU9bepnTr6wioTzbVtU0cJRP9pmtjUsXgEjsmXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejnh3FEE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so25881615e9.1
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Dec 2025 06:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765634967; x=1766239767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vM3/qwju6TUB5rKPxQvw8v6N+bpFadF0DoVs0x+xuQU=;
        b=ejnh3FEE1RSjYluBSVw7DHtgXqVP/Tkgehg5U2LLCtPChhbzqdMOWhP6Z2SlIrFkgl
         /m4uWbmQ7wXGLt/2I1excb5gX7Efg7UxxMc0IduxbyvRRcy3yOd30akfN4M87P6PB0t+
         K+MwcKvl/AVBwK2A1bmZQlzgSF9op3oJKu9Un8u4cBFEw11u1u+zuoifiyWBTQWoxyXt
         XoggkV9n7t4LAveg3NtWskEiIw2/27PnM0GHU6hLVaFvS5aR5LYjkG5PVEmNbCHWFtzk
         fo0vH7Brm/TUV37jDxBouMB7iKJbQEpg5MbZh5hN6sayMx+4xrCMjG7ObzlNxHOabDUv
         v4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765634967; x=1766239767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM3/qwju6TUB5rKPxQvw8v6N+bpFadF0DoVs0x+xuQU=;
        b=kGjH8jtyVd+IPX87pSHbBiT7pB5Z0o/0KA67Cp2hXoegmWy/JOUqyw3SirufNFvEgv
         DlBp+Tcrl9brKmiWP+1kR7qy6rNdbcxP1QHEoxP2sWKC4ybrUosDofWGl9fI+7zbRgXQ
         PTfLy7gKBCPsB28DLYQ4pGWxICy+s+o7soIeo+HpEnycM4XxNxv39H1SBsFzzSeFZ3GV
         xWaZ9dXnLsh+sBjCfzgthuWHMHGyWSZ/H8HCekm3bgtyC+K1lr/OwhYwEyzXYalNEEWR
         cDTED4FqMy7mOm6CXyEx8x9HjIGWUDZRCa64kVPQL8E3SzVP/RsrIrnqcOfRL4OYDXkU
         /aWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUgMYIBjPmjWrElu0V0W9Zf10M5dagYKk1yIhlk6xN5lMZYSfvLITb6RxV+oG7FxwXVMnzLgGdxP41+fU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfOPs4LmP1F3rt/kAI79fL1m1nWLE8zFIc4FPjC98y+2u0Z2Ze
	ehkp+lcwNVTCt6gQnmj3MhBFuBUTUXfBcmy3uUVP138GiRXD/R+4x3TkInrX+WMZ
X-Gm-Gg: AY/fxX6DuDKbLoF5nU7sNkEdvXaKMwWAP6JjHyAAX2LG6QosXMqDEfkNqbM0PHyc1Lf
	qp8ivHR47W9uhhKQXufsB5lhVVWSN1dhRLu2Z4P8sztKkKu8SLTmIWMaocC/gD7c2wF9xckG562
	K8/xiXG2zG1larytwEBStkmDdbBD1sgJ7jRHlJpBsHgX/gPtSgqIsNhJWnX+ILKhHXufSamtopt
	Rl5k4JkOrxvsY6d3r5biuLT6ZgSOn63GsotNJlvMrjDkdyQB2wPfz8PZOE1AOFfVR3PUZyMpDLc
	OiqD68+3iAxXNr/o2FkPQfVPP8OOzQy/rFPNr6Ypu8IBiNtwSKi+BE1ph3rKA7n5f8rZSeW5/RN
	QO/BZBL7BoJnTMMbMxpfyeDsbE+k2JEvjI6YO4WFMXqu708i1pj306GSlAlfV+Jvl8AMquzRdNr
	yXKPog/IbTcPQ=
X-Google-Smtp-Source: AGHT+IG1q1j6s6LuLVMrMF+nfrclR+JSyI6ET8cqL/+xAgFlGvNlZfBuyKf0lgAWR7VgSwOZxHURQQ==
X-Received: by 2002:a05:600c:35d1:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-47a8f8bdf0dmr65038865e9.10.1765634967492;
        Sat, 13 Dec 2025 06:09:27 -0800 (PST)
Received: from fedora.lan ([2a0d:6fc1:2:c000:4240:b502:d22f:bb75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b17bsm89216945e9.2.2025.12.13.06.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 06:09:26 -0800 (PST)
From: Rostislav Krasny <rostiprodev@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rostislav Krasny <rostiprodev@gmail.com>
Subject: [PATCH v2 0/1] kconfig: move XPM icons to separate files
Date: Sat, 13 Dec 2025 16:09:22 +0200
Message-ID: <20251213140923.19710-1-rostiprodev@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review and approve this path. Version 2 of this patch fixes
two accidentally broken icons.

Rostislav Krasny (1):
  kconfig: move XPM icons to separate files

 scripts/kconfig/Makefile              |   4 +-
 scripts/kconfig/gconf.c               |  35 ++-
 scripts/kconfig/icons/back.xpm        |  29 +++
 scripts/kconfig/icons/choice_no.xpm   |  18 ++
 scripts/kconfig/icons/choice_yes.xpm  |  18 ++
 scripts/kconfig/icons/load.xpm        |  31 +++
 scripts/kconfig/icons/menu.xpm        |  18 ++
 scripts/kconfig/icons/menuback.xpm    |  18 ++
 scripts/kconfig/icons/save.xpm        |  31 +++
 scripts/kconfig/icons/single_view.xpm |  28 +++
 scripts/kconfig/icons/split_view.xpm  |  28 +++
 scripts/kconfig/icons/symbol_mod.xpm  |  18 ++
 scripts/kconfig/icons/symbol_no.xpm   |  18 ++
 scripts/kconfig/icons/symbol_yes.xpm  |  18 ++
 scripts/kconfig/icons/tree_view.xpm   |  28 +++
 scripts/kconfig/images.c              | 328 --------------------------
 scripts/kconfig/images.h              |  33 ---
 scripts/kconfig/qconf.cc              |  29 ++-
 18 files changed, 345 insertions(+), 385 deletions(-)
 create mode 100644 scripts/kconfig/icons/back.xpm
 create mode 100644 scripts/kconfig/icons/choice_no.xpm
 create mode 100644 scripts/kconfig/icons/choice_yes.xpm
 create mode 100644 scripts/kconfig/icons/load.xpm
 create mode 100644 scripts/kconfig/icons/menu.xpm
 create mode 100644 scripts/kconfig/icons/menuback.xpm
 create mode 100644 scripts/kconfig/icons/save.xpm
 create mode 100644 scripts/kconfig/icons/single_view.xpm
 create mode 100644 scripts/kconfig/icons/split_view.xpm
 create mode 100644 scripts/kconfig/icons/symbol_mod.xpm
 create mode 100644 scripts/kconfig/icons/symbol_no.xpm
 create mode 100644 scripts/kconfig/icons/symbol_yes.xpm
 create mode 100644 scripts/kconfig/icons/tree_view.xpm
 delete mode 100644 scripts/kconfig/images.c
 delete mode 100644 scripts/kconfig/images.h

-- 
2.52.0


