Return-Path: <linux-kbuild+bounces-5041-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FB09E88CC
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 02:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42B951884E08
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 01:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FC0F4F1;
	Mon,  9 Dec 2024 01:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUYvDpaM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA25FBA3D;
	Mon,  9 Dec 2024 01:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733706047; cv=none; b=tVzZf77RtHoDR3R5pbvYxkqobJC9nR/2u6Rk54BeqtSAkXsAA1clkY01qcBwqdNbirlZAvt7wbOjiJDCrxrUkyIt+i6ZzXMhkGymCbjh/VwcU84bJgw895aSGQIIe/Bpyg/fJTh4Bxz1j7qf/qja7uhzYLwyHzpBfCCtvHkFCiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733706047; c=relaxed/simple;
	bh=i70/ysfY/A2S3VR7v4jumMC5u/oBkDepJwnpr0n5f7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TjTsDx9Bc5h3hKtFmqMp/UJNeDS0wxowAOi1/77X2HwmAfQ6i/nU1yjXAPORLiRsygPGm6q/LeaX5tLfUoz2uyPIYWKXfge8+H2cIECAQnsPkuwK0EqrzKo6Ibl1g7d0+xNceiyESwr63eOI5TyYVq91Z1Zuygwqtx7am3WYgzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUYvDpaM; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9e44654ae3so615314966b.1;
        Sun, 08 Dec 2024 17:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733706044; x=1734310844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i70/ysfY/A2S3VR7v4jumMC5u/oBkDepJwnpr0n5f7I=;
        b=ZUYvDpaMEl8aSqjecBZ2W7Rpie59A/1qcRBCNSidutPQOGSoYt0FrnDgr6AVNFEAov
         jQUqWjpoY5zqoM7GeZjuebHw71u52/4wpbEe7TPtuAbO8KmCafu3KQHLtr3DCrOxCk1l
         R5e3h/1Vv8p9cK5gEtWR875yBYkGx+9C4WtuTmDpZEXRL3/P0TZjVpyrDJkts9bjHhD9
         CMXOgjOUEx6XIWApGUmoiw2+/l3q0HfYFki09z3YAZ6rDMQPs0xWfPWFfY1jKU6jA7GV
         W+YnDt+pm3BZauAJiBCg2pQ55Ds3lLHky3/ESd/+QLcKfNXUYKzJslHjy0iWzKbgSkYc
         PohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733706044; x=1734310844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i70/ysfY/A2S3VR7v4jumMC5u/oBkDepJwnpr0n5f7I=;
        b=GfV6uH0dhFV1HF0UBlkEpicJ35uC8oCXxagXDSdJ9Mt52z0PFjQIUkzbibnjhUlL1P
         TC83TolGGtVtSxfECteruCgMO4shzvszUGA2q/X1596UAIhtRe4JvDhhDb0aHx1SJoME
         sjUdSv+fPEvZYlKe3EtGDQEEzZ7JFw1iDI4fyGp7hpQMoEGW3EIGIGIJYEXTn5gPWN2z
         p6InGjf60ukqklttNaPyPrmeveJcz20tNbIzYhXVqg+4QRPap0WhjG3Wk0Lpe/Lyqcbk
         SL/AfWR74US6Pkj/kcETisMp8d5sCoEu8Ivml49r3WGOHnGGcMsiq/a2TRNNfz78KYlw
         f+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVQcQmE4nmmsonrPMZXSuQh31FPVltkGr8vLN+wurOGD9u1j5enYZT8ZE2nf7WCJKtG1b6XrTUiU8GkXPA=@vger.kernel.org, AJvYcCXPSAe0OFMgn1fXW0L/OGoMIXQRbl2lWRA80YU3HcU7y/ULxcdS9kaaa+ojbuZWf5Df9wUdvMc1c4Ni1zhK@vger.kernel.org
X-Gm-Message-State: AOJu0YwxdMTy34vx0Zdem9mVZHELITVmU7bycbA10hctkZ+pLNP0uOte
	ZQw2GRbi5TbwR1rls13xgizMbZwCvoWo2h/+a7kV1eVhPn4Fiifo
X-Gm-Gg: ASbGncvEdXV7ktwm4ffA5bXx4tFs2AJ1Kxds77sEF7JTKCHeIsdA8awBGTLlqHUuzsD
	u20VeasNvoy+mcI6NGjAZp0rdxqHQmjjrGNoOXJw6ZxfZvYufTZC7xHxotYoCYmSdnEk+9s1tui
	lWx+mx6H3vkRCtfDO82U8og08/S0nJnwkptxtWjSpphSn263ufIorCrEyimztLR1PU+cp00xsL1
	hNSLOo5242yAOoQ1jjsqirIoJzRe+HOFWcmE61n4njmYbOKskkhpq0bfXm1H5tPj4g=
X-Google-Smtp-Source: AGHT+IEp3zuRCqVGzrNP2Q1VU4DjC48s5kKrCsRaNkw5J3ld1biyCwbFSXinVJ0z23YdT1mtmxwF+g==
X-Received: by 2002:a17:907:770c:b0:aa6:945c:452c with SMTP id a640c23a62f3a-aa6945c45e3mr712566b.45.1733706043997;
        Sun, 08 Dec 2024 17:00:43 -0800 (PST)
Received: from localhost.localdomain ([2a02:908:e842:bf20:64ca:fb51:d773:c8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa692846b85sm9618766b.127.2024.12.08.17.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 17:00:43 -0800 (PST)
From: Ole Schuerks <ole0811sch@gmail.com>
To: mcgrof@kernel.org
Cc: deltaone@debian.org,
	jan.sollmann@rub.de,
	jude.gyimah@rub.de,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ole0811sch@gmail.com,
	thorsten.berger@rub.de
Subject: Re: [PATCH v6 02/11] kbuild: Add list_size, list_at_index, list_for_each_from
Date: Mon,  9 Dec 2024 02:00:19 +0100
Message-Id: <20241209010019.52601-1-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <Z1DjikoDzwIAID5T@bombadil.infradead.org>
References: <Z1DjikoDzwIAID5T@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> What's wrong with list_count_nodes()?=0D
=0D
> list_for_each_entry_from() exists on my tree on linux-next added=0D
> through commit e229c2fb3370a ("[LIST]: Introduce=0D
> list_for_each_entry_from") since v2.6.17, so since 2006.=0D
=0D
These macros only exist in include/linux/list.h, not in=0D
scripts/include/list.h. My assumption was that the build system should only=
=0D
use scripts/include/list.h.=0D
=0D
> I'd just keep thsi internal to your code for now, and later if we really=
=0D
> want we can add this as a generic helper.=0D
=0D
Alright, the additions will be internals in v7.=0D
=0D
Best regards,=0D
Ole Schuerks=0D

