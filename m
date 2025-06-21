Return-Path: <linux-kbuild+bounces-7607-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D65AE298B
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 16:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFC25177855
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 14:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F34145A05;
	Sat, 21 Jun 2025 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TITlQGci"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1808870824;
	Sat, 21 Jun 2025 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750517352; cv=none; b=o6DO76DN/HUo2L5CZvAoKuQh3R+lTqBgM+LNNTMp1cllXOkXFHyo36ZUlgenuzz/cUZ8a1wnGxqgg2Cty8EuODFf1rDiH9izxt5rfz0WgINmvRQE73+iavw+2TYMywpkpJGe5XXxFHyxTw56v5DZk7o2ECb4a+4qA0g2yxfnDws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750517352; c=relaxed/simple;
	bh=L9jzxKVD973Y+69sXc6ZIMCAeSN0QkdY5s4QXXZhQ+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ke+gxcrL5TyJ4i0c9A7BYW0qZIpZt21DxGuZu2HIxf4OZLEDctbKAt4jM2tlrdoWhMOKAZqNGgEAA3bk0RR9quoBhdi92K4U7XwTNjxKF2Lb1DsROB75f5X6xXxFw9wYYiuonRWlzlkY0hshfp9oixZjm6vup6Q/YTaISGgK3S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TITlQGci; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2ed1bc24fcso427384a12.0;
        Sat, 21 Jun 2025 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750517350; x=1751122150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JO/PmxHTS0dVHQZuOxg2POaSrxajCmDCh3CexbgOBU=;
        b=TITlQGciW2txFXOGe6JT7kPuHUy1CRMz8XHwsfoSWEzDzfw0lM3VT0ehBEps7buMEi
         QWesnOUdMjlyJdozZkwd92/DGprcQ2LZb5G0IRNSNmUlAg7JPj5cThxR9IYbPvhT4kY/
         H50KpUEifGUfiqBDD2VQQJOAPKasrXkVpRea0iLwpNSfZWhUMXXHOjDR5lnRABSdG67x
         PS9hOdERHxDou45qdurxQywWfCIM9dqpFjLmU9BBiiHip9P390z3eGL6bVl1NHUgIuKT
         xe2lLevkqW/43qyRcpwuKM080sFfLs8yLKe8oZA6VVaXy2uDa1LpYIyvnTc+oZDW1spS
         37Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750517350; x=1751122150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JO/PmxHTS0dVHQZuOxg2POaSrxajCmDCh3CexbgOBU=;
        b=lDOsVzEmtrX9WU+D0BdmJVHdS1wZhH7bUVovEddQutCgPZdVcC8UK6O4Fk2Dw/r/HM
         28WPCbL97cT0OH1Ol77s2Dh/6oTwUgR5JL8smM09yHEg4CpDT6NO5ESo8c2/I7w6LLAh
         8xAKbyR7Rhh8pKCxV/2JQi7cFmJ7GbhkNg+Xf6UW7wo/8wSYEyRF6RjEz2MNyjAdXVH3
         ncRD6c7MF4MJYtx/HvPGI9/MlItgnCBhSllEKXQZClS/AQKDNelhuJWsNpRwdCG0I5jX
         hJusCVc7PtWcijXi59RBYElhdwfcknqovxSkPOg/BufxX/XpGnHlAhCabpQYh1Wf7REr
         bBxg==
X-Forwarded-Encrypted: i=1; AJvYcCUeGQTSxgS5nwVSmm59hIPhUp33J7HUPPp8KLCzieoPXr6yp1kcR73ZQ9/ZhkuwAeKZy/EmkZQX0hQSlw==@vger.kernel.org, AJvYcCUfjr2Mw/V8aX8O5+zAjt031KrlApkxONGjTGnBlDxxkH81pVr33zoDDR2Q4HRcylxkjZes6d51G8/dlGCsuA==@vger.kernel.org, AJvYcCUg5JzFM6XLx+gfX3hDLhXjXxVL6Rs0RT/FMay90LKJ6NLq6ncg5cxeKseummlQJiFv2KVD1Dk5/ERaHTRU@vger.kernel.org, AJvYcCV+6G2+lpZL5N2Y+HCwJLV5Di8K2cv6w7XM9LbJJ2ttcXU8h8Auug5uxa68Ia1OEl6ChL54baFuFojeGCA3Q5Y=@vger.kernel.org, AJvYcCWxSFDvRSVD6JKIj9X/t1Ljc7BgXK35OS4ZBosGOvnGvXRu+7G1z7wL4eKqVE8s9m2msrTy+qrUXICeA/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpsGbVNkMjP9MCzk+swRrezqvlIYBaUH24S2ZeKDIrVBZrDuKm
	F4xy+FPL9rocTz8XhpcZ8ZpBsNH6kPDLsAdOeJbxCIQaDWdYcXpvQuaqlOYVPFYuc3Zhv2SP1/b
	IWeE9voIhDe/OWM4KDgPm0opLDmuCUrA=
X-Gm-Gg: ASbGnctJ2iCwv3oOojcY54Dd0ygH/8xRsEZ3tcDRR+0G99abHAKjQAUB+iigAJTB+Bu
	Lp2SCVxIf/OgsF16J7Bw7lkM/oSstEcVYhzoX58wVYpEI4+FV4hc/O3EZMlwmxBr2WwlqWjjq+d
	QI
X-Google-Smtp-Source: AGHT+IEo+CKQk8wHNOSQkclxu85nsW/a1YOusDaFxSgp8kZzrYJrC7dRgm/TGgX963G87fb6N1JTUrgrqpNCW47JYFs=
X-Received: by 2002:a17:90a:d88c:b0:312:25dd:1c8b with SMTP id
 98e67ed59e1d1-3159d62a060mr3801838a91.2.1750517348376; Sat, 21 Jun 2025
 07:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750511018.git.legion@kernel.org> <6e2f70b07a710e761eb68d089d96cee7b27bb2d5.1750511018.git.legion@kernel.org>
In-Reply-To: <6e2f70b07a710e761eb68d089d96cee7b27bb2d5.1750511018.git.legion@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Jun 2025 16:48:56 +0200
X-Gm-Features: Ac12FXxYM6BOVWg7hJOdAE-osp-Ry_oOUPNZyOxR1nNHyxVYxW4mw0T0N4kIqio
Message-ID: <CANiq72kZAMGmDyAj33CtRW2-WdEF=vPZcA-4ziMbpd9gYmFsyw@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] modpost: Add modname to mod_device_table alias
To: Alexey Gladkov <legion@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 3:57=E2=80=AFPM Alexey Gladkov <legion@kernel.org> =
wrote:
>
>  rust/kernel/device_id.rs |  8 ++++----

Cc'ing maintainers and list.

Cheers,
Miguel

