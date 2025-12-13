Return-Path: <linux-kbuild+bounces-10089-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2055CBB016
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Dec 2025 14:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7687304A7CF
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Dec 2025 13:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663B03093AA;
	Sat, 13 Dec 2025 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3csYgqn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A702230146E
	for <linux-kbuild@vger.kernel.org>; Sat, 13 Dec 2025 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765632947; cv=none; b=teyoBQVFi+ltQL7ylX5y0TgOU65wV5nx+5uyjMvIWAzoPLPNq8BmCn0VJGYLGIbcCrpxQUJX/50F2vfTmWbw972fAy4Pe+dljtELEhrlRUJ5WINtFMWKrOqt9wfiHAmz234fAKORt7G9JHTLjHUy0OJRoOrIBD2JYNOcCxzYxUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765632947; c=relaxed/simple;
	bh=z7pRByr8Gc7Y1/seM7EzB2I+NLU1Xx+gLj3dGITviKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V69/9SUMjxkxyShFFcoNUIUsqoM6t99irgcH2hqmpQSFMnKO3U61lb1pMxBP7JKbAnwhwT/9WlounlybxHoxTl79wgNUXlXiR7gs/w/EJk+2qc/xBCy1j+FH+9Z/xZRQrXnZ0MAMFf20V1CAZnXl/OgsrgX6vGR0DwFYIzBQVrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3csYgqn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47789cd2083so11301415e9.2
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Dec 2025 05:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765632944; x=1766237744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rrZggitt8LpPPdBMczk/Vv8OyoRJ6T9goBY/g7UIL68=;
        b=Q3csYgqnhqoqTBfwb8YKjlWsNxcF5i+GiCZPs8QCMWhBn5JK5XRB+zkVyZF1mh7/NK
         vbDActiTo1rpIfwWtVefBdVCkwbJmX6NO5H8fsCk4Xfz9/hVHkLQGwN6DjVEwHX41Jcz
         fE8eqopanM8Kb0S4jF91rbZlYpTQZ6JjMbjcGWoVD8dEAPU4ROI6GzYDS6nlmSZ5fiax
         53mI1lxUMzSJ7Ka3E8NqlUOdODQoDJCdo9HekmhEqPjzqtxYfAP4Z0IPt+4QGGcOlCnU
         Z9Q4F+gL4oJC12o434zs3pljt5EpKDf+1Fv2NIEzh6n1x6TlidOZgSzRHpeUudrzTU8h
         Xf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765632944; x=1766237744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrZggitt8LpPPdBMczk/Vv8OyoRJ6T9goBY/g7UIL68=;
        b=Rnwfg6O+1smCvSza2NnwfS+cbOdPml761pQ0JPNVUzWQIIxGWREasBX79q/xG7lGUU
         x+f+v+FVce9ibBlBM6ytGIik+mpDpncfsu8yjahfAbMrAEDnbK0qw3SlyMyS29kE/bEE
         oRRIuN2F8ZASIA1ICvUvgRUeTIGbXPuMHTWsNuyJV0CsyebKmzNrch1yKFBSMu9t/1we
         0vlyD2wZ8djAeqW0Q8p3uwER6Sfoftfm86egFARFC8FjaUtHGVg45qDuSXhkoxx7bGeb
         4Dur8+CePm8LaO98sqCfsDbkZV7g1+88pSNKY5OTrHXSIBpwqg1dV6uEK8tbPlGwdDeF
         dfIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdjWfZn1+0z7h/vJxdhKv2X/nu3bcYdIuXXo+GEhj8gveQMpiujp3sbBiIIBM2NfowHyieFunz8a06U5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/x274+eiY2hAp8xQHIzWcoZKMSeZL3I3Ez1HohLhpLv2Fukl
	IUrIDcjTWDccf+48Bjn40MOpHeK4aX00neqEDNPeDcygIBbJj7QChiNg
X-Gm-Gg: AY/fxX5MbwBFD47P4mQcyJ4oyTAK/PykaV7ewQzyE/w6TJdSfTzU3Il8Fmj8KLR3UDv
	HUJ3UggpAk2iEc+C4p+pkKKqo6A5ywfzG5Ao7lDULzyveLU+r+2VFxnjLwx1VGj8vqgC7DFq/Dp
	LA7Qch5vUyzyhcEgc50PNU6n2fpmGZ4rZvsKhdXsVppwC3XVjPUUzqUg5PGQg73AVRbXlxpt3Ms
	CaiOhhaPurMM8y6okq+p0k8dc7n4nRPo8Xf11w+rpjqCAfW5zhtCbcXpe0eKJYxbfBN2fug6FbU
	lAPub5PSDAdUlmqQDU3YKrje5KuIqDdTBH5fm4q+I4TgZPSAT8MXLeGI5aHZZEaSwlMn1DPoa9K
	KhYqlrKdRgaUeCoj0wgwZMQOplnAAUMhgDyMBY4m6rU0W7RCu3SFter0y0Oecl1PTeazTj20sn/
	J3OeZULiizvdo=
X-Google-Smtp-Source: AGHT+IH0P21m9F/1NPtuEFcNu81bMVZWc4hM777BDMikFiBXVhvv7NQKWUk+NBBww8uvIiryzCdd2w==
X-Received: by 2002:a05:600c:8b70:b0:47a:8088:439c with SMTP id 5b1f17b1804b1-47a8f91643emr54219415e9.35.1765632943603;
        Sat, 13 Dec 2025 05:35:43 -0800 (PST)
Received: from fedora.lan ([2a0d:6fc1:2:c000:4240:b502:d22f:bb75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm86283495e9.11.2025.12.13.05.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 05:35:43 -0800 (PST)
From: Rostislav Krasny <rostiprodev@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rostislav Krasny <rostiprodev@gmail.com>
Subject: [PATCH 0/1] kconfig: move XPM icons to separate files
Date: Sat, 13 Dec 2025 15:35:37 +0200
Message-ID: <20251213133538.15044-1-rostiprodev@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Please review and approve this path. This is my first contribution to the
Linux project. The previous email from me today was an unfortunate try of
sending this patch through Gmail web UI, please ignore it.

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
 scripts/kconfig/icons/save.xpm        |  32 +++
 scripts/kconfig/icons/single_view.xpm |  28 +++
 scripts/kconfig/icons/split_view.xpm  |  28 +++
 scripts/kconfig/icons/symbol_mod.xpm  |  18 ++
 scripts/kconfig/icons/symbol_no.xpm   |  18 ++
 scripts/kconfig/icons/symbol_yes.xpm  |  18 ++
 scripts/kconfig/icons/tree_view.xpm   |  28 +++
 scripts/kconfig/images.c              | 328 --------------------------
 scripts/kconfig/images.h              |  33 ---
 scripts/kconfig/qconf.cc              |  29 ++-
 18 files changed, 346 insertions(+), 385 deletions(-)
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


