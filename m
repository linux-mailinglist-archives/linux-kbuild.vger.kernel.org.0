Return-Path: <linux-kbuild+bounces-8174-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DBCB12031
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 16:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECBBD189A727
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 14:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FB31E833D;
	Fri, 25 Jul 2025 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gehMEBpP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558541C6FE1;
	Fri, 25 Jul 2025 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753454209; cv=none; b=fQtEHdS27OeEZh+yFVRZsMj7mDj9TMNwQjO35uOspjImvc3/Yvi1iSZXP1BZ0ZkUbG+9RxORnzcah67usHB97t7YzhzPrkwDr1NZdomtzL5igPJ+V63iOpEHkZ1MI28AqqFyYiUAvC/LRnBq6YnNbHNzR7kXhGHAX31X5gfqRew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753454209; c=relaxed/simple;
	bh=IZUpgyeFcJwifm4ZXyp7YQPiftS7j2IRiJMMhFmctpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTUW9zIhSfqqmQ/D2gBMd6chSKcgifZHlSNEEm7JvqbOqfVL3jB1t59lAFJPxrwCFGpjwaVI/AS07Mu9BVE2IbWLSU63amc8bDtkVCpE9kBuO3uBqQEIQO+sJGXjSUq4+O+5kVPTaNECzCPGiXE/y+tC9TX30wYCvAA7CGqn8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gehMEBpP; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2edec6c5511so1419556fac.2;
        Fri, 25 Jul 2025 07:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753454207; x=1754059007; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zmQ9twC572vgY3H+WN2l+zO5lDHBOnDqF55BMIf7fYw=;
        b=gehMEBpPEEyTuIUeJPoQLQfDFayWYC6LNZ2Y4gS2VlVqbS9MW/Qgzf7dnyBaSkyKAZ
         2+jef6IUT+SJy7ndx2RZt7zRv3d6tk5IIkBwjehrXZSmAYIvGKq5Y852OfNHJvKdZGG1
         oqo1+nxb117XeItY6PxsSFcXnx8Y7oSHEnNxOv5doVYUSGMe29/E8htlVNUGu49WeOLq
         9YCl/WGK9TsWF32UXIIztwuCu1an/mNWJ7UlR06hH4dYX2C9CNNPRpupMSY+JrEfqFRb
         F0/zf3f8XhQBZhZgyrwf904sMoHvBw5ZaiI2s30kDOIPWE9eSh9nMaSYFqxDNbHE01Q+
         i8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753454207; x=1754059007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmQ9twC572vgY3H+WN2l+zO5lDHBOnDqF55BMIf7fYw=;
        b=DGjNAeAFbc9EdqAj9lB767Pn8b0esqBjPHmZYzN7AEKTEDSU978T6gJrjN6JwWKQlb
         Ph/G34w8YHqn/Y/9toE8ziD94KIVLayWh+0vqB1ZR0ZOouxvOfiJcOqYkGE14r7JWMSc
         ZsNVSKPX5XV4+rXZUQBdeJk00njWNQ9pjyN+npzHwYrCLmqHnLPTGYG2RejS3knP5MIS
         0ijc5JoWc5yfr37OWpgqVuNPByRdCkmiL100rK31DQtehfGmiFDMDhXf95Je8TW1zrf1
         pNPoV3QgnaZdeRJF/JXl8Ym3/0rR0USJ+Ahw/bxYCx28oGi/X7UReptEFvMdB84p3gIW
         ejdw==
X-Forwarded-Encrypted: i=1; AJvYcCUOA5+BZwgXf/PGmgVBK8Cqva3EblzGpoLeYv/96ymE1gyVLsshmD0UeM2/K2raygguPp3YMYKwLuJJhwA=@vger.kernel.org, AJvYcCW4M1LOt6TbX6dqfDeTQe9sarexqJ2bLhArI/Mye3YFCWcyzLd6Lc77v7+VnGQkN/jFSSvEYX7OJ8MypeoZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyzkPMQtF6Zc/qMy2EcGnHPrqTU+/pKrBRIM71pYK+VNGdK0pWN
	huo7ltbOj9TH3iG9Nk86oeHamko3jyaBEEXSMILLJE1/lmgpcqaYE5xD7JY8dPgid80GcqaB751
	plLamnp6rdvej19aniFll21ZUy/nyf3I=
X-Gm-Gg: ASbGnctKDAsJyWZNBRisyiJzPx3sQga/gExE54ZsyaIeDClmyWHNlAU6vAh/ALZJoBj
	xQ2Y6mT8koB2lbbyeCJ4HJrDugP8uBXmmsVU9paUr//KkuNZH9XLKC7QJXjN0p9krFCg2EkzKAg
	sfk2VVucnZw4k0JSXN9wTeI2FoKKjHNdhFBmLsNjGRVr1sRW6O3R8rcFVWrhGXmppkQMuxB5qnk
	W0KVAUidCMAjwt9SNIB
X-Google-Smtp-Source: AGHT+IGrfVbCo03vvW/g8BMGChPrgPTj51C0wHN9ndO7rSzkTDaezJg4kAShqx5LuEUGQO434znvazHm+orVozwuYd0=
X-Received: by 2002:a05:6870:249c:b0:2ff:9953:42f7 with SMTP id
 586e51a60fabf-30701b47bd4mr1547786fac.35.1753454207290; Fri, 25 Jul 2025
 07:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250725055928.37658-1-suchitkarunakaran@gmail.com> <20250725-violet-mayfly-from-heaven-bd66d2@l-nschier-aarch64>
In-Reply-To: <20250725-violet-mayfly-from-heaven-bd66d2@l-nschier-aarch64>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Fri, 25 Jul 2025 20:06:35 +0530
X-Gm-Features: Ac12FXxLCvqxacHGfKq22Qp7FNE6KZuYGxrGkBLSEGqLhmT8ZbaGWHFJ66i0Sqk
Message-ID: <CAO9wTFiYRb8RDB9cTRsC3yqa6Zja5+QWuew1AZyZs5gPxbdVGw@mail.gmail.com>
Subject: Re: [PATCH] kconfig/lxdialog: replace strcpy() with strscpy() in inputbox.c
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

>
> Did you compile-test this?  strscpy() is not available for user-space.
>

Hi,
Apologies. I didn't compile the change earlier since it was just a
replacement of strcpy with strscpy, and I completely forgot that I was
working with userspace tools. After seeing your comment, I tried
compiling it and I encountered an error. Would it be more appropriate
to use memcpy or strlcpy instead in this case? I'd really appreciate
your guidance on the correct approach here. Thank you!

