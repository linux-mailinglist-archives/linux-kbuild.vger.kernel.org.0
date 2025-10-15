Return-Path: <linux-kbuild+bounces-9154-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EE8BDC3EA
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 04:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8536E3E9B9D
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 02:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27077296BCB;
	Wed, 15 Oct 2025 02:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xp1XYJb8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC2B30F7F6
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Oct 2025 02:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496998; cv=none; b=SIdUMTJFdASdfHzFa1td2M1VUs99KaNP4Vb/GdN2f+KFgYuAEzlcH0tjWCpk4rV4C++pFMtVDnv43M/C6zEKqt2Pz843pBrcocrCFN+aOWVeDMDmElAAUih/VRPuiQuSAjxsgGUOv8ak4mFnDu5Ovy3GpbgnPMNSpMXh+MydED8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496998; c=relaxed/simple;
	bh=TE1qHUGtE2qlD/mCekHEiwVSHgeYLYgnt1C5+7OY8Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OzVvvXnhTblhuKWgGPimft6A0Yjj7LMqmPmjpzXXU7IkLukfROZQw2iTwGZ8CHuWx743U9w2/EhxHee0JrX3Paw41EXk4i1skRwfyd25jkW0VluxOaCr+BK3pmUdkT0+wnVu0PB/Q/K4K6QVx/qMiIaez7TNGkGla72Opi4phnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xp1XYJb8; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-633be3be1e6so780183d50.1
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Oct 2025 19:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760496995; x=1761101795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TE1qHUGtE2qlD/mCekHEiwVSHgeYLYgnt1C5+7OY8Hg=;
        b=Xp1XYJb8IPTrpCM8JgAnFUHYW/+r2whVO2nqOQxAC9oYoOZw0518fQarJrcupDcf5J
         Zf3KzxU1eIqbgFE0AFX7I9BLlgsgqcqKr/mO56M3DiI+I/m5KVCb9DN3++a8480XclVD
         iVyl/jrLlyvG9nMPjTRImBWe80LsWgiB49531fOIsyL8XZQgv5hZYWfuP/Ao4KD0vmSj
         GAA2x2zG+z/XC+ExGb47M89juZE0HkdDCjAX5yT61IObekr94i2acHg8y0T6Ljdvea3H
         YRvagA82+tz+84Dh3AFZh88XCdCju954XBEKTcxQMtrh7xldkpxAvnejCqF1VDP4ZVIL
         78KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496995; x=1761101795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TE1qHUGtE2qlD/mCekHEiwVSHgeYLYgnt1C5+7OY8Hg=;
        b=Bs449N21pVkOujMXywdqkOXL/QsNY4ctDa3NqR4ACPhiWibZmSvpUiBr1b+4dj/Z3n
         qXQKny5Vka9eXUYsKX0DpRksMFmqlxWySiPXZi/DIPijlQCUnHHKVB7NBnFTNjj7JwaR
         o5QO0lkT/m2NesiHTBNR/HT/61n6zs9RZXBxI52y+HobLwK8lmuPM/tizmJA4/W11sD2
         sB2R3SAes94BSCPM1w8ziIRqWIsobEzgeXCv6lYaHcZKJN/IzMHX6Hm0mCBoRbBrwNBr
         0cneBulTjAbjVDaiEYH14VCmtZMpRef1QAHncOIp0Enq5pzRMIHEDsdU/W0k38DMa9PQ
         S7nA==
X-Gm-Message-State: AOJu0Yy61DCQsDobx1e1WIXxonGA/9ijOXpH3Rj+3QAMT537GpcEamvQ
	bv+SxLsRETiKPhMcQNGkX82NcahqlCscr9wf2b9Mal+o5zOl4nuIH5xnF97kkISpNVzB35q7Gh4
	7rEdZcGsD6HPl7/vD11ZcDnn6rb07Dvs=
X-Gm-Gg: ASbGncuomva5aNnqJNxdEWESinoOGV3uzD+ODHFDy8auM0wQmwvVZsjmLmyj3AwSCqA
	edoxhfUw264FH2WQ+T5lJUKsMPZVCcES0WZWJURj5B/yHrUMm3AhaY3Xyx/5JtMQWyrsUd7QDru
	v0LIjQxWL/LUI8nXXpamLdOEza5fyBCJENa5p7kYV1RiY6lrIObtBmN/k7kCUIsHeAkWfWDXXIf
	MDA6MYGA7lPoqWtK4OowgTmpxfq5g==
X-Google-Smtp-Source: AGHT+IG3HRitPb0dlcLGv5LgSdqyT8KuXHdCc4yeCJu3F1DpzIoAorsJ2rfH1BjAA338ijrr0+SbQ3r37duOGjwCMlA=
X-Received: by 2002:a53:bf83:0:b0:63b:a691:71fa with SMTP id
 956f58d0204a3-63cbe06465dmr19731581d50.4.1760496995327; Tue, 14 Oct 2025
 19:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009075149.1083040-1-safinaskar@gmail.com> <aOd27ViaWbsdwNDR@levanger>
In-Reply-To: <aOd27ViaWbsdwNDR@levanger>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 15 Oct 2025 05:55:59 +0300
X-Gm-Features: AS18NWBIftPtYmrWrg2OYbA_p_2SzeJFq9_j6ArULRBmZaQNo6Xg6r4qfIVGAdM
Message-ID: <CAPnZJGDsrSk6GUYVhpofoiTKLS-pVJE4TFU_hA0gttn6Or=q+Q@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] kbuild: CFLAGS=-w no longer works
To: Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	regressions@lists.linux.dev, nathan@kernel.org, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, sam@gentoo.org, 
	thomas.weissschuh@linutronix.de, Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 11:49=E2=80=AFAM Nicolas Schier <nsc@kernel.org> wro=
te:
> If you want to hand-over additional CFLAGS to kbuild you need to use
> KCFLAGS or other variations, see Documentation/kbuild/kbuild.rst.

Oops, I'm sorry.
#regzbot invalid: there is no bug, kbuild works as documented

--=20
Askar Safin

