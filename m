Return-Path: <linux-kbuild+bounces-9762-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C15BC7B6C0
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 20:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 02A3B343360
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 19:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B44273D81;
	Fri, 21 Nov 2025 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R66xKcqQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE7A2264D5
	for <linux-kbuild@vger.kernel.org>; Fri, 21 Nov 2025 19:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763751702; cv=none; b=PswyLQds9F46FALb3o6Matisz4sQbfQu7IK5DQj4IasFuZADIbrpvfbwGyS914Vi3/WIJKd9FnHl04wKKqODMjhjAIsaY6u/y9n5NfQIs3cMAw9IuJIZogmG+XBZ3GbaNYf+xJai/at23oxsbJHtmHGfjkwsA8mIfBmJu9tPfaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763751702; c=relaxed/simple;
	bh=znNrGtLO/y2KIKC6w6UbPHjCgvfwhBb8OCIlLO/42vU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDXQ0KjKSaMVGgOhQP7lhGFMp3bAPOeRHEB44eqBj0Z1PKosZ0LdmV9xH1Ykku8446KUg2nUYxSm4ytaIsxFu04gdJffbUAsZNdpcghcrpkdqQXBk0K1+L6sbAQEqleWMYz3vFC1ZL6+yGk1j4fth8xjwvteswZJ0rZxWxvXpWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R66xKcqQ; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bc2c9a771b5so285828a12.3
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Nov 2025 11:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763751700; x=1764356500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMRrQ5UDUuelFdTKPrDDsaVzS+ehlFeWjYLK9O4YUmY=;
        b=R66xKcqQ02lkyymRFnl1rGiQ2xkD981v28fgZ3OiB6Zt9qnHZnS2dMI5NKgfaTyyKN
         fx0YDPzQAGtJVHl+pMDj0TU1L5QQZeIQbLz73fymRiwfEfcEXEW4qIoYsM1UTVAzQ2Kh
         980wSSu0RStPflVFBzgdZbWjunA1c3g1QNqtaG9GvmBIKBrbXGfMmzdJ04belCIRLL7L
         CfreugdCMgIygMyuGiLINXpDD6CIfFqhKj0GFeV8ysaUjRozURESk3xD6KwWXJZ3MzHP
         nOSJTbZ2H8TA2gbfzzRIU7XOLlam/cYwvuhGa7nqoyXYKcRVaGAoDvvSCiCS4WcrzyvI
         Q87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763751700; x=1764356500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gMRrQ5UDUuelFdTKPrDDsaVzS+ehlFeWjYLK9O4YUmY=;
        b=ICnThxN17qURw8FPQPExy8Fts6+B4q+N+KLQU0kSIagyxCp3X9Kaz5LsIBz90+MUqe
         zDFfCMVQwdSAUuPIUXUX889U3mYYJgQsBOyZNJ/1nxkx7R9iqMinbDJUoIIA1bIEjW5S
         G4AMAIsjIXeYEe5s4r+/e7C4v+IvsQ9DDLyiTct0c77mnEkxxsG2GWMcKm1PDXk7lllu
         d+3grSTTqccC4lXaXpyTlR+7vBIgHCf5MgA9AJYmSRCKxHZgVrpCT/MOZqN6kL/pi1WU
         f2pEF2q/S1Nut7INyOb7g62Ij62KhFwL5wWaekDWd8MkfjtWje9Qyi4vIDvWOa7izPtb
         +ijQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdtzexsPjZoK7OwJ8kEX68+P7wEVhzmo+eOecQ7RqNLF6mXx9u6AxIgOXvEYi7HCfm3YSmDfopv+J/cLc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1udYa2f/+Y0QQ9/4FWCtsDNEwsNjqtcVvsXMmVjU2/GWsddFk
	/bFSf6nVaax1VpXlaCNtfb+mJT+vio5Rpq5hRWYXQTJ7ZBATU/rHknldrDsXDbfnavb+HT6BV/L
	xOYrxZ5oWQ8kpnMoiXCcOvEtM6OTKcuE=
X-Gm-Gg: ASbGncvpvfRP+GPYcaKBondrw2omqFtLs4QUkO1QJ3x4DPVuEZWhk+OUAH21EjlDbJq
	JXu5Ztc5xQ3gGDd+dgxZT6TqBrh1d2GHDSiztWEKPwT8XGb40XsUaNrcM4TdNLgh9NVY81InyhN
	62VRoVaPcJn9sbbaarrFE3IM7EEQZB6sDyMk0Kito8qg2APM5agpty6rjlCzNFDv/3JM9fPQ13G
	a8oWZfZW5kBD/CGGwpvXuxmD4sdc67OzgHI5m9wJIMP50Fcv9VfOFNrY1+MVOGI7pwOhEHim4Jn
	+0fdOAMX17mFrGV1A3xgzjKtXZG6Eqz3kEyWInzDiLkfya+DnIa8xwmCbjOAmBurUtvBzHPFvfY
	CvbmP4RElRbcr4A==
X-Google-Smtp-Source: AGHT+IHxzbdxx7SbQCrTEvxngdIKbtJYdfkpcAfmpDXK7Tu1gbYmvuvSxOavC3Q8fiaJxbZ3HHu3Yl70yC4dL2qOhV0=
X-Received: by 2002:a05:693c:2a0c:b0:2a4:3593:5fc8 with SMTP id
 5a478bee46e88-2a719277278mr918984eec.2.1763751699943; Fri, 21 Nov 2025
 11:01:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121184342.it.626-kees@kernel.org>
In-Reply-To: <20251121184342.it.626-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Nov 2025 20:01:27 +0100
X-Gm-Features: AWmQ_blNjwG2ZHIL75QpaofqEmG2atnGSXOJBOn15FdezxxUNWzQjNXhbF1nmK8
Message-ID: <CANiq72mzu_reg+A7vV9ARtu40g4R2rGr6ort5SgjX2Wozo6j-Q@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Enable GCC diagnostic context for
 value-tracking warnings
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 7:43=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Fixes based on this work have already
> been landing, e.g.:
>
>   4a6f18f28627 ("net/mlx4_core: Avoid impossible mlx4_db_alloc() order va=
lue")
>   8a39f1c870e9 ("ovl: Check for NULL d_inode() in ovl_dentry_upper()")
>   e5f7e4e0a445 ("drm/amdgpu/atom: Work around vbios NULL offset false pos=
itive")

Thanks for the references & extra context!

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

