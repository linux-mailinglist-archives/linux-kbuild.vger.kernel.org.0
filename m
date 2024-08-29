Return-Path: <linux-kbuild+bounces-3291-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D62C9651D9
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 23:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D2181F24F3C
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 21:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BAD618950B;
	Thu, 29 Aug 2024 21:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnxzfGpD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A601537C7;
	Thu, 29 Aug 2024 21:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724966688; cv=none; b=PUItBXgGEc6n6zFIYgKQV/oRBejtrgIcak579DncPuhpr29fZHfeGFpYq+rZvR6l9tmexl2uFToLuMnvODI4jdJ3526b5CUr1ltMuw5Br+1aIVpWhscdd+v2fLvHz2LpeM/lEH+U4xj24TZVjFKoy4yv1HUbp7ONSC3I/3GPu1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724966688; c=relaxed/simple;
	bh=z+4jBoXyb7GpCwFmDwG/CygV3VoxdoyGDPLoxqPAf1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZwnafFn9mrSvqOcS4k8wg61nZk5KAsHF72rOuD2vhVAOOCSeaKRJHQY1v3nrw/1JNy16UjXJ5xC/fxdmyIrbMqaKRyVU8qDPUUst7qrG+eNIRKGY6uUQfpG3BMCcIsL6KZNGAA2k36PE/BIdQ+VSWS/AYJJfZhaRnMHYW/At7XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnxzfGpD; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5343617fdddso2027783e87.0;
        Thu, 29 Aug 2024 14:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724966685; x=1725571485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vP+mLG75kQvykNeaAY9FeVWlg2fTEFPrZRsJaqyVvRM=;
        b=CnxzfGpDgVkRWl3/FJlnWFfhY4e1b89ropwzOFtS8LiIiJjhMPX9OehuoczDTMh8wT
         eWGMaKbCmumFoxB0aGznm4lcMNk3nocAvPD+JY0XQGrNHL4ujpJ7Q4cca9p/c/MvlMLJ
         kmnaZZzVdWiUtQYgmJtJU57d0bjw1P3AId7HLxASTQipaMdI52/wz6v2Nju7eGD5qgl0
         BB4RX8CgESFgHphr4gpt6MJqUUwtqsYCxnud5nfr5IF0W47ZSHwVMtb5jSvFqVamNFX8
         HrUWv7P6RD1H6jYA+lfrHw1OgJxz01CFugN7MDUePYdoxTKgUK3wu5PeeiMQdfkCzgXg
         rlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724966685; x=1725571485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vP+mLG75kQvykNeaAY9FeVWlg2fTEFPrZRsJaqyVvRM=;
        b=GReDYsWtExr+pANHfTiiyZQ383zwRteP2s/GdFl0aQaZE23r4g1AzYRgbyvOlY882h
         nPYBB011V1EBncZoPEzm2HmjOL831JVZAZrVdbOpdfgvxmBXrRovPXAGdaewb65XLCNM
         +R5xjEhwaZneFT9tsul8Tuh0D4McnXDWjeAiO3UIqlfyP7w+sC+PZ/YXgxr1owgDA0QL
         /LHb88w8Uc6MrNpZ9EAxWKCCzpYmUrjsKGGFlw4UGdn7QcC92VX1QWOjtB03N80Am+rZ
         7TxWfnlh60rXVtbdBN7zt+sgx+jb1Ab5jaU+7v7Je3DHj2leQ2LooyH3clqyImy9hmEb
         5WTA==
X-Forwarded-Encrypted: i=1; AJvYcCUr+Z5LpOysPN5Nntd7KVpIpDrDdH/FGiXTQct6EYLvx+vYREO0iGPIIElIZXEltRuQuhX987jt7u5s/vbv@vger.kernel.org, AJvYcCWm10QUKeeJ96zfdn02mxYUe4/4WTK2v4p5LohCdKBkkZYTrVz/V7VzdQtrluzNBgjGWgXCE7yAXYFl7mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ8VarAvuHGV0Cdq6QVnlLAQP86X4k3kbXfSnb35lSaXzGkd9d
	rC+HBxaj7yY3fwsAqnzjulR6H9uyN6NelE3U1HO5zx2YBUAkq+iS
X-Google-Smtp-Source: AGHT+IELEp6eOWH3jL2ZFBge+3ovMFzJryukeo1dXEFbbn7O8NenKy7KsbVOfHm2BHrbKl1q6Co0aQ==
X-Received: by 2002:a05:6512:4003:b0:533:4620:ebec with SMTP id 2adb3069b0e04-5353e543459mr4254272e87.3.1724966684556;
        Thu, 29 Aug 2024 14:24:44 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:ec7e:b531:2c95:d981])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989223268sm122151566b.218.2024.08.29.14.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 14:24:44 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: mcgrof@kernel.org
Cc: deltaone@debian.org,
	jan.sollmann@rub.de,
	jude.gyimah@rub.de,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	ole0811sch@gmail.com,
	thorsten.berger@rub.de
Subject: Re: [PATCH v4 02/12] kconfig: Add picosat.c (1/3)
Date: Thu, 29 Aug 2024 23:23:52 +0200
Message-Id: <20240829212352.38083-1-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZsPBfBQXNZmbNfpE@bombadil.infradead.org>
References: <ZsPBfBQXNZmbNfpE@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/20/24 00:04, Luis Chamberlain wrote:=0D
> On Fri, Aug 16, 2024 at 12:20:01PM +0200, Ole Schuerks wrote:=0D
>> What's the best way of letting the user know that they need to =0D
>> install PicoSAT if they want to use the conflict resolver?=0D
>> My idea would =0D
>> be to notify the user via the GUI when they try to use the interface of =
=0D
>> the conflict resolver without having PicoSAT installed. Do you see any =
=0D
>> issues with that/do you prefer some alternative approach?=0D
>=0D
> Conflicts don't happen often and we already have a printf which happens w=
hen=0D
> one does, my recommendation would be that we simply opt-in for the=0D
> resolver if the user has the requirements installed. Otherwise we only=0D
> inform the user to install it if a conflict comes up. Documentation can=0D
> also be enhanced to describe this functionality / support.=0D
>=0D
>   Luis=0D
=0D
There's perhaps a misunderstanding here. I think you are talking about the=
=0D
rare scenario where a symbol is selected despite the dependencies not being=
=0D
met (where the printf tells you that). But ConfigFix isn't only useful in=0D
this case. We believe that the most common use will be to enable or disable=
=0D
symbols with missing dependencies that prevent directly setting the=0D
symbols' values via the GUI.=0D
=0D
For example, when one symbol depends on a second symbol, and the second=0D
symbol is set to N, then the first symbol cannot directly be set to M or Y=
=0D
(assuming it isn't already selected by some symbol). One case of such a=0D
constellation is DEBUG_MISC, which depends on DEBUG_KERNEL. ConfigFix can=0D
identify that DEBUG_KERNEL must be set to Y in order to set DEBUG_MISC to=0D
Y. Conflicts can also occur when trying to lower the value of a symbol: If=
=0D
a symbol is selected by a second symbol, and the second symbol is set to Y,=
=0D
then the first symbol can't directly be set to N or M. One such case is=0D
EXPERT, which selects DEBUG_KERNEL.=0D
=0D
So, the conflict resolution is useful when users want to quickly enable=0D
some grayed out symbols. If one has to install some external package first,=
=0D
then that might diminish the usefulness. While there are extreme cases=0D
where it can take hours to manually identify all the dependencies, first=0D
having to build PicoSAT might take longer than manually resolving the=0D
conflict. Many users might then never install PicoSAT to try out the=0D
conflict resolver, even if they would benefit from it.=0D
=0D
So the question is whether using PicoSAT as an external library is worth=0D
the portability issues and effort, and whether it wouldn't make more sense=
=0D
to directly include the PicoSAT source file.=0D
=0D
Otherwise, if we go with not including the PicoSAT source, then one could=0D
inform users about the missing package in the GUI, like this:=0D
When PicoSAT is installed:=0D
https://drive.google.com/file/d/1asBfLp1qfOq94a69ZLz2bf3VsUv4IYwL/view?usp=
=3Dsharing=0D
When PicoSAT is not installed:=0D
https://drive.google.com/file/d/1ytUppyFPtH_G8Gr22X0JAf5wIne-FiJD/view?usp=
=3Dsharing=0D
=0D
Let us know what you think. Include PicoSAT directly as a source or not,=0D
and then inform the user via the GUI?=0D

