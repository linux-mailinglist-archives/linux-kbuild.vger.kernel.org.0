Return-Path: <linux-kbuild+bounces-9335-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF90C20877
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Oct 2025 15:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C49F3A5B74
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Oct 2025 14:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D372822688C;
	Thu, 30 Oct 2025 14:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KR44TSHJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AFA23C4E9
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Oct 2025 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761833679; cv=none; b=j0EuMp1rxHJTagKWKhI4fwJAX+6ZPudQCz9vP4f2t7JhiUrye0BN1M6r4WAZB/nUiaz3Svo6sFwa8gj9XTv0u9GXWIwRkDuSkeXT70r+oPVlWUutEB/cM847DMPKtzFTru7HRl6cl3J8MJSh9D1rZv3m6sydlo1u33i5vKPnPeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761833679; c=relaxed/simple;
	bh=46PCqH6r7ZqwyhQNYazf3buzpOeGcKgYYNVjNq4es+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=umGmJ14rOYf8oEqd8imn3aqsELhyj6UbVJpDSs32CFNT8WZ39d00Kna/p5tcQcRTYZ0El/by5D1rWSIwmTCgV9aH9OiEFag6LLzXkRhURppmtoNmEXZzgVE3vSsFDGldQGI0qqg2BP4eKuixkD75OLuF/HJQvcWD8vFoL7JObDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KR44TSHJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47721743fd0so6197635e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Oct 2025 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761833676; x=1762438476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4MPP2DbSCIYyNQgvYiItWb092pEOou74V8p606S7bGI=;
        b=KR44TSHJGPr+ZwDQy8h062WfCmVwPCPkGKrKYCb8dK8bwItxS5Q+eWzvtymx1k8CTX
         J9yjzkdaZDcHUj4/JG9p1IAkc13svejmKQEwW5zdXCtjVI2MXyPvPxYRrygSgq1lls9P
         4ZzHgrQr5JsSp+wgQCnv8zm0WtfrS+yoVbEmTef2l3FM3I0AwYIDwiK+UbUC4Bt1setw
         td8V55RlUaBjeHmC5LeEUVL2rbd+LOBBze/A1FL0tI2PQR8IyIoumFSZ/lC4u+kgt6Xc
         fbbXI6Oif6njuJEKKJrya74fthdMAW3IHddBNjB0+X/9UrbwtNScH7tQ+L73uBG+Jnn+
         aVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761833676; x=1762438476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MPP2DbSCIYyNQgvYiItWb092pEOou74V8p606S7bGI=;
        b=OrURjXNQUkMlSM7VD97eSxzOgPu4r5eLCEGyvlfpSpnQfYtyf0ou41YaxXCrQGXeu2
         9B6a5kryXUMoAkCbf1jmcRSYAVHguZZyuYguHRRS0IL+ixtcoW1aKN1SqwNLXta1VR/D
         +vPo3N2hb/ASOFE9pERnmqs3Y9wWhx8GoJOSuaepS9FmPi3omu+PxKzZ4XzV/yZF+neW
         SZ3BokkJlrPdaFguppkldvOmvscSaOt3eZ/TlZ391UtB6oxwGeTjgFLp2bKitsSYjqmH
         BWf/NbDwavUIyLmi9s7z6uCDkFcLl0Bc4fFUh9P595rMUSibE2K0qQGdZQiYNn/xuIdc
         gcQA==
X-Forwarded-Encrypted: i=1; AJvYcCU+tt01YjhEPWLbT7jcO3vZ5D280Hqm/yZt9Un9HiME/E7hbil7114iR2J6WM4K+Hlc80qj9zFJgo1emE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwTf7vljkWtpkWH6bB3Q1lTZWXaXa01RPBQK9TTR8JADXw1KHS
	cQPFVBjVnJLAlUF35CnA3yWqMZSF+JH/w4Ik/IcAmmzlhoW2aKNU/yuX
X-Gm-Gg: ASbGncuJLnkMSvoiYN79J/MlrVkPq6/lAWYun+I4sEOm+wmnqjlzk4oZcCqRzQwVxxh
	PLv4yJ+bnzuhKL/kvxwsiaq2M4eqrG/BW9zwSS12lz95nWZd6L57JcNbbsM+R0KUdoRCYbaXtXi
	TlpD5t5ZlsxvoXnXD+aD6laF5CXbB9LlzA0hgc4AISojV3Yw79A5qzqKUYzNRVPrxikCD+l5Nac
	CUxLUMqJ3+K4VL1O/HaqTfri1vmWQM4DQwNjYiVEcU/1IhRCglx2nHfeXscmWsDx7RahMQ+I3/6
	mpiy3pAFu4JLHLUHuKyc8sYJ9R11ll24NntRvJoibUz49eDwFRHFSmjeE+ONqLI6YT/W2c9U6g0
	968b2PZcV9LEYW6PjUqiu1ibmwXj+zfQmFE9JQtbfkofzXvu5qHlR983VD5xgn7M2I1nNpm4b7K
	1ANNy0Zj8MTi14pD9ktTTJTgsKinn09q80WmwC
X-Google-Smtp-Source: AGHT+IGHX5D8zZrWy88kodm6kYBAZt+eLYfOFetX9xkQR5Vu5SZs1f4m7A15mKfBnKWBKTCDEr25rA==
X-Received: by 2002:a05:600c:1c22:b0:46e:5100:326e with SMTP id 5b1f17b1804b1-4772686f074mr38616325e9.23.1761833676127;
        Thu, 30 Oct 2025 07:14:36 -0700 (PDT)
Received: from itek.frank67.it (mob-5-90-140-35.net.vodafone.it. [5.90.140.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b79cbsm32350410f8f.4.2025.10.30.07.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 07:14:35 -0700 (PDT)
From: Franco Martelli <martellif67@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rdunlap@infradead.org,
	corbet@lwn.net,
	linux-kbuild@vger.kernel.org,
	Franco Martelli <martellif67@gmail.com>
Subject: [PATCH 0/1] Kconfig: Added compare capabilities for mconf
Date: Thu, 30 Oct 2025 15:13:41 +0100
Message-ID: <20251030141342.159994-1-martellif67@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hello,

There are circumstances where the Python script
"scripts/diffconfig" is not helpful:

$ scripts/diffconfig /boot/config-6.12.43+deb13-amd64 ../linux-source-6.1/.config | wc -l
7375

where the first argument is the .config file of
the new LTS kernel version (6.12.y) provided by
the distribution and the second argument is the
.config file  customized of the old  LTS kernel
version (6.1.y).
As you can see  there are too many  differences
are reported, to deal with them.

The solution I propose is to provide comparison
capability for scripts/kconfig/mconf.c (make
menuconfig). Adding a:

"*" indicating that the symbol is  built-in =y
"_" indicating that the symbol is  disabled =n
"M" indicating that the symbol is a  module =M
"#" indicating that the symbol is a new feature

just before symbol's description in "menuconfig"
window. If the symbol's tristate value is the
same in the .config edited and in the .config
compared then those symbols item will be left
untouched.


Franco Martelli (1):
  Kconfig: Added compare capabilities for mconf

 scripts/kconfig/confdata.c         | 189 ++++++++++++++++++++++-
 scripts/kconfig/expr.h             |   9 ++
 scripts/kconfig/lkc.h              |  11 ++
 scripts/kconfig/lkc_proto.h        |   4 +
 scripts/kconfig/lxdialog/menubox.c |  29 +++-
 scripts/kconfig/mconf.c            | 240 ++++++++++++++++++++++++++---
 6 files changed, 452 insertions(+), 30 deletions(-)


base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
-- 
2.47.3


