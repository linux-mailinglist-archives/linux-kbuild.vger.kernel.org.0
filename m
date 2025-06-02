Return-Path: <linux-kbuild+bounces-7344-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E583ACAFB1
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 15:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2C1E17FCDB
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 13:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC6E222580;
	Mon,  2 Jun 2025 13:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlJGTDgq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5997222561
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Jun 2025 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872347; cv=none; b=HQ4LaVHGkE1Fqsqsn+IONH5CYSorCKom3Bda1oNx6zJWAC1jLsooCtuDy3dXWfW+meJgPifg4FlSGsuX1AtKS5vvkr2CMKooxSD0FHC9N33VhvlV8q8Au3olCDH2GU8YSWhv76fc6I2UYlcqdO7AapWn0GxNWN+ifYPxhLcLW6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872347; c=relaxed/simple;
	bh=LZYzZ+cUHj6P2mamQuY6l6cqdt+/CFqIRXzHbO0TqBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3MB9elFZ9YyzIZimNeHTvm0uA0ZR2cUjvIsXradzwRwqOdX7rW1HC13lRAdzQC5vmsgjU4cnbfLDUdO35m9G9NQk2Alq6vU+b4eZmkn6waZ1mNtz+PP/Y2Lbds1ZHdSIUBzTM9/5wINgIMiQLANm6kjX3bYr2UePF4c/Phnc4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlJGTDgq; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2eeada3df1so67660a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Jun 2025 06:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748872345; x=1749477145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZYzZ+cUHj6P2mamQuY6l6cqdt+/CFqIRXzHbO0TqBY=;
        b=BlJGTDgqCpdvwdqOcp23kVoLcHYSk3wdDEbMmF1Ml7DxtLjlnzV0Zhmw11ki3R4OEu
         CoC/2q5WZurgLqyyYA27gVCcQTE4V4f9sLsP0D2hRwkLGXy7FrW8KY300QuzzwNaht93
         cOV8duAKhqr/SRv/UoDn7UiSE9dZktNFh3fbtsQRqFm17ttlJweYc5yLwfyfAzl+Hr5+
         v3KSqWgXXF/mqlLQldW7ELOvCOSc33xJIL3N5yXrE4dz4iKsURlEpTDh/HpOV4eZ55ok
         pkxDzJk1cV9gel77A33gzF3NFiSowV2Pi3Pzyw0ak9/Ko7k+fmRY+7tyPU3717tRvrhf
         zAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872345; x=1749477145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZYzZ+cUHj6P2mamQuY6l6cqdt+/CFqIRXzHbO0TqBY=;
        b=JInUZ38jn2ylz9KvGunRC2zcZqyCkbAjRBBZlBDk0n+2utWTNhSNuHP3BnYUvY0VFD
         5f7BJkM3LgdRBpBuwI3M53qi2tatwl90rGc/mx3AiWlEvV7eVx2hiLOPqp554N897J6U
         PV1qcyY+g+ud31PQDgKno6/IlXl4CEoLSTDKHkBJ5eS6WUykz0k142pMQuJNAAkrqg32
         fU/ba+HeSSjYhNdVAQsrCQBBxUDo9AWAFsKOXXQjSmEwo92NR1lErMYL6lKS76WT9Hyv
         OMUMMiqCOushTCUTiBbxmGVIfk6ZFwrBpDptHuvZmxDldtWgsYFLdlD/U5zZbdRn3oMe
         0h3g==
X-Forwarded-Encrypted: i=1; AJvYcCWioUQlCm1rtBcZTFo1FjzXBfyXLcxCFpdiqQ855vKVFiShs/b5+6hoci5UOed9GXPvV01feUZLVzJ+nkk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/9pMLnXutyWc2oJq6lbOO+mKf9O2V+q+6odjvt1r5V37DeTvC
	nQBsSqvfw2VLsVLWwqmAT7MN82wVDE18/lKQgIlE1PYey47qQpnxhiRKxu0jSWcs/ivJZLClZpf
	4X1u6XZlLyFJ/RtK8/8/V3/JsKKPYtEo=
X-Gm-Gg: ASbGncuJSmchuPP0tk1cAjmeO45JIER/Sw2hrom3mUZuArd0u7o3ZzBXdKuyD3WsEUf
	95k3OUUi5kD/tz3DOzDWx7Ljv4DOBqTD5WRQ+HEx7WsBZoLT28JLjA5WSR81AaWSysbsWN8fhAU
	Yz2qagWzGCrtO2kWRmna9fMDh4uz0xgMDj
X-Google-Smtp-Source: AGHT+IEz/LnFOV+A6ZDrNuOcUpwGnyPWj7aa1r3nviHqTuU/wWJHN9yCqVJBzgYiZydmFNTtAnI1IUs/ruLXCpmSY6I=
X-Received: by 2002:a17:90b:3d44:b0:311:a314:c2dd with SMTP id
 98e67ed59e1d1-3124db04d6fmr7948094a91.4.1748872344921; Mon, 02 Jun 2025
 06:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250601184049.368419-1-martellif67@gmail.com>
 <20250601184049.368419-2-martellif67@gmail.com> <2e8cb14e-abb7-4850-a1fe-31bad55bb04b@infradead.org>
 <ddf7c0be-48ce-47d5-acc6-2e9e5aae64b4@gmail.com>
In-Reply-To: <ddf7c0be-48ce-47d5-acc6-2e9e5aae64b4@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Jun 2025 15:52:12 +0200
X-Gm-Features: AX0GCFs4wBDPW1qadWj7aJJrTZi8l82GwTb3JzipKlaW8fTcCbnF3VDPe6tZO7g
Message-ID: <CANiq72=1zoNj52YNVjnFjTgnOhz_HidnFT19JFThTNXB4fdA=A@mail.gmail.com>
Subject: Re: [PATCH 1/1] Kconfig: Added compare capabilities for mconf
To: Franco Martelli <martellif67@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, masahiroy@kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 3:41=E2=80=AFPM Franco Martelli <martellif67@gmail.c=
om> wrote:
>
> Now how to deal with those typos? Should I git amend the commit and send
> a new version 2 of the patch? Sorry but I'm new in the kernel's process
> patching.

Yeah, you should amend it and send a new version, tagged with v2 with
e.g. the `-v2` flag or similar. In other words, new versions should
not depend on the previous ones -- patch series are "rebased" in that
sense, rather than "stacked".

For new versions, you should also provide a changelog, after the first
`---` line, before the diffstat.

By the way, ideally you also pass `format-patch` the `--base` flag to
provide a base commit for all patch series, so that it is clearer for
both humans and tooling :)

Thanks!

Cheers,
Miguel

