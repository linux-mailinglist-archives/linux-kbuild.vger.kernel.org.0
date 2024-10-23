Return-Path: <linux-kbuild+bounces-4285-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D66989AD3D3
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 20:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97598285626
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE30C1D278A;
	Wed, 23 Oct 2024 18:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZcNTbJF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73911D1726;
	Wed, 23 Oct 2024 18:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707509; cv=none; b=AWCIZAa6kSpdx4oF/c0arodOKDOGZBt28V3pISwtQJL0YefPKr+ibeeUCABR4YjMgPlZEWd8smwMhUi7Xnjyl93ETbwmlaFs0RFZHfuTJ7YWGDW8j1N/cm8k1lVe9tL3I3z8ZlN/yA/tXZvAneZD/973tAlOcDVvtdZ+q69BUaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707509; c=relaxed/simple;
	bh=NLERFIn12bpXm8efVGcmTQPNdOx1Jj+S+1cvkw4hdG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8PJxtscNUq7BpqJ5vx9ko5h4Wsek+qwq8i1WKw8cc9z8IXysenFyDZx67ZQ/6b7OPmDZMXE+FMBb3VC1SJmON0DlKY9QavygM6Lo24oDERKrfRihg74IuC/GgMglBAquMbp359Jjh/QoeHIHkCauwqrOOQ7p73+kgwtpM41NkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZcNTbJF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB06C4CEC7;
	Wed, 23 Oct 2024 18:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729707509;
	bh=NLERFIn12bpXm8efVGcmTQPNdOx1Jj+S+1cvkw4hdG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dZcNTbJFegj1EO16Urhpm0/746k8rLYj0f3bZhMMFKZJQytfiSxYVVsOzn0EKxd1y
	 0yTbvj55+3CYRX3aSmPtVDldMvcEX8SmSV5Zkc3B81KQoPemD1iBwj/q5maJ0sShwc
	 ACJl05Kt9lN4AOXKjfmQI+EKORvT88VTaJMXTYCGW0vwJJ4/Qz38NfevmsxEesVens
	 uQ96uzr1isSLvmye7Z8sFHwdlCpoRMS6ra0FM8OuPId0UW43td12IpVkbWGxJMhqw1
	 iQmyu5J72iaxHStgd74aM9qNWM0K8SNVRQpJTaT1QaHxf8do6Fgu2nuGPNbaj59WZ2
	 TCsI9yv5wUtAQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] kconfig: qconf: remove redundant type check for choice members
Date: Thu, 24 Oct 2024 03:17:52 +0900
Message-ID: <20241023181823.138524-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023181823.138524-1-masahiroy@kernel.org>
References: <20241023181823.138524-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit fde192511bdb ("kconfig: remove tristate choice support"),
choice members are always boolean. The type check is redundant.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 18cc5c184f56..58c57c908149 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -159,7 +159,7 @@ void ConfigItem::updateMenu(void)
 			ch = 'M';
 			break;
 		default:
-			if (sym_is_choice_value(sym) && type == S_BOOLEAN)
+			if (sym_is_choice_value(sym))
 				setIcon(promptColIdx, choiceNoIcon);
 			else
 				setIcon(promptColIdx, symbolNoIcon);
-- 
2.43.0


