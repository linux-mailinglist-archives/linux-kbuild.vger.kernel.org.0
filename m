Return-Path: <linux-kbuild+bounces-9294-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56067C14C23
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 14:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADBC542312F
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 13:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A111F4C8E;
	Tue, 28 Oct 2025 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQwjsR1A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8481E1A17
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Oct 2025 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761656651; cv=none; b=XMPEpcKflz/Vxs316TvbdPvY8zhKdzzWBlPEiTPWm6d/oDh8P8KNFJyt+BQrX4JJttmFLdWTCDucQ6oZeOLJy2WZVjWFhfhdTh3/cnDogH7TT8IAcE+A6sNBDK2EugwDUxh9qmLFmId2wuM/MRL/dpMli7PvD/TGudd/Mw2pXlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761656651; c=relaxed/simple;
	bh=o+gsxF2a+s+BG+ImH/NesDa5oejSxzi1zOrUT1zQ8HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ommd4jHJOGTpz5H1bGxb0ftvmGyQUXp5DpbyhFR//digRPdaq3+rbk7WuVsssrDm58mnhaW2Oh64cxndfDe2aD5noIpxEKmlch9rcuXHkBiVlidYhEKDYVLQUPdXUltKFEcNAogiM5PlQbArLd3DEY0+bHLxBPvGhr3S5buyUjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQwjsR1A; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7815092cd22so76934997b3.2
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Oct 2025 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761656649; x=1762261449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/0OtKa0fwpsGbbWHnbV4jMYc8LFQ8mSjlnSp1wdWyE=;
        b=LQwjsR1AZPmQeEPX6UkC5Hmndtcu0tLxyXAZo9OA0s/yscdDgyGKsmYTG29lYQB7LH
         +o5X6EBkKD6uCJHKb2Fw8D4oEuGJNAQTo15yi2fPkJGVlJ+xDCBj3ZsKbJuBZaS+6/Ga
         d2o/PLmMpZFcAB6JshRSD5a2waBPLC4+veV8HSUEZV4NM/Krr5qGrbrP/KP1TGng0Qe9
         w0vsjwh1+Lf7KdExaxhJltlbneeG/qE38Dout1ZvTmWeEpXRfDO4v8wxuyNSUKhPXtWn
         spfFkMttIaGUBybKQr1J2TjkzTRsWYxe/vqkP/EOIKeYGgZSMS4K/17pCAqdehMNhquL
         k8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761656649; x=1762261449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/0OtKa0fwpsGbbWHnbV4jMYc8LFQ8mSjlnSp1wdWyE=;
        b=Rpnb1/7nLU4E0MRsoAYH9M4hWlEXTep03KOOjBksJQyytlciX0Pgrg8W9+XZcQsaaY
         6qWnJrWxs+0f8XWCsreUL7lG03EAWyDU7mx0RuLUtTYRgPdG+l5l5jwdEvlOaOAk/kuK
         HfE8slN4Tg4lD+Z5TwsIRAVprhkLSNn56XMhg44iiSQ0nM0NFwveOn1lgiT/ejIgTbA0
         +CTV56O9GSanKb5Ta/pBb9gtn1vlMHbWO/EttqzpZrRAN3rrYQgal4EI1fIIJauo4mWG
         LZVW5BHBlirm7hCbyHDsrHdANY0GPaUVHMo6LDttSvXW3cl4k5/gYLe/K/MiHq9AB6Zb
         0vuA==
X-Forwarded-Encrypted: i=1; AJvYcCU4Abg4cv1hzDOZzHwWWVWcjCx137EfMBuGV9LEg+7eK+NxWxDKuDgjXCR/neHOYKgAhmb7QQAkM+qp0EU=@vger.kernel.org
X-Gm-Message-State: AOJu0YweOQSuh4qj0WVVukHS9dYm02PZOPCe/DXneCHdy7Qcwka5dRPu
	IBERAEnA6bgSLFHHvhgy0IzBlphCVBNs0pYfRpy4Tl2zhLhN7Q8aM2XVvhYpO7XgJCI2mpQxiH8
	jSXjPzYzmMw7L3SxVKkUacq8O4tPgG/0=
X-Gm-Gg: ASbGnctNsIZ2HIjXaOu9qSEQIPJVFGemp0tKa6bkx1aksDqwk6pEm44zI8xiMvcVo/O
	SqpUbxJ1zFdKJGaVfsJjJoJiqgA8KqXLzxv7qR5rk/U8uDq7B6Zmh821kxnTw742O/QonPl7HpE
	pmt2jk62avg+Q+NxjHkYoh3PTJY8yi61jQNis+1MhLKDtiyIMQytS77MrFg8f6klO6peSk6+bPx
	GFBhY6OPlEW9PctaOh7Ia7r0SFyNlXJd0hyjaZgR0s/8gPsFpHao6myxmpj+RRR
X-Google-Smtp-Source: AGHT+IGl+GnLITy+almrkll6qV+UR1AjovGvr5jvY5xg5QHKzNmw/ZHW9q9+b73du1ozFlDeRGPiDs8Hs7aOvINNsAc=
X-Received: by 2002:a05:690c:630e:b0:784:9883:5fa8 with SMTP id
 00721157ae682-786181cafb0mr31790047b3.68.1761656647431; Tue, 28 Oct 2025
 06:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6q8l68r.wl-tiwai@suse.de> <20251015145749.2572-1-safinaskar@gmail.com>
 <878qhckxc5.wl-tiwai@suse.de> <CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
 <875xcgkvnw.wl-tiwai@suse.de> <CAPnZJGDmCnKPz2eygwDjQGXZWVctGyJxV+OeFSLLeZPOCEvvbA@mail.gmail.com>
 <CAPnZJGBdqPhmNOes4-BRu8C-0d3yco8H93WhdORxm7MRBSw7CQ@mail.gmail.com>
 <CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
 <87bjm78978.wl-tiwai@suse.de> <878qgvgrk0.wl-tiwai@suse.de>
In-Reply-To: <878qgvgrk0.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Tue, 28 Oct 2025 16:03:31 +0300
X-Gm-Features: AWmQ_bkosASxL-kMiGEUK0uLtyvvSN2aJsJnCBmaxZOZLhuSFph6rGxsUC3ATkM
Message-ID: <CAPnZJGD9DM6Rk9NwdJZtZRKp_8wBtS0z47v0oRmKyNxdUzvLmg@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: Dell.Client.Kernel@dell.com, amadeuszx.slawinski@linux.intel.com, 
	baojun.xu@ti.com, bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	regressions@lists.linux.dev, rf@opensource.cirrus.com, 
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, sam@gentoo.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 3:05=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> Askar, have you tried the above?  I was off in the last week, so

I will try later. Possibly after two weeks.

--=20
Askar Safin

