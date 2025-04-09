Return-Path: <linux-kbuild+bounces-6554-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C67A82E30
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 20:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE88244420C
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 18:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7291726B966;
	Wed,  9 Apr 2025 18:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNgcZyQI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB911CF8B;
	Wed,  9 Apr 2025 18:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222158; cv=none; b=m8A66j3/yFBZQpXYBqO6k0FKhFy/qSTSUZTxO9vGBnlpc5G+VND5LSLq/ruYRYhclzyCsuApoiwmpKhLnn59xfCDQvUstRNQs0jAhsDIul0rS9uPL2GqIyQa0tb8Pzigz02cwi2jLq4HCjnUGW83S3KmU1ezAyRW43DxI7It6io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222158; c=relaxed/simple;
	bh=DtTCKK7iCTevDaulFE/y82vN/R8ldpmuojMHLJ3+uxQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZWTJa4IsJ1+3yJcLttiCUFU2kU6BvLkKP/gJ3LFMMy65Rdh8tOyuK5YdApkC6LwwIQKgKpM8s3Rl4PZz8sufacHjGUxxdBji5kPYL4Kurvu6PH1uToP1y5Cf51FD7IjAl+C//TYYBXMWVxCkueWYue7395P+ebVI9bjdChMpHaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNgcZyQI; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso12394050a12.3;
        Wed, 09 Apr 2025 11:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744222153; x=1744826953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtTCKK7iCTevDaulFE/y82vN/R8ldpmuojMHLJ3+uxQ=;
        b=FNgcZyQIq7P0pTakBNpfslK87cBd/UbOh+mWyGfZnF+6JBhXF42Q6YFjA8q4YZK5OP
         aRy88lF0eNL2UgyTDqZtDQtul5u6Yssu9n5UiOPkxtbFN/K1nAQowuKgB4dXwE2X2rO1
         JE/NknCfXgkt/a4rRwz0t4PSN8sv2ddbQod2CdCyHuegvVSzB4Xb/735FW+TvvOsK/yz
         73rQ+onCYoQBFoF/K3RbUrhIcdVgsOt9hXluZmKcVnZ9sL2r1OCsyvs5NBNFX/uv0p+k
         lvtnbzh23GDjcLEkmtWNJVKiFa1paqt9ABbQ2MsocpaGMWp5WTrmDHNY7lI2hkLKbu46
         OCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222153; x=1744826953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtTCKK7iCTevDaulFE/y82vN/R8ldpmuojMHLJ3+uxQ=;
        b=idFXyF1wW1dCo6YloD8XJiqwGZby8nvEClZsUSruTg62ej7WVfj+wU7mB9Jxkm7Ouv
         PHdH10BFgPENogJ4Iou/NjgSKWaTpr9aiJTvZEIYc9cYoO/X5Knu9J6U2oDEB/oOE08i
         HioBXyaXgljSQIr1cjtNwhmv1ZZsMFCbH4gIBeLXdKSKui90a527aypCR7dqtxkjQqqY
         LqqV8iVyW18qR+zi6UdzvA+/W1MDwigFWNK4rdncBduIxqJb+3ik6ysk6i8uaM9bTwRY
         gpGM30s5+5yk1uq2C4Ac56WWMkCGQ1Xu+yfFHCHXt3vaQzAxxuOWhXG0ZLIzCnrJBp3Z
         iP+g==
X-Forwarded-Encrypted: i=1; AJvYcCVRQGH3Ydb0/zilrTcPAIuF1ADjht3mQHoNlOG2MwTkDOtUo/SIBBBEvOwQDpB+jNahYLUj/V27R07n1C0=@vger.kernel.org, AJvYcCVdtU7hDwmMP+0aXj896HG4YRzGO0Z+pB2PtmBfwqQuC53uT/TyOlSOMzERMyxV2rv2Ts5xdRY/bwoCF1wE@vger.kernel.org
X-Gm-Message-State: AOJu0YxTlOqYzMbE8jfLxrzMvx57OCWuMwzWjmFR+mQiVv67krMnrfsv
	LDUtz2/I8IprfL/z4EcYq2pk0rwtV7QodaJH07x1vKPnzkcP9bcn
X-Gm-Gg: ASbGnctNfruPt8tQt5Sg2ITU8Kjjan4j0ZuxGAA/wPk1o/0f2iSrVEZ01hOGR8j5PAk
	94ThapmsSLnE8UZuB7qqbaMH8IkADrx6uvPgr+KomrCGzGHyXvNZGAX92KAth+35awBlYM5L7/+
	Tiplw9ICPVf3vwqci5rt8Qe7jkvPg5nyMaXC2zdPKJIV/R9iDwMmP/T7ivuBxtUGlJlAGTr/j2R
	UxLCj6pqlILyHL4msd0OPTLRUbpWH52w+4fbbFRTXgTWev0hOVKp7jKPZhxpAvkq00tUXkQBgXM
	YfhvvuLNNKIp7i5vdRuTUYOx6NpYp68ZOF5BSOR9k0G8BpVYzh75wU/qkg==
X-Google-Smtp-Source: AGHT+IHROJVO3GnWtbq6DcJP3REe9bvDX/RZD2YzKK7u7UX/9R2YSeBIZCwQu6Ke9jXvHTdeMSyzlg==
X-Received: by 2002:a05:6402:84e:b0:5eb:95a8:da89 with SMTP id 4fb4d7f45d1cf-5f2f7752814mr3274642a12.32.1744222152610;
        Wed, 09 Apr 2025 11:09:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:f49e:dfb1:b879:dac0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbc2e3f8sm1117633a12.48.2025.04.09.11.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:09:11 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: masahiroy@kernel.org
Cc: deltaone@debian.org,
	jan.sollmann@rub.de,
	jude.gyimah@rub.de,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mcgrof@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ole0811sch@gmail.com,
	thorsten.berger@rub.de
Subject: Re: [PATCH v7 00/11] kconfig: Add support for conflict resolution
Date: Wed,  9 Apr 2025 20:08:46 +0200
Message-Id: <20250409180846.23742-1-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAK7LNAT48101gZzcHF3U-VL1i0Ekns6zXKpNDb3MnScoSNr-kw@mail.gmail.com>
References: <CAK7LNAT48101gZzcHF3U-VL1i0Ekns6zXKpNDb3MnScoSNr-kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Feb 11, 2025 at 01:46 AM, Masahiro Yamada wrote:=0D
> On Tue, Feb 11, 2025 at 12:43=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.=
org> wrote:=0D
>>=0D
>> On Mon, Feb 10, 2025 at 02:00:52PM +0900, Masahiro Yamada wrote:=0D
>>> Thanks for this, but I have no plans to merge the SAT solver.=0D
>>>=0D
>>> The reason is that my future plan is to move toolchain selection=0D
>>> to the Kconfig stage instead of specifying it statically from the comma=
nd line.=0D
>>=0D
>> That makes sense.=0D
>>=0D
>>> This approach was suggested by Linus [1], and to achieve that,=0D
>>> the shell evaluation must be dynamically re-evaluated [2].=0D
>>=0D
>> Sure.=0D
>>=0D
>>> The SAT solver would likely conflict with this plan. At least due to th=
e=0D
>>> significant amount of additional code, which would be an obstacle.=0D
>>=0D
>> I can't see how the toolchain selection, if set on Kconfig can't be=0D
>> leveraged later to enable / disable the SAT solver, however I can=0D
>> see the amount of code shuffling incurred to be an extra hurdle to=0D
>> address and a preference to leave that for later.=0D
>>=0D
>> In other words, I susepct it is still possible to evaluate to=0D
>> add support for the SAT solver post toolchain kconfig integration.=0D
>>=0D
>> Thoughts?=0D
>=0D
>=0D
> It depends on how the dynamic shell evaluation is implemented.=0D
> This is not limited to bool/tristate, but SAT solver only works for=0D
> those two types.=0D
=0D
=0D
I just wanted to clarify, configfix already supports string/int/hex values.=
=0D
Configfix uses SAT-variables that correspond to a kconfig-symbol being set=
=0D
to a specific value (e.g., one such variable would be `NR_CPUS=3D1`). The=0D
sample values for which such a variable is created are currently collected=
=0D
from default and range properties.=0D
=0D
This collecting of sample values is going to be the main challenge of=0D
integrating configfix with dynamic shell evaluations. I believe the=0D
integration is feasible, but even if serious problems should arise, a=0D
decent alternative is to have configfix simply ignore the possibility of=0D
changing the symbol values that are inputs to or results of dynamic shell=0D
evaluations. That should amount to roughly the same capabilities as the=0D
current version without dynamic shell evaluations.=0D
=0D
Best regards,=0D
Ole Schuerks=0D

