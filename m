Return-Path: <linux-kbuild+bounces-10656-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B806D39A8B
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 23:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A2F6300C5FA
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 22:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6314230C345;
	Sun, 18 Jan 2026 22:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcR4BtsT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008602C1590
	for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 22:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768775463; cv=pass; b=Myc1Eo1My9bOf2JkdiM5OAVJdOJmb1+7ymQWRPUuMrQF4dIBEtHPLCHzBTjLqWf/bcKRpbtE6Vxc/P6G4Vg5zT/ciNxRc2hHvwwmuJyNEYHnsUfJraJXEz023pUydrwZckvvV00vZb9Kr8MiMX4VrYngIgdrttjUzKg/j3yk0Qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768775463; c=relaxed/simple;
	bh=KKEXciCThGyh/95Y7fesJNbQ9c5Hfi3JWsZZKixX7S8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knnMBlc/CilxB1H/HkTTgHz9DQW1HWPX7HHDoEGnZgCuevmPGvIR9GwMcBVd442htuZNCmbojYn6GY1hj8IzfqtWof4KhaOjOwAnfGDxfV2xJ6F7MEEsAeSFBVyoHxyRurQoRAspZ3unptuKaaUDbV1upKn/56QQ+R5PLnSkauk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcR4BtsT; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b6aa67a792so157422eec.3
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 14:31:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768775460; cv=none;
        d=google.com; s=arc-20240605;
        b=Trxrz732WZfufN5HOfCdgbj2j3AMdfPXDnS6kL4Hv8xnjqYqlDSJf4tL2ZBmZRjVwP
         ZU6PeXIrmgTfTO2yKbrUdhloAxVDVrvUc+LEuZIlugMtHDULa2LUmo+Gcq53JMCXwoyg
         58p+Ho682VP0I3OwtIERf679FeNlqQ2bqwQUIRHoo7crA7YVpohGlnOUwOidHVn65xEf
         AEJieo0cg5PqeInTmA48eYRTQqP0fgrHaFFacPJ5eDQhtIG/Zb7XxpmwT3lj7WaRQtAo
         z9GhS9Tu5RCf75GJU465BoLoGyzRYgKe8omTx55D5VjIKMcfBoYai3gI9xowVbV7LH8I
         Y8QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KKEXciCThGyh/95Y7fesJNbQ9c5Hfi3JWsZZKixX7S8=;
        fh=G6GuffW/q9hkHywZwm/VmdWIwk6Mohgffkjlhyz8Jkc=;
        b=SkI4X3QdZSEXPEij9NVHQmwoZfBpy9iYlLbmDL5IIPznGIqLRhczbrzxIkBDSqdmOD
         AzGvDzWFuGJAZQ/m+Nhed63WMV+A9JigRJWIq4QiXh+OXNtspsPOOWs4+ic7tmrHJAFH
         jfzGzWIU3Jh85WHe8jRKaCzefUfGPEpjOEpFFJT3ebLZ5VuEviPkgs0iqTae6FPBM5An
         nKh5Sls89GPffwdMyBDF8NF79pt76Qx+Of7rOFtBg1RH+llxEek0iO+HkTZxa0t5J625
         Ila5gKRYRYOodwZzGfpJr1tqXYPXHHO4MdGrU9bBfqARxP3Vqi2kClrrdEhjGvSTAemS
         6FEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768775460; x=1769380260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKEXciCThGyh/95Y7fesJNbQ9c5Hfi3JWsZZKixX7S8=;
        b=IcR4BtsTkrWZkrlErFbPbzpYlUgvHwn03RZ62LNbklHTp2qYiC8sYp6BqDgl83sIPt
         oG9LkwX7z1km0TfLcuX57pRxCVYQUvQOYItWgU5WTLc8CMAlZHgT4AJZCCi/Y3+ITZea
         f51YSlxhbjI72iIw0SIoG7USpt1pI9gLCM2Gbq//EyrT2bx4CxXk5Hdk7vmM+YRhcwIH
         BkIoB8At+6MczXAtMqBeDd0Bn4C7hbeDFALqUnz6TyI3LwDaipr2FvkMH3IQCIq6Km7u
         Vk0tVwFRPN+E4277K/ZMkmNn7bD+w2qN1UzmmP6zyBzQqZ21eM1Exo2NMRRHR46YHj1E
         Fqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768775460; x=1769380260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KKEXciCThGyh/95Y7fesJNbQ9c5Hfi3JWsZZKixX7S8=;
        b=TBesTRJbwgzmlLkJLIvI/s1hDEpysqhTLkfh/rPTT2n5SNq8kcHuJ8kWphaYkcediz
         YHgNL+o2EsFJbu1p0Yrln/wX9v6kRfsZeJFmFuqZRRLxx0jXSUNEQjWslvwFasEmnvEE
         ueYrByQ+HdPi6YJ20cwtdhl+oE+eS7mGa48aEXlJ+TVJP0KOTRs0n5EkjDeGde92Ufz+
         5B67D38c1mbRZv9pD8ROutRWoaxz8Pq4Ya2SgnWvbbFkUohn+mGB5z1vDKQhGSxBwKen
         xxY6LptyZnO68e/iAo89lqF3RniqQhWJP0QeTVTkhZwHmAVVObNrA5AwkkMz7P8+A7ZK
         Ajpw==
X-Forwarded-Encrypted: i=1; AJvYcCXaT0x2/UX09l8DbQFSRz1bOWMZKma0ZDTiDQHLtRa6O3YgOOK/efnh51rU3G0wBpQI48I1Desb4fzWfG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuO+iugj2VvKvh4WkpnOT5Nr4opR6Pq66ftJmQ6kREZNTrOiDG
	S5KEjWqO/v75xMKWBfFVUQQE5nb+nGKadUCyLonBngbbHsXeI/Fn/mV9V0s9Iu6ObB2I0Z0KQQR
	PQRDXj3c7VAJKLVMg5cbe4+zl67WSMk0=
X-Gm-Gg: AY/fxX65OVsBOjw46S/0o4K0ii0mKhiBp4y30Kt67oCEQdjeduaWq0CPEhium+PffR1
	f9WAsrHb4jrm9HrFmqEvKanH2xEAe29o6TYEaWEvSQbSBikWYuvLycCqaukWOH45tLiwMd2kbHy
	Hqr2wyuOQ+CoCg958+tILxYsXvnkxcjiYRt9IcCHmnt2Z7EmptJXOrIm1BMWTecowNfy3XyRcMW
	WY4U6fH9OZ6b6W2FR/ntw/HLzx6LwtmvPdJUlTR/5D94fMpRh0e0ofwev8mKqvA3E6wXUWiYkwl
	60tTzs1kx2u/NvbJK/UjnvGqo5XFqFf3qYVg2wC1aJQvFZW+/9TONfs8/fxFBfsRHwf8vKNwXr2
	GHtqYtQ7wus89
X-Received: by 2002:a05:7300:fd0f:b0:2ae:605b:d530 with SMTP id
 5a478bee46e88-2b6b40f82e3mr4635633eec.6.1768775459862; Sun, 18 Jan 2026
 14:30:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <71ff222b8731e63e06059c5d8566434e508baf2b.1761876365.git.chenmiao@openatom.club>
In-Reply-To: <71ff222b8731e63e06059c5d8566434e508baf2b.1761876365.git.chenmiao@openatom.club>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 23:30:47 +0100
X-Gm-Features: AZwV_QgOJ28ZAQRCR4DoI7T-EEPUZK5Eh4l_mbKewBXtOnf97wGzSLD3VTXZX-4
Message-ID: <CANiq72kDsmkJeS3bGSiD_dA1wSm328nYbbHEZ8HRiMHOirCS+A@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: Remove the product of pin_init cleanly in mrporper
To: chenmiao <chenmiao@openatom.club>, Benno Lossin <lossin@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Cc: tamird@gmail.com, da.gomez@samsung.com, 
	hust-os-kernel-patches@googlegroups.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 3:32=E2=80=AFAM chenmiao <chenmiao@openatom.club> w=
rote:
>
> When I enabled Rust compilation, I wanted to clean up its output, so I
> used make clean and make mrproper. However, I was still able to find that
> libpin_init_internal.so in the rust directory was not deleted, while
> all other corresponding outputs were cleared.
>
> Dongliang Mu <dzm91@hust.edu.cn>

This line seems broken. Was this meant to be a Reviewed-by, like in v1?

> Signed-off-by: chenmiao <chenmiao@openatom.club>

I think in another patch/thread you mentioned this should be "Chen Miao", r=
ight?

No need for a new patch, I can fix both on apply if you agree.

Adding the relevant people to Cc (pin-init, Kbuild and Rust). And
Tamir for the `.dylib` side.

Also, I guess we could backport this:

Fixes: d7659acca7a3 ("rust: add pin-init crate build infrastructure")
Cc: stable@vger.kernel.org

Cheers,
Miguel

